;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12533 (MINGW32)
;--------------------------------------------------------
	.module 00_bank_stack
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_bank
	.globl _set_bank
	.globl _pop_bank
	.globl _push_bank
	.globl ___banks_sp
	.globl ___banks_storage
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
___banks_storage::
	.ds 8
___banks_sp::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
;src/00_bank_stack.c:6: void push_bank(const unsigned char n) NONBANKED {
;	---------------------------------
; Function push_bank
; ---------------------------------
_push_bank::
;src/00_bank_stack.c:7: *(++__banks_sp) = n;
	ld	hl, #___banks_sp
	inc	(hl)
	jr	NZ, 00103$
	inc	hl
	inc	(hl)
00103$:
	ld	hl, #___banks_sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
;src/00_bank_stack.c:8: SWITCH_ROM_MBC1(n);
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	de, #0x2000
	ld	a, (hl)
	ld	(de), a
;src/00_bank_stack.c:9: }
	ret
;src/00_bank_stack.c:11: void pop_bank() NONBANKED {
;	---------------------------------
; Function pop_bank
; ---------------------------------
_pop_bank::
;src/00_bank_stack.c:12: unsigned char n = *(--__banks_sp);
	ld	hl, #___banks_sp
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
;src/00_bank_stack.c:13: SWITCH_ROM_MBC1(n);
	ldh	(__current_bank + 0), a
	ld	(#0x2000),a
;src/00_bank_stack.c:14: }
	ret
;src/00_bank_stack.c:16: void set_bank(const unsigned char n) NONBANKED {
;	---------------------------------
; Function set_bank
; ---------------------------------
_set_bank::
;src/00_bank_stack.c:17: *__banks_sp = n;
	ld	hl, #___banks_sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
;src/00_bank_stack.c:18: SWITCH_ROM_MBC1(n);
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	de, #0x2000
	ld	a, (hl)
	ld	(de), a
;src/00_bank_stack.c:19: }
	ret
;src/00_bank_stack.c:21: unsigned char get_bank() NONBANKED {
;	---------------------------------
; Function get_bank
; ---------------------------------
_get_bank::
;src/00_bank_stack.c:22: return (*__banks_sp);
	ld	hl, #___banks_sp
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (___banks_sp + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;src/00_bank_stack.c:23: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
__xinit____banks_storage:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit____banks_sp:
	.dw ___banks_storage
	.area _CABS (ABS)
