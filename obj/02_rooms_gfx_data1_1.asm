;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12533 (MINGW32)
;--------------------------------------------------------
	.module 02_rooms_gfx_data1_1
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _room_5_1_tiles
	.globl _room_5_1_coll
	.globl _room_5_1_map
	.globl _room_4_1_tiles
	.globl _room_4_1_coll
	.globl _room_4_1_map
	.globl _enemies_34_1_tiles
	.globl _room_3_1_tiles
	.globl _room_3_1_coll
	.globl _room_3_1_map
	.globl _daisy_gets_mushrooms
	.globl _vcoll_daisy
	.globl _hcoll_mushroom
	.globl _reset_room5_1
	.globl _vcoll_troll
	.globl _hcoll_float4
	.globl _hcoll_float3
	.globl _draw_float4
	.globl _draw_float3
	.globl _move_float
	.globl _init_room34
	.globl _reset_room4
	.globl _multiple_move_sprites_limits
	.globl _default_drop
	.globl _show_coins
	.globl _sub_coins
	.globl _get_v_coll
	.globl _get_h_coll
	.globl _show_dialog_window
	.globl _set_sprite_data
	.globl _float4_dir
	.globl _float4_pos_x
	.globl _float3_dir
	.globl _float3_pos_x
	.globl _float4_move
	.globl _float3_move
	.globl _float_move_timer
	.globl _dasy_negotiated
	.globl _troll_negotiated
	.globl _troll_satisfied
	.globl _float_offsets_r4
	.globl _float_offsets_r3
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_troll_satisfied::
	.ds 1
_troll_negotiated::
	.ds 1
_dasy_negotiated::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_float_move_timer::
	.ds 1
_float3_move::
	.ds 1
_float4_move::
	.ds 1
_float3_pos_x::
	.ds 2
_float3_dir::
	.ds 2
_float4_pos_x::
	.ds 2
_float4_dir::
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
	.area _CODE_5
;src/rooms/room_34_1.c:7: void reset_room4() {
;	---------------------------------
; Function reset_room4
; ---------------------------------
_reset_room4::
;src/rooms/room_34_1.c:8: troll_satisfied = 0, troll_negotiated = 0;
	ld	hl, #_troll_satisfied
	ld	(hl), #0x00
	ld	hl, #_troll_negotiated
	ld	(hl), #0x00
;src/rooms/room_34_1.c:9: }
	ret
_float_offsets_r3:
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0xf8	; 248
_float_offsets_r4:
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x40	; 64
;src/rooms/room_34_1.c:10: void init_room34() {
;	---------------------------------
; Function init_room34
; ---------------------------------
_init_room34::
;src/rooms/room_34_1.c:11: set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
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
;src/rooms/room_34_1.c:12: for (__temp_i = evil_sprite_offset; __temp_i < (evil_sprite_offset + 4); __temp_i++) 
	ld	hl, #___temp_i
	ld	(hl), #0x09
00103$:
;src/rooms/room_34_1.c:13: set_sprite_tile(__temp_i, evil_sprites_tileoffset);
	ld	hl, #___temp_i
;c:/gb/gbdk/include/gb/gb.h:1185: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x09
;src/rooms/room_34_1.c:12: for (__temp_i = evil_sprite_offset; __temp_i < (evil_sprite_offset + 4); __temp_i++) 
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0d
	jr	C, 00103$
;src/rooms/room_34_1.c:14: }
	ret
;src/rooms/room_34_1.c:26: void move_float() {             // two floats in room 3 and 4 move in sync with each other
;	---------------------------------
; Function move_float
; ---------------------------------
_move_float::
;src/rooms/room_34_1.c:27: float_move_timer++;
	ld	hl, #_float_move_timer
	inc	(hl)
;src/rooms/room_34_1.c:28: if (float_move_timer & 1) return;
	ld	a, (hl)
	rrca
	ret	C
;src/rooms/room_34_1.c:29: if (float3_move) {
	ld	a, (#_float3_move)
	or	a, a
	jr	Z, 00113$
;src/rooms/room_34_1.c:30: if (float3_dir) {
	ld	hl, #_float3_dir + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00110$
;src/rooms/room_34_1.c:31: float3_pos_x++;
	ld	hl, #_float3_pos_x
	inc	(hl)
	jr	NZ, 00183$
	inc	hl
	inc	(hl)
00183$:
;src/rooms/room_34_1.c:32: if (float3_pos_x >= float3_max_x) { float3_dir = 0; float3_move = 0; }
	ld	hl, #_float3_pos_x
	ld	a, (hl+)
	sub	a, #0xf0
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00184$
	bit	7, d
	jr	NZ, 00185$
	cp	a, a
	jr	00185$
00184$:
	bit	7, d
	jr	Z, 00185$
	scf
00185$:
	jr	C, 00104$
	xor	a, a
	ld	hl, #_float3_dir
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #_float3_move
	ld	(hl), #0x00
00104$:
;src/rooms/room_34_1.c:33: if (float3_pos_x == float3_max_x - (float_length + 14)) float4_move = 1;
	ld	hl, #_float3_pos_x
	ld	a, (hl+)
	sub	a, #0xc2
	or	a, (hl)
	jr	NZ, 00113$
	ld	hl, #_float4_move
	ld	(hl), #0x01
	jr	00113$
00110$:
;src/rooms/room_34_1.c:35: float3_pos_x--;
	ld	hl, #_float3_pos_x
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
;src/rooms/room_34_1.c:36: if (float3_pos_x <= float3_min_x) float3_dir = 1;
	ld	a, d
	ld	(hl-), a
	ld	a, #0x68
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00188$
	bit	7, d
	jr	NZ, 00189$
	cp	a, a
	jr	00189$
00188$:
	bit	7, d
	jr	Z, 00189$
	scf
00189$:
	jr	C, 00113$
	ld	hl, #_float3_dir
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00113$:
;src/rooms/room_34_1.c:39: if (float4_move) {
	ld	a, (#_float4_move)
	or	a, a
	ret	Z
;src/rooms/room_34_1.c:40: if (float4_dir) {
	ld	hl, #_float4_dir + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00121$
;src/rooms/room_34_1.c:41: float4_pos_x++;
	ld	hl, #_float4_pos_x
	inc	(hl)
	jr	NZ, 00190$
	inc	hl
	inc	(hl)
00190$:
;src/rooms/room_34_1.c:42: if (float4_pos_x >= float4_max_x) float4_dir = 0;
	ld	hl, #_float4_pos_x
	ld	a, (hl+)
	sub	a, #0x20
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00191$
	bit	7, d
	jr	NZ, 00192$
	cp	a, a
	jr	00192$
00191$:
	bit	7, d
	jr	Z, 00192$
	scf
00192$:
	ret	C
	xor	a, a
	ld	hl, #_float4_dir
	ld	(hl+), a
	ld	(hl), a
	ret
00121$:
;src/rooms/room_34_1.c:44: float4_pos_x--;
	ld	hl, #_float4_pos_x
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
;src/rooms/room_34_1.c:45: if (float4_pos_x <= float4_min_x) { float4_dir = 1; float4_move = 0; }
	ld	a, d
	ld	(hl-), a
	ld	a, #0xe0
	sub	a, (hl)
	inc	hl
	ld	a, #0xff
	sbc	a, (hl)
	ld	a, #0xff
	ld	d, a
	bit	7, (hl)
	jr	Z, 00193$
	bit	7, d
	jr	NZ, 00194$
	cp	a, a
	jr	00194$
00193$:
	bit	7, d
	jr	Z, 00194$
	scf
00194$:
	jr	C, 00117$
	ld	hl, #_float4_dir
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	ld	hl, #_float4_move
	ld	(hl), #0x00
00117$:
;src/rooms/room_34_1.c:46: if (float4_pos_x == float4_min_x + (float_length + 15)) float3_move = 1;
	ld	hl, #_float4_pos_x
	ld	a, (hl+)
	sub	a, #0x0f
	or	a, (hl)
	ret	NZ
	ld	hl, #_float3_move
	ld	(hl), #0x01
;src/rooms/room_34_1.c:49: }
	ret
;src/rooms/room_34_1.c:50: void draw_float3() {
;	---------------------------------
; Function draw_float3
; ---------------------------------
_draw_float3::
;src/rooms/room_34_1.c:54: -bkg_scroll_x_target, - bkg_scroll_y_target);
	xor	a, a
	ld	hl, #_bkg_scroll_y_target
	sub	a, (hl)
	ld	d, a
	xor	a, a
	ld	hl, #_bkg_scroll_x_target
	sub	a, (hl)
	ld	b, a
;src/rooms/room_34_1.c:53: (unsigned char *)float_offsets_r3, 
;src/rooms/room_34_1.c:52: float3_pos_x, float34_pos_y, 
	ld	hl, #_float3_pos_x
	ld	a, (hl)
;src/rooms/room_34_1.c:51: multiple_move_sprites_limits(float_sprite_offset, float_sprite_count, 
	ld	e, b
	push	de
	ld	de, #_float_offsets_r3
	push	de
	ld	h, #0x78
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x04
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_multiple_move_sprites_limits
	add	sp, #8
;src/rooms/room_34_1.c:55: }
	ret
;src/rooms/room_34_1.c:56: void draw_float4() {
;	---------------------------------
; Function draw_float4
; ---------------------------------
_draw_float4::
;src/rooms/room_34_1.c:60: -bkg_scroll_x_target, -bkg_scroll_y_target);
	xor	a, a
	ld	hl, #_bkg_scroll_y_target
	sub	a, (hl)
	ld	d, a
	xor	a, a
	ld	hl, #_bkg_scroll_x_target
	sub	a, (hl)
	ld	b, a
;src/rooms/room_34_1.c:59: (unsigned char *)float_offsets_r4, 
;src/rooms/room_34_1.c:58: float4_pos_x, float34_pos_y, 
	ld	hl, #_float4_pos_x
	ld	a, (hl)
;src/rooms/room_34_1.c:57: multiple_move_sprites_limits(float_sprite_offset, float_sprite_count, 
	ld	e, b
	push	de
	ld	de, #_float_offsets_r4
	push	de
	ld	h, #0x78
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x04
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_multiple_move_sprites_limits
	add	sp, #8
;src/rooms/room_34_1.c:61: }
	ret
;src/rooms/room_34_1.c:62: void hcoll_float3(WORD x, WORD y) {
;	---------------------------------
; Function hcoll_float3
; ---------------------------------
_hcoll_float3::
;src/rooms/room_34_1.c:63: if (delta_y >= 0) {
	ld	a, (#_delta_y + 1)
	bit	7, a
	jp	NZ, 00108$
;src/rooms/room_34_1.c:64: if ((x >= float3_pos_x - 8) && (x <= float3_pos_x + (3 * 8))) {            
	ld	hl, #_float3_pos_x
	ld	a, (hl+)
	add	a, #0xf8
	ld	c, a
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00136$
	bit	7, d
	jr	NZ, 00137$
	cp	a, a
	jr	00137$
00136$:
	bit	7, d
	jr	Z, 00137$
	scf
00137$:
	jp	C, 00108$
	ld	hl, #_float3_pos_x
	ld	a, (hl+)
	add	a, #0x18
	ld	c, a
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00138$
	bit	7, d
	jr	NZ, 00139$
	cp	a, a
	jr	00139$
00138$:
	bit	7, d
	jr	Z, 00139$
	scf
00139$:
	jp	C, 00108$
;src/rooms/room_34_1.c:65: if ((y >= float34_pos_y - 1) && (y <= float34_pos_y + 4)) {
	ldhl	sp,	#4
	ld	a, (hl+)
	sub	a, #0x77
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00140$
	bit	7, d
	jr	NZ, 00141$
	cp	a, a
	jr	00141$
00140$:
	bit	7, d
	jr	Z, 00141$
	scf
00141$:
	jr	C, 00108$
	ldhl	sp,	#4
	ld	a, #0x7c
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00142$
	bit	7, d
	jr	NZ, 00143$
	cp	a, a
	jr	00143$
00142$:
	bit	7, d
	jr	Z, 00143$
	scf
00143$:
	jr	C, 00108$
;src/rooms/room_34_1.c:66: tile_pos_x = x >> 3; tile_pos_ox = (x - float3_pos_x) & 7;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_tile_pos_x
	ld	(hl), c
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_float3_pos_x
	ld	c, (hl)
	sub	a, c
	and	a, #0x07
	ld	(#_tile_pos_ox),a
;src/rooms/room_34_1.c:67: tile_pos_y = y >> 3; tile_pos_oy = y & 7;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_tile_pos_y
	ld	(hl), c
	ldhl	sp,	#4
	ld	a, (hl)
	and	a, #0x07
	ld	(#_tile_pos_oy),a
;src/rooms/room_34_1.c:68: collision_buf[0] = 1; collision_buf[1] = 1; collision_buf[2] = 0;
	ld	hl, #_collision_buf
	ld	(hl), #0x01
	ld	hl, #(_collision_buf + 1)
	ld	(hl), #0x01
	ld	hl, #(_collision_buf + 2)
	ld	(hl), #0x00
;src/rooms/room_34_1.c:69: delta_y = 0;
	xor	a, a
	ld	hl, #_delta_y
	ld	(hl+), a
	ld	(hl), a
;src/rooms/room_34_1.c:70: is_position_safe = 0;
	ld	hl, #_is_position_safe
	ld	(hl), #0x00
;src/rooms/room_34_1.c:71: return;
	ret
00108$:
;src/rooms/room_34_1.c:75: get_h_coll(x, y);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_h_coll
	add	sp, #4
;src/rooms/room_34_1.c:76: }
	ret
;src/rooms/room_34_1.c:77: void hcoll_float4(WORD x, WORD y) {
;	---------------------------------
; Function hcoll_float4
; ---------------------------------
_hcoll_float4::
;src/rooms/room_34_1.c:78: if (delta_y >= 0) {
	ld	a, (#_delta_y + 1)
	bit	7, a
	jp	NZ, 00108$
;src/rooms/room_34_1.c:79: if ((x >= float4_pos_x - 8) && (x <= float4_pos_x + (3 * 8))) {
	ld	hl, #_float4_pos_x
	ld	a, (hl+)
	add	a, #0xf8
	ld	c, a
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00136$
	bit	7, d
	jr	NZ, 00137$
	cp	a, a
	jr	00137$
00136$:
	bit	7, d
	jr	Z, 00137$
	scf
00137$:
	jp	C, 00108$
	ld	hl, #_float4_pos_x
	ld	a, (hl+)
	add	a, #0x18
	ld	c, a
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00138$
	bit	7, d
	jr	NZ, 00139$
	cp	a, a
	jr	00139$
00138$:
	bit	7, d
	jr	Z, 00139$
	scf
00139$:
	jp	C, 00108$
;src/rooms/room_34_1.c:80: if ((y >= float34_pos_y - 1) && (y <= float34_pos_y + 4)) {
	ldhl	sp,	#4
	ld	a, (hl+)
	sub	a, #0x77
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00140$
	bit	7, d
	jr	NZ, 00141$
	cp	a, a
	jr	00141$
00140$:
	bit	7, d
	jr	Z, 00141$
	scf
00141$:
	jr	C, 00108$
	ldhl	sp,	#4
	ld	a, #0x7c
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00142$
	bit	7, d
	jr	NZ, 00143$
	cp	a, a
	jr	00143$
00142$:
	bit	7, d
	jr	Z, 00143$
	scf
00143$:
	jr	C, 00108$
;src/rooms/room_34_1.c:81: tile_pos_x = x >> 3; tile_pos_ox = (x - float4_pos_x) & 7;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_tile_pos_x
	ld	(hl), c
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_float4_pos_x
	ld	c, (hl)
	sub	a, c
	and	a, #0x07
	ld	(#_tile_pos_ox),a
;src/rooms/room_34_1.c:82: tile_pos_y = y >> 3; tile_pos_oy = y & 7;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_tile_pos_y
	ld	(hl), c
	ldhl	sp,	#4
	ld	a, (hl)
	and	a, #0x07
	ld	(#_tile_pos_oy),a
;src/rooms/room_34_1.c:83: collision_buf[0] = 1; collision_buf[1] = 1; collision_buf[2] = 0;
	ld	hl, #_collision_buf
	ld	(hl), #0x01
	ld	hl, #(_collision_buf + 1)
	ld	(hl), #0x01
	ld	hl, #(_collision_buf + 2)
	ld	(hl), #0x00
;src/rooms/room_34_1.c:84: delta_y = 0;
	xor	a, a
	ld	hl, #_delta_y
	ld	(hl+), a
	ld	(hl), a
;src/rooms/room_34_1.c:85: is_position_safe = 0;
	ld	hl, #_is_position_safe
	ld	(hl), #0x00
;src/rooms/room_34_1.c:86: return;
	ret
00108$:
;src/rooms/room_34_1.c:90: get_h_coll(x, y);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_h_coll
	add	sp, #4
;src/rooms/room_34_1.c:91: }
	ret
;src/rooms/room_34_1.c:94: void vcoll_troll(WORD x, WORD y) {
;	---------------------------------
; Function vcoll_troll
; ---------------------------------
_vcoll_troll::
	dec	sp
;src/rooms/room_34_1.c:96: if (x >= troll_x_position) {
	ldhl	sp,	#3
	ld	a, (hl+)
	sub	a, #0xb0
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	ld	e, a
	bit	7, e
	jr	Z, 00157$
	bit	7, d
	jr	NZ, 00158$
	cp	a, a
	jr	00158$
00157$:
	bit	7, d
	jr	Z, 00158$
	scf
00158$:
	ld	a, #0x00
	rla
	ldhl	sp,	#0
	ld	(hl), a
;src/rooms/room_34_1.c:95: if (!troll_negotiated) {
	ld	a, (#_troll_negotiated)
	or	a, a
	jr	NZ, 00104$
;src/rooms/room_34_1.c:96: if (x >= troll_x_position) {
	ldhl	sp,	#0
	bit	0, (hl)
	jr	NZ, 00104$
;src/rooms/room_34_1.c:97: show_dialog_window(4, &troll_dialog);
	ld	de, #_troll_dialog
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_34_1.c:98: troll_negotiated = 1;
	ld	hl, #_troll_negotiated
	ld	(hl), #0x01
00104$:
;src/rooms/room_34_1.c:101: if ((!troll_satisfied) && (coins >= 3)) {
	ld	a, (#_troll_satisfied)
	or	a, a
	jr	NZ, 00108$
	ld	a, (#_coins)
	sub	a, #0x03
	jr	C, 00108$
;src/rooms/room_34_1.c:102: if (x >= troll_x_position) {
	ldhl	sp,	#0
	bit	0, (hl)
	jr	NZ, 00108$
;src/rooms/room_34_1.c:103: show_dialog_window(3, &troll_toll);
	ld	de, #_troll_toll
	push	de
	ld	a, #0x03
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_34_1.c:104: sub_coins(3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_sub_coins
	inc	sp
;src/rooms/room_34_1.c:105: show_coins();
	call	_show_coins
;src/rooms/room_34_1.c:106: troll_satisfied = 1;
	ld	hl, #_troll_satisfied
	ld	(hl), #0x01
00108$:
;src/rooms/room_34_1.c:109: if ((!troll_satisfied) && (delta_x >= 0)) {
	ld	a, (#_troll_satisfied)
	or	a, a
	jr	NZ, 00113$
	ld	a, (#_delta_x + 1)
	bit	7, a
	jr	NZ, 00113$
;src/rooms/room_34_1.c:110: if (x >= troll_x_position) {
	ldhl	sp,	#0
	bit	0, (hl)
	jr	NZ, 00113$
;src/rooms/room_34_1.c:111: tile_pos_x = x >> 3; 
	ldhl	sp,#3
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_tile_pos_x
	ld	(hl), c
;src/rooms/room_34_1.c:112: collision_buf[0] = 1; collision_buf[1] = 1;
	ld	hl, #_collision_buf
	ld	(hl), #0x01
	ld	hl, #(_collision_buf + 1)
	ld	(hl), #0x01
;src/rooms/room_34_1.c:113: delta_x = -1;
	ld	hl, #_delta_x
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xff
;src/rooms/room_34_1.c:115: dizzy_stun = 1;
	ld	hl, #_dizzy_stun
	ld	(hl), #0x01
;src/rooms/room_34_1.c:116: ani_type = ANI_JUMP_L; ani_phase = 0;
	ld	hl, #_ani_type
	ld	(hl), #0x09
	ld	hl, #_ani_phase
	ld	(hl), #0x00
;src/rooms/room_34_1.c:117: current_dyn = &move_y_dynamics; current_dyn_phase = 0;            
	ld	hl, #_current_dyn
	ld	(hl), #<(_move_y_dynamics)
	inc	hl
	ld	(hl), #>(_move_y_dynamics)
	ld	hl, #_current_dyn_phase
	ld	(hl), #0x00
00113$:
;src/rooms/room_34_1.c:120: get_v_coll(x, y);
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_v_coll
;src/rooms/room_34_1.c:121: }
	add	sp, #5
	ret
;src/rooms/room_5_1.c:2: void reset_room5_1() {
;	---------------------------------
; Function reset_room5_1
; ---------------------------------
_reset_room5_1::
;src/rooms/room_5_1.c:3: dasy_negotiated = 0;
	ld	hl, #_dasy_negotiated
	ld	(hl), #0x00
;src/rooms/room_5_1.c:4: }
	ret
;src/rooms/room_5_1.c:9: void hcoll_mushroom(WORD x, WORD y) {
;	---------------------------------
; Function hcoll_mushroom
; ---------------------------------
_hcoll_mushroom::
;src/rooms/room_5_1.c:10: if (delta_y >= 0) {
	ld	a, (#_delta_y + 1)
	bit	7, a
	jp	NZ, 00108$
;src/rooms/room_5_1.c:11: if ((x >= (mushroom_pos_x - 8)) && (x <= (mushroom_pos_x + (2 * 8)))) {
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x18
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00136$
	bit	7, d
	jr	NZ, 00137$
	cp	a, a
	jr	00137$
00136$:
	bit	7, d
	jr	Z, 00137$
	scf
00137$:
	jp	C, 00108$
	ldhl	sp,	#2
	ld	a, #0x30
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00138$
	bit	7, d
	jr	NZ, 00139$
	cp	a, a
	jr	00139$
00138$:
	bit	7, d
	jr	Z, 00139$
	scf
00139$:
	jp	C, 00108$
;src/rooms/room_5_1.c:12: if ((y >= (mushroom_pos_y - 1)) && (y <= (mushroom_pos_y + 4))) {
	ldhl	sp,	#4
	ld	a, (hl+)
	sub	a, #0x5f
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00140$
	bit	7, d
	jr	NZ, 00141$
	cp	a, a
	jr	00141$
00140$:
	bit	7, d
	jr	Z, 00141$
	scf
00141$:
	jp	C, 00108$
	ldhl	sp,	#4
	ld	a, #0x64
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00142$
	bit	7, d
	jr	NZ, 00143$
	cp	a, a
	jr	00143$
00142$:
	bit	7, d
	jr	Z, 00143$
	scf
00143$:
	jr	C, 00108$
;src/rooms/room_5_1.c:13: tile_pos_x = x >> 3; tile_pos_ox = (x - float4_pos_x) & 7;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_tile_pos_x
	ld	(hl), c
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_float4_pos_x
	ld	c, (hl)
	sub	a, c
	and	a, #0x07
	ld	(#_tile_pos_ox),a
;src/rooms/room_5_1.c:14: tile_pos_y = y >> 3; tile_pos_oy = y & 7;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_tile_pos_y
	ld	(hl), c
	ldhl	sp,	#4
	ld	a, (hl)
	and	a, #0x07
	ld	(#_tile_pos_oy),a
;src/rooms/room_5_1.c:15: collision_buf[0] = 1; collision_buf[1] = 1; collision_buf[2] = 0;
	ld	hl, #_collision_buf
	ld	(hl), #0x01
	ld	hl, #(_collision_buf + 1)
	ld	(hl), #0x01
	ld	hl, #(_collision_buf + 2)
	ld	(hl), #0x00
;src/rooms/room_5_1.c:16: delta_y = 0;
	xor	a, a
	ld	hl, #_delta_y
	ld	(hl+), a
	ld	(hl), a
;src/rooms/room_5_1.c:17: is_position_safe = 0;
	ld	hl, #_is_position_safe
	ld	(hl), #0x00
;src/rooms/room_5_1.c:18: double_dyn = 1;
	ld	hl, #_double_dyn
	ld	(hl), #0x01
;src/rooms/room_5_1.c:19: return;
	ret
00108$:
;src/rooms/room_5_1.c:23: get_h_coll(x, y);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_h_coll
	add	sp, #4
;src/rooms/room_5_1.c:24: }
	ret
;src/rooms/room_5_1.c:26: void vcoll_daisy(WORD x, WORD y) {
;	---------------------------------
; Function vcoll_daisy
; ---------------------------------
_vcoll_daisy::
;src/rooms/room_5_1.c:27: if (!dasy_negotiated) {
	ld	a, (#_dasy_negotiated)
	or	a, a
	jr	NZ, 00106$
;src/rooms/room_5_1.c:28: if ((y > (14 * 8)) && (x > (17 * 8)) && (x < (19 * 8))) {
	ldhl	sp,	#4
	ld	a, #0x70
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00129$
	bit	7, d
	jr	NZ, 00130$
	cp	a, a
	jr	00130$
00129$:
	bit	7, d
	jr	Z, 00130$
	scf
00130$:
	jr	NC, 00106$
	ldhl	sp,	#2
	ld	a, #0x88
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00131$
	bit	7, d
	jr	NZ, 00132$
	cp	a, a
	jr	00132$
00131$:
	bit	7, d
	jr	Z, 00132$
	scf
00132$:
	jr	NC, 00106$
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x98
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
	jr	NC, 00106$
;src/rooms/room_5_1.c:29: show_dialog_window(5, &daisy_dialog);
	ld	de, #_daisy_dialog
	push	de
	ld	a, #0x05
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_5_1.c:30: dasy_negotiated = 1;
	ld	hl, #_dasy_negotiated
	ld	(hl), #0x01
00106$:
;src/rooms/room_5_1.c:33: get_v_coll(x, y);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_v_coll
	add	sp, #4
;src/rooms/room_5_1.c:34: }
	ret
;src/rooms/room_5_1.c:36: UBYTE daisy_gets_mushrooms(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
;	---------------------------------
; Function daisy_gets_mushrooms
; ---------------------------------
_daisy_gets_mushrooms::
;src/rooms/room_5_1.c:37: if (id == ID_MUSHROOMS) {
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00106$
;src/rooms/room_5_1.c:38: if ((tile_y == 14) && (tile_x > 14) && (tile_x < 19)) {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x0e
	jr	NZ, 00106$
	ld	a, #0x0e
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00106$
	ld	a, (hl)
	sub	a, #0x13
	jr	NC, 00106$
;src/rooms/room_5_1.c:39: show_dialog_window(7, &daisy_gives_pie);
	ld	de, #_daisy_gives_pie
	push	de
	ld	a, #0x07
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_5_1.c:40: return ID_PIE;
	ld	e, #0x05
	ret
00106$:
;src/rooms/room_5_1.c:43: return default_drop(id);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_default_drop
	inc	sp
;src/rooms/room_5_1.c:44: }
	ret
	.area _CODE_5
_room_3_1_map:
	.dw #0x0096
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xc2	; 194
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xc2	; 194
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x07	; 7
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0xc2	; 194
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0xc2	; 194
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x22	; 34
	.db #0x2b	; 43
	.db #0x23	; 35
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0xd1	; 209
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0xd1	; 209
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x42	; 66	'B'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x43	; 67	'C'
	.db #0x42	; 66	'B'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x43	; 67	'C'
	.db #0x42	; 66	'B'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x43	; 67	'C'
	.db #0x42	; 66	'B'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x48	; 72	'H'
	.db #0x47	; 71	'G'
	.db #0x4a	; 74	'J'
	.db #0x46	; 70	'F'
	.db #0x4b	; 75	'K'
	.db #0x4a	; 74	'J'
	.db #0x46	; 70	'F'
	.db #0xd1	; 209
	.db #0x00	; 0
_room_3_1_coll:
	.dw #0x0021
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x01	; 1
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x05	; 5
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xd1	; 209
	.db #0x00	; 0
	.db #0xcd	; 205
	.db #0x01	; 1
	.db #0xd1	; 209
	.db #0x07	; 7
	.db #0xde	; 222
	.db #0x01	; 1
_room_3_1_tiles:
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x29	; 41
	.db #0x32	; 50	'2'
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0xc6	; 198
	.db #0x65	; 101	'e'
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
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x31	; 49	'1'
	.db #0x2b	; 43
	.db #0x32	; 50	'2'
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0xb2	; 178
	.db #0x58	; 88	'X'
	.db #0x2c	; 44
	.db #0x96	; 150
	.db #0x8b	; 139
	.db #0x45	; 69	'E'
	.db #0x82	; 130
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x8c	; 140
	.db #0xd4	; 212
	.db #0x4c	; 76	'L'
	.db #0x94	; 148
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
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x12	; 18
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x4b	; 75	'K'
	.db #0xdb	; 219
	.db #0x9b	; 155
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0xb8	; 184
	.db #0x72	; 114	'r'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0xe3	; 227
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x0d	; 13
	.db #0x26	; 38
	.db #0x17	; 23
	.db #0x26	; 38
	.db #0x08	; 8
	.db #0x52	; 82	'R'
	.db #0x2b	; 43
	.db #0x19	; 25
	.db #0x02	; 2
	.db #0x5d	; 93
	.db #0x38	; 56	'8'
	.db #0x27	; 39
	.db #0xce	; 206
	.db #0x14	; 20
	.db #0xbb	; 187
	.db #0xcb	; 203
	.db #0x87	; 135
	.db #0x02	; 2
	.db #0x96	; 150
	.db #0x6e	; 110	'n'
	.db #0x6c	; 108	'l'
	.db #0x40	; 64
	.db #0xd6	; 214
	.db #0x34	; 52	'4'
	.db #0x31	; 49	'1'
	.db #0xbb	; 187
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf3	; 243
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x44	; 68	'D'
	.db #0x31	; 49	'1'
	.db #0x02	; 2
	.db #0x1a	; 26
	.db #0x53	; 83	'S'
	.db #0x24	; 36
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x31	; 49	'1'
	.db #0x68	; 104	'h'
	.db #0xdb	; 219
	.db #0x33	; 51	'3'
	.db #0x09	; 9
	.db #0x59	; 89	'Y'
	.db #0xcc	; 204
	.db #0x63	; 99	'c'
	.db #0x02	; 2
	.db #0x90	; 144
	.db #0x0e	; 14
	.db #0x9c	; 156
	.db #0xc9	; 201
	.db #0x83	; 131
	.db #0x71	; 113	'q'
	.db #0xa6	; 166
	.db #0xa8	; 168
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xfd	; 253
	.db #0xac	; 172
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xf7	; 247
	.db #0xa2	; 162
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x1a	; 26
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x2d	; 45
	.db #0x46	; 70	'F'
	.db #0x28	; 40
	.db #0x54	; 84	'T'
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x7c	; 124
	.db #0xbe	; 190
	.db #0x02	; 2
	.db #0x5c	; 92
	.db #0xae	; 174
	.db #0x84	; 132
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x4a	; 74	'J'
	.db #0x24	; 36
	.db #0xa6	; 166
	.db #0xa9	; 169
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x4a	; 74	'J'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0xa2	; 162
	.db #0xaa	; 170
	.db #0xd3	; 211
	.db #0xae	; 174
	.db #0x02	; 2
	.db #0xc8	; 200
	.db #0x44	; 68	'D'
	.db #0x22	; 34
	.db #0xaa	; 170
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0xba	; 186
	.db #0xb7	; 183
	.db #0x02	; 2
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x4a	; 74	'J'
	.db #0x24	; 36
	.db #0xa6	; 166
	.db #0xa9	; 169
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0xc8	; 200
	.db #0x4a	; 74	'J'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0xa2	; 162
	.db #0xaa	; 170
	.db #0xd3	; 211
	.db #0xae	; 174
	.db #0x02	; 2
	.db #0xc9	; 201
	.db #0x4a	; 74	'J'
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0xf0	; 240
	.db #0x8d	; 141
	.db #0x5a	; 90	'Z'
	.db #0xb5	; 181
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x4a	; 74	'J'
	.db #0x24	; 36
	.db #0xa6	; 166
	.db #0xa9	; 169
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x4b	; 75	'K'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0xa2	; 162
	.db #0xaa	; 170
	.db #0xd3	; 211
	.db #0xae	; 174
	.db #0x02	; 2
	.db #0xbf	; 191
	.db #0x65	; 101	'e'
	.db #0x22	; 34
	.db #0xaa	; 170
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0xba	; 186
	.db #0xb7	; 183
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x50	; 80	'P'
	.db #0x4a	; 74	'J'
	.db #0x24	; 36
	.db #0xa6	; 166
	.db #0xa9	; 169
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0xf0	; 240
	.db #0x8d	; 141
	.db #0x5a	; 90	'Z'
	.db #0xb5	; 181
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x90	; 144
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
	.db #0x38	; 56	'8'
	.db #0x63	; 99	'c'
	.db #0xcb	; 203
	.db #0xaf	; 175
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x2b	; 43
	.db #0xed	; 237
	.db #0x02	; 2
	.db #0xa0	; 160
	.db #0xa4	; 164
	.db #0x48	; 72	'H'
	.db #0x28	; 40
	.db #0x93	; 147
	.db #0xea	; 234
	.db #0xed	; 237
	.db #0xd6	; 214
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xcf	; 207
	.db #0xa5	; 165
	.db #0x68	; 104	'h'
	.db #0xab	; 171
	.db #0x9a	; 154
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0xe9	; 233
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x38	; 56	'8'
	.db #0x27	; 39
	.db #0x41	; 65	'A'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x38	; 56	'8'
	.db #0x47	; 71	'G'
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0xe5	; 229
	.db #0x12	; 18
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xde	; 222
	.db #0xfa	; 250
	.db #0xdf	; 223
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x29	; 41
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xea	; 234
	.db #0xb7	; 183
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xfd	; 253
	.db #0x27	; 39
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x7c	; 124
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdd	; 221
	.db #0x69	; 105	'i'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0xf9	; 249
	.db #0xd5	; 213
	.db #0xba	; 186
	.db #0xd4	; 212
	.db #0x4c	; 76	'L'
	.db #0x08	; 8
	.db #0x00	; 0
_enemies_34_1_tiles:
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0xd7	; 215
	.db #0x7c	; 124
	.db #0xab	; 171
	.db #0xfe	; 254
	.db #0xd3	; 211
	.db #0xfe	; 254
	.db #0x83	; 131
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
_room_4_1_map:
	.dw #0x00bc
	.db #0xe4	; 228
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe2	; 226
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0xcb	; 203
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x4c	; 76	'L'
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
_room_4_1_coll:
	.dw #0x0031
	.db #0xe4	; 228
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x05	; 5
	.db #0xd8	; 216
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
	.db #0xe2	; 226
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x04	; 4
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x04	; 4
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x04	; 4
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x04	; 4
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x04	; 4
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x04	; 4
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xd5	; 213
	.db #0x01	; 1
	.db #0xc8	; 200
	.db #0x07	; 7
	.db #0xf4	; 244
	.db #0x01	; 1
_room_4_1_tiles:
	.db #0x59	; 89	'Y'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x72	; 114	'r'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0xb8	; 184
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
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
	.db #0xfb	; 251
	.db #0x5f	; 95
	.db #0xaf	; 175
	.db #0xf5	; 245
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x78	; 120	'x'
	.db #0xd4	; 212
	.db #0xae	; 174
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xdf	; 223
	.db #0xb7	; 183
	.db #0xeb	; 235
	.db #0x01	; 1
	.db #0x2e	; 46
	.db #0x7d	; 125
	.db #0x7f	; 127
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xd5	; 213
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0xf1	; 241
	.db #0xf3	; 243
	.db #0xcf	; 207
	.db #0xf7	; 247
	.db #0xfb	; 251
	.db #0xf5	; 245
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
	.db #0xbf	; 191
	.db #0xed	; 237
	.db #0x5f	; 95
	.db #0xab	; 171
	.db #0xd7	; 215
	.db #0xaa	; 170
	.db #0x75	; 117	'u'
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0xf7	; 247
	.db #0xfd	; 253
	.db #0xb6	; 182
	.db #0xdf	; 223
	.db #0x75	; 117	'u'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x82	; 130
	.db #0x01	; 1
	.db #0xab	; 171
	.db #0xdf	; 223
	.db #0xf7	; 247
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xea	; 234
	.db #0xd5	; 213
	.db #0xa0	; 160
	.db #0x01	; 1
	.db #0x6e	; 110	'n'
	.db #0xfb	; 251
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
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xd6	; 214
	.db #0xaf	; 175
	.db #0xf7	; 247
	.db #0xbe	; 190
	.db #0x55	; 85	'U'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x48	; 72	'H'
	.db #0x1f	; 31
	.db #0x4e	; 78	'N'
	.db #0x24	; 36
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf6	; 246
	.db #0xfa	; 250
	.db #0xdc	; 220
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x36	; 54	'6'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x85	; 133
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xb1	; 177
	.db #0x2a	; 42
	.db #0x51	; 81	'Q'
	.db #0x6e	; 110	'n'
	.db #0x89	; 137
	.db #0x71	; 113	'q'
	.db #0xbf	; 191
	.db #0x9e	; 158
	.db #0x02	; 2
	.db #0xcf	; 207
	.db #0xd7	; 215
	.db #0xae	; 174
	.db #0x5e	; 94
	.db #0xbf	; 191
	.db #0x38	; 56	'8'
	.db #0xd9	; 217
	.db #0xf2	; 242
	.db #0x02	; 2
	.db #0xc5	; 197
	.db #0xac	; 172
	.db #0x68	; 104	'h'
	.db #0xe2	; 226
	.db #0xd6	; 214
	.db #0xf8	; 248
	.db #0x5c	; 92
	.db #0xec	; 236
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x12	; 18
	.db #0x19	; 25
	.db #0x1c	; 28
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xa6	; 166
	.db #0x06	; 6
	.db #0x78	; 120	'x'
	.db #0x0d	; 13
	.db #0xf1	; 241
	.db #0xfe	; 254
	.db #0xaf	; 175
	.db #0x02	; 2
	.db #0xb1	; 177
	.db #0xda	; 218
	.db #0xed	; 237
	.db #0x64	; 100	'd'
	.db #0x73	; 115	's'
	.db #0x75	; 117	'u'
	.db #0x73	; 115	's'
	.db #0xf0	; 240
	.db #0x02	; 2
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xe5	; 229
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x17	; 23
	.db #0x2c	; 44
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x2e	; 46
	.db #0x5f	; 95
	.db #0x02	; 2
	.db #0x47	; 71	'G'
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0xaa	; 170
	.db #0x57	; 87	'W'
	.db #0x3e	; 62
	.db #0xc6	; 198
	.db #0x02	; 2
	.db #0xe0	; 224
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x15	; 21
	.db #0xa3	; 163
	.db #0x57	; 87	'W'
	.db #0x8d	; 141
	.db #0x5e	; 94
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x95	; 149
	.db #0x80	; 128
	.db #0x1b	; 27
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3d	; 61
	.db #0x02	; 2
	.db #0x58	; 88	'X'
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x64	; 100	'd'
	.db #0x02	; 2
	.db #0x56	; 86	'V'
	.db #0xa6	; 166
	.db #0x58	; 88	'X'
	.db #0x02	; 2
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x98	; 152
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x02	; 2
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x02	; 2
	.db #0x60	; 96
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x02	; 2
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x89	; 137
	.db #0x02	; 2
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x34	; 52	'4'
	.db #0x24	; 36
	.db #0x34	; 52	'4'
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x02	; 2
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x5f	; 95
	.db #0x4f	; 79	'O'
	.db #0x97	; 151
	.db #0x2a	; 42
	.db #0x31	; 49	'1'
	.db #0x1c	; 28
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xaa	; 170
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0x02	; 2
	.db #0xa0	; 160
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xea	; 234
	.db #0x55	; 85	'U'
	.db #0xa0	; 160
	.db #0x05	; 5
	.db #0xe0	; 224
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x47	; 71	'G'
	.db #0xa7	; 167
	.db #0x47	; 71	'G'
	.db #0x13	; 19
	.db #0x47	; 71	'G'
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x54	; 84	'T'
	.db #0xa4	; 164
	.db #0xc8	; 200
	.db #0xa8	; 168
	.db #0xc8	; 200
	.db #0xe8	; 232
	.db #0xc8	; 200
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x4d	; 77	'M'
	.db #0x4d	; 77	'M'
	.db #0x4d	; 77	'M'
	.db #0x79	; 121	'y'
	.db #0xd9	; 217
	.db #0x02	; 2
	.db #0x59	; 89	'Y'
	.db #0x59	; 89	'Y'
	.db #0x59	; 89	'Y'
	.db #0x59	; 89	'Y'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x65	; 101	'e'
	.db #0x65	; 101	'e'
	.db #0x02	; 2
	.db #0x45	; 69	'E'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x02	; 2
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x90	; 144
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xb2	; 178
	.db #0xb2	; 178
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x52	; 82	'R'
	.db #0x02	; 2
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xa6	; 166
	.db #0xa6	; 166
	.db #0x02	; 2
	.db #0x90	; 144
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xb2	; 178
	.db #0xb2	; 178
	.db #0xb2	; 178
	.db #0x9e	; 158
	.db #0x9b	; 155
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x4a	; 74	'J'
	.db #0x24	; 36
	.db #0xa6	; 166
	.db #0xa9	; 169
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x4a	; 74	'J'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0xa2	; 162
	.db #0xaa	; 170
	.db #0xd3	; 211
	.db #0xae	; 174
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x22	; 34
	.db #0xaa	; 170
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0xba	; 186
	.db #0xb7	; 183
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0x21	; 33
	.db #0x8b	; 139
	.db #0xad	; 173
	.db #0x52	; 82	'R'
	.db #0x02	; 2
	.db #0x87	; 135
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xbc	; 188
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xbc	; 188
	.db #0x3f	; 63
	.db #0x7d	; 125
	.db #0x6f	; 111	'o'
	.db #0x15	; 21
	.db #0xaa	; 170
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xf9	; 249
	.db #0xbf	; 191
	.db #0x17	; 23
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0xf5	; 245
	.db #0xfd	; 253
	.db #0xe9	; 233
	.db #0x53	; 83	'S'
	.db #0xa7	; 167
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xe4	; 228
	.db #0xf0	; 240
	.db #0xea	; 234
	.db #0xd8	; 216
	.db #0xda	; 218
	.db #0xb5	; 181
	.db #0x0a	; 10
	.db #0xb7	; 183
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0xf0	; 240
	.db #0x8d	; 141
	.db #0x5a	; 90	'Z'
	.db #0xb5	; 181
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x25	; 37
	.db #0x12	; 18
	.db #0x14	; 20
	.db #0xc9	; 201
	.db #0x54	; 84	'T'
	.db #0xb7	; 183
	.db #0x6b	; 107	'k'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x69	; 105	'i'
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0x7c	; 124
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
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0xe5	; 229
	.db #0x12	; 18
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x38	; 56	'8'
	.db #0x27	; 39
	.db #0x41	; 65	'A'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0xe9	; 233
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x38	; 56	'8'
	.db #0x47	; 71	'G'
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x33	; 51	'3'
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xa5	; 165
	.db #0x68	; 104	'h'
	.db #0xab	; 171
	.db #0x9a	; 154
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xfd	; 253
	.db #0xf7	; 247
	.db #0xf5	; 245
	.db #0xe3	; 227
	.db #0xa0	; 160
	.db #0x15	; 21
	.db #0x76	; 118	'v'
_room_5_1_map:
	.dw #0x017c
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x07	; 7
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x18	; 24
	.db #0xcb	; 203
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x09	; 9
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x07	; 7
	.db #0x23	; 35
	.db #0x04	; 4
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x21	; 33
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x29	; 41
	.db #0x21	; 33
	.db #0x2a	; 42
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x2b	; 43
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x2e	; 46
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x21	; 33
	.db #0x35	; 53	'5'
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x36	; 54	'6'
	.db #0x2a	; 42
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x37	; 55	'7'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x21	; 33
	.db #0x3b	; 59
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x3c	; 60
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x40	; 64
	.db #0x09	; 9
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x4a	; 74	'J'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x09	; 9
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x04	; 4
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x58	; 88	'X'
	.db #0x5e	; 94
	.db #0x54	; 84	'T'
	.db #0x09	; 9
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x5f	; 95
	.db #0x38	; 56	'8'
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0xc2	; 194
	.db #0x66	; 102	'f'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0x54	; 84	'T'
	.db #0x04	; 4
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6b	; 107	'k'
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x4f	; 79	'O'
	.db #0x52	; 82	'R'
	.db #0xc2	; 194
	.db #0x66	; 102	'f'
	.db #0x68	; 104	'h'
	.db #0x72	; 114	'r'
	.db #0x4f	; 79	'O'
	.db #0x52	; 82	'R'
	.db #0x54	; 84	'T'
	.db #0x09	; 9
	.db #0xc2	; 194
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x38	; 56	'8'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x66	; 102	'f'
	.db #0x52	; 82	'R'
	.db #0x66	; 102	'f'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0xc2	; 194
	.db #0x66	; 102	'f'
	.db #0x54	; 84	'T'
	.db #0x04	; 4
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
_room_5_1_coll:
	.dw #0x004c
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
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc4	; 196
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
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xca	; 202
	.db #0x01	; 1
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xcb	; 203
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xce	; 206
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xcc	; 204
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
	.db #0xc9	; 201
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0xca	; 202
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x01	; 1
_room_5_1_tiles:
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x31	; 49	'1'
	.db #0x54	; 84	'T'
	.db #0x66	; 102	'f'
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x08	; 8
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x01	; 1
	.db #0x61	; 97	'a'
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
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x38	; 56	'8'
	.db #0x54	; 84	'T'
	.db #0xaa	; 170
	.db #0xd2	; 210
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
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
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x53	; 83	'S'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0xa8	; 168
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x08	; 8
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x21	; 33
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
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x81	; 129
	.db #0x13	; 19
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x98	; 152
	.db #0x70	; 112	'p'
	.db #0x80	; 128
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
	.db #0x04	; 4
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
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0xca	; 202
	.db #0x0a	; 10
	.db #0x61	; 97	'a'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x38	; 56	'8'
	.db #0x2c	; 44
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x01	; 1
	.db #0xe1	; 225
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x9b	; 155
	.db #0x2d	; 45
	.db #0xd0	; 208
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0xe6	; 230
	.db #0x1b	; 27
	.db #0x0d	; 13
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x21	; 33
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0x2c	; 44
	.db #0x16	; 22
	.db #0x8f	; 143
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x02	; 2
	.db #0x2b	; 43
	.db #0x1c	; 28
	.db #0xc2	; 194
	.db #0x31	; 49	'1'
	.db #0x4a	; 74	'J'
	.db #0x2d	; 45
	.db #0xd0	; 208
	.db #0x9a	; 154
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0x80	; 128
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0xd0	; 208
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
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0x2a	; 42
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xb3	; 179
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x43	; 67	'C'
	.db #0xa1	; 161
	.db #0x70	; 112	'p'
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x88	; 136
	.db #0x61	; 97	'a'
	.db #0xa8	; 168
	.db #0x41	; 65	'A'
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x88	; 136
	.db #0x61	; 97	'a'
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x85	; 133
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x37	; 55	'7'
	.db #0x00	; 0
	.db #0xcd	; 205
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x10	; 16
	.db #0x13	; 19
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x86	; 134
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x13	; 19
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x5c	; 92
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0xc8	; 200
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x61	; 97	'a'
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x85	; 133
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x25	; 37
	.db #0x12	; 18
	.db #0x14	; 20
	.db #0xc9	; 201
	.db #0x54	; 84	'T'
	.db #0xb6	; 182
	.db #0x6b	; 107	'k'
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0xa2	; 162
	.db #0xa4	; 164
	.db #0x98	; 152
	.db #0x14	; 20
	.db #0xb5	; 181
	.db #0xee	; 238
	.db #0xb5	; 181
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x01	; 1
	.db #0x61	; 97	'a'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0xa8	; 168
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x85	; 133
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x10	; 16
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
	.db #0x3b	; 59
	.db #0x56	; 86	'V'
	.db #0xd4	; 212
	.db #0xf5	; 245
	.db #0xb5	; 181
	.db #0xb5	; 181
	.db #0xd6	; 214
	.db #0xde	; 222
	.db #0x01	; 1
	.db #0x77	; 119	'w'
	.db #0x8b	; 139
	.db #0xb7	; 183
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0x04	; 4
	.db #0x4a	; 74	'J'
	.db #0x0a	; 10
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0xca	; 202
	.db #0x0a	; 10
	.db #0xe3	; 227
	.db #0x03	; 3
	.db #0xea	; 234
	.db #0x0a	; 10
	.db #0x62	; 98	'b'
	.db #0x02	; 2
	.db #0x6a	; 106	'j'
	.db #0x0a	; 10
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x23	; 35
	.db #0x2e	; 46
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x1a	; 26
	.db #0x74	; 116	't'
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xb8	; 184
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0xc0	; 192
	.db #0x00	; 0
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
	.db #0xaa	; 170
	.db #0xba	; 186
	.db #0xaa	; 170
	.db #0xab	; 171
	.db #0xaa	; 170
	.db #0xa2	; 162
	.db #0xa2	; 162
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0x22	; 34
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x11	; 17
	.db #0x87	; 135
	.db #0x12	; 18
	.db #0x85	; 133
	.db #0x12	; 18
	.db #0x03	; 3
	.db #0x35	; 53	'5'
	.db #0x68	; 104	'h'
	.db #0xd0	; 208
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x55	; 85	'U'
	.db #0x6d	; 109	'm'
	.db #0x6d	; 109	'm'
	.db #0x25	; 37
	.db #0xad	; 173
	.db #0xed	; 237
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0x03	; 3
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xaf	; 175
	.db #0xda	; 218
	.db #0xae	; 174
	.db #0x0a	; 10
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0xea	; 234
	.db #0x00	; 0
	.db #0xa7	; 167
	.db #0x00	; 0
	.db #0x7a	; 122	'z'
	.db #0x68	; 104	'h'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x72	; 114	'r'
	.db #0x72	; 114	'r'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xeb	; 235
	.db #0x00	; 0
	.db #0xba	; 186
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x46	; 70	'F'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0x04	; 4
	.db #0xea	; 234
	.db #0x0a	; 10
	.db #0xe1	; 225
	.db #0x01	; 1
	.db #0xaa	; 170
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x6a	; 106	'j'
	.db #0x6a	; 106	'j'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0x55	; 85	'U'
	.db #0x78	; 120	'x'
	.db #0x55	; 85	'U'
	.db #0x7c	; 124
	.db #0x55	; 85	'U'
	.db #0x6c	; 108	'l'
	.db #0x45	; 69	'E'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x78	; 120	'x'
	.db #0x55	; 85	'U'
	.db #0x7a	; 122	'z'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x6a	; 106	'j'
	.db #0x41	; 65	'A'
	.db #0x6a	; 106	'j'
	.db #0x42	; 66	'B'
	.db #0x6a	; 106	'j'
	.db #0x42	; 66	'B'
	.db #0x6a	; 106	'j'
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xea	; 234
	.db #0xd1	; 209
	.db #0xaa	; 170
	.db #0x75	; 117	'u'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x03	; 3
	.db #0x6e	; 110	'n'
	.db #0x41	; 65	'A'
	.db #0x6a	; 106	'j'
	.db #0x51	; 81	'Q'
	.db #0x7a	; 122	'z'
	.db #0x55	; 85	'U'
	.db #0x6c	; 108	'l'
	.db #0x45	; 69	'E'
	.db #0x01	; 1
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x46	; 70	'F'
	.db #0x55	; 85	'U'
	.db #0x3a	; 58
	.db #0x55	; 85	'U'
	.db #0x7e	; 126
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
	.db #0x01	; 1
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x4a	; 74	'J'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0xa2	; 162
	.db #0xaa	; 170
	.db #0xd3	; 211
	.db #0xae	; 174
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x3a	; 58
	.db #0x34	; 52	'4'
	.db #0x3a	; 58
	.db #0x75	; 117	'u'
	.db #0xfb	; 251
	.db #0x03	; 3
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6c	; 108	'l'
	.db #0xd7	; 215
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x6c	; 108	'l'
	.db #0x45	; 69	'E'
	.db #0x6e	; 110	'n'
	.db #0x55	; 85	'U'
	.db #0x7a	; 122	'z'
	.db #0x55	; 85	'U'
	.db #0x72	; 114	'r'
	.db #0x55	; 85	'U'
	.db #0x03	; 3
	.db #0x7e	; 126
	.db #0x55	; 85	'U'
	.db #0x76	; 118	'v'
	.db #0x55	; 85	'U'
	.db #0x46	; 70	'F'
	.db #0x55	; 85	'U'
	.db #0x70	; 112	'p'
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x07	; 7
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
	.db #0xf4	; 244
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0xef	; 239
	.db #0x4b	; 75	'K'
	.db #0x33	; 51	'3'
	.db #0x5b	; 91
	.db #0x51	; 81	'Q'
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0xf7	; 247
	.db #0xdf	; 223
	.db #0xd5	; 213
	.db #0x8d	; 141
	.db #0x82	; 130
	.db #0x57	; 87	'W'
	.db #0xd9	; 217
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xde	; 222
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1b	; 27
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x93	; 147
	.db #0x55	; 85	'U'
	.db #0x11	; 17
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbb	; 187
	.db #0xc7	; 199
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x90	; 144
	.db #0xb8	; 184
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa4	; 164
	.db #0x75	; 117	'u'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0xc8	; 200
	.db #0xe1	; 225
	.db #0x68	; 104	'h'
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0x82	; 130
	.db #0x66	; 102	'f'
	.db #0xeb	; 235
	.db #0x0f	; 15
	.db #0x00	; 0
	.area _INITIALIZER
__xinit__float_move_timer:
	.db #0x00	; 0
__xinit__float3_move:
	.db #0x01	; 1
__xinit__float4_move:
	.db #0x00	; 0
__xinit__float3_pos_x:
	.dw #0x0068
__xinit__float3_dir:
	.dw #0x0001
__xinit__float4_pos_x:
	.dw #0xffe0
__xinit__float4_dir:
	.dw #0x0001
	.area _CABS (ABS)
