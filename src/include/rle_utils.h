void unshrink_tiles(UBYTE from, UBYTE count, unsigned char * shrinked_tiles)
{
    unsigned char __temp_tile_data[16];
    unsigned char * dest; 
    UBYTE mode;
    for (UBYTE i = 0; i < count; i++) {
        mode = *shrinked_tiles; shrinked_tiles++;
        dest = __temp_tile_data;
        if (mode == 1) {
            for (UBYTE j = 0; j < 8; j ++) {
                *dest = *shrinked_tiles; dest++;
                *dest = 0x00; dest++;
                shrinked_tiles++;
            }
            set_bkg_data(from, 1, __temp_tile_data);
        } else if (mode == 2) {
            for (UBYTE j = 0; j < 8; j ++) {
                *dest = 0x00; dest++;
                *dest = *shrinked_tiles; dest++; 
                shrinked_tiles++;
            }
            set_bkg_data(from, 1, __temp_tile_data);
        } else if (mode == 3) {
            for (UBYTE j = 0; j < 8; j ++) {
                *dest = *shrinked_tiles; dest++; 
                *dest = *shrinked_tiles; dest++; 
                shrinked_tiles++;
            }
            set_bkg_data(from, 1, __temp_tile_data);
        } else if (mode == 4) {
            set_bkg_data(from, 1, shrinked_tiles);
            shrinked_tiles += 16;
        } else {
            for (UBYTE j = 0; j < 8; j ++) {
                *dest = 0x00; dest++;
                *dest = 0x00; dest++;
            }            
            set_bkg_data(from, 1, __temp_tile_data);
        }
        from++;        
    }
}

void rle_decompress_tilemap(UBYTE bkg, UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * tiles) __naked
{
    bkg; x; y; w; h; tiles;
__asm
            push    BC
            
            ld      BC, #0x0000 ; local variables: count, ch
            push    BC            
            
            lda     HL,7(SP)    
            ld      D,(HL)      ; D = x
            inc     HL
            ld      E,(HL)      ; E = y
            lda     HL,12(SP)
            ld      B,(HL)      ; BC = tiles
            dec     HL
            ld      C,(HL)
            dec     HL
            ld      A,(HL-)     ; A = h
            ld      H,(HL)      ; H = w
            ld      L,A         ; L = h

            push    HL          ; Store WH
            lda     HL,8(SP)
            ld      A,(HL)      ; A = bkg/win destination
            or      A
            jr      NZ,$decomp0B
            ldh     A,(#_LCDC_REG)
            bit     3,A
            jr      NZ,$decomp01
            ld      HL,#0x9800  ; HL = origin
            jr      $decomp02
$decomp01:  ld      HL,#0x9C00  ; HL = origin
            jr      $decomp02
$decomp0B:  ldh     A,(#_LCDC_REG)
            bit     6,A
            jr      NZ,$decomp01
            ld      HL,#0x9800  ; HL = origin

$decomp02:  push    BC          ; Store source
            xor     A
            or      E
            jr      Z,$decomp03

            ld      BC,#0x20    ; One line is 20 tiles
$decomp04:  add     HL,BC       ; Y coordinate
            dec     E
            jr      NZ,$decomp04
            
$decomp03:  ld      B,#0x00     ; X coordinate
            ld      C,D
            add     HL,BC

            pop     BC          ; BC = source
            pop     DE          ; DE = WH
            push    HL          ; Store origin
            push    DE          ; Store WH
            
$decomp05:  push    HL

            lda     HL,6(SP)
            ld      A,(HL+)
            or      A
            jr      Z,$decomp07
            ld      A,(HL-)
            dec     (HL)           
            jr      $decomp08
            
$decomp07:  dec     HL
            ld      A,(BC)      ; Copy tile
            cp      #0xc0
            jr      Z,$decomp09
            and     #0xc0
            cp      #0xc0
            jr      NZ,$decomp09
            
            ld      A,(BC)
            and     #0x3f
            dec     A
            ld      (HL+),A
            inc     BC
            ld      A,(BC)
            ld      (HL),A
            inc     BC
            jr      $decomp08
            
$decomp09:  ld      A,(BC)      ; just single tile
            inc     BC
            
$decomp08:  ld      L,A
$decomp0A:  ldh     A,(#_STAT_REG)
            and     #0x02
            jr      NZ,$decomp0A
            ld      A,L
            
            pop     HL
        
            ld      (HL+),A
            dec     D
            jr      NZ,$decomp05
            
            pop     HL          ; HL = WH
            ld      D,H         ; Restore D = W
            pop     HL          ; HL = origin
            dec     E
            jr      Z,$decomp06

            push    BC          ; Next line
            ld      BC,#0x20    ; One line is 20 tiles
            add     HL,BC
            pop     BC

            push    HL          ; Store current origin
            push    DE          ; Store WH
            jr      $decomp05
            
$decomp06:  pop     BC          ; local variables
            pop     BC
            ret
__endasm;
}

void rle_decompress_data(const unsigned char * data, UWORD size, unsigned char * dest) __naked
{
    data; size; dest;// suppress warninig: unreferenced function argument
__asm
            push    BC              ; 0 bc, 2 ret, 4 data, 6 size, 8 dest, 10 -

            lda     HL, 4(SP)
            ld      E, (HL)
            inc     HL
            ld      D, (HL)
            inc     HL
            ld      C, (HL) 
            inc     HL 
            ld      B, (HL)
            inc     HL
            ld      A, (HL+)
            ld      H, (HL)
            ld      L, A
                        
$rle03:     ld      A, (DE)
            and     #0xc0
            cp      #0xc0
            jr      Z, $rle04
            
            ld      A, (DE)
            ld      (HL+), A
            inc     DE
            dec     BC
            ld      A, C
            or      B
            jr      NZ, $rle03
            
            pop     BC
            ret            
            
$rle04:     push    BC

            ld      A, (DE)
            and     #0x3f
            jr      Z, $rle06
            
            ld      C, A            
            inc     DE
            ld      A, (DE)
$rle07:     ld      (HL+), A       
            dec     C
            jr      NZ, $rle07
            inc     DE
            
            pop     BC
            
            dec     BC
            ld      A, C
            or      B
            jr      Z, $rle08            
            dec     BC
            ld      A, C
            or      B
            jr      NZ, $rle03
            
$rle08:     pop     BC
            ret
            
$rle06:     pop     BC

            ld      A, (DE)
            ld      (HL+), A
            inc     DE
                        
            dec     BC
            ld      A, C
            or      B
            jr      NZ, $rle03
            
            pop     BC
            ret
__endasm;
}
