void set_inc_tiles(UBYTE from, UBYTE count, unsigned char * buf) __naked
{
    from; count; buf;
__asm
            lda     HL, 2(SP)   ; Skip return address and registers
            ld      E, (HL)     ; E = from
            inc     HL
            ld      D, (HL)     ; D = count
            inc     HL
            ld      A, (HL+)    
            ld      H, (HL)     
            ld      L, A        ; HL = buf
            
            ld      A, E
$tileset01: ld      (HL+), A           
            inc     A
            dec     D
            jr      NZ, $tileset01 
            
            ret
__endasm;           
}

void unshrink_tiles(UBYTE from, UBYTE count, unsigned char * shrinked_tiles)
{
    from; count; shrinked_tiles;
__asm
; TODO: switching to copy_vram
;            ldh     A,(.LCDC)
;            bit     4,A
;            jp      NZ,_set_sprite_data

            push    BC

            lda     HL,7(SP)    ; Skip return address and registers
            ld      B,(HL)      ; BC = data
            dec     HL
            ld      C,(HL)
            dec     HL
            ld      E,(HL)      ; E = nb_tiles
            dec     HL
            ld      L,(HL)      ; L = first_tile

            ld      A,L
            rlca                ; Sign extend (patterns have signed numbers)
            sbc     A
            ld      H,A
            add     HL,HL       ; HL *= 16
            add     HL,HL
            add     HL,HL
            add     HL,HL
                    
            push    BC
            ld      BC,#0x9000
            add     HL,BC
            pop     BC

$unshr02:   push    DE
                        
            ld      A, (BC)     
            inc     BC
            ld      E, A        ; E = shrink_type

            ld      D, #8
                    
$unshr03:                       ; Special version of '.copy_vram'
            bit     3, H        ; Bigger than 0x9800
            jr      Z, $unshr04
            bit     4, H
            jr      Z, $unshr04
            res     4, H        ; Switch to 0x8800
            
$unshr04:   ld      A, E
            cp      #1
            jr      Z, $unshr20
            cp      #2
            jr      Z, $unshr30
            cp      #3
            jr      Z, $unshr40
            cp      #4
            jr      Z, $unshr50
            
$unshr10:   ldh     A,(#_STAT_REG)
            and     #0x02
            jr      NZ, $unshr10
            xor     A
            ld      (HL+), A
            ld      (HL+), A
            jr      $unshr0A
         
$unshr20:   ldh     A,(#_STAT_REG)
            and     #0x02
            jr      NZ, $unshr20
            ld      A, (BC)
            ld      (HL+), A
            xor     A
            ld      (HL+), A
            inc     BC
            jr      $unshr0A

$unshr30:   ldh     A,(#_STAT_REG)
            and     #0x02
            jr      NZ, $unshr30
            xor     A
            ld      (HL+), A
            ld      A, (BC)
            ld      (HL+), A
            inc     BC
            jr      $unshr0A

$unshr40:   ldh     A,(#_STAT_REG)
            and     #0x02
            jr      NZ, $unshr40
            ld      A, (BC)
            ld      (HL+), A
            ld      (HL+), A
            inc     BC
            jr      $unshr0A

$unshr50:   ldh     A,(#_STAT_REG)
            and     #0x02
            jr      NZ, $unshr50
            ld      A, (BC)
            inc     BC
            ld      (HL+), A
            ld      A, (BC)
            ld      (HL+), A
            inc     BC
            jr      $unshr0A

$unshr0A:   dec     D
            jr      NZ, $unshr03 

            pop     DE
            dec     E
            jr      NZ, $unshr02
                    
            pop     BC
            ret     
__endasm;           
}
   
void rle_decompress_tilemap(UBYTE bkg, UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * tiles) __naked
{
    bkg; x; y; w; h; tiles;
__asm
            push    BC
            
            ld      BC, #0x0000 ; local variables: count, ch
            push    BC            
            
            lda     HL, 7(SP)    
            ld      D, (HL)     ; D = x
            inc     HL
            ld      E, (HL)     ; E = y
            lda     HL, 12(SP)
            ld      B, (HL)     ; BC = tiles
            dec     HL
            ld      C, (HL)
            dec     HL
            ld      A, (HL-)    ; A = h
            ld      H, (HL)     ; H = w
            ld      L,A         ; L = h

            push    HL          ; Store WH
            lda     HL, 8(SP)
            ld      A, (HL)     ; A = bkg/win destination
            or      A
            jr      NZ, $decomp0B
            ldh     A, (#_LCDC_REG)
            bit     3, A
            jr      NZ, $decomp01
            ld      HL, #0x9800 ; HL = origin
            jr      $decomp02
$decomp01:  ld      HL, #0x9C00 ; HL = origin
            jr      $decomp02
$decomp0B:  ldh     A, (#_LCDC_REG)
            bit     6, A
            jr      NZ, $decomp01
            ld      HL, #0x9800 ; HL = origin

$decomp02:  push    BC          ; Store source
            xor     A
            or      E
            jr      Z, $decomp03

            ld      BC, #0x20   ; One line is 20 tiles
$decomp04:  add     HL, BC      ; Y coordinate
            dec     E
            jr      NZ, $decomp04
            
$decomp03:  ld      B, #0x00    ; X coordinate
            ld      C, D
            add     HL, BC

            pop     BC          ; BC = source
            pop     DE          ; DE = WH
            push    HL          ; Store origin
            push    DE          ; Store WH
            
$decomp05:  push    HL

            lda     HL, 6(SP)
            ld      A, (HL+)
            or      A
            jr      Z, $decomp07
            ld      A, (HL-)
            dec     (HL)           
            jr      $decomp08
            
$decomp07:  dec     HL
            ld      A, (BC)     ; Copy tile
            cp      #0xc0
            jr      Z, $decomp09
            and     #0xc0
            cp      #0xc0
            jr      NZ, $decomp09
            
            ld      A, (BC)
            and     #0x3f
            dec     A
            ld      (HL+), A
            inc     BC
            ld      A, (BC)
            ld      (HL), A
            inc     BC
            jr      $decomp08
            
$decomp09:  ld      A, (BC)     ; just single tile
            inc     BC
            
$decomp08:  pop     HL
            push    DE
            
            ld      D, A
$decomp0A:  ldh     A, (#_STAT_REG)
            and     #0x02
            jr      NZ, $decomp0A
            ld      (HL), D
            inc     HL

            pop     DE
            dec     D
            jr      NZ,$decomp05
            
            pop     HL          ; HL = WH
            ld      D,H         ; Restore D = W
            pop     HL          ; HL = origin
            dec     E
            jr      Z,$decomp06

            push    BC          ; Next line
            ld      BC, #0x20   ; One line is 20 tiles
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
