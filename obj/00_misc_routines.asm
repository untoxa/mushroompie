;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12533 (MINGW32)
;--------------------------------------------------------
	.module 00_misc_routines
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FadeDMG
	.globl _FadeStep
	.globl _execute_inventory
	.globl _execute_dialog
	.globl _draw_fancy_frame
	.globl _prepare_text
	.globl _set_win_tiles
	.globl _wait_vbl_done
	.globl _waitpadup
	.globl _joypad
	.globl _delay
	.globl _inventory_joy
	.globl _old_inventory_selection
	.globl _inventory_selection
	.globl _inventory_items
	.globl _selector_empty
	.globl _selector_offset
	.globl _dlg_idx
	.globl _dlg_unpacked
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_inventory_items::
	.ds 6
_inventory_selection::
	.ds 1
_old_inventory_selection::
	.ds 1
_inventory_joy::
	.ds 1
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
	.area _CODE_1
;src/00_misc_routines.c:41: UBYTE prepare_text(const unsigned char * src, unsigned char * dest) __naked
;	---------------------------------
; Function prepare_text
; ---------------------------------
_prepare_text::
;src/00_misc_routines.c:84: __endasm;           
	push	BC
	lda	HL, 4(SP)
	ld	C, (HL)
	inc	HL
	ld	B, (HL) ; BC = source
	inc	HL
	ld	A, (HL+)
	ld	H, (HL)
	ld	L, A ; HL = dest
	ld	DE, #0
	$preptxt02:
	ld A, (BC)
	inc	BC
	or	A
	jr	Z, $preptxt01
	cp	#32 ; ' '
	jr	C, $preptxt03
	sub	#33
	cp	#58 ; font length in chars
	jr	NC, $preptxt03
	ld	D, A
	ld	A, (#_font_tiles_start)
	add	D
	ld	(HL+), A
	inc	E
	jr	$preptxt02
	$preptxt03:
	xor A
	ld	(HL+), A
	inc	E
	jr	$preptxt02
	$preptxt01:
	ld D, #0
	pop	BC
	ret
;src/00_misc_routines.c:85: }
;src/00_misc_routines.c:87: void draw_fancy_frame(UBYTE lines) {
;	---------------------------------
; Function draw_fancy_frame
; ---------------------------------
_draw_fancy_frame::
;src/00_misc_routines.c:88: if (lines < 11) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x0b
	jr	NC, 00102$
;src/00_misc_routines.c:89: __temp_j = ((lines + 4) << 3); __temp_k = ((144 - __temp_j) >> 1);
	ld	b, (hl)
	ld	a, b
	inc	a
	inc	a
	inc	a
	inc	a
	add	a, a
	add	a, a
	add	a, a
	ld	hl, #___temp_j
	ld	(hl), a
	ld	e, (hl)
	ld	d, #0x00
	ld	a, #0x90
	sub	a, e
	ld	e, a
	sbc	a, a
	sub	a, d
	ld	d, a
	sra	d
	rr	e
	ld	hl, #___temp_k
	ld	(hl), e
;src/00_misc_routines.c:90: lyc_table[6] = __temp_k; lyc_table[7] = __temp_k + __temp_j;
	ld	de, #(_lyc_table + 6)
	ld	a, (hl)
	ld	(de), a
	ld	de, #_lyc_table + 7
	ld	a, (hl)
	ld	hl, #___temp_j
	add	a, (hl)
	ld	(de), a
;src/00_misc_routines.c:91: set_win_tiles(0, title_height, 20, 2, dlg_unpacked);
	ld	de, #_dlg_unpacked
	push	de
	ld	hl, #0x214
	push	hl
	ld	hl, #0x300
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/00_misc_routines.c:92: set_win_tiles(0, title_height + 2, 20, lines + 2, (unsigned char *)dlg_idx[lines]);
	ldhl	sp,	#2
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	ld	de, #_dlg_idx
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
;	spillPairReg hl
	inc	b
	inc	b
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	bc
	inc	sp
	ld	hl, #0x1405
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
	ret
00102$:
;src/00_misc_routines.c:94: lyc_table[6] = 0; lyc_table[7] = 23; // don't draw if window too large
	ld	hl, #(_lyc_table + 6)
	ld	(hl), #0x00
	ld	hl, #(_lyc_table + 7)
	ld	(hl), #0x17
;src/00_misc_routines.c:96: }
	ret
_dlg_unpacked:
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0xe8	; 232
	.db #0xe9	; 233
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xe9	; 233
	.db #0xeb	; 235
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0xe8	; 232
	.db #0xe9	; 233
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xea	; 234
	.db #0xe9	; 233
	.db #0xeb	; 235
	.db #0x00	; 0
	.db #0xed	; 237
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xed	; 237
	.db #0x00	; 0
_dlg_idx:
	.dw (_dlg_unpacked + 220)
	.dw (_dlg_unpacked + 200)
	.dw (_dlg_unpacked + 180)
	.dw (_dlg_unpacked + 160)
	.dw (_dlg_unpacked + 140)
	.dw (_dlg_unpacked + 120)
	.dw (_dlg_unpacked + 100)
	.dw (_dlg_unpacked + 80)
	.dw (_dlg_unpacked + 60)
	.dw (_dlg_unpacked + 40)
;src/00_misc_routines.c:100: void execute_dialog(const UBYTE lines, const dialog_item* item) {
;	---------------------------------
; Function execute_dialog
; ---------------------------------
_execute_dialog::
	dec	sp
	dec	sp
;src/00_misc_routines.c:101: const dialog_item* item_old = 0;
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), a
;src/00_misc_routines.c:102: if (item) {
	ldhl	sp,	#6
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00115$
;src/00_misc_routines.c:103: draw_fancy_frame(lines);
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_draw_fancy_frame
	inc	sp
;src/00_misc_routines.c:104: wait_vbl_done();          // prevent inventory flicking
	call	_wait_vbl_done
;src/00_misc_routines.c:105: inventory = 1;
	ld	hl, #_inventory
	ld	(hl), #0x01
;src/00_misc_routines.c:106: while (item) {
00111$:
	ldhl	sp,	#6
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00113$
;src/00_misc_routines.c:109: if (item->text) set_win_tiles(2 + item->x, 5 + item->y, prepare_text(item->text, __temp_text_buf), 1, __temp_text_buf);
	ld	a, (hl+)
	ld	c, a
;src/00_misc_routines.c:107: if ((item_old != item) && (item)) {
	ld	a, (hl-)
	ld	b, a
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NZ, 00158$
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#1
	sub	a, (hl)
	jr	Z, 00104$
00158$:
	ldhl	sp,	#6
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00104$
;src/00_misc_routines.c:108: wait_vbl_done();
	call	_wait_vbl_done
;src/00_misc_routines.c:109: if (item->text) set_win_tiles(2 + item->x, 5 + item->y, prepare_text(item->text, __temp_text_buf), 1, __temp_text_buf);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	l,a
	or	a,h
	jr	Z, 00102$
	push	bc
	ld	de, #___temp_text_buf
	push	de
	push	hl
	call	_prepare_text
	add	sp, #4
	pop	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	add	a, #0x05
	ld	d, a
	ld	a, (bc)
	add	a, #0x02
	ld	hl, #___temp_text_buf
	push	hl
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
00102$:
;src/00_misc_routines.c:110: item_old = item;
	inc	sp
	inc	sp
	push	bc
00104$:
;src/00_misc_routines.c:112: if (item->key) {
	ld	hl, #0x0004
	add	hl, bc
	ld	e, (hl)
;src/00_misc_routines.c:116: item = item->next;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;src/00_misc_routines.c:112: if (item->key) {
	ld	a, e
	or	a, a
	jr	Z, 00109$
;src/00_misc_routines.c:113: wait_vbl_done();
	push	hl
	call	_wait_vbl_done
	call	_joypad
	pop	hl
	ld	a, (hl)
	and	a,e
	jr	Z, 00111$
;src/00_misc_routines.c:115: waitpadup();
	call	_waitpadup
;src/00_misc_routines.c:116: item = item->next;
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	jp	00111$
00109$:
;src/00_misc_routines.c:118: } else item = item->next;
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	jp	00111$
00113$:
;src/00_misc_routines.c:120: waitpadup();
	call	_waitpadup
00115$:
;src/00_misc_routines.c:122: wait_vbl_done();
	call	_wait_vbl_done
;src/00_misc_routines.c:123: inventory = 0;
	ld	hl, #_inventory
	ld	(hl), #0x00
;src/00_misc_routines.c:124: }
	inc	sp
	inc	sp
	ret
;src/00_misc_routines.c:137: game_item * execute_inventory() {
;	---------------------------------
; Function execute_inventory
; ---------------------------------
_execute_inventory::
;src/00_misc_routines.c:138: draw_fancy_frame(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_draw_fancy_frame
	inc	sp
;src/00_misc_routines.c:140: __temp_i = 0;
	ld	hl, #___temp_i
	ld	(hl), #0x00
;src/00_misc_routines.c:141: if (inventory_item_list.size > 0) {
	ld	a, (#_inventory_item_list + 0)
	or	a, a
	jp	Z, 00105$
;src/00_misc_routines.c:142: __temp_j = (2 + title_height);
	ld	hl, #___temp_j
	ld	(hl), #0x05
;src/00_misc_routines.c:143: __temp_game_item = inventory_item_list.first;        
	ld	de, #(_inventory_item_list + 1)
	ld	a, (de)
	ld	hl, #___temp_game_item
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/00_misc_routines.c:144: while (__temp_game_item) {            
00101$:
	ld	hl, #___temp_game_item + 1
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00106$
;src/00_misc_routines.c:145: inventory_items[__temp_i] = __temp_game_item;
	ld	hl, #___temp_i
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	a, l
	add	a, #<(_inventory_items)
	ld	c, a
	ld	a, h
	adc	a, #>(_inventory_items)
	ld	b, a
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/00_misc_routines.c:146: wait_vbl_done();
	call	_wait_vbl_done
;src/00_misc_routines.c:147: set_win_tiles(3, __temp_j, prepare_text(__temp_game_item->desc->name, __temp_text_buf), 1, __temp_text_buf);
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #___temp_text_buf
	push	de
	push	bc
	call	_prepare_text
	add	sp, #4
	ld	a, e
	ld	de, #___temp_text_buf
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	a, (#___temp_j)
	ld	h, a
	ld	l, #0x03
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/00_misc_routines.c:148: __temp_i++; __temp_j ++;
	ld	hl, #___temp_i
	inc	(hl)
	ld	hl, #___temp_j
	inc	(hl)
;src/00_misc_routines.c:149: __temp_game_item = __temp_game_item->next;
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0007
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #___temp_game_item
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	jr	00101$
00105$:
;src/00_misc_routines.c:152: wait_vbl_done();
	call	_wait_vbl_done
;src/00_misc_routines.c:153: set_win_tiles(3, 6, prepare_text("N O T H I N G", __temp_text_buf), 1, __temp_text_buf);
	ld	de, #___temp_text_buf
	push	de
	ld	de, #___str_0
	push	de
	call	_prepare_text
	add	sp, #4
	ld	a, e
	ld	de, #___temp_text_buf
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x06
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
00106$:
;src/00_misc_routines.c:155: set_win_tiles(5, 9, prepare_text("DON'T DROP", __temp_text_buf), 1, __temp_text_buf);
	ld	de, #___temp_text_buf
	push	de
	ld	de, #___str_1
	push	de
	call	_prepare_text
	add	sp, #4
	ld	a, e
	ld	de, #___temp_text_buf
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x09
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;src/00_misc_routines.c:156: prepare_text("><", __temp_text_buf);
	ld	de, #___temp_text_buf
	push	de
	ld	de, #___str_2
	push	de
	call	_prepare_text
	add	sp, #4
;src/00_misc_routines.c:158: inventory_selection = 0, old_inventory_selection = 1;
	ld	hl, #_inventory_selection
	ld	(hl), #0x00
	ld	hl, #_old_inventory_selection
	ld	(hl), #0x01
;src/00_misc_routines.c:160: wait_vbl_done();
	call	_wait_vbl_done
;src/00_misc_routines.c:161: inventory = 1;    
	ld	hl, #_inventory
	ld	(hl), #0x01
;src/00_misc_routines.c:162: do {
00124$:
;src/00_misc_routines.c:163: if (inventory_selection != old_inventory_selection) {
	ld	a, (#_inventory_selection)
	ld	hl, #_old_inventory_selection
	sub	a, (hl)
	jr	Z, 00108$
;src/00_misc_routines.c:164: __temp_l = selector_offset[old_inventory_selection], __temp_k = selector_offset[inventory_selection];
	ld	a, #<(_selector_offset)
	ld	hl, #_old_inventory_selection
	add	a, (hl)
	ld	c, a
	ld	a, #>(_selector_offset)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	(#___temp_l),a
	ld	a, #<(_selector_offset)
	ld	hl, #_inventory_selection
	add	a, (hl)
	ld	c, a
	ld	a, #>(_selector_offset)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	(#___temp_k),a
;src/00_misc_routines.c:165: wait_vbl_done();
	call	_wait_vbl_done
;src/00_misc_routines.c:166: set_win_tiles(2, __temp_l, 1, 1, selector_empty);
	ld	de, #_selector_empty
	push	de
	ld	hl, #0x101
	push	hl
	ld	a, (#___temp_l)
	ld	h, a
	ld	l, #0x02
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/00_misc_routines.c:167: set_win_tiles(17, __temp_l, 1, 1, selector_empty);
	ld	de, #_selector_empty
	push	de
	ld	hl, #0x101
	push	hl
	ld	a, (#___temp_l)
	ld	h, a
	ld	l, #0x11
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/00_misc_routines.c:168: set_win_tiles(2, __temp_k, 1, 1, __temp_text_buf);
	ld	de, #___temp_text_buf
	push	de
	ld	hl, #0x101
	push	hl
	ld	a, (#___temp_k)
	ld	h, a
	ld	l, #0x02
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/00_misc_routines.c:169: set_win_tiles(17, __temp_k, 1, 1, __temp_text_buf + 1);
	ld	de, #(___temp_text_buf + 1)
	push	de
	ld	hl, #0x101
	push	hl
	ld	a, (#___temp_k)
	ld	h, a
	ld	l, #0x11
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/00_misc_routines.c:171: old_inventory_selection = inventory_selection;
	ld	a, (#_inventory_selection)
	ld	(#_old_inventory_selection),a
;src/00_misc_routines.c:172: waitpadup();
	call	_waitpadup
00108$:
;src/00_misc_routines.c:174: inventory_joy = joypad();
	call	_joypad
	ld	hl, #_inventory_joy
	ld	(hl), e
;src/00_misc_routines.c:175: if (inventory_joy & (J_UP | J_LEFT)) {
	ld	c, (hl)
	ld	a, c
	and	a, #0x06
	jr	Z, 00122$
;src/00_misc_routines.c:176: if (inventory_selection) inventory_selection--; else inventory_selection = __temp_i;
	ld	hl, #_inventory_selection
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
	dec	(hl)
	jr	00125$
00110$:
	ld	a, (#___temp_i)
	ld	(#_inventory_selection),a
	jr	00125$
00122$:
;src/00_misc_routines.c:177: } else if (inventory_joy & (J_DOWN | J_RIGHT)) {
	ld	a, c
	and	a, #0x09
	jr	Z, 00119$
;src/00_misc_routines.c:178: inventory_selection++; if (inventory_selection > __temp_i) inventory_selection = 0;
	ld	hl, #_inventory_selection
	inc	(hl)
	ld	a, (#___temp_i)
	ld	hl, #_inventory_selection
	sub	a, (hl)
	jr	NC, 00125$
	ld	(hl), #0x00
	jr	00125$
00119$:
;src/00_misc_routines.c:179: } else if (inventory_joy & J_B) {
	bit	5, c
	jr	Z, 00125$
;src/00_misc_routines.c:180: waitpadup();
	call	_waitpadup
;src/00_misc_routines.c:181: wait_vbl_done();
	call	_wait_vbl_done
;src/00_misc_routines.c:182: inventory = 0;
	ld	hl, #_inventory
	ld	(hl), #0x00
;src/00_misc_routines.c:183: if (inventory_selection) return inventory_items[inventory_selection - 1];
	ld	hl, #_inventory_selection
	ld	a, (hl)
	or	a, a
	jr	Z, 00125$
	ld	bc, #_inventory_items+0
	ld	a, (hl)
	dec	a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	ret
00125$:
;src/00_misc_routines.c:185: } while(inventory);
	ld	a, (#_inventory)
	or	a, a
	jp	NZ, 00124$
;src/00_misc_routines.c:186: return 0;
	ld	de, #0x0000
;src/00_misc_routines.c:187: }
	ret
_selector_offset:
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
_selector_empty:
	.db #0x00	; 0
___str_0:
	.ascii "N O T H I N G"
	.db 0x00
___str_1:
	.ascii "DON'T DROP"
	.db 0x00
___str_2:
	.ascii "><"
	.db 0x00
;src/00_misc_routines.c:191: UBYTE FadeStep(UBYTE pal, UBYTE step) __naked {
;	---------------------------------
; Function FadeStep
; ---------------------------------
_FadeStep::
;src/00_misc_routines.c:230: __endasm;
	lda	HL, 3(SP)
	ld	A, (HL-)
	ld	E, (HL)
	or	A
	jr	Z, $fadeout03
	ld	D, A
	push	BC
	$fadeout00:
	ld	B, #4
	$fadeout01:
	ld	A, E
	and	#3
	cp	#3
	jr	Z, $fadeout02
	inc	A
	$fadeout02:
	srl A
	rr	C
	srl	A
	rr	C
	srl	E
	srl	E
	dec	B
	jr	NZ, $fadeout01
	ld	E, C
	dec	D
	jr	NZ, $fadeout00
	pop	BC
	ret
	$fadeout03:
	ld D, #0
	ret
;src/00_misc_routines.c:231: }
;src/00_misc_routines.c:233: void FadeDMG(UBYTE dir, UBYTE bgp, UBYTE obp0, UBYTE obp1) {
;	---------------------------------
; Function FadeDMG
; ---------------------------------
_FadeDMG::
;src/00_misc_routines.c:235: for (UBYTE i = 0; i < 4; i++) {
	ld	c, #0x00
00106$:
	ld	a, c
	sub	a, #0x04
	ret	NC
;src/00_misc_routines.c:236: if (dir) j = 3 - i; else j = i;
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
	ld	b, c
	ld	a, #0x03
	sub	a, b
	ld	b, a
	jr	00103$
00102$:
	ld	b, c
00103$:
;src/00_misc_routines.c:237: wait_vbl_done();
	call	_wait_vbl_done
;src/00_misc_routines.c:238: BGP_REG  = FadeStep(bgp,  j); 
	push	bc
	push	bc
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_FadeStep
	pop	hl
	ld	a, e
	pop	bc
	ldh	(_BGP_REG + 0), a
;src/00_misc_routines.c:239: OBP0_REG = FadeStep(obp0, j); 
	push	bc
	push	bc
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_FadeStep
	pop	hl
	ld	a, e
	pop	bc
	ldh	(_OBP0_REG + 0), a
;src/00_misc_routines.c:240: OBP1_REG = FadeStep(obp1, j);
	push	bc
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_FadeStep
	pop	hl
	ld	a, e
	pop	bc
	ldh	(_OBP1_REG + 0), a
;src/00_misc_routines.c:241: delay(50);
	push	bc
	ld	de, #0x0032
	push	de
	call	_delay
	pop	hl
	pop	bc
;src/00_misc_routines.c:235: for (UBYTE i = 0; i < 4; i++) {
	inc	c
;src/00_misc_routines.c:243: }
	jr	00106$
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
