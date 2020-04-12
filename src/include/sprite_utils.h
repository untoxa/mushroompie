void multiple_clear_sprite_tiledata(UBYTE start, UBYTE count) __naked
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
$setspp01:  ld      (HL), A
            add     HL, BC
            dec     E
            jr      NZ, $setspp01
            
            pop     BC
            ret     
__endasm;
}

void multiple_set_sprite_tiles(UBYTE start, UBYTE count, const unsigned char * tiles) __naked
{
    start; count; tiles;
__asm
            push    BC
            
            lda     HL, 4(SP)
            ld      C, (HL)     ; C = start
            inc     HL
            ld      E, (HL)     ; E = count
            inc     HL
            
            ld      A, (HL+)    
            ld      H, (HL)
            ld      L, A
            push    HL          ; HL = tiles
            
            ld      B, #0x00
            sla     C           ; Multiply C by 4
            sla     C

            ld      HL, #0xC000 + 2
            add     HL, BC
            ld      C, #0x04

            ld      A, E        ; E --> A = count
            pop     DE          ; HL --> DE = tiles

$setspt01:  push    AF
            ld      A, (DE)
            inc     DE
            ld      (HL), A
            add     HL, BC
            pop     AF
            dec     A
            jr      NZ, $setspt01
            
            pop     BC
            ret     
__endasm;
}

void multiple_move_sprites(UBYTE start, UBYTE count, UBYTE x, UBYTE y, const unsigned char * offsets) __naked
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
            inc     BC
            add     D
            ld      (HL), A
            ld      A, (BC)
            inc     BC
            
            push    BC
            ld      BC, #1
            add     HL, BC      ; use add instruction to avoid oam bug
            
            add     E
            ld      (HL), A
            ld      C, #3
            add     HL, BC      ; use add instruction to avoid oam bug
            pop     BC
            
            pop     AF
            dec     A
            jr      NZ, $mmspr02
            
            pop     BC
            ret     
__endasm;
}

void multiple_move_sprites_limits(UBYTE start, UBYTE count, UBYTE x, UBYTE y, const unsigned char * offsets) __naked
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

$mmsprl02:  push    AF

            ld      A, (BC)
            inc     BC
            add     D
            
            push    HL
            ld      H, B
            ld      L, C
            cp      (HL)
            jr      NC, $mmsprl03
            inc     BC
            xor     A
            jr      $mmsprl04
$mmsprl03:  inc     BC
            inc     HL
            cp      (HL)
            jr      C, $mmsprl04
            jr      Z, $mmsprl04
            xor     A
            
$mmsprl04:  pop     HL
            ld      (HL), A
            
            push    BC          
            ld      BC, #1
            add     HL, BC      ; use add instruction to avoid oam bug      
            pop     BC
            
            inc     BC
            ld      A, (BC)
            inc     BC
            add     E
            
            push    HL
            ld      H, B
            ld      L, C
            cp      (HL)
            jr      NC, $mmsprl05
            inc     BC
            xor     A
            jr      $mmsprl06
$mmsprl05:  inc     BC
            inc     HL
            cp      (HL)
            jr      C, $mmsprl06
            jr      Z, $mmsprl06
            xor     A
            
$mmsprl06:  pop     HL
            ld      (HL), A

            push    BC          
            ld      BC, #3
            add     HL, BC      ; use add instruction to avoid oam bug
            pop     BC

            inc     BC

            pop     AF
            dec     A
            jr      NZ, $mmsprl02
            
            pop     BC
            ret     
__endasm;
}
