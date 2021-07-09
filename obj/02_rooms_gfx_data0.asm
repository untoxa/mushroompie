;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12533 (MINGW32)
;--------------------------------------------------------
	.module 02_rooms_gfx_data0
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _room_5_0_tiles
	.globl _room_5_0_coll
	.globl _room_5_0_map
	.globl _enemies_4_0_tiles
	.globl _room_4_0_tiles
	.globl _room_4_0_coll
	.globl _room_4_0_map
	.globl _room_3_0_tiles
	.globl _room_3_0_coll
	.globl _room_3_0_map
	.globl _enemies_2_0_tiles
	.globl _room_2_0_tiles
	.globl _room_2_0_coll
	.globl _room_2_0_map
	.globl _room_1_0_tiles
	.globl _room_1_0_coll
	.globl _room_1_0_map
	.globl _room_0_0_tiles
	.globl _room_0_0_coll
	.globl _room_0_0_map
	.globl _grand_gets_pie
	.globl _dizzy_catches_firefly
	.globl _find_firefly
	.globl _draw_flies4_0
	.globl _move_flies4_0
	.globl _init_room4_0
	.globl _coll_spider
	.globl _draw_spider
	.globl _move_spider
	.globl _init_room2_0
	.globl _multiple_set_sprite_tiles
	.globl _multiple_move_sprites_limits
	.globl _multiple_move_sprites
	.globl _default_drop
	.globl _find_by_id
	.globl _pop_by_id
	.globl _push_last
	.globl _show_dialog_window
	.globl _set_sprite_data
	.globl _spider_pos_y
	.globl _spider_dir
	.globl _spider_phase
	.globl _fly_phase
	.globl _fly_ptr
	.globl _flies
	.globl _spider0
	.globl _spidertn
	.globl _spidernettn
	.globl _spider_offsets
	.globl _spider_net_ofs
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_flies::
	.ds 12
_fly_ptr::
	.ds 2
_fly_phase::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_spider_phase::
	.ds 1
_spider_dir::
	.ds 1
_spider_pos_y::
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_3
;src/rooms/room_2_0.c:22: void init_room2_0() {
;	---------------------------------
; Function init_room2_0
; ---------------------------------
_init_room2_0::
;src/rooms/room_2_0.c:23: set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0007
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (bc)
	push	de
	ld	h, a
	ld	l, #0x09
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/rooms/room_2_0.c:24: multiple_set_sprite_tiles(spider_net_sprite_offset, spider_net_sprite_count, spidernettn);
	ld	de, #_spidernettn
	push	de
	ld	hl, #0x60d
	push	hl
	call	_multiple_set_sprite_tiles
	add	sp, #4
;src/rooms/room_2_0.c:25: }
	ret
_spider_net_ofs:
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0x58	; 88	'X'
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x58	; 88	'X'
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x58	; 88	'X'
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0x58	; 88	'X'
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x28	; 40
	.db #0x58	; 88	'X'
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xff	; 255
_spider_offsets:
	.db #0x28	; 40
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x10	; 16
_spidernettn:
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0d	; 13
_spidertn:
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
_spider0:
	.dw (_spidertn + 0)
	.dw (_spidertn + 2)
;src/rooms/room_2_0.c:31: void move_spider() {
;	---------------------------------
; Function move_spider
; ---------------------------------
_move_spider::
;src/rooms/room_2_0.c:32: if (spider_phase & 1) {
	ld	a, (#_spider_phase)
	rrca
	ret	NC
;src/rooms/room_2_0.c:33: if (spider_dir) {
	ld	a, (#_spider_dir)
	or	a, a
	jr	Z, 00106$
;src/rooms/room_2_0.c:34: spider_pos_y += 2; if (spider_pos_y >= spider_max_y) spider_dir = 0;
	ld	hl, #_spider_pos_y
	ld	a, (hl)
	add	a, #0x02
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0x5e
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00133$
	bit	7, d
	jr	NZ, 00134$
	cp	a, a
	jr	00134$
00133$:
	bit	7, d
	jr	Z, 00134$
	scf
00134$:
	ret	C
	ld	hl, #_spider_dir
	ld	(hl), #0x00
	ret
00106$:
;src/rooms/room_2_0.c:36: spider_pos_y--; if (spider_pos_y <= spider_min_y) spider_dir = 1;
	ld	hl, #_spider_pos_y
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, #0x38
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00135$
	bit	7, d
	jr	NZ, 00136$
	cp	a, a
	jr	00136$
00135$:
	bit	7, d
	jr	Z, 00136$
	scf
00136$:
	ret	C
	ld	hl, #_spider_dir
	ld	(hl), #0x01
;src/rooms/room_2_0.c:39: }
	ret
;src/rooms/room_2_0.c:41: void draw_spider() {
;	---------------------------------
; Function draw_spider
; ---------------------------------
_draw_spider::
;src/rooms/room_2_0.c:42: if (spider_phase == 0) {
	ld	a, (#_spider_phase)
	or	a, a
	jr	NZ, 00104$
;src/rooms/room_2_0.c:43: multiple_set_sprite_tiles(evil_sprite_offset, spider_sprite_count, spider0[0]);        
	ld	hl, #_spider0
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x209
	push	hl
	call	_multiple_set_sprite_tiles
	add	sp, #4
	jr	00105$
00104$:
;src/rooms/room_2_0.c:44: } else if (spider_phase == 4) {
	ld	a, (#_spider_phase)
	sub	a, #0x04
	jr	NZ, 00105$
;src/rooms/room_2_0.c:45: multiple_set_sprite_tiles(evil_sprite_offset, spider_sprite_count, spider0[1]);        
	ld	hl, #(_spider0 + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x209
	push	hl
	call	_multiple_set_sprite_tiles
	add	sp, #4
00105$:
;src/rooms/room_2_0.c:47: spider_phase++; spider_phase &= 7;
	ld	hl, #_spider_phase
	inc	(hl)
	ld	a, (hl)
	and	a, #0x07
	ld	(hl), a
;src/rooms/room_2_0.c:51: -bkg_scroll_x_target, -bkg_scroll_y_target);    
	xor	a, a
	ld	hl, #_bkg_scroll_y_target
	sub	a, (hl)
	ld	c, a
	xor	a, a
	ld	hl, #_bkg_scroll_x_target
	sub	a, (hl)
	ld	b, a
;src/rooms/room_2_0.c:50: (unsigned char *)spider_net_ofs, 
	ld	de, #_spider_net_ofs
;src/rooms/room_2_0.c:49: spider_pos_x, (spider_pos_y & 0xFFF8), 
	ld	a, (#_spider_pos_y)
	and	a, #0xf8
;src/rooms/room_2_0.c:48: multiple_move_sprites_limits(spider_net_sprite_offset, spider_net_sprite_count, 
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	de
	ld	h, a
	ld	l, #0x98
	push	hl
	ld	hl, #0x60d
	push	hl
	call	_multiple_move_sprites_limits
	add	sp, #8
;src/rooms/room_2_0.c:54: (unsigned char *)spider_offsets);    
;src/rooms/room_2_0.c:53: spider_pos_x - bkg_scroll_x_target, spider_pos_y - bkg_scroll_y_target, 
	ld	a, (#_spider_pos_y)
	ld	hl, #_bkg_scroll_y_target
	ld	c, (hl)
	sub	a, c
	ld	b, a
	ld	a, #0x98
	ld	hl, #_bkg_scroll_x_target
	sub	a, (hl)
;src/rooms/room_2_0.c:52: multiple_move_sprites(spider_sprite_offset, spider_sprite_count, 
	ld	de, #_spider_offsets
	push	de
	push	bc
	inc	sp
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_multiple_move_sprites
	add	sp, #6
;src/rooms/room_2_0.c:55: }
	ret
;src/rooms/room_2_0.c:57: void coll_spider(WORD x, WORD y) {
;	---------------------------------
; Function coll_spider
; ---------------------------------
_coll_spider::
;src/rooms/room_2_0.c:58: if (!((spider_pos_x > x + 16) || 
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, c
	sub	a, #0x98
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	C
;src/rooms/room_2_0.c:59: (spider_pos_x + 16 < x) ||
	ldhl	sp,	#2
	ld	a, #0xa8
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00128$
	bit	7, d
	jr	NZ, 00129$
	cp	a, a
	jr	00129$
00128$:
	bit	7, d
	jr	Z, 00129$
	scf
00129$:
	ret	C
;src/rooms/room_2_0.c:60: (spider_pos_y > y + 20) ||
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_spider_pos_y
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00130$
	bit	7, d
	jr	NZ, 00131$
	cp	a, a
	jr	00131$
00130$:
	bit	7, d
	jr	Z, 00131$
	scf
00131$:
	ret	C
;src/rooms/room_2_0.c:61: (spider_pos_y + 8 < y))) {
	ld	hl, #_spider_pos_y
	ld	a, (hl+)
	add	a, #0x08
	ld	c, a
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	ldhl	sp,	#4
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00132$
	bit	7, d
	jr	NZ, 00133$
	cp	a, a
	jr	00133$
00132$:
	bit	7, d
	jr	Z, 00133$
	scf
00133$:
	ret	C
;src/rooms/room_2_0.c:62: dec_energy += 3;
	ld	hl, #_dec_energy
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
;src/rooms/room_2_0.c:64: }
	ret
;src/rooms/room_4_0.c:7: void init_room4_0() {
;	---------------------------------
; Function init_room4_0
; ---------------------------------
_init_room4_0::
;src/rooms/room_4_0.c:8: set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0007
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (bc)
	push	de
	ld	h, a
	ld	l, #0x09
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/rooms/room_4_0.c:9: }
	ret
;src/rooms/room_4_0.c:11: void move_flies4_0() {
;	---------------------------------
; Function move_flies4_0
; ---------------------------------
_move_flies4_0::
	add	sp, #-4
;src/rooms/room_4_0.c:12: for (__temp_i = 0; __temp_i < 3; __temp_i++) {
	ld	hl, #___temp_i
	ld	(hl), #0x00
00115$:
;src/rooms/room_4_0.c:13: fly_ptr = &flies[__temp_i];
	ld	hl, #___temp_i
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_flies
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_fly_ptr
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/rooms/room_4_0.c:14: if (fly_phase & 1) {
	ld	a, (#_fly_phase)
	ldhl	sp,	#3
	ld	(hl), a
;src/rooms/room_4_0.c:15: fly_ptr->x += fly_delta[(*(ptr_div_reg)) & 7];
	ld	a, (#_fly_ptr)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_fly_ptr + 1)
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #_ptr_div_reg
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_ptr_div_reg + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_fly_delta
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/rooms/room_4_0.c:14: if (fly_phase & 1) {
	push	hl
	ldhl	sp,	#5
	bit	0, (hl)
	pop	hl
	jr	Z, 00112$
;src/rooms/room_4_0.c:15: fly_ptr->x += fly_delta[(*(ptr_div_reg)) & 7];
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	hl, #_fly_ptr
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/rooms/room_4_0.c:16: if (fly_ptr->x < 0) fly_ptr->x = 0; 
	bit	7, h
	jr	Z, 00104$
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
	jp	00116$
00104$:
;src/rooms/room_4_0.c:17: else if (fly_ptr->x > (room_width * 8)) fly_ptr->x = ((room_width * 8) - 1);
	ld	e, h
	ld	d, #0x00
	ld	a, #0xf0
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00150$
	bit	7, d
	jr	NZ, 00151$
	cp	a, a
	jr	00151$
00150$:
	bit	7, d
	jr	Z, 00151$
	scf
00151$:
	jr	NC, 00116$
	ld	a, #0xef
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	jr	00116$
00112$:
;src/rooms/room_4_0.c:19: fly_ptr->y += fly_delta[(*(ptr_div_reg)) & 7];
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/rooms/room_4_0.c:15: fly_ptr->x += fly_delta[(*(ptr_div_reg)) & 7];
	ld	hl, #_fly_ptr
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/rooms/room_4_0.c:19: fly_ptr->y += fly_delta[(*(ptr_div_reg)) & 7];
	inc	bc
	inc	bc
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/rooms/room_4_0.c:20: if (fly_ptr->y < 0) fly_ptr->y = 0; 
	bit	7, h
	jr	Z, 00109$
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
	jr	00116$
00109$:
;src/rooms/room_4_0.c:21: else if (fly_ptr->y > (room_height * 8)) fly_ptr->y = ((room_height * 8) - 1);
	ld	e, h
	ld	d, #0x00
	ld	a, #0x88
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00152$
	bit	7, d
	jr	NZ, 00153$
	cp	a, a
	jr	00153$
00152$:
	bit	7, d
	jr	Z, 00153$
	scf
00153$:
	jr	NC, 00116$
	ld	a, #0x87
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
00116$:
;src/rooms/room_4_0.c:12: for (__temp_i = 0; __temp_i < 3; __temp_i++) {
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jp	C, 00115$
;src/rooms/room_4_0.c:24: }
	add	sp, #4
	ret
;src/rooms/room_4_0.c:26: void draw_flies4_0() {
;	---------------------------------
; Function draw_flies4_0
; ---------------------------------
_draw_flies4_0::
;src/rooms/room_4_0.c:27: switch (fly_phase) {
	ld	a, #0x06
	ld	hl, #_fly_phase
	sub	a, (hl)
	jr	C, 00107$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00129$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00129$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00107$
	jp	00104$
	jp	00105$
	jp	00106$
;src/rooms/room_4_0.c:28: case 0 : set_sprite_tile(fly_sprite_offset0,     evil_sprites_tileoffset); break;
00101$:
;c:/gb/gbdk/include/gb/gb.h:1185: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x09
;src/rooms/room_4_0.c:28: case 0 : set_sprite_tile(fly_sprite_offset0,     evil_sprites_tileoffset); break;
	jr	00107$
;src/rooms/room_4_0.c:29: case 1 : set_sprite_tile(fly_sprite_offset0 + 1, evil_sprites_tileoffset); break;
00102$:
;c:/gb/gbdk/include/gb/gb.h:1185: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x09
;src/rooms/room_4_0.c:29: case 1 : set_sprite_tile(fly_sprite_offset0 + 1, evil_sprites_tileoffset); break;
	jr	00107$
;src/rooms/room_4_0.c:30: case 2 : set_sprite_tile(fly_sprite_offset0 + 2, evil_sprites_tileoffset); break;
00103$:
;c:/gb/gbdk/include/gb/gb.h:1185: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), #0x09
;src/rooms/room_4_0.c:30: case 2 : set_sprite_tile(fly_sprite_offset0 + 2, evil_sprites_tileoffset); break;
	jr	00107$
;src/rooms/room_4_0.c:32: case 4 : set_sprite_tile(fly_sprite_offset0,     (evil_sprites_tileoffset + 1)); break;
00104$:
;c:/gb/gbdk/include/gb/gb.h:1185: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x0a
;src/rooms/room_4_0.c:32: case 4 : set_sprite_tile(fly_sprite_offset0,     (evil_sprites_tileoffset + 1)); break;
	jr	00107$
;src/rooms/room_4_0.c:33: case 5 : set_sprite_tile(fly_sprite_offset0 + 1, (evil_sprites_tileoffset + 1)); break;
00105$:
;c:/gb/gbdk/include/gb/gb.h:1185: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x0a
;src/rooms/room_4_0.c:33: case 5 : set_sprite_tile(fly_sprite_offset0 + 1, (evil_sprites_tileoffset + 1)); break;
	jr	00107$
;src/rooms/room_4_0.c:34: case 6 : set_sprite_tile(fly_sprite_offset0 + 2, (evil_sprites_tileoffset + 1)); break;
00106$:
;c:/gb/gbdk/include/gb/gb.h:1185: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), #0x0a
;src/rooms/room_4_0.c:35: }
00107$:
;src/rooms/room_4_0.c:36: fly_phase++; fly_phase &= 7;
	ld	hl, #_fly_phase
	inc	(hl)
	ld	a, (hl)
	and	a, #0x07
	ld	(hl), a
;src/rooms/room_4_0.c:37: for (__temp_i = 0; __temp_i < 3; __temp_i++) {
	ld	hl, #___temp_i
	ld	(hl), #0x00
00115$:
;src/rooms/room_4_0.c:38: fly_ptr = &flies[__temp_i];
	ld	hl, #___temp_i
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_flies
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_fly_ptr
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/rooms/room_4_0.c:41: (unsigned char *)fly_offsets);
;src/rooms/room_4_0.c:40: fly_ptr->x - bkg_scroll_x_target, fly_ptr->y - bkg_scroll_y_target,
	ld	hl, #_fly_ptr
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	hl, #_bkg_scroll_y_target
	ld	c, (hl)
	sub	a, c
	ld	b, a
	ld	a, (de)
	ld	hl, #_bkg_scroll_x_target
	ld	c, (hl)
	sub	a, c
	ld	c, a
;src/rooms/room_4_0.c:39: multiple_move_sprites(fly_sprite_offset0 + __temp_i, 1, 
	ld	hl, #___temp_i
	ld	a, (hl)
	add	a, #0x09
	ld	de, #_fly_offsets
	push	de
	push	bc
	inc	sp
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_multiple_move_sprites
	add	sp, #6
;src/rooms/room_4_0.c:37: for (__temp_i = 0; __temp_i < 3; __temp_i++) {
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00115$
;src/rooms/room_4_0.c:43: }
	ret
;src/rooms/room_4_0.c:45: fly_coord_t * find_firefly(UBYTE tile_x, UBYTE tile_y) {
;	---------------------------------
; Function find_firefly
; ---------------------------------
_find_firefly::
	add	sp, #-3
;src/rooms/room_4_0.c:47: for (__temp_i = 0; __temp_i < 3; __temp_i++) {
	ld	hl, #___temp_i
	ld	(hl), #0x00
00107$:
;src/rooms/room_4_0.c:48: fly_ptr = &flies[__temp_i];
	ld	hl, #___temp_i
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_flies
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_fly_ptr
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/rooms/room_4_0.c:50: ff_tile_x = fly_ptr->x >> 3, ff_tile_y = fly_ptr->y >> 3;        
	ld	hl, #_fly_ptr
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#2
	ld	(hl), e
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#0
;src/rooms/room_4_0.c:52: if ((ff_tile_x >= tile_x) && (ff_tile_x <= tile_x + 2) &&
	ld	a, c
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#5
	sub	a, (hl)
	jr	C, 00108$
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	ldhl	sp,	#2
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00141$
	bit	7, d
	jr	NZ, 00142$
	cp	a, a
	jr	00142$
00141$:
	bit	7, d
	jr	Z, 00142$
	scf
00142$:
	jr	C, 00108$
;src/rooms/room_4_0.c:53: (ff_tile_y >= tile_y) && (ff_tile_y <= tile_y + 1)) return fly_ptr;
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#6
	sub	a, (hl)
	jr	C, 00108$
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00143$
	bit	7, d
	jr	NZ, 00144$
	cp	a, a
	jr	00144$
00143$:
	bit	7, d
	jr	Z, 00144$
	scf
00144$:
	jr	C, 00108$
	ld	hl, #_fly_ptr
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	jr	00109$
00108$:
;src/rooms/room_4_0.c:47: for (__temp_i = 0; __temp_i < 3; __temp_i++) {
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jp	C, 00107$
;src/rooms/room_4_0.c:55: return 0;
	ld	de, #0x0000
00109$:
;src/rooms/room_4_0.c:56: }
	add	sp, #3
	ret
;src/rooms/room_4_0.c:58: UBYTE dizzy_catches_firefly(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
;	---------------------------------
; Function dizzy_catches_firefly
; ---------------------------------
_dizzy_catches_firefly::
;src/rooms/room_4_0.c:61: if (id == ID_LID) {
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x07
	jp	NZ,00112$
;src/rooms/room_4_0.c:62: temp_item = find_by_id(&inventory_item_list, ID_JAR);
	ld	a, #0x06
	push	af
	inc	sp
	ld	de, #_inventory_item_list
	push	de
	call	_find_by_id
	add	sp, #3
	ld	a, e
;src/rooms/room_4_0.c:63: if (temp_item) {
	or	a, d
	jp	Z, 00112$
;src/rooms/room_4_0.c:64: temp_fly = find_firefly(tile_x, tile_y);
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_find_firefly
	pop	hl
	ld	c, e
	ld	b, d
;src/rooms/room_4_0.c:65: if (temp_fly) {
	ld	a, b
	or	a, c
	jr	Z, 00112$
;src/rooms/room_4_0.c:67: temp_item = pop_by_id(&inventory_item_list, ID_JAR);
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	ld	de, #_inventory_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
	pop	bc
;src/rooms/room_4_0.c:68: if (temp_item) push_last(&item_stack, temp_item);
	ld	a, d
	or	a, e
	jr	Z, 00102$
	push	bc
	push	de
	ld	de, #_item_stack
	push	de
	call	_push_last
	add	sp, #4
	pop	bc
00102$:
;src/rooms/room_4_0.c:70: temp_item = pop_by_id(&game_item_list, ID_FIREFLY);
	push	bc
	ld	a, #0x08
	push	af
	inc	sp
	ld	de, #_game_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
	pop	bc
;src/rooms/room_4_0.c:71: if (!temp_item) temp_item = pop_by_id(&item_stack, ID_FIREFLY);
	ld	a, d
	or	a, e
	jr	NZ, 00104$
	push	bc
	ld	a, #0x08
	push	af
	inc	sp
	ld	de, #_item_stack
	push	de
	call	_pop_by_id
	add	sp, #3
	pop	bc
00104$:
;src/rooms/room_4_0.c:72: if (temp_item) push_last(&inventory_item_list, temp_item);                
	ld	a, d
	or	a, e
	jr	Z, 00106$
	push	bc
	push	de
	ld	de, #_inventory_item_list
	push	de
	call	_push_last
	add	sp, #4
	pop	bc
00106$:
;src/rooms/room_4_0.c:74: temp_fly->x = 8, temp_fly->y = 8;
	ld	l, c
	ld	h, b
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
	inc	bc
	inc	bc
	ld	a, #0x08
	ld	(bc), a
	inc	bc
	ld	a, #0x00
	ld	(bc), a
;src/rooms/room_4_0.c:76: show_dialog_window(2, &firefly_caught);
	ld	de, #_firefly_caught
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_4_0.c:78: return ID_ITEM_USED;
	ld	e, #0x0f
	ret
00112$:
;src/rooms/room_4_0.c:82: return default_drop(id);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_default_drop
	inc	sp
;src/rooms/room_4_0.c:83: }
	ret
;src/rooms/room_5_0.c:1: UBYTE grand_gets_pie(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
;	---------------------------------
; Function grand_gets_pie
; ---------------------------------
_grand_gets_pie::
;src/rooms/room_5_0.c:2: if (id == ID_PIE) {
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00106$
;src/rooms/room_5_0.c:3: if ((tile_y == 7) && (tile_x > 18) && (tile_x < 22)) {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x07
	jr	NZ, 00106$
	ld	a, #0x12
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00106$
	ld	a, (hl)
	sub	a, #0x16
	jr	NC, 00106$
;src/rooms/room_5_0.c:4: show_dialog_window(6, &grandpa_thanks);
	ld	de, #_grandpa_thanks
	push	de
	ld	a, #0x06
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_5_0.c:5: return ID_ITEM_USED;
	ld	e, #0x0f
	ret
00106$:
;src/rooms/room_5_0.c:8: return default_drop(id);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_default_drop
	inc	sp
;src/rooms/room_5_0.c:9: }
	ret
	.area _CODE_3
_room_0_0_map:
	.dw #0x00fc
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0xc2	; 194
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0xc2	; 194
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0xc3	; 195
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0xd2	; 210
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0xd2	; 210
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0xc2	; 194
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x07	; 7
	.db #0x16	; 22
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0xc2	; 194
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x08	; 8
	.db #0x25	; 37
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0xc2	; 194
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x29	; 41
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x0a	; 10
	.db #0x07	; 7
	.db #0x16	; 22
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x25	; 37
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0xd5	; 213
	.db #0x00	; 0
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x53	; 83	'S'
	.db #0x52	; 82	'R'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x1c	; 28
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x1d	; 29
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x6c	; 108	'l'
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x0b	; 11
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0xc2	; 194
	.db #0x54	; 84	'T'
_room_0_0_coll:
	.dw #0x005b
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x05	; 5
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x05	; 5
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x02	; 2
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0xcb	; 203
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc4	; 196
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0xd7	; 215
	.db #0x01	; 1
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x01	; 1
_room_0_0_tiles:
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x1d	; 29
	.db #0x82	; 130
	.db #0x70	; 112	'p'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x4c	; 76	'L'
	.db #0x1a	; 26
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x2e	; 46
	.db #0x19	; 25
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x41	; 65	'A'
	.db #0xb8	; 184
	.db #0x64	; 100	'd'
	.db #0x51	; 81	'Q'
	.db #0x01	; 1
	.db #0xce	; 206
	.db #0x02	; 2
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0xb0	; 176
	.db #0x92	; 146
	.db #0x0d	; 13
	.db #0xea	; 234
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x91	; 145
	.db #0x04	; 4
	.db #0x30	; 48	'0'
	.db #0x6e	; 110	'n'
	.db #0x59	; 89	'Y'
	.db #0x94	; 148
	.db #0x2c	; 44
	.db #0xd1	; 209
	.db #0x02	; 2
	.db #0x64	; 100	'd'
	.db #0xcb	; 203
	.db #0x9d	; 157
	.db #0x08	; 8
	.db #0x66	; 102	'f'
	.db #0xcd	; 205
	.db #0x8a	; 138
	.db #0x35	; 53	'5'
	.db #0x02	; 2
	.db #0x32	; 50	'2'
	.db #0xa0	; 160
	.db #0x06	; 6
	.db #0x8d	; 141
	.db #0x4b	; 75	'K'
	.db #0x92	; 146
	.db #0xa5	; 165
	.db #0x52	; 82	'R'
	.db #0x02	; 2
	.db #0x51	; 81	'Q'
	.db #0x86	; 134
	.db #0x49	; 73	'I'
	.db #0x33	; 51	'3'
	.db #0x68	; 104	'h'
	.db #0x59	; 89	'Y'
	.db #0x32	; 50	'2'
	.db #0x27	; 39
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x18	; 24
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xd6	; 214
	.db #0xa1	; 161
	.db #0x55	; 85	'U'
	.db #0x81	; 129
	.db #0x51	; 81	'Q'
	.db #0x82	; 130
	.db #0x02	; 2
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x97	; 151
	.db #0x3a	; 58
	.db #0x11	; 17
	.db #0xcc	; 204
	.db #0x9b	; 155
	.db #0x15	; 21
	.db #0x68	; 104	'h'
	.db #0x48	; 72	'H'
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xfe	; 254
	.db #0xed	; 237
	.db #0xbe	; 190
	.db #0xd5	; 213
	.db #0xa8	; 168
	.db #0x17	; 23
	.db #0xea	; 234
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0x24	; 36
	.db #0x82	; 130
	.db #0x02	; 2
	.db #0xa1	; 161
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0xd0	; 208
	.db #0x03	; 3
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x42	; 66	'B'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x51	; 81	'Q'
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0xc0	; 192
	.db #0x02	; 2
	.db #0x98	; 152
	.db #0x37	; 55	'7'
	.db #0xac	; 172
	.db #0x4a	; 74	'J'
	.db #0x16	; 22
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x4e	; 78	'N'
	.db #0x04	; 4
	.db #0xb3	; 179
	.db #0x66	; 102	'f'
	.db #0x45	; 69	'E'
	.db #0x9a	; 154
	.db #0x52	; 82	'R'
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x90	; 144
	.db #0x68	; 104	'h'
	.db #0x9c	; 156
	.db #0x04	; 4
	.db #0x68	; 104	'h'
	.db #0x96	; 150
	.db #0x42	; 66	'B'
	.db #0x98	; 152
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x17	; 23
	.db #0x2f	; 47
	.db #0xdb	; 219
	.db #0xb5	; 181
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xfb	; 251
	.db #0xf5	; 245
	.db #0xef	; 239
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xb8	; 184
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe8	; 232
	.db #0xf4	; 244
	.db #0xdb	; 219
	.db #0xad	; 173
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0xfd	; 253
	.db #0xea	; 234
	.db #0x5d	; 93
	.db #0xe2	; 226
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x58	; 88	'X'
	.db #0xa8	; 168
	.db #0x54	; 84	'T'
	.db #0x8c	; 140
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x05	; 5
	.db #0x95	; 149
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x28	; 40
	.db #0x2a	; 42
	.db #0xac	; 172
	.db #0xac	; 172
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0xf6	; 246
	.db #0xf6	; 246
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0x83	; 131
	.db #0x93	; 147
	.db #0xeb	; 235
	.db #0xeb	; 235
	.db #0x6b	; 107	'k'
	.db #0x6b	; 107	'k'
	.db #0xb7	; 183
	.db #0xb7	; 183
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0xce	; 206
	.db #0xce	; 206
	.db #0x04	; 4
	.db #0x2c	; 44
	.db #0xac	; 172
	.db #0x15	; 21
	.db #0x95	; 149
	.db #0x19	; 25
	.db #0x19	; 25
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x5d	; 93
	.db #0x5d	; 93
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x70	; 112	'p'
	.db #0x73	; 115	's'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x02	; 2
	.db #0x64	; 100	'd'
	.db #0x28	; 40
	.db #0x8c	; 140
	.db #0x14	; 20
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x6b	; 107	'k'
	.db #0xf5	; 245
	.db #0xef	; 239
	.db #0x7d	; 125
	.db #0xaa	; 170
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0xfb	; 251
	.db #0xb7	; 183
	.db #0xfa	; 250
	.db #0xd5	; 213
	.db #0xeb	; 235
	.db #0x55	; 85	'U'
	.db #0xae	; 174
	.db #0x44	; 68	'D'
	.db #0x01	; 1
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0x6d	; 109	'm'
	.db #0xfb	; 251
	.db #0xae	; 174
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xd6	; 214
	.db #0xaf	; 175
	.db #0xf7	; 247
	.db #0xbe	; 190
	.db #0x55	; 85	'U'
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x47	; 71	'G'
	.db #0xac	; 172
	.db #0xd5	; 213
	.db #0xa2	; 162
	.db #0x51	; 81	'Q'
	.db #0x24	; 36
	.db #0x51	; 81	'Q'
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x42	; 66	'B'
	.db #0x92	; 146
	.db #0x06	; 6
	.db #0x42	; 66	'B'
	.db #0x22	; 34
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x27	; 39
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x0b	; 11
	.db #0x03	; 3
	.db #0xec	; 236
	.db #0xcc	; 204
	.db #0x65	; 101	'e'
	.db #0x69	; 105	'i'
	.db #0x62	; 98	'b'
	.db #0x71	; 113	'q'
	.db #0x7d	; 125
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x74	; 116	't'
	.db #0x88	; 136
	.db #0x64	; 100	'd'
	.db #0x78	; 120	'x'
	.db #0xcc	; 204
	.db #0x46	; 70	'F'
	.db #0xb2	; 178
	.db #0x94	; 148
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x23	; 35
	.db #0x2e	; 46
	.db #0x35	; 53	'5'
	.db #0x68	; 104	'h'
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x1a	; 26
	.db #0x74	; 116	't'
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xb8	; 184
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x12	; 18
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xc2	; 194
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x39	; 57	'9'
	.db #0x33	; 51	'3'
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x35	; 53	'5'
	.db #0x1b	; 27
	.db #0x03	; 3
	.db #0x86	; 134
	.db #0xb3	; 179
	.db #0x93	; 147
	.db #0xc6	; 198
	.db #0xe5	; 229
	.db #0xf2	; 242
	.db #0xe8	; 232
	.db #0x70	; 112	'p'
	.db #0x03	; 3
	.db #0xc4	; 196
	.db #0xa9	; 169
	.db #0xd7	; 215
	.db #0xe2	; 226
	.db #0x75	; 117	'u'
	.db #0x62	; 98	'b'
	.db #0x74	; 116	't'
	.db #0x38	; 56	'8'
	.db #0x03	; 3
	.db #0xd0	; 208
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0xfd	; 253
	.db #0xea	; 234
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xac	; 172
	.db #0xf2	; 242
	.db #0xa9	; 169
	.db #0xd3	; 211
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x16	; 22
	.db #0x16	; 22
	.db #0x33	; 51	'3'
	.db #0x2b	; 43
	.db #0x39	; 57	'9'
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0xf9	; 249
	.db #0x73	; 115	's'
	.db #0xf3	; 243
	.db #0xb7	; 183
	.db #0x67	; 103	'g'
	.db #0x97	; 151
	.db #0xe5	; 229
	.db #0x03	; 3
	.db #0x37	; 55	'7'
	.db #0x31	; 49	'1'
	.db #0xa2	; 162
	.db #0x94	; 148
	.db #0xcc	; 204
	.db #0x90	; 144
	.db #0xc4	; 196
	.db #0xe0	; 224
	.db #0x03	; 3
	.db #0x5d	; 93
	.db #0xfa	; 250
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x71	; 113	'q'
	.db #0x2a	; 42
	.db #0xc4	; 196
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x11	; 17
	.db #0xb5	; 181
	.db #0x71	; 113	'q'
	.db #0x21	; 33
	.db #0x51	; 81	'Q'
	.db #0x82	; 130
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x3c	; 60
	.db #0x3a	; 58
	.db #0x3d	; 61
	.db #0x77	; 119	'w'
	.db #0x7f	; 127
	.db #0x75	; 117	'u'
	.db #0x77	; 119	'w'
	.db #0xf3	; 243
	.db #0x03	; 3
	.db #0xd2	; 210
	.db #0x79	; 121	'y'
	.db #0x35	; 53	'5'
	.db #0x9c	; 156
	.db #0xde	; 222
	.db #0xdc	; 220
	.db #0xfa	; 250
	.db #0xae	; 174
	.db #0x03	; 3
	.db #0xa4	; 164
	.db #0xe4	; 228
	.db #0x4a	; 74	'J'
	.db #0xc6	; 198
	.db #0xca	; 202
	.db #0x46	; 70	'F'
	.db #0xe6	; 230
	.db #0x6b	; 107	'k'
	.db #0x03	; 3
	.db #0xc8	; 200
	.db #0x94	; 148
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0xf7	; 247
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x12	; 18
	.db #0x62	; 98	'b'
	.db #0x82	; 130
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0xb8	; 184
	.db #0x5c	; 92
	.db #0x2c	; 44
	.db #0x54	; 84	'T'
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x3c	; 60
	.db #0x70	; 112	'p'
	.db #0x61	; 97	'a'
	.db #0xe3	; 227
	.db #0x03	; 3
	.db #0xef	; 239
	.db #0xd7	; 215
	.db #0x97	; 151
	.db #0x93	; 147
	.db #0x2f	; 47
	.db #0x3f	; 63
	.db #0xfc	; 252
	.db #0xc3	; 195
	.db #0x03	; 3
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x9e	; 158
	.db #0xac	; 172
	.db #0x9c	; 156
	.db #0x39	; 57	'9'
	.db #0xb8	; 184
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0xf6	; 246
	.db #0xf9	; 249
	.db #0xba	; 186
	.db #0xbd	; 189
	.db #0xce	; 206
	.db #0x57	; 87	'W'
	.db #0x5b	; 91
	.db #0xb1	; 177
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x70	; 112	'p'
	.db #0x98	; 152
	.db #0x38	; 56	'8'
	.db #0x14	; 20
	.db #0xc2	; 194
	.db #0xb3	; 179
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0x54	; 84	'T'
	.db #0x64	; 100	'd'
	.db #0x12	; 18
	.db #0x7b	; 123
	.db #0xc5	; 197
	.db #0xbd	; 189
	.db #0x02	; 2
	.db #0x70	; 112	'p'
	.db #0xc8	; 200
	.db #0xb4	; 180
	.db #0xec	; 236
	.db #0xc4	; 196
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xbc	; 188
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xef	; 239
	.db #0xfa	; 250
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0xa8	; 168
	.db #0x74	; 116	't'
	.db #0xaa	; 170
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xde	; 222
	.db #0xf7	; 247
	.db #0xba	; 186
	.db #0x03	; 3
	.db #0xf7	; 247
	.db #0xaa	; 170
	.db #0xf7	; 247
	.db #0xaa	; 170
	.db #0xdd	; 221
	.db #0xa2	; 162
	.db #0x54	; 84	'T'
	.db #0xfa	; 250
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0x10	; 16
	.db #0xa8	; 168
	.db #0x48	; 72	'H'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0xd4	; 212
	.db #0xd4	; 212
	.db #0xba	; 186
	.db #0xba	; 186
	.db #0xd5	; 213
	.db #0xd5	; 213
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0xfd	; 253
	.db #0xf7	; 247
	.db #0x75	; 117	'u'
	.db #0xe3	; 227
	.db #0xa0	; 160
	.db #0x15	; 21
	.db #0x76	; 118	'v'
	.db #0x03	; 3
	.db #0x38	; 56	'8'
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0x7b	; 123
	.db #0x52	; 82	'R'
	.db #0x8c	; 140
	.db #0xd6	; 214
	.db #0x54	; 84	'T'
	.db #0x02	; 2
	.db #0x7d	; 125
	.db #0xe3	; 227
	.db #0x0d	; 13
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x16	; 22
	.db #0x35	; 53	'5'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x66	; 102	'f'
	.db #0xfa	; 250
	.db #0x66	; 102	'f'
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x1d	; 29
	.db #0x3f	; 63
	.db #0x3b	; 59
	.db #0x37	; 55	'7'
	.db #0x2a	; 42
	.db #0x35	; 53	'5'
	.db #0x2e	; 46
	.db #0x03	; 3
	.db #0x7d	; 125
	.db #0xea	; 234
	.db #0x75	; 117	'u'
	.db #0xaf	; 175
	.db #0x5d	; 93
	.db #0xfa	; 250
	.db #0x77	; 119	'w'
	.db #0xea	; 234
	.db #0x03	; 3
	.db #0xd1	; 209
	.db #0x2a	; 42
	.db #0x44	; 68	'D'
	.db #0xa0	; 160
	.db #0x0a	; 10
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x75	; 117	'u'
	.db #0xaf	; 175
	.db #0x57	; 87	'W'
	.db #0xee	; 238
	.db #0x47	; 71	'G'
	.db #0x9a	; 154
	.db #0xd5	; 213
	.db #0x6a	; 106	'j'
	.db #0x03	; 3
	.db #0xd0	; 208
	.db #0xa4	; 164
	.db #0x70	; 112	'p'
	.db #0xaa	; 170
	.db #0x51	; 81	'Q'
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0x24	; 36
	.db #0x03	; 3
	.db #0xa4	; 164
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x3e	; 62
	.db #0x77	; 119	'w'
	.db #0xfa	; 250
	.db #0xd4	; 212
	.db #0x60	; 96
	.db #0x34	; 52	'4'
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0xe0	; 224
	.db #0xb8	; 184
	.db #0x56	; 86	'V'
	.db #0x89	; 137
	.db #0x41	; 65	'A'
	.db #0x02	; 2
	.db #0x1c	; 28
	.db #0xe0	; 224
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3b	; 59
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x58	; 88	'X'
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7d	; 125
	.db #0x7b	; 123
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xea	; 234
	.db #0xfd	; 253
	.db #0xaa	; 170
	.db #0xf7	; 247
	.db #0xaa	; 170
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x44	; 68	'D'
	.db #0x4c	; 76	'L'
	.db #0xf4	; 244
	.db #0x15	; 21
	.db #0xac	; 172
	.db #0xd7	; 215
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0xa5	; 165
	.db #0x52	; 82	'R'
	.db #0x56	; 86	'V'
	.db #0xb9	; 185
	.db #0x56	; 86	'V'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x7d	; 125
	.db #0xfe	; 254
	.db #0xd5	; 213
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xfa	; 250
	.db #0x03	; 3
	.db #0x14	; 20
	.db #0x19	; 25
	.db #0x8d	; 141
	.db #0xc6	; 198
	.db #0x65	; 101	'e'
	.db #0xa2	; 162
	.db #0x51	; 81	'Q'
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0x75	; 117	'u'
	.db #0xa0	; 160
	.db #0x54	; 84	'T'
	.db #0xa2	; 162
	.db #0x10	; 16
	.db #0xe4	; 228
	.db #0x40	; 64
	.db #0x92	; 146
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x8f	; 143
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x75	; 117	'u'
	.db #0x7b	; 123
	.db #0xd5	; 213
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x51	; 81	'Q'
	.db #0x2e	; 46
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x81	; 129
	.db #0x06	; 6
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x23	; 35
	.db #0x47	; 71	'G'
	.db #0x8e	; 142
	.db #0x1f	; 31
	.db #0x3a	; 58
	.db #0x77	; 119	'w'
	.db #0x7a	; 122	'z'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0xfa	; 250
	.db #0xfd	; 253
	.db #0xb2	; 178
	.db #0xe5	; 229
	.db #0xac	; 172
	.db #0x55	; 85	'U'
	.db #0x62	; 98	'b'
	.db #0x03	; 3
	.db #0xd5	; 213
	.db #0xa0	; 160
	.db #0x83	; 131
	.db #0x46	; 70	'F'
	.db #0x21	; 33
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x77	; 119	'w'
	.db #0xae	; 174
	.db #0x5d	; 93
	.db #0x2a	; 42
	.db #0x4d	; 77	'M'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x55	; 85	'U'
	.db #0xe8	; 232
	.db #0x55	; 85	'U'
	.db #0x38	; 56	'8'
	.db #0x0d	; 13
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x48	; 72	'H'
	.db #0x18	; 24
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x03	; 3
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x3e	; 62
	.db #0x75	; 117	'u'
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x55	; 85	'U'
	.db #0x3a	; 58
	.db #0x15	; 21
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x52	; 82	'R'
	.db #0x06	; 6
	.db #0x51	; 81	'Q'
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x81	; 129
	.db #0x62	; 98	'b'
	.db #0x1c	; 28
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x32	; 50	'2'
	.db #0x2b	; 43
	.db #0x5d	; 93
	.db #0xab	; 171
	.db #0x9f	; 159
	.db #0x6c	; 108	'l'
_room_1_0_map:
	.dw #0x006a
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0xc2	; 194
	.db #0x3e	; 62
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0xd0	; 208
	.db #0x00	; 0
_room_1_0_coll:
	.dw #0x0030
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x05	; 5
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe4	; 228
	.db #0x00	; 0
	.db #0xc8	; 200
	.db #0x05	; 5
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0xc8	; 200
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc4	; 196
	.db #0x01	; 1
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc7	; 199
	.db #0x01	; 1
	.db #0xd5	; 213
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc8	; 200
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xce	; 206
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x00	; 0
_room_1_0_tiles:
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x17	; 23
	.db #0x2f	; 47
	.db #0xdb	; 219
	.db #0xb5	; 181
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xfb	; 251
	.db #0xf5	; 245
	.db #0xef	; 239
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x6f	; 111	'o'
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xbf	; 191
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xb8	; 184
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe8	; 232
	.db #0xf4	; 244
	.db #0xdb	; 219
	.db #0xad	; 173
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x6b	; 107	'k'
	.db #0xf5	; 245
	.db #0xef	; 239
	.db #0x7d	; 125
	.db #0xaa	; 170
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0x6e	; 110	'n'
	.db #0xb5	; 181
	.db #0x4a	; 74	'J'
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0xf5	; 245
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x57	; 87	'W'
	.db #0xab	; 171
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0x6d	; 109	'm'
	.db #0xfb	; 251
	.db #0xae	; 174
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0xfb	; 251
	.db #0xb7	; 183
	.db #0xfa	; 250
	.db #0xd5	; 213
	.db #0xeb	; 235
	.db #0x55	; 85	'U'
	.db #0xae	; 174
	.db #0x44	; 68	'D'
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xd6	; 214
	.db #0xaf	; 175
	.db #0xf7	; 247
	.db #0xbe	; 190
	.db #0x55	; 85	'U'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x2e	; 46
	.db #0x7d	; 125
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0xf6	; 246
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xd5	; 213
	.db #0xab	; 171
	.db #0xdf	; 223
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0xf3	; 243
	.db #0xcf	; 207
	.db #0xf7	; 247
	.db #0xfb	; 251
	.db #0xf5	; 245
	.db #0x6e	; 110	'n'
	.db #0xfb	; 251
	.db #0x01	; 1
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xfd	; 253
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0xdf	; 223
	.db #0xaf	; 175
	.db #0xf7	; 247
	.db #0xaf	; 175
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xdf	; 223
	.db #0xed	; 237
	.db #0x5f	; 95
	.db #0xab	; 171
	.db #0xd7	; 215
	.db #0xaa	; 170
	.db #0x75	; 117	'u'
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0xda	; 218
	.db #0xfd	; 253
	.db #0xb6	; 182
	.db #0xdf	; 223
	.db #0x75	; 117	'u'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x82	; 130
	.db #0x01	; 1
	.db #0xdf	; 223
	.db #0xbf	; 191
	.db #0xf7	; 247
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xea	; 234
	.db #0xd5	; 213
	.db #0xa0	; 160
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0xed	; 237
	.db #0x77	; 119	'w'
	.db #0xae	; 174
	.db #0x55	; 85	'U'
	.db #0xea	; 234
	.db #0x55	; 85	'U'
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0x76	; 118	'v'
	.db #0xad	; 173
	.db #0x52	; 82	'R'
	.db #0x85	; 133
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7d	; 125
	.db #0x77	; 119	'w'
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xea	; 234
	.db #0xbd	; 189
	.db #0xea	; 234
	.db #0xf7	; 247
	.db #0xa8	; 168
	.db #0xd5	; 213
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x50	; 80	'P'
	.db #0xe8	; 232
	.db #0x58	; 88	'X'
	.db #0xa4	; 164
	.db #0x04	; 4
	.db #0xa2	; 162
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3a	; 58
	.db #0x3d	; 61
	.db #0x6e	; 110	'n'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0xfa	; 250
	.db #0xfd	; 253
	.db #0xb2	; 178
	.db #0xe5	; 229
	.db #0xac	; 172
	.db #0x55	; 85	'U'
	.db #0x62	; 98	'b'
	.db #0x03	; 3
	.db #0x47	; 71	'G'
	.db #0xac	; 172
	.db #0xd5	; 213
	.db #0xa2	; 162
	.db #0x51	; 81	'Q'
	.db #0x24	; 36
	.db #0x51	; 81	'Q'
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x2b	; 43
	.db #0x53	; 83	'S'
	.db #0xa2	; 162
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x29	; 41
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xd0	; 208
	.db #0xa8	; 168
	.db #0x44	; 68	'D'
	.db #0xaa	; 170
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x75	; 117	'u'
	.db #0x6b	; 107	'k'
	.db #0x5d	; 93
	.db #0x2a	; 42
	.db #0x34	; 52	'4'
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0xc2	; 194
	.db #0xa2	; 162
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x13	; 19
	.db #0xe4	; 228
	.db #0x03	; 3
	.db #0x55	; 85	'U'
	.db #0x22	; 34
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0xc4	; 196
	.db #0xe1	; 225
	.db #0x70	; 112	'p'
	.db #0xb8	; 184
	.db #0x03	; 3
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x42	; 66	'B'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x51	; 81	'Q'
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0xc0	; 192
	.db #0x02	; 2
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0xa4	; 164
	.db #0x25	; 37
	.db #0x49	; 73	'I'
	.db #0x59	; 89	'Y'
	.db #0x55	; 85	'U'
	.db #0xae	; 174
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x44	; 68	'D'
	.db #0x5c	; 92
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0xdc	; 220
	.db #0xd7	; 215
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0xa5	; 165
	.db #0x52	; 82	'R'
	.db #0x56	; 86	'V'
	.db #0xb9	; 185
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0x29	; 41
	.db #0x25	; 37
	.db #0xa5	; 165
	.db #0x23	; 35
	.db #0x40	; 64
	.db #0x5b	; 91
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x45	; 69	'E'
	.db #0x4d	; 77	'M'
	.db #0xf5	; 245
	.db #0x14	; 20
	.db #0xac	; 172
	.db #0xd6	; 214
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x13	; 19
	.db #0x07	; 7
	.db #0x27	; 39
	.db #0x0e	; 14
	.db #0x2e	; 46
	.db #0x17	; 23
	.db #0x5f	; 95
	.db #0x3a	; 58
	.db #0x3a	; 58
	.db #0x77	; 119	'w'
	.db #0x77	; 119	'w'
	.db #0x7a	; 122	'z'
	.db #0x7a	; 122	'z'
	.db #0x03	; 3
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xbb	; 187
	.db #0xd5	; 213
	.db #0xab	; 171
	.db #0xdd	; 221
	.db #0xee	; 238
	.db #0x03	; 3
	.db #0xbe	; 190
	.db #0xf6	; 246
	.db #0xfd	; 253
	.db #0xaa	; 170
	.db #0xdc	; 220
	.db #0xe9	; 233
	.db #0x74	; 116	't'
	.db #0xbe	; 190
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7d	; 125
	.db #0x7b	; 123
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xeb	; 235
	.db #0xfd	; 253
	.db #0xaa	; 170
	.db #0xf7	; 247
	.db #0xaa	; 170
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xea	; 234
	.db #0xfd	; 253
	.db #0xaa	; 170
	.db #0xf7	; 247
	.db #0xaa	; 170
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xfe	; 254
	.db #0xed	; 237
	.db #0xbe	; 190
	.db #0xd5	; 213
	.db #0xa8	; 168
	.db #0x17	; 23
	.db #0xea	; 234
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0x24	; 36
	.db #0x82	; 130
	.db #0x03	; 3
	.db #0x38	; 56	'8'
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0x7b	; 123
	.db #0x52	; 82	'R'
	.db #0x8c	; 140
	.db #0xd6	; 214
	.db #0x54	; 84	'T'
	.db #0x03	; 3
	.db #0x38	; 56	'8'
	.db #0x63	; 99	'c'
	.db #0xcb	; 203
	.db #0xaf	; 175
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x2a	; 42
	.db #0xec	; 236
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0xcf	; 207
	.db #0xa5	; 165
	.db #0x68	; 104	'h'
	.db #0xab	; 171
	.db #0x9a	; 154
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0xfd	; 253
	.db #0xf7	; 247
	.db #0x75	; 117	'u'
	.db #0xe3	; 227
	.db #0xa0	; 160
	.db #0x15	; 21
	.db #0x76	; 118	'v'
	.db #0x03	; 3
	.db #0xfd	; 253
	.db #0x77	; 119	'w'
	.db #0x7d	; 125
	.db #0xd5	; 213
	.db #0xbb	; 187
	.db #0x51	; 81	'Q'
	.db #0x66	; 102	'f'
	.db #0x35	; 53	'5'
	.db #0x03	; 3
	.db #0xd5	; 213
	.db #0xa8	; 168
	.db #0xf7	; 247
	.db #0xdc	; 220
	.db #0xaa	; 170
	.db #0xd4	; 212
	.db #0x82	; 130
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x12	; 18
	.db #0xaa	; 170
	.db #0x44	; 68	'D'
	.db #0x01	; 1
	.db #0xa2	; 162
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0xd5	; 213
	.db #0xa0	; 160
	.db #0x83	; 131
	.db #0x46	; 70	'F'
	.db #0x21	; 33
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x77	; 119	'w'
	.db #0xae	; 174
	.db #0x5d	; 93
	.db #0x2a	; 42
	.db #0x4d	; 77	'M'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xff	; 255
_room_2_0_map:
	.dw #0x01a7
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x09	; 9
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x07	; 7
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x25	; 37
	.db #0x09	; 9
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x26	; 38
	.db #0x02	; 2
	.db #0x27	; 39
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x07	; 7
	.db #0x37	; 55	'7'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x0e	; 14
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x1e	; 30
	.db #0x40	; 64
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x07	; 7
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x07	; 7
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x43	; 67	'C'
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x1b	; 27
	.db #0x46	; 70	'F'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x4a	; 74	'J'
	.db #0x09	; 9
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x07	; 7
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x4b	; 75	'K'
	.db #0x37	; 55	'7'
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2b	; 43
	.db #0x46	; 70	'F'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x4d	; 77	'M'
	.db #0x09	; 9
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x07	; 7
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x4e	; 78	'N'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x4f	; 79	'O'
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x53	; 83	'S'
	.db #0x18	; 24
	.db #0x54	; 84	'T'
	.db #0x0b	; 11
	.db #0x55	; 85	'U'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x25	; 37
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x1b	; 27
	.db #0x46	; 70	'F'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x07	; 7
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x2b	; 43
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x61	; 97	'a'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x46	; 70	'F'
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x25	; 37
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x65	; 101	'e'
	.db #0x69	; 105	'i'
	.db #0x56	; 86	'V'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x14	; 20
	.db #0x6c	; 108	'l'
	.db #0x34	; 52	'4'
	.db #0x6d	; 109	'm'
	.db #0x00	; 0
	.db #0xd2	; 210
	.db #0x6e	; 110	'n'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x46	; 70	'F'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x07	; 7
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x6e	; 110	'n'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x2b	; 43
	.db #0x46	; 70	'F'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x07	; 7
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x71	; 113	'q'
	.db #0x72	; 114	'r'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x6e	; 110	'n'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x17	; 23
	.db #0x02	; 2
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x71	; 113	'q'
	.db #0x72	; 114	'r'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x6e	; 110	'n'
	.db #0x55	; 85	'U'
	.db #0xc3	; 195
	.db #0x00	; 0
_room_2_0_coll:
	.dw #0x0029
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc7	; 199
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x02	; 2
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xea	; 234
	.db #0x00	; 0
	.db #0xd1	; 209
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xde	; 222
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xde	; 222
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xde	; 222
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xc4	; 196
	.db #0x00	; 0
_room_2_0_tiles:
	.db #0x73	; 115	's'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xb0	; 176
	.db #0x4c	; 76	'L'
	.db #0x12	; 18
	.db #0xcb	; 203
	.db #0x34	; 52	'4'
	.db #0xa6	; 166
	.db #0x8d	; 141
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x0a	; 10
	.db #0x8a	; 138
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x0a	; 10
	.db #0x2a	; 42
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x6a	; 106	'j'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x0a	; 10
	.db #0x2a	; 42
	.db #0x03	; 3
	.db #0x3a	; 58
	.db #0x46	; 70	'F'
	.db #0x2a	; 42
	.db #0x16	; 22
	.db #0x22	; 34
	.db #0x17	; 23
	.db #0x32	; 50	'2'
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0x03	; 3
	.db #0x66	; 102	'f'
	.db #0x54	; 84	'T'
	.db #0x6a	; 106	'j'
	.db #0x54	; 84	'T'
	.db #0x66	; 102	'f'
	.db #0x54	; 84	'T'
	.db #0xe6	; 230
	.db #0x54	; 84	'T'
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x98	; 152
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x5f	; 95
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x04	; 4
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x56	; 86	'V'
	.db #0xc0	; 192
	.db #0xc5	; 197
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x43	; 67	'C'
	.db #0x50	; 80	'P'
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x0a	; 10
	.db #0x8a	; 138
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x3a	; 58
	.db #0x47	; 71	'G'
	.db #0x2a	; 42
	.db #0x27	; 39
	.db #0x2a	; 42
	.db #0x27	; 39
	.db #0x32	; 50	'2'
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0x03	; 3
	.db #0xea	; 234
	.db #0x54	; 84	'T'
	.db #0x62	; 98	'b'
	.db #0x54	; 84	'T'
	.db #0xee	; 238
	.db #0x54	; 84	'T'
	.db #0xea	; 234
	.db #0x54	; 84	'T'
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x13	; 19
	.db #0x85	; 133
	.db #0x12	; 18
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x26	; 38
	.db #0x4b	; 75	'K'
	.db #0xb4	; 180
	.db #0xca	; 202
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0xc0	; 192
	.db #0x28	; 40
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x13	; 19
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x02	; 2
	.db #0x93	; 147
	.db #0x06	; 6
	.db #0x74	; 116	't'
	.db #0xc1	; 193
	.db #0xa2	; 162
	.db #0x0c	; 12
	.db #0x92	; 146
	.db #0x67	; 103	'g'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x53	; 83	'S'
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xfa	; 250
	.db #0x04	; 4
	.db #0x50	; 80	'P'
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x86	; 134
	.db #0x50	; 80	'P'
	.db #0x52	; 82	'R'
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x50	; 80	'P'
	.db #0x53	; 83	'S'
	.db #0x40	; 64
	.db #0x45	; 69	'E'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x46	; 70	'F'
	.db #0x02	; 2
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x38	; 56	'8'
	.db #0xac	; 172
	.db #0x46	; 70	'F'
	.db #0x2b	; 43
	.db #0x13	; 19
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xbc	; 188
	.db #0x57	; 87	'W'
	.db #0x0b	; 11
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0xea	; 234
	.db #0x03	; 3
	.db #0x22	; 34
	.db #0x17	; 23
	.db #0x2a	; 42
	.db #0x17	; 23
	.db #0x2a	; 42
	.db #0x57	; 87	'W'
	.db #0x22	; 34
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x5f	; 95
	.db #0x03	; 3
	.db #0x66	; 102	'f'
	.db #0x54	; 84	'T'
	.db #0x66	; 102	'f'
	.db #0x54	; 84	'T'
	.db #0xea	; 234
	.db #0x54	; 84	'T'
	.db #0xe6	; 230
	.db #0x54	; 84	'T'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x6c	; 108	'l'
	.db #0x98	; 152
	.db #0x6c	; 108	'l'
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0xd0	; 208
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0xd0	; 208
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x90	; 144
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x5b	; 91
	.db #0xfa	; 250
	.db #0x5b	; 91
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x04	; 4
	.db #0x50	; 80	'P'
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x50	; 80	'P'
	.db #0x54	; 84	'T'
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0xa2	; 162
	.db #0x11	; 17
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xc1	; 193
	.db #0xea	; 234
	.db #0x42	; 66	'B'
	.db #0xaa	; 170
	.db #0x01	; 1
	.db #0xaa	; 170
	.db #0x41	; 65	'A'
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x22	; 34
	.db #0x57	; 87	'W'
	.db #0x32	; 50	'2'
	.db #0x56	; 86	'V'
	.db #0x32	; 50	'2'
	.db #0x57	; 87	'W'
	.db #0x32	; 50	'2'
	.db #0x16	; 22
	.db #0x03	; 3
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x5f	; 95
	.db #0x03	; 3
	.db #0x62	; 98	'b'
	.db #0x5c	; 92
	.db #0xea	; 234
	.db #0x54	; 84	'T'
	.db #0xe2	; 226
	.db #0x54	; 84	'T'
	.db #0x66	; 102	'f'
	.db #0x54	; 84	'T'
	.db #0x02	; 2
	.db #0x33	; 51	'3'
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0x8b	; 139
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0xe8	; 232
	.db #0x41	; 65	'A'
	.db #0xa8	; 168
	.db #0x41	; 65	'A'
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x34	; 52	'4'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0x1c	; 28
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x5b	; 91
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x23	; 35
	.db #0x2e	; 46
	.db #0x35	; 53	'5'
	.db #0x68	; 104	'h'
	.db #0xd0	; 208
	.db #0x03	; 3
	.db #0x1a	; 26
	.db #0x74	; 116	't'
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xb8	; 184
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0x1c	; 28
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x6c	; 108	'l'
	.db #0xb6	; 182
	.db #0x41	; 65	'A'
	.db #0xac	; 172
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x70	; 112	'p'
	.db #0x38	; 56	'8'
	.db #0x03	; 3
	.db #0x51	; 81	'Q'
	.db #0x87	; 135
	.db #0x52	; 82	'R'
	.db #0xc5	; 197
	.db #0x52	; 82	'R'
	.db #0x44	; 68	'D'
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x0b	; 11
	.db #0x34	; 52	'4'
	.db #0x21	; 33
	.db #0x0c	; 12
	.db #0x13	; 19
	.db #0x0a	; 10
	.db #0x18	; 24
	.db #0x03	; 3
	.db #0xc1	; 193
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x1f	; 31
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0x8e	; 142
	.db #0x47	; 71	'G'
	.db #0xa2	; 162
	.db #0x71	; 113	'q'
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0xee	; 238
	.db #0xd1	; 209
	.db #0xed	; 237
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x77	; 119	'w'
	.db #0xbb	; 187
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x6a	; 106	'j'
	.db #0x2b	; 43
	.db #0xaf	; 175
	.db #0xad	; 173
	.db #0xad	; 173
	.db #0x6b	; 107	'k'
	.db #0x7b	; 123
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x50	; 80	'P'
	.db #0xd0	; 208
	.db #0x58	; 88	'X'
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x1a	; 26
	.db #0x35	; 53	'5'
	.db #0x35	; 53	'5'
	.db #0x25	; 37
	.db #0x2d	; 45
	.db #0x25	; 37
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0xac	; 172
	.db #0xac	; 172
	.db #0xa4	; 164
	.db #0xb4	; 180
	.db #0xa4	; 164
	.db #0xaa	; 170
	.db #0x01	; 1
	.db #0x55	; 85	'U'
	.db #0x6d	; 109	'm'
	.db #0x6d	; 109	'm'
	.db #0x25	; 37
	.db #0xad	; 173
	.db #0xed	; 237
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0x01	; 1
	.db #0xaa	; 170
	.db #0xb6	; 182
	.db #0xb6	; 182
	.db #0xa4	; 164
	.db #0xb5	; 181
	.db #0xb7	; 183
	.db #0xd5	; 213
	.db #0xd5	; 213
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x11	; 17
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x41	; 65	'A'
	.db #0x47	; 71	'G'
	.db #0x9a	; 154
	.db #0x70	; 112	'p'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf1	; 241
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x61	; 97	'a'
	.db #0x0a	; 10
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x2a	; 42
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x0a	; 10
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0x61	; 97	'a'
	.db #0x0a	; 10
	.db #0x8a	; 138
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0xc0	; 192
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x7a	; 122	'z'
	.db #0x55	; 85	'U'
	.db #0x72	; 114	'r'
	.db #0x55	; 85	'U'
	.db #0x70	; 112	'p'
	.db #0x55	; 85	'U'
	.db #0x78	; 120	'x'
	.db #0x55	; 85	'U'
	.db #0x03	; 3
	.db #0x46	; 70	'F'
	.db #0x55	; 85	'U'
	.db #0x70	; 112	'p'
	.db #0x55	; 85	'U'
	.db #0x78	; 120	'x'
	.db #0x55	; 85	'U'
	.db #0x7a	; 122	'z'
	.db #0x55	; 85	'U'
	.db #0x03	; 3
	.db #0x83	; 131
	.db #0x15	; 21
	.db #0x82	; 130
	.db #0x14	; 20
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x7c	; 124
	.db #0x55	; 85	'U'
	.db #0x6c	; 108	'l'
	.db #0x45	; 69	'E'
	.db #0x6e	; 110	'n'
	.db #0x41	; 65	'A'
	.db #0x6a	; 106	'j'
	.db #0x51	; 81	'Q'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x7f	; 127
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x6d	; 109	'm'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0xfe	; 254
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x46	; 70	'F'
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x51	; 81	'Q'
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x7a	; 122	'z'
	.db #0x55	; 85	'U'
	.db #0x6c	; 108	'l'
	.db #0x45	; 69	'E'
	.db #0x6c	; 108	'l'
	.db #0x45	; 69	'E'
	.db #0x6e	; 110	'n'
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0x67	; 103	'g'
	.db #0x67	; 103	'g'
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xf6	; 246
	.db #0xe6	; 230
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x3a	; 58
	.db #0x55	; 85	'U'
	.db #0x7e	; 126
	.db #0x55	; 85	'U'
	.db #0x7e	; 126
	.db #0x55	; 85	'U'
	.db #0x76	; 118	'v'
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x63	; 99	'c'
	.db #0xa6	; 166
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x94	; 148
	.db #0x4c	; 76	'L'
	.db #0x94	; 148
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x4d	; 77	'M'
	.db #0x1a	; 26
	.db #0x34	; 52	'4'
	.db #0x69	; 105	'i'
	.db #0xd1	; 209
	.db #0xa2	; 162
	.db #0x41	; 65	'A'
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x8c	; 140
	.db #0xd4	; 212
	.db #0x4c	; 76	'L'
	.db #0x94	; 148
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x38	; 56	'8'
	.db #0x54	; 84	'T'
	.db #0xaa	; 170
	.db #0xd2	; 210
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe8	; 232
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
_enemies_2_0_tiles:
	.db #0x05	; 5
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x67	; 103	'g'
	.db #0x18	; 24
	.db #0x98	; 152
	.db #0x67	; 103	'g'
	.db #0x52	; 82	'R'
	.db #0x8d	; 141
	.db #0xa0	; 160
	.db #0x1f	; 31
	.db #0x5d	; 93
	.db #0x22	; 34
	.db #0xa2	; 162
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0xe1	; 225
	.db #0x42	; 66	'B'
	.db #0xbc	; 188
	.db #0x0d	; 13
	.db #0xf2	; 242
	.db #0xb6	; 182
	.db #0x49	; 73	'I'
	.db #0x69	; 105	'i'
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x8f	; 143
	.db #0xc2	; 194
	.db #0x3d	; 61
	.db #0xb0	; 176
	.db #0x4f	; 79	'O'
	.db #0x6d	; 109	'm'
	.db #0x92	; 146
	.db #0x96	; 150
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xe6	; 230
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0xe6	; 230
	.db #0x4e	; 78	'N'
	.db #0xb1	; 177
	.db #0x05	; 5
	.db #0xf8	; 248
	.db #0xba	; 186
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
_room_3_0_map:
	.dw #0x0012
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x00	; 0
_room_3_0_coll:
	.dw #0x0012
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x00	; 0
_room_3_0_tiles:
	.db #0x01	; 1
	.db #0x00	; 0
_room_4_0_map:
	.dw #0x004e
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xe2	; 226
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xc2	; 194
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xd5	; 213
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0xc2	; 194
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xe4	; 228
	.db #0x00	; 0
_room_4_0_coll:
	.dw #0x0028
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x05	; 5
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x05	; 5
	.db #0xe3	; 227
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x05	; 5
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x05	; 5
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0x05	; 5
	.db #0xe2	; 226
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x05	; 5
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x05	; 5
	.db #0xe4	; 228
	.db #0x00	; 0
_room_4_0_tiles:
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x17	; 23
	.db #0x2f	; 47
	.db #0xdb	; 219
	.db #0xb5	; 181
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xfb	; 251
	.db #0xf5	; 245
	.db #0xef	; 239
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x6f	; 111	'o'
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xbf	; 191
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xb8	; 184
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe8	; 232
	.db #0xf4	; 244
	.db #0xdb	; 219
	.db #0xad	; 173
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x6b	; 107	'k'
	.db #0xf5	; 245
	.db #0xef	; 239
	.db #0x7d	; 125
	.db #0xaa	; 170
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0x6e	; 110	'n'
	.db #0xb5	; 181
	.db #0x4a	; 74	'J'
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0xf5	; 245
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x57	; 87	'W'
	.db #0xab	; 171
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0x6d	; 109	'm'
	.db #0xfb	; 251
	.db #0xae	; 174
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0xfb	; 251
	.db #0xb7	; 183
	.db #0xfa	; 250
	.db #0xd5	; 213
	.db #0xeb	; 235
	.db #0x55	; 85	'U'
	.db #0xae	; 174
	.db #0x44	; 68	'D'
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xd6	; 214
	.db #0xaf	; 175
	.db #0xf7	; 247
	.db #0xbe	; 190
	.db #0x55	; 85	'U'
	.db #0x02	; 2
_enemies_4_0_tiles:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0xdb	; 219
	.db #0xdb	; 219
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
_room_5_0_map:
	.dw #0x012e
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0xcd	; 205
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0xcd	; 205
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x15	; 21
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x16	; 22
	.db #0x08	; 8
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x1e	; 30
	.db #0x0c	; 12
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x26	; 38
	.db #0x11	; 17
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x2a	; 42
	.db #0x19	; 25
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x2e	; 46
	.db #0x21	; 33
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0xc3	; 195
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x16	; 22
	.db #0x08	; 8
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0x0c	; 12
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0xc3	; 195
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x0c	; 12
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x08	; 8
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x0c	; 12
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0x4d	; 77	'M'
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0xcd	; 205
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5c	; 92
	.db #0x5e	; 94
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5c	; 92
	.db #0x5f	; 95
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x16	; 22
	.db #0x08	; 8
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x1e	; 30
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0xd4	; 212
	.db #0x4d	; 77	'M'
	.db #0x64	; 100	'd'
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x08	; 8
_room_5_0_coll:
	.dw #0x0056
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xd7	; 215
	.db #0x00	; 0
	.db #0xc5	; 197
	.db #0x04	; 4
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xd7	; 215
	.db #0x00	; 0
	.db #0xc5	; 197
	.db #0x04	; 4
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xd7	; 215
	.db #0x00	; 0
	.db #0xc5	; 197
	.db #0x04	; 4
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xca	; 202
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc7	; 199
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xcd	; 205
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xd2	; 210
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
_room_5_0_tiles:
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x3a	; 58
	.db #0x46	; 70	'F'
	.db #0x2a	; 42
	.db #0x16	; 22
	.db #0x22	; 34
	.db #0x17	; 23
	.db #0x32	; 50	'2'
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0x03	; 3
	.db #0x66	; 102	'f'
	.db #0x54	; 84	'T'
	.db #0x6a	; 106	'j'
	.db #0x54	; 84	'T'
	.db #0x66	; 102	'f'
	.db #0x54	; 84	'T'
	.db #0xe6	; 230
	.db #0x54	; 84	'T'
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x54	; 84	'T'
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x5b	; 91
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x61	; 97	'a'
	.db #0x08	; 8
	.db #0xa8	; 168
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0xc8	; 200
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x03	; 3
	.db #0x22	; 34
	.db #0x17	; 23
	.db #0x2a	; 42
	.db #0x17	; 23
	.db #0x2a	; 42
	.db #0x57	; 87	'W'
	.db #0x22	; 34
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x5f	; 95
	.db #0x03	; 3
	.db #0x66	; 102	'f'
	.db #0x54	; 84	'T'
	.db #0x66	; 102	'f'
	.db #0x54	; 84	'T'
	.db #0xea	; 234
	.db #0x54	; 84	'T'
	.db #0xe6	; 230
	.db #0x54	; 84	'T'
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x2a	; 42
	.db #0x13	; 19
	.db #0xc8	; 200
	.db #0x4c	; 76	'L'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0x01	; 1
	.db #0xd9	; 217
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x08	; 8
	.db #0xa8	; 168
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x15	; 21
	.db #0x06	; 6
	.db #0x13	; 19
	.db #0x18	; 24
	.db #0x2d	; 45
	.db #0x06	; 6
	.db #0x11	; 17
	.db #0x19	; 25
	.db #0x02	; 2
	.db #0x96	; 150
	.db #0xe0	; 224
	.db #0x09	; 9
	.db #0x4c	; 76	'L'
	.db #0x16	; 22
	.db #0x1a	; 26
	.db #0x4c	; 76	'L'
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x64	; 100	'd'
	.db #0x88	; 136
	.db #0xd0	; 208
	.db #0xba	; 186
	.db #0x43	; 67	'C'
	.db #0x24	; 36
	.db #0xec	; 236
	.db #0x5a	; 90	'Z'
	.db #0x03	; 3
	.db #0x90	; 144
	.db #0x70	; 112	'p'
	.db #0x1c	; 28
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x11	; 17
	.db #0x83	; 131
	.db #0x15	; 21
	.db #0x82	; 130
	.db #0x14	; 20
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x98	; 152
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x2c	; 44
	.db #0x30	; 48	'0'
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xe1	; 225
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x4e	; 78	'N'
	.db #0x80	; 128
	.db #0x12	; 18
	.db #0xeb	; 235
	.db #0x31	; 49	'1'
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x4a	; 74	'J'
	.db #0x34	; 52	'4'
	.db #0x80	; 128
	.db #0xd0	; 208
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0x38	; 56	'8'
	.db #0xac	; 172
	.db #0x46	; 70	'F'
	.db #0x2b	; 43
	.db #0x13	; 19
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x70	; 112	'p'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x1f	; 31
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x38	; 56	'8'
	.db #0x1c	; 28
	.db #0x8e	; 142
	.db #0x47	; 71	'G'
	.db #0xa2	; 162
	.db #0x71	; 113	'q'
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xbc	; 188
	.db #0x57	; 87	'W'
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0xa2	; 162
	.db #0x11	; 17
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xe8	; 232
	.db #0xc1	; 193
	.db #0xe8	; 232
	.db #0x41	; 65	'A'
	.db #0xa8	; 168
	.db #0x01	; 1
	.db #0xa8	; 168
	.db #0x41	; 65	'A'
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x85	; 133
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x10	; 16
	.db #0x13	; 19
	.db #0x80	; 128
	.db #0x86	; 134
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xdd	; 221
	.db #0x9c	; 156
	.db #0x63	; 99	'c'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x2c	; 44
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0xdd	; 221
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x1a	; 26
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x13	; 19
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x6b	; 107	'k'
	.db #0x88	; 136
	.db #0xdd	; 221
	.db #0x7f	; 127
	.db #0xaa	; 170
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe6	; 230
	.db #0xef	; 239
	.db #0xeb	; 235
	.db #0x43	; 67	'C'
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0xdb	; 219
	.db #0x8a	; 138
	.db #0xdb	; 219
	.db #0x82	; 130
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xa0	; 160
	.db #0xea	; 234
	.db #0xa0	; 160
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xfd	; 253
	.db #0x01	; 1
	.db #0xa9	; 169
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x30	; 48	'0'
	.db #0x11	; 17
	.db #0x20	; 32
	.db #0x71	; 113	'q'
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x8e	; 142
	.db #0x17	; 23
	.db #0x07	; 7
	.db #0x39	; 57	'9'
	.db #0xfe	; 254
	.db #0xd7	; 215
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x11	; 17
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x23	; 35
	.db #0x2e	; 46
	.db #0x35	; 53	'5'
	.db #0x68	; 104	'h'
	.db #0xd0	; 208
	.db #0xa0	; 160
	.db #0x03	; 3
	.db #0x74	; 116	't'
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xb8	; 184
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x77	; 119	'w'
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x72	; 114	'r'
	.db #0xf2	; 242
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x16	; 22
	.db #0x2a	; 42
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x58	; 88	'X'
	.db #0xa8	; 168
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xb6	; 182
	.db #0x57	; 87	'W'
	.db #0xb3	; 179
	.db #0x57	; 87	'W'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x87	; 135
	.db #0x12	; 18
	.db #0x85	; 133
	.db #0x12	; 18
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x38	; 56	'8'
	.db #0x54	; 84	'T'
	.db #0xaa	; 170
	.db #0xd2	; 210
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x2a	; 42
	.db #0x0a	; 10
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0xaa	; 170
	.db #0x0a	; 10
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0x8a	; 138
	.db #0x0a	; 10
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x2a	; 42
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0xb2	; 178
	.db #0x57	; 87	'W'
	.db #0xb2	; 178
	.db #0x57	; 87	'W'
	.db #0xb2	; 178
	.db #0x57	; 87	'W'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0xfb	; 251
	.db #0xcd	; 205
	.db #0xb6	; 182
	.db #0x30	; 48	'0'
	.db #0x76	; 118	'v'
	.db #0x61	; 97	'a'
	.db #0xe6	; 230
	.db #0x52	; 82	'R'
	.db #0x03	; 3
	.db #0xea	; 234
	.db #0xe1	; 225
	.db #0xea	; 234
	.db #0x62	; 98	'b'
	.db #0x2a	; 42
	.db #0x02	; 2
	.db #0x8a	; 138
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0xb7	; 183
	.db #0x53	; 83	'S'
	.db #0xb7	; 183
	.db #0x57	; 87	'W'
	.db #0x36	; 54	'6'
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x95	; 149
	.db #0xb5	; 181
	.db #0x02	; 2
	.db #0xb6	; 182
	.db #0x31	; 49	'1'
	.db #0xb6	; 182
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x4a	; 74	'J'
	.db #0x41	; 65	'A'
	.db #0x8a	; 138
	.db #0x81	; 129
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x2a	; 42
	.db #0x33	; 51	'3'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xdb	; 219
	.db #0x6c	; 108	'l'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0xaa	; 170
	.db #0xb3	; 179
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0xa8	; 168
	.db #0xb0	; 176
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0xa8	; 168
	.db #0xb2	; 178
	.db #0x2b	; 43
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0xa8	; 168
	.db #0x98	; 152
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x00	; 0
	.area _INITIALIZER
__xinit__spider_phase:
	.db #0x00	; 0
__xinit__spider_dir:
	.db #0x01	; 1
__xinit__spider_pos_y:
	.dw #0x0038
	.area _CABS (ABS)
