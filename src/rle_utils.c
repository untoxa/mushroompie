#include <gb/gb.h>

// fill buffer with incrementing values
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

// unshrink 0bpp, 1bpp and 2bpp tiles to vram
void unshrink_tiles(UBYTE from, UBYTE count, unsigned char * shrinked_tiles) __naked
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

// unshrink tiles to buffer
void unshrink_tiles_to_buf(UBYTE count, const unsigned char * shrinked_tiles, unsigned char * dest) __naked
{
    count; shrinked_tiles, dest;
__asm
            push    BC

            lda     HL, 4(SP)
            ld      E, (HL)     ; E = count
            inc     HL
            ld      C, (HL)
            inc     HL
            ld      B, (HL)     ; BC = source
            inc     HL
            ld      A, (HL+)
            ld      H, (HL)
            ld      L, A        ; HL = dest
            
$unshb02:   ld      D, #8
                    
            ld      A, (BC)
            inc     BC
            or      A
            jr      Z, $unshb10
            cp      #1
            jr      Z, $unshb20
            cp      #2
            jr      Z, $unshb30
            cp      #3
            jr      Z, $unshb40
            cp      #4
            jr      Z, $unshb50
            jr      $unshb04

$unshb03:   dec     E
            jr      NZ, $unshb02
                    
$unshb04:   pop     BC
            ret     
            
$unshb10:   xor     A
$unshb11:   ld      (HL+), A
            ld      (HL+), A
            dec     D
            jr      NZ, $unshb11
            jr      $unshb03
         
$unshb20:   ld      A, (BC)
            ld      (HL+), A
            xor     A
            ld      (HL+), A
            inc     BC
            dec     D
            jr      NZ, $unshb20
            jr      $unshb03

$unshb30:   xor     A
            ld      (HL+), A
            ld      A, (BC)
            ld      (HL+), A
            inc     BC
            dec     D
            jr      NZ, $unshb30
            jr      $unshb03

$unshb40:   ld      A, (BC)
            ld      (HL+), A
            ld      (HL+), A
            inc     BC
            dec     D
            jr      NZ, $unshb40
            jr      $unshb03

$unshb50:   ld      A, (BC)
            inc     BC
            ld      (HL+), A
            ld      A, (BC)
            ld      (HL+), A
            inc     BC
            dec     D
            jr      NZ, $unshb50
            jr      $unshb03
__endasm;           
}
   
// unshrink tiles to buffer
unsigned char * get_shrinked_tile_offset(UBYTE tilenum, const unsigned char * shrinked_tiles) __naked
{
    tilenum; shrinked_tiles;
__asm
            lda     HL, 4(SP)
            ld      D, (HL)   
            dec     HL
            ld      E, (HL)     ; DE = shrinked_tiles
            dec     HL
            ld      A, (HL)
            or      A
            ret     Z
            
            ld      L, A        ; L = tilenum
                        
$unshc02:   ld      A, (DE)
            inc     DE

            cp      #5
            ret     NC
            
            or      A
            jr      Z, $unshc03

            cp      #4
            ld      A, #16
            jr      Z, $unshc04

            ld      A, #8
$unshc04:   add     E
            ld      E, A
            ld      A, D
            adc     #0
            ld      D, A

$unshc03:   dec     L
            jr      NZ, $unshc02
                    
            ret     
__endasm;           
}
   
   
// decompress rle-like compressed map to vram
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

            ld      BC, #0x20   ; One line is 20h tiles
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
            ld      BC, #0x20   ; One line is 20h tiles
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

// decompress rle-like compressed buffer
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

// put tile map to buffer, containing another tilemap with buf_w / buf_h dimentions
void put_map_to_buf(UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * source, unsigned char * buf, UBYTE buf_w, UBYTE buf_h) __naked
{
    x; y; w; h; source; buf; buf_w; buf_h;
__asm
            push    BC          ; ret, bc, x, y, w, h, source, buf, buf_w, buf_h
                        
            lda     HL, 4(SP)    
            ld      D, (HL)     ; D = x
            inc     HL
            ld      E, (HL)     ; E = y
            lda     HL, 9(SP)
            ld      B, (HL)     ; BC = source
            dec     HL
            ld      C, (HL)
            dec     HL
            ld      A, (HL-)    ; A = h
            ld      H, (HL)     ; H = w
            ld      L, A        ; L = h

            ld      A, H        ; check x bound
            add     D
            push    HL
            lda     HL, 14(SP)  ; &buf_w
            cp      (HL)        ; buf_w
            jr      C, $putitm08
            ld      A, D
            cp      (HL)        ; buf_w
            jp      NC, $putitm09
            ld      A, (HL)     ; buf_w
            sub     D
            pop     HL
            ld      H, A
            jr      $putitm01
            
$putitm08:  pop     HL

$putitm01:  ld      A, L        ; check y bound
            add     E
            push    HL
            lda     HL, 15(SP)  ; &buf_h
            cp      (HL)        ; buf_h
            jr      C, $putitm0A
            ld      A, E
            cp      (HL)        ; buf_h
            jp      NC, $putitm09
            ld      A, (HL)     ; buf_h
            sub     E
            pop     HL
            ld      L, A
            jr      $putitm07
            
$putitm0A:  pop     HL          

$putitm07:  push    HL          ; Store WH
            
            lda     HL, 12(SP)  ; HL = origin
            ld      A, (HL+)
            ld      H, (HL)
            ld      L, A

$putitm02:  push    BC          ; Store source
            xor     A
            or      E
            jr      Z, $putitm03

            push    HL
            lda     HL, 18(SP)  ; &buf_w
            ld      B, #0
            ld      C, (HL)     ; buf_w
            pop     HL
            
$putitm04:  add     HL, BC      ; Y coordinate
            dec     E
            jr      NZ, $putitm04
            
$putitm03:  ld      B, #0x00    ; X coordinate
            ld      C, D
            add     HL, BC

            pop     BC          ; BC = source
            pop     DE          ; DE = WH
            
            push    HL          ; Store origin
            push    DE          ; Store WH
            push    BC
                                    
$putitm05:  ld      A, (BC)     ; just single tile
            ld      (HL+), A
            inc     BC

            dec     D
            jr      NZ,$putitm05
            
            pop     BC
            
            pop     HL          ; HL = WH
            ld      D,H         ; Restore D = W
            pop     HL          ; HL = origin
            dec     E
            jr      Z,$putitm06

            push    HL          ; Next line
            lda     HL, 14(SP)   
            ld      A, (HL)     ; buf_w
            pop     HL
            add     L
            ld      L, A
            ld      A, H
            adc     #0
            ld      H, A
            
            push    HL
            lda     HL, 8(SP)
            ld      L, (HL)
            
            ld      H, #0
            add     HL, BC
            ld      B, H
            ld      C, L
            pop     HL
            push    HL          ; Store current origin

            push    DE          ; Store WH
            push    BC
            
            jr      $putitm05
            
$putitm09:  pop     HL            
            
$putitm06:  pop     BC
            ret
__endasm;
}

// extract tile map from buffer, containing another tilemap with buf_w / buf_h dimentions
void get_map_from_buf(UBYTE x, UBYTE y, UBYTE w, UBYTE h, unsigned char * dest, unsigned char * buf, UBYTE buf_w, UBYTE buf_h) __naked
{
    x; y; w; h; dest; buf; buf_w; buf_h;
__asm
            push    BC          ; ret, bc, x, y, w, h, dest, buf, buf_w, buf_h
                        
            lda     HL, 4(SP)    
            ld      D, (HL)     ; D = x
            inc     HL
            ld      E, (HL)     ; E = y
            lda     HL, 9(SP)
            ld      B, (HL)     ; BC = dest
            dec     HL
            ld      C, (HL)
            dec     HL
            ld      A, (HL-)    ; A = h
            ld      H, (HL)     ; H = w
            ld      L, A        ; L = h

            ld      A, H        ; check x bound
            add     D
            push    HL
            lda     HL, 14(SP)  ; &buf_w
            cp      (HL)        ; buf_w
            jr      C, $getitm08
            ld      A, D
            cp      (HL)        ; buf_w
            jp      NC, $getitm09
            ld      A, (HL)     ; buf_w
            sub     D
            pop     HL
            ld      H, A
            jr      $getitm01
            
$getitm08:  pop     HL

$getitm01:  ld      A, L        ; check y bound
            add     E
            push    HL
            lda     HL, 15(SP)  ; &buf_h
            cp      (HL)        ; buf_h
            jr      C, $getitm0A
            ld      A, E
            cp      (HL)        ; buf_h
            jp      NC, $getitm09
            ld      A, (HL)     ; buf_h
            sub     E
            pop     HL
            ld      L, A
            jr      $getitm07
            
$getitm0A:  pop     HL          

$getitm07:  push    HL          ; Store WH
            
            lda     HL, 12(SP)  ; HL = origin
            ld      A, (HL+)
            ld      H, (HL)
            ld      L, A

$getitm02:  push    BC          ; Store dest
            xor     A
            or      E
            jr      Z, $getitm03

            push    HL
            lda     HL, 18(SP)  ; &buf_w
            ld      B, #0
            ld      C, (HL)     ; buf_w
            pop     HL
            
$getitm04:  add     HL, BC      ; Y coordinate
            dec     E
            jr      NZ, $getitm04
            
$getitm03:  ld      B, #0x00    ; X coordinate
            ld      C, D
            add     HL, BC

            pop     BC          ; BC = dest
            pop     DE          ; DE = WH
            
            push    HL          ; Store origin
            push    DE          ; Store WH
            push    BC
                                    
$getitm05:  ld      A, (HL+)
            ld      (BC), A     ; just single tile
            inc     BC

            dec     D
            jr      NZ,$getitm05
            
            pop     BC
            
            pop     HL          ; HL = WH
            ld      D,H         ; Restore D = W
            pop     HL          ; HL = origin
            dec     E
            jr      Z,$getitm06

            push    HL          ; Next line
            lda     HL, 14(SP)   
            ld      A, (HL)     ; buf_w
            pop     HL
            add     L
            ld      L, A
            ld      A, H
            adc     #0
            ld      H, A
            
            push    HL
            lda     HL, 8(SP)
            ld      L, (HL)
            
            ld      H, #0
            add     HL, BC
            ld      B, H
            ld      C, L
            pop     HL
            push    HL          ; Store current origin

            push    DE          ; Store WH
            push    BC
            
            jr      $getitm05
            
$getitm09:  pop     HL            
            
$getitm06:  pop     BC
            ret
__endasm;
}
