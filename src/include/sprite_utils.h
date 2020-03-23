void multiple_clear_sprite_tiles(UBYTE start, UBYTE count) __naked
{
    start; count;
__asm
            lda     HL, 2(SP)
            ld      E, (HL)     ; E = start
            inc     HL
            ld      D, (HL)     ; D = count
                
            ld      H, #0x00    ; HL = nb_tiles
            ld      L, E
            add     HL, HL      ; HL *= 16
            add     HL, HL
            add     HL, HL
            add     HL, HL
                
            push    BC
            ld      BC, #0x8000
            add     HL, BC
            pop     BC
 
            push    HL
            ld      L, D
            ld      H, #0
            add     HL, HL      ; HL *= 16
            add     HL, HL
            add     HL, HL
            add     HL, HL
            ld      D, H
            ld      E, L        ; DE = D * 16
            pop     HL
 
$clrspt01:  ldh     A, (#_STAT_REG)
            and     #0x02
            jr      NZ, $clrspt01

            xor     A
            ld      (HL+), A
            dec     DE
            ld      A, D
            or      E
            jr      NZ, $clrspt01

            ret     
__endasm;
}

void multiple_set_sprite_prop(UBYTE start, UBYTE count, UBYTE prop) __naked
{
    start; count; prop;
__asm
            push    BC
            
            lda     HL, 4(SP)
            ld      C, (HL)     ; C = start
            inc     HL
            ld      E, (HL)     ; E = count
            inc     HL
            ld      D, (HL)     ; D = prop
            
            ld      B, #0x00
            sla     C           ; Multiply C by 4
            sla     C

            ld      HL, #0xC000 + 3
            add     HL, BC
            ld      C, #0x04

            ld      A, D        ; Set sprite properties
$clrspt02:  ld      (HL), A
            add     HL, BC
            dec     E
            jr      NZ, $clrspt02
            
            pop     BC
            ret     
__endasm;
}

void multiple_move_sprites(UBYTE start, UBYTE count, UBYTE x, UBYTE y, unsigned char * offsets) __naked
{
    start; count; x; y; offsets;
__asm
            push    BC
            
            lda     HL, 4(SP)
            ld      C, (HL)     ; C = start
            inc     HL
            ld      A, (HL)     ; A = count
            
            ld      B, #0x00
            sla     C           ; Multiply C by 4
            sla     C

            ld      HL, #0xC000
            add     HL, BC

            push    HL
            lda     HL, 11(SP)
            ld      B, (HL)
            dec     HL
            ld      C, (HL)     ; BC = offsets
            dec     HL
            ld      D, (HL)     ; D = y
            dec     HL
            ld      E, (HL)     ; E = x
            pop     HL

$mmspr02:   push    AF

            ld      A, (BC)
            add     D
            ld      (HL+), A
            inc     BC
            ld      A, (BC)
            add     E
            ld      (HL+), A
            inc     BC
            inc     HL
            inc     HL

            pop     AF
            dec     A
            jr      NZ, $mmspr02
            
            pop     BC
            ret     
__endasm;
}
