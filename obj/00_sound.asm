;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12533 (MINGW32)
;--------------------------------------------------------
	.module 00_sound
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FX_ADDR_LO
	.globl _FX_REG_SIZES
	.globl _PlayFx
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/00_sound.c:6: void PlayFx(SOUND_CHANNEL channel, UINT8 mute_frames, ...) __naked {
;	---------------------------------
; Function PlayFx
; ---------------------------------
_PlayFx::
;src/00_sound.c:35: __endasm;
	push	BC
	lda	HL, 4(SP)
	ld	B, #0
	ld	C, (HL) ; BC = channel
	ld	HL, #_FX_REG_SIZES
	add	HL, BC
	ld	E, (HL) ; E = FX_REG_SIZES[channel]
	ld	HL, #_FX_ADDR_LO
	add	HL, BC
	ld	B, #0xFF
	ld	C, (HL) ; BC = 0xFF00 + FX_ADDR_LO[channel]
	lda	HL, 6(SP)
	1$:
	ld	A, (HL+)
	inc	HL
	ld	(BC), A
	inc	BC
	dec	E
	jr	NZ, 1$
	pop	BC
	ret
;src/00_sound.c:36: }
	.area _CODE
_FX_REG_SIZES:
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x03	; 3
_FX_ADDR_LO:
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x1a	; 26
	.db #0x20	; 32
	.db #0x24	; 36
	.area _INITIALIZER
	.area _CABS (ABS)
