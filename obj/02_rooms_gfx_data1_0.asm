;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12533 (MINGW32)
;--------------------------------------------------------
	.module 02_rooms_gfx_data1_0
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _enemies_2_1_tiles
	.globl _room_2_1_tiles
	.globl _room_2_1_coll
	.globl _room_2_1_map
	.globl _enemies_1_1_tiles
	.globl _room_1_1_tiles
	.globl _room_1_1_coll
	.globl _room_1_1_map
	.globl _enemies_0_1_tiles
	.globl _room_0_1_tiles
	.globl _room_0_1_coll
	.globl _room_0_1_map
	.globl _dylan_gets_key
	.globl _vcoll_dylan
	.globl _hcoll_elevator
	.globl _draw_elevator
	.globl _move_elevator
	.globl _init_room2
	.globl _reset_room2
	.globl _cleaning_path
	.globl _vcoll_blockage
	.globl _hcoll_blockage
	.globl _draw_flames1_1
	.globl _init_room1_1
	.globl _reset_room1
	.globl _dizzy_drops_firefly
	.globl _hcoll_darkness
	.globl _coll_bats
	.globl _draw_bats0
	.globl _move_bats0
	.globl _draw_room0_1
	.globl _init_room0_1
	.globl _reset_room0_1
	.globl _rle_decompress_tilemap
	.globl _multiple_set_sprite_tiles
	.globl _multiple_move_sprites
	.globl _default_drop
	.globl _default_draw
	.globl _find_by_id
	.globl _pop_by_id
	.globl _push_last
	.globl _get_v_coll
	.globl _get_h_coll
	.globl _show_dialog_window
	.globl _set_sprite_data
	.globl _flame2_phase
	.globl _flame1_phase
	.globl _flame_timer
	.globl _bat2_dir
	.globl _bat2_pos_x
	.globl _bat1_dir
	.globl _bat1_pos_x
	.globl _bat_phase
	.globl _bite_timer
	.globl _dylan_negotiated
	.globl _elevator_enabled
	.globl _elevator_move
	.globl _elevator_dir
	.globl _elevator_pos_y
	.globl _path_cleaned
	.globl _intro_shown
	.globl _firefly_pos_y
	.globl _firefly_pos_x
	.globl _warning_shown
	.globl _room_dark
	.globl _elevator_offsets
	.globl _elevator_map
	.globl _flames
	.globl _ftn
	.globl _flames_offsets
	.globl _evils
	.globl _bftn
	.globl _bat_offsets
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_room_dark::
	.ds 1
_warning_shown::
	.ds 1
_firefly_pos_x::
	.ds 2
_firefly_pos_y::
	.ds 2
_intro_shown::
	.ds 1
_path_cleaned::
	.ds 1
_elevator_pos_y::
	.ds 1
_elevator_dir::
	.ds 1
_elevator_move::
	.ds 1
_elevator_enabled::
	.ds 1
_dylan_negotiated::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_bite_timer::
	.ds 1
_bat_phase::
	.ds 1
_bat1_pos_x::
	.ds 2
_bat1_dir::
	.ds 2
_bat2_pos_x::
	.ds 2
_bat2_dir::
	.ds 2
_flame_timer::
	.ds 1
_flame1_phase::
	.ds 1
_flame2_phase::
	.ds 1
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
	.area _CODE_4
;src/rooms/room_0_1.c:16: void reset_room0_1() {
;	---------------------------------
; Function reset_room0_1
; ---------------------------------
_reset_room0_1::
;src/rooms/room_0_1.c:17: room_dark = 1; warning_shown = 0;
	ld	hl, #_room_dark
	ld	(hl), #0x01
	ld	hl, #_warning_shown
	ld	(hl), #0x00
;src/rooms/room_0_1.c:18: }
	ret
_bat_offsets:
	.db #0x28	; 40
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x10	; 16
_bftn:
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0e	; 14
_evils:
	.dw (_bftn + 0)
	.dw (_bftn + 5)
;src/rooms/room_0_1.c:19: void init_room0_1() {
;	---------------------------------
; Function init_room0_1
; ---------------------------------
_init_room0_1::
;src/rooms/room_0_1.c:20: set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
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
;src/rooms/room_0_1.c:21: }
	ret
;src/rooms/room_0_1.c:22: void draw_room0_1() {
;	---------------------------------
; Function draw_room0_1
; ---------------------------------
_draw_room0_1::
;src/rooms/room_0_1.c:23: if (room_dark) {
	ld	hl, #_room_dark
	ld	a, (hl)
	or	a, a
	jp	Z,_default_draw
;src/rooms/room_0_1.c:24: rle_decompress_tilemap(rle_decompress_to_bkg, 0, 3, room_width, room_height, empty_compressed_map);
	ld	de, #_empty_compressed_map
	push	de
	ld	hl, #0x111e
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_rle_decompress_tilemap
	add	sp, #7
;src/rooms/room_0_1.c:25: } else default_draw();
	ret
;src/rooms/room_0_1.c:26: }
	ret
;src/rooms/room_0_1.c:41: void move_bats0() {
;	---------------------------------
; Function move_bats0
; ---------------------------------
_move_bats0::
;src/rooms/room_0_1.c:42: if (room_dark) return;
	ld	a, (#_room_dark)
	or	a, a
	ret	NZ
;src/rooms/room_0_1.c:43: if (bat1_dir) {
	ld	hl, #_bat1_dir + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00108$
;src/rooms/room_0_1.c:44: bat1_pos_x++; if (bat1_pos_x >= bat1_max_x) bat1_dir = 0;
	ld	hl, #_bat1_pos_x
	inc	(hl)
	jr	NZ, 00192$
	inc	hl
	inc	(hl)
00192$:
	ld	hl, #_bat1_pos_x
	ld	a, (hl+)
	sub	a, #0xc8
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
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
	jr	C, 00109$
	xor	a, a
	ld	hl, #_bat1_dir
	ld	(hl+), a
	ld	(hl), a
	jr	00109$
00108$:
;src/rooms/room_0_1.c:46: bat1_pos_x--; if (bat1_pos_x <= bat1_min_x) bat1_dir = 1;
	ld	hl, #_bat1_pos_x
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, #0x10
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00195$
	bit	7, d
	jr	NZ, 00196$
	cp	a, a
	jr	00196$
00195$:
	bit	7, d
	jr	Z, 00196$
	scf
00196$:
	jr	C, 00109$
	ld	hl, #_bat1_dir
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00109$:
;src/rooms/room_0_1.c:48: if (bat2_dir) {
	ld	hl, #_bat2_dir + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00115$
;src/rooms/room_0_1.c:49: bat2_pos_x++; if (bat2_pos_x >= bat2_max_x) bat2_dir = 0;
	ld	hl, #_bat2_pos_x
	inc	(hl)
	jr	NZ, 00197$
	inc	hl
	inc	(hl)
00197$:
	ld	hl, #_bat2_pos_x
	ld	a, (hl+)
	sub	a, #0xa8
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00198$
	bit	7, d
	jr	NZ, 00199$
	cp	a, a
	jr	00199$
00198$:
	bit	7, d
	jr	Z, 00199$
	scf
00199$:
	jr	C, 00116$
	xor	a, a
	ld	hl, #_bat2_dir
	ld	(hl+), a
	ld	(hl), a
	jr	00116$
00115$:
;src/rooms/room_0_1.c:51: bat2_pos_x--; if (bat2_pos_x <= bat2_min_x) bat2_dir = 1;
	ld	hl, #_bat2_pos_x
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, #0x20
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00200$
	bit	7, d
	jr	NZ, 00201$
	cp	a, a
	jr	00201$
00200$:
	bit	7, d
	jr	Z, 00201$
	scf
00201$:
	jr	C, 00116$
	ld	hl, #_bat2_dir
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00116$:
;src/rooms/room_0_1.c:53: if (bat_phase & 1) {
	ld	hl, #_bat_phase
	ld	e, (hl)
;src/rooms/room_0_1.c:54: firefly_pos_x += fly_delta[(*(ptr_div_reg)) & 7];
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
	ld	c, l
	ld	b, h
;src/rooms/room_0_1.c:53: if (bat_phase & 1) {
	bit	0, e
	jr	Z, 00128$
;src/rooms/room_0_1.c:54: firefly_pos_x += fly_delta[(*(ptr_div_reg)) & 7];
	ld	hl, #_fly_delta
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_firefly_pos_x
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;src/rooms/room_0_1.c:55: if (firefly_pos_x < 0) firefly_pos_x = 0; 
	bit	7, (hl)
	jr	Z, 00120$
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ret
00120$:
;src/rooms/room_0_1.c:56: else if (firefly_pos_x > (room_width * 8)) firefly_pos_x = ((room_width * 8) - 1);
	ld	hl, #_firefly_pos_x
	ld	a, #0xf0
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00203$
	bit	7, d
	jr	NZ, 00204$
	cp	a, a
	jr	00204$
00203$:
	bit	7, d
	jr	Z, 00204$
	scf
00204$:
	ret	NC
	ld	hl, #_firefly_pos_x
	ld	a, #0xef
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	ret
00128$:
;src/rooms/room_0_1.c:58: firefly_pos_y += fly_delta[(*(ptr_div_reg)) & 7];
	ld	hl, #_fly_delta
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_firefly_pos_y
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;src/rooms/room_0_1.c:59: if (firefly_pos_y < 0) firefly_pos_y = 0; 
	bit	7, (hl)
	jr	Z, 00125$
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ret
00125$:
;src/rooms/room_0_1.c:60: else if (firefly_pos_y > (room_height * 8)) firefly_pos_y = ((room_height * 8) - 1);
	ld	hl, #_firefly_pos_y
	ld	a, #0x88
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00205$
	bit	7, d
	jr	NZ, 00206$
	cp	a, a
	jr	00206$
00205$:
	bit	7, d
	jr	Z, 00206$
	scf
00206$:
	ret	NC
	ld	hl, #_firefly_pos_y
	ld	a, #0x87
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/rooms/room_0_1.c:62: }
	ret
;src/rooms/room_0_1.c:64: void draw_bats0() {
;	---------------------------------
; Function draw_bats0
; ---------------------------------
_draw_bats0::
;src/rooms/room_0_1.c:65: if (room_dark) return;
	ld	a, (#_room_dark)
	or	a, a
	ret	NZ
;src/rooms/room_0_1.c:66: if (bat_phase == 0) {
	ld	a, (#_bat_phase)
	or	a, a
	jr	NZ, 00106$
;src/rooms/room_0_1.c:67: multiple_set_sprite_tiles(evil_sprite_offset, total_room0_1_evil, evils[0]);        
	ld	hl, #_evils
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x509
	push	hl
	call	_multiple_set_sprite_tiles
	add	sp, #4
	jr	00107$
00106$:
;src/rooms/room_0_1.c:68: } else if (bat_phase == 4) {
	ld	a, (#_bat_phase)
	sub	a, #0x04
	jr	NZ, 00107$
;src/rooms/room_0_1.c:69: multiple_set_sprite_tiles(evil_sprite_offset, total_room0_1_evil, evils[1]);        
	ld	hl, #(_evils + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x509
	push	hl
	call	_multiple_set_sprite_tiles
	add	sp, #4
00107$:
;src/rooms/room_0_1.c:71: bat_phase++; bat_phase &= 7;
	ld	hl, #_bat_phase
	inc	(hl)
	ld	a, (hl)
	and	a, #0x07
	ld	(hl), a
;src/rooms/room_0_1.c:74: (unsigned char *)bat_offsets);    
	ld	bc, #_bat_offsets
;src/rooms/room_0_1.c:73: bat1_pos_x - bkg_scroll_x_target, bat1_pos_y - bkg_scroll_y_target, 
	ld	a, #0x38
	ld	hl, #_bkg_scroll_y_target
	sub	a, (hl)
	ld	d, a
	ld	a, (#_bat1_pos_x)
	ld	hl, #_bkg_scroll_x_target
	ld	e, (hl)
	sub	a, e
;src/rooms/room_0_1.c:72: multiple_move_sprites(bat1_sprite_offset, bat_sprite_count, 
	push	bc
	push	de
	inc	sp
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_multiple_move_sprites
	add	sp, #6
;src/rooms/room_0_1.c:77: (unsigned char *)bat_offsets);    
;src/rooms/room_0_1.c:76: bat2_pos_x - bkg_scroll_x_target, bat2_pos_y - bkg_scroll_y_target, 
	ld	a, #0x58
	ld	hl, #_bkg_scroll_y_target
	sub	a, (hl)
	ld	b, a
	ld	a, (#_bat2_pos_x)
	ld	hl, #_bkg_scroll_x_target
	ld	c, (hl)
	sub	a, c
;src/rooms/room_0_1.c:75: multiple_move_sprites(bat2_sprite_offset, bat_sprite_count, 
	ld	de, #_bat_offsets
	push	de
	push	bc
	inc	sp
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_multiple_move_sprites
	add	sp, #6
;src/rooms/room_0_1.c:80: (unsigned char *)fly_offsets);
;src/rooms/room_0_1.c:79: firefly_pos_x - bkg_scroll_x_target, firefly_pos_y - bkg_scroll_y_target,
	ld	a, (#_firefly_pos_y)
	ld	hl, #_bkg_scroll_y_target
	ld	c, (hl)
	sub	a, c
	ld	b, a
	ld	a, (#_firefly_pos_x)
	ld	hl, #_bkg_scroll_x_target
	ld	c, (hl)
	sub	a, c
;src/rooms/room_0_1.c:78: multiple_move_sprites(fly_sprite_offset1, fly_sprite_count, 
	ld	de, #_fly_offsets
	push	de
	push	bc
	inc	sp
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	call	_multiple_move_sprites
	add	sp, #6
;src/rooms/room_0_1.c:81: }
	ret
;src/rooms/room_0_1.c:83: void coll_bats(WORD x, WORD y) {
;	---------------------------------
; Function coll_bats
; ---------------------------------
_coll_bats::
	add	sp, #-5
;src/rooms/room_0_1.c:84: if (room_dark) return;
	ld	a, (#_room_dark)
	or	a, a
	jp	NZ,00114$
;src/rooms/room_0_1.c:85: if (!((bat1_pos_x > x + 16) || 
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;src/rooms/room_0_1.c:87: (bat1_pos_y > y + 20) ||
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	add	hl, de
	ld	c, l
	ld	b, h
;src/rooms/room_0_1.c:89: dec_energy += 3;
	ld	a, (#_dec_energy)
	add	a, #0x03
	ldhl	sp,	#2
	ld	(hl), a
;src/rooms/room_0_1.c:85: if (!((bat1_pos_x > x + 16) || 
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ld	hl, #_bat1_pos_x
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00161$
	bit	7, d
	jr	NZ, 00162$
	cp	a, a
	jr	00162$
00161$:
	bit	7, d
	jr	Z, 00162$
	scf
00162$:
	jr	C, 00109$
;src/rooms/room_0_1.c:86: (bat1_pos_x + 16 < x) ||
	ld	hl, #_bat1_pos_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#3
	ld	e, l
	ld	d, h
	ldhl	sp,	#7
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00163$
	bit	7, d
	jr	NZ, 00164$
	cp	a, a
	jr	00164$
00163$:
	bit	7, d
	jr	Z, 00164$
	scf
00164$:
	jr	C, 00109$
;src/rooms/room_0_1.c:87: (bat1_pos_y > y + 20) ||
	ld	a, c
	sub	a, #0x38
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00109$
;src/rooms/room_0_1.c:88: (bat1_pos_y + 8 < y))) {
	ldhl	sp,	#9
	ld	a, #0x40
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00165$
	bit	7, d
	jr	NZ, 00166$
	cp	a, a
	jr	00166$
00165$:
	bit	7, d
	jr	Z, 00166$
	scf
00166$:
	jr	C, 00109$
;src/rooms/room_0_1.c:89: dec_energy += 3;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_dec_energy),a
	jp	00114$
00109$:
;src/rooms/room_0_1.c:90: } else if (!((bat2_pos_x > x + 16) || 
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ld	hl, #_bat2_pos_x
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00167$
	bit	7, d
	jr	NZ, 00168$
	cp	a, a
	jr	00168$
00167$:
	bit	7, d
	jr	Z, 00168$
	scf
00168$:
	jr	C, 00114$
;src/rooms/room_0_1.c:91: (bat2_pos_x + 16 < x) ||
	ld	hl, #_bat2_pos_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#3
	ld	e, l
	ld	d, h
	ldhl	sp,	#7
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00169$
	bit	7, d
	jr	NZ, 00170$
	cp	a, a
	jr	00170$
00169$:
	bit	7, d
	jr	Z, 00170$
	scf
00170$:
	jr	C, 00114$
;src/rooms/room_0_1.c:92: (bat2_pos_y > y + 20) ||
	ld	a, c
	sub	a, #0x58
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00114$
;src/rooms/room_0_1.c:93: (bat2_pos_y + 8 < y))) {
	ldhl	sp,	#9
	ld	a, #0x60
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00171$
	bit	7, d
	jr	NZ, 00172$
	cp	a, a
	jr	00172$
00171$:
	bit	7, d
	jr	Z, 00172$
	scf
00172$:
	jr	C, 00114$
;src/rooms/room_0_1.c:94: dec_energy += 3;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_dec_energy),a
00114$:
;src/rooms/room_0_1.c:96: }
	add	sp, #5
	ret
;src/rooms/room_0_1.c:98: void hcoll_darkness(WORD x, WORD y) {
;	---------------------------------
; Function hcoll_darkness
; ---------------------------------
_hcoll_darkness::
;src/rooms/room_0_1.c:99: if (room_dark) {
	ld	a, (#_room_dark)
	or	a, a
	jr	Z, 00109$
;src/rooms/room_0_1.c:100: if (!warning_shown) {
	ld	a, (#_warning_shown)
	or	a, a
	jr	NZ, 00102$
;src/rooms/room_0_1.c:101: show_dialog_window(4, &darkness_warn);
	ld	de, #_darkness_warn
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_0_1.c:102: warning_shown = 1;
	ld	hl, #_warning_shown
	ld	(hl), #0x01
00102$:
;src/rooms/room_0_1.c:104: if (x < (MAX_DIZZY_X - 8)) {
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0xd8
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00137$
	bit	7, d
	jr	NZ, 00138$
	cp	a, a
	jr	00138$
00137$:
	bit	7, d
	jr	Z, 00138$
	scf
00138$:
	jr	NC, 00109$
;src/rooms/room_0_1.c:105: is_position_safe = 0;
	ld	hl, #_is_position_safe
	ld	(hl), #0x00
;src/rooms/room_0_1.c:106: bite_timer++; bite_timer &= 3;
	ld	hl, #_bite_timer
	inc	(hl)
	ld	a, (hl)
	and	a, #0x03
;src/rooms/room_0_1.c:107: if ((!bite_timer) && (!dec_energy)) dec_energy++;
	ld	(hl), a
	or	a, a
	jr	NZ, 00109$
	ld	hl, #_dec_energy
	ld	a, (hl)
	or	a, a
	jr	NZ, 00109$
	inc	(hl)
00109$:
;src/rooms/room_0_1.c:110: get_h_coll(x, y);
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
;src/rooms/room_0_1.c:111: }
	ret
;src/rooms/room_0_1.c:113: UBYTE dizzy_drops_firefly(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
;	---------------------------------
; Function dizzy_drops_firefly
; ---------------------------------
_dizzy_drops_firefly::
	dec	sp
	dec	sp
;src/rooms/room_0_1.c:115: if (id == ID_FIREFLY) {
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x08
	jr	NZ, 00117$
;src/rooms/room_0_1.c:116: room_dark = 0; firefly_pos_x = (25 * 8); firefly_pos_y = (9 * 8);
	ld	hl, #_room_dark
	ld	(hl), #0x00
	ld	hl, #_firefly_pos_x
	ld	a, #0xc8
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	ld	hl, #_firefly_pos_y
	ld	a, #0x48
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jp	00118$
00117$:
;src/rooms/room_0_1.c:117: } else if (id == ID_LID) {
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x07
	jp	NZ,00118$
;src/rooms/room_0_1.c:118: temp_item = find_by_id(&inventory_item_list, ID_JAR);
	ld	a, #0x06
	push	af
	inc	sp
	ld	de, #_inventory_item_list
	push	de
	call	_find_by_id
	add	sp, #3
	ld	a, e
;src/rooms/room_0_1.c:119: if (temp_item) {
	or	a, d
	jp	Z, 00118$
;src/rooms/room_0_1.c:120: UBYTE ff_tile_x = firefly_pos_x >> 3, ff_tile_y = firefly_pos_y >> 3;
	ld	hl, #_firefly_pos_x
	ld	a, (hl+)
	ld	e, a
	ld	c, (hl)
	sra	c
	rr	e
	sra	c
	rr	e
	sra	c
	rr	e
	ld	hl, #_firefly_pos_y
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#1
	ld	(hl), c
;src/rooms/room_0_1.c:121: if ((ff_tile_x >= tile_x) && (ff_tile_x <= tile_x + 2) &&
	ld	a, e
	ldhl	sp,	#4
	sub	a, (hl)
	jp	C, 00118$
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00175$
	bit	7, d
	jr	NZ, 00176$
	cp	a, a
	jr	00176$
00175$:
	bit	7, d
	jr	Z, 00176$
	scf
00176$:
	jp	C, 00118$
;src/rooms/room_0_1.c:122: (ff_tile_y >= tile_y) && (ff_tile_y <= tile_y + 1)) {
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#5
	sub	a, (hl)
	jp	C, 00118$
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ldhl	sp,	#1
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
	jr	Z, 00177$
	bit	7, d
	jr	NZ, 00178$
	cp	a, a
	jr	00178$
00177$:
	bit	7, d
	jr	Z, 00178$
	scf
00178$:
	jr	C, 00118$
;src/rooms/room_0_1.c:124: temp_item = pop_by_id(&inventory_item_list, ID_JAR);
	ld	a, #0x06
	push	af
	inc	sp
	ld	de, #_inventory_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
;src/rooms/room_0_1.c:125: if (temp_item) push_last(&item_stack, temp_item);
	ld	a, d
	or	a, e
	jr	Z, 00102$
	push	de
	ld	de, #_item_stack
	push	de
	call	_push_last
	add	sp, #4
00102$:
;src/rooms/room_0_1.c:127: temp_item = pop_by_id(&game_item_list, ID_FIREFLY);
	ld	a, #0x08
	push	af
	inc	sp
	ld	de, #_game_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
	ld	c, e
	ld	b, d
;src/rooms/room_0_1.c:128: if (!temp_item) temp_item = pop_by_id(&item_stack, ID_FIREFLY);
	ld	a, b
	or	a, c
	jr	NZ, 00104$
	ld	a, #0x08
	push	af
	inc	sp
	ld	de, #_item_stack
	push	de
	call	_pop_by_id
	add	sp, #3
	ld	c, e
	ld	b, d
00104$:
;src/rooms/room_0_1.c:129: if (temp_item) push_last(&inventory_item_list, temp_item);                
	ld	a, b
	or	a, c
	jr	Z, 00106$
	push	bc
	ld	de, #_inventory_item_list
	push	de
	call	_push_last
	add	sp, #4
00106$:
;src/rooms/room_0_1.c:131: show_dialog_window(2, &firefly_caught);
	ld	de, #_firefly_caught
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_0_1.c:133: multiple_move_sprites(evil_sprite_offset, evil_sprite_total_count, 0, 0, (unsigned char *)evil_hide);           
	ld	de, #_evil_hide
	push	de
	xor	a, a
	rrca
	push	af
	ld	hl, #0x1009
	push	hl
	call	_multiple_move_sprites
	add	sp, #6
;src/rooms/room_0_1.c:134: room_dark = 1;
	ld	hl, #_room_dark
	ld	(hl), #0x01
;src/rooms/room_0_1.c:135: return ID_ITEM_USED;
	ld	e, #0x0f
	jr	00119$
00118$:
;src/rooms/room_0_1.c:139: return default_drop(id);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_default_drop
	inc	sp
00119$:
;src/rooms/room_0_1.c:140: }
	inc	sp
	inc	sp
	ret
;src/rooms/room_1_1.c:18: void reset_room1() {
;	---------------------------------
; Function reset_room1
; ---------------------------------
_reset_room1::
;src/rooms/room_1_1.c:19: intro_shown = 0, path_cleaned = 0;
	ld	hl, #_intro_shown
	ld	(hl), #0x00
	ld	hl, #_path_cleaned
	ld	(hl), #0x00
;src/rooms/room_1_1.c:20: }
	ret
_flames_offsets:
	.db #0x28	; 40
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x10	; 16
_ftn:
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x27	; 39
	.db #0x28	; 40
_flames:
	.dw (_ftn + 0)
	.dw (_ftn + 4)
	.dw (_ftn + 8)
	.dw (_ftn + 12)
	.dw (_ftn + 16)
	.dw (_ftn + 20)
	.dw (_ftn + 24)
	.dw (_ftn + 28)
;src/rooms/room_1_1.c:21: void init_room1_1() {
;	---------------------------------
; Function init_room1_1
; ---------------------------------
_init_room1_1::
;src/rooms/room_1_1.c:22: set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
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
;src/rooms/room_1_1.c:23: }
	ret
;src/rooms/room_1_1.c:24: void draw_flames1_1() {
;	---------------------------------
; Function draw_flames1_1
; ---------------------------------
_draw_flames1_1::
;src/rooms/room_1_1.c:25: if (!flame_timer) {
	ld	a, (#_flame_timer)
	or	a, a
	jr	NZ, 00102$
;src/rooms/room_1_1.c:26: flame1_phase++; flame1_phase &= 7;
	ld	hl, #_flame1_phase
	inc	(hl)
	ld	a, (hl)
	and	a, #0x07
	ld	(hl), a
;src/rooms/room_1_1.c:27: flame2_phase++; flame2_phase &= 7;
	ld	hl, #_flame2_phase
	inc	(hl)
	ld	a, (hl)
	and	a, #0x07
	ld	(hl), a
;src/rooms/room_1_1.c:28: multiple_set_sprite_tiles(flame1_sprite_offset, flame_sprite_count, flames[flame1_phase]);
	ld	bc, #_flames+0
	ld	hl, #_flame1_phase
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	hl, #0x409
	push	hl
	call	_multiple_set_sprite_tiles
	add	sp, #4
	pop	bc
;src/rooms/room_1_1.c:29: multiple_set_sprite_tiles(flame2_sprite_offset, flame_sprite_count, flames[flame2_phase]);
	ld	hl, #_flame2_phase
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x40d
	push	hl
	call	_multiple_set_sprite_tiles
	add	sp, #4
00102$:
;src/rooms/room_1_1.c:31: flame_timer++; flame_timer &= 7;
	ld	hl, #_flame_timer
	inc	(hl)
	ld	a, (hl)
	and	a, #0x07
	ld	(hl), a
;src/rooms/room_1_1.c:34: (unsigned char *)flames_offsets);    
	ld	de, #_flames_offsets
;src/rooms/room_1_1.c:33: flame1_pos_x - bkg_scroll_x_target, flame1_pos_y - bkg_scroll_y_target, 
	ld	a, #0x28
	ld	hl, #_bkg_scroll_y_target
	sub	a, (hl)
	ld	b, a
	ld	a, #0x18
	ld	hl, #_bkg_scroll_x_target
	sub	a, (hl)
;src/rooms/room_1_1.c:32: multiple_move_sprites(flame1_sprite_offset, flame_sprite_count, 
	push	de
	push	bc
	inc	sp
	ld	h, a
	ld	l, #0x04
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_multiple_move_sprites
	add	sp, #6
;src/rooms/room_1_1.c:37: (unsigned char *)flames_offsets);
	ld	de, #_flames_offsets
;src/rooms/room_1_1.c:36: flame2_pos_x - bkg_scroll_x_target, flame2_pos_y - bkg_scroll_y_target, 
	ld	a, #0x38
	ld	hl, #_bkg_scroll_y_target
	sub	a, (hl)
	ld	b, a
	ld	a, #0x60
	ld	hl, #_bkg_scroll_x_target
	sub	a, (hl)
;src/rooms/room_1_1.c:35: multiple_move_sprites(flame2_sprite_offset, flame_sprite_count, 
	push	de
	push	bc
	inc	sp
	ld	h, a
	ld	l, #0x04
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	call	_multiple_move_sprites
	add	sp, #6
;src/rooms/room_1_1.c:38: }
	ret
;src/rooms/room_1_1.c:40: void hcoll_blockage(WORD x, WORD y) {
;	---------------------------------
; Function hcoll_blockage
; ---------------------------------
_hcoll_blockage::
;src/rooms/room_1_1.c:42: if (!intro_shown) {
	ld	a, (#_intro_shown)
	or	a, a
	jr	NZ, 00102$
;src/rooms/room_1_1.c:43: show_dialog_window(5, &intro);
	ld	de, #_intro
	push	de
	ld	a, #0x05
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_1_1.c:44: intro_shown = 1;
	ld	hl, #_intro_shown
	ld	(hl), #0x01
00102$:
;src/rooms/room_1_1.c:46: get_h_coll(x, y);
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
;src/rooms/room_1_1.c:47: }
	ret
;src/rooms/room_1_1.c:49: void vcoll_blockage(WORD x, WORD y) {
;	---------------------------------
; Function vcoll_blockage
; ---------------------------------
_vcoll_blockage::
;src/rooms/room_1_1.c:50: if ((!path_cleaned) && (delta_x >= 0)) {
	ld	a, (#_path_cleaned)
	or	a, a
	jr	NZ, 00104$
	ld	a, (#_delta_x + 1)
	bit	7, a
	jr	NZ, 00104$
;src/rooms/room_1_1.c:51: if (x >= (17 * 8)) {
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x88
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00123$
	bit	7, d
	jr	NZ, 00124$
	cp	a, a
	jr	00124$
00123$:
	bit	7, d
	jr	Z, 00124$
	scf
00124$:
	jr	C, 00104$
;src/rooms/room_1_1.c:52: tile_pos_x = x >> 3; 
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
;src/rooms/room_1_1.c:53: collision_buf[0] = 1; collision_buf[1] = 1;
	ld	hl, #_collision_buf
	ld	(hl), #0x01
	ld	hl, #(_collision_buf + 1)
	ld	(hl), #0x01
;src/rooms/room_1_1.c:54: return;
	ret
00104$:
;src/rooms/room_1_1.c:57: get_v_coll(x, y);
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
;src/rooms/room_1_1.c:58: }
	ret
;src/rooms/room_1_1.c:60: UBYTE cleaning_path(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
;	---------------------------------
; Function cleaning_path
; ---------------------------------
_cleaning_path::
;src/rooms/room_1_1.c:62: if ((!path_cleaned) && (id == ID_PICKAXE)) {
	ld	a, (#_path_cleaned)
	or	a, a
	jr	NZ, 00104$
	ldhl	sp,	#4
	ld	a, (hl)
	dec	a
	jr	NZ, 00104$
;src/rooms/room_1_1.c:63: if (tile_x >= 14) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x0e
	jr	C, 00104$
;src/rooms/room_1_1.c:64: show_dialog_window(2, &cleared_path);
	ld	de, #_cleared_path
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_1_1.c:66: pop_by_id(&game_item_list, ID_BOULDER0);
	ld	a, #0x0c
	push	af
	inc	sp
	ld	de, #_game_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
;src/rooms/room_1_1.c:67: pop_by_id(&game_item_list, ID_BOULDER1);
	ld	a, #0x0d
	push	af
	inc	sp
	ld	de, #_game_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
;src/rooms/room_1_1.c:68: pop_by_id(&game_item_list, ID_BOULDER2);
	ld	a, #0x0e
	push	af
	inc	sp
	ld	de, #_game_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
;src/rooms/room_1_1.c:69: path_cleaned = 1;
	ld	hl, #_path_cleaned
	ld	(hl), #0x01
;src/rooms/room_1_1.c:70: return ID_ITEM_NONE;
	ld	e, #0x00
	ret
00104$:
;src/rooms/room_1_1.c:73: return default_drop(id);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_default_drop
	inc	sp
;src/rooms/room_1_1.c:74: }
	ret
;src/rooms/room_2_1.c:12: void reset_room2() {
;	---------------------------------
; Function reset_room2
; ---------------------------------
_reset_room2::
;src/rooms/room_2_1.c:13: elevator_pos_y = elevator_min_y, elevator_dir = 1, elevator_move = 0, elevator_enabled = 0; dylan_negotiated = 0;
	ld	hl, #_elevator_pos_y
	ld	(hl), #0x18
	ld	hl, #_elevator_dir
	ld	(hl), #0x01
	ld	hl, #_elevator_move
	ld	(hl), #0x00
	ld	hl, #_elevator_enabled
	ld	(hl), #0x00
	ld	hl, #_dylan_negotiated
	ld	(hl), #0x00
;src/rooms/room_2_1.c:14: }
	ret
_elevator_map:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
_elevator_offsets:
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x20	; 32
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x10	; 16
	.db #0x48	; 72	'H'
	.db #0x18	; 24
	.db #0x48	; 72	'H'
	.db #0x20	; 32
;src/rooms/room_2_1.c:15: void init_room2() {
;	---------------------------------
; Function init_room2
; ---------------------------------
_init_room2::
;src/rooms/room_2_1.c:16: set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
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
;src/rooms/room_2_1.c:17: for (__temp_i = 0; __temp_i < elevator_sprite_count; __temp_i++) 
	ld	hl, #___temp_i
	ld	(hl), #0x00
00103$:
;src/rooms/room_2_1.c:18: set_sprite_tile(elevator_sprite_offset + __temp_i, evil_sprites_tileoffset + elevator_map[__temp_i]);
	ld	a, #<(_elevator_map)
	ld	hl, #___temp_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_elevator_map)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	add	a, #0x09
	ld	c, a
	ld	a, (hl)
	add	a, #0x09
;c:/gb/gbdk/include/gb/gb.h:1185: shadow_OAM[nb].tile=tile;
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;src/rooms/room_2_1.c:17: for (__temp_i = 0; __temp_i < elevator_sprite_count; __temp_i++) 
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0d
	jr	C, 00103$
;src/rooms/room_2_1.c:19: }
	ret
;src/rooms/room_2_1.c:20: void move_elevator() {
;	---------------------------------
; Function move_elevator
; ---------------------------------
_move_elevator::
;src/rooms/room_2_1.c:21: if (elevator_enabled) {
	ld	a, (#_elevator_enabled)
	or	a, a
	ret	Z
;src/rooms/room_2_1.c:22: elevator_move++; elevator_move &= 1;
	ld	hl, #_elevator_move
	inc	(hl)
	ld	a, (hl)
	and	a, #0x01
;src/rooms/room_2_1.c:23: if (!elevator_move) {
	ld	(hl), a
	or	a, a
	ret	NZ
;src/rooms/room_2_1.c:24: if (elevator_dir) {
	ld	a, (#_elevator_dir)
	or	a, a
	jr	Z, 00106$
;src/rooms/room_2_1.c:25: elevator_pos_y++; if (elevator_pos_y >= elevator_max_y) elevator_dir = 0;
	ld	hl, #_elevator_pos_y
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x48
	ret	C
	ld	hl, #_elevator_dir
	ld	(hl), #0x00
	ret
00106$:
;src/rooms/room_2_1.c:27: elevator_pos_y--; if (elevator_pos_y <= elevator_min_y) elevator_dir = 1;
	ld	hl, #_elevator_pos_y
	dec	(hl)
	ld	a, #0x18
	sub	a, (hl)
	ret	C
	ld	hl, #_elevator_dir
	ld	(hl), #0x01
;src/rooms/room_2_1.c:31: }
	ret
;src/rooms/room_2_1.c:32: void draw_elevator() {
;	---------------------------------
; Function draw_elevator
; ---------------------------------
_draw_elevator::
;src/rooms/room_2_1.c:33: if (!elevator_move) {
	ld	a, (#_elevator_move)
	or	a, a
	ret	NZ
;src/rooms/room_2_1.c:36: (unsigned char *)elevator_offsets);
;src/rooms/room_2_1.c:35: elevator_pos_x - bkg_scroll_x_target, elevator_pos_y - bkg_scroll_y_target, 
	ld	a, (#_elevator_pos_y)
	ld	hl, #_bkg_scroll_y_target
	sub	a, (hl)
	ld	b, a
	ld	a, #0x78
	ld	hl, #_bkg_scroll_x_target
	sub	a, (hl)
;src/rooms/room_2_1.c:34: multiple_move_sprites(elevator_sprite_offset, elevator_sprite_count, 
	ld	de, #_elevator_offsets
	push	de
	push	bc
	inc	sp
	ld	h, a
	ld	l, #0x0d
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_multiple_move_sprites
	add	sp, #6
;src/rooms/room_2_1.c:38: }
	ret
;src/rooms/room_2_1.c:39: void hcoll_elevator(WORD x, WORD y) {
;	---------------------------------
; Function hcoll_elevator
; ---------------------------------
_hcoll_elevator::
	dec	sp
	dec	sp
;src/rooms/room_2_1.c:40: if ((elevator_enabled) && (delta_y >= 0)) {
	ld	a, (#_elevator_enabled)
	or	a, a
	jp	Z, 00113$
	ld	a, (#_delta_y + 1)
	bit	7, a
	jp	NZ, 00113$
;src/rooms/room_2_1.c:41: if ((x >= elevator_pos_x - 8) && (x <= elevator_pos_x + (3 * 8))) {
	ldhl	sp,	#4
	ld	a, (hl+)
	sub	a, #0x70
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
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
	jp	C, 00113$
	ldhl	sp,	#4
	ld	a, #0x90
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00159$
	bit	7, d
	jr	NZ, 00160$
	cp	a, a
	jr	00160$
00159$:
	bit	7, d
	jr	Z, 00160$
	scf
00160$:
	jp	C, 00113$
;src/rooms/room_2_1.c:42: if ((y >= elevator_pos_y + ((4 * 8) - 1)) && (y <= elevator_pos_y + ((4 * 8) + 7))) {
	ld	hl, #_elevator_pos_y
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x001f
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00161$
	bit	7, d
	jr	NZ, 00162$
	cp	a, a
	jr	00162$
00161$:
	bit	7, d
	jr	Z, 00162$
	scf
00162$:
	jp	C, 00113$
	ld	hl, #0x0027
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00163$
	bit	7, d
	jr	NZ, 00164$
	cp	a, a
	jr	00164$
00163$:
	bit	7, d
	jr	Z, 00164$
	scf
00164$:
	jr	C, 00113$
;src/rooms/room_2_1.c:43: tile_pos_x = x >> 3; tile_pos_ox = x & 7;
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
	ld	hl, #_tile_pos_x
	ld	(hl), c
	ldhl	sp,	#4
	ld	a, (hl)
	and	a, #0x07
	ld	(#_tile_pos_ox),a
;src/rooms/room_2_1.c:44: tile_pos_y = y >> 3; tile_pos_oy = (y - elevator_pos_y) & 7;
	ldhl	sp,#6
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
	ldhl	sp,	#6
	ld	a, (hl)
	ld	hl, #_elevator_pos_y
	ld	c, (hl)
	sub	a, c
	and	a, #0x07
	ld	(#_tile_pos_oy),a
;src/rooms/room_2_1.c:45: collision_buf[0] = 1; collision_buf[1] = 1; collision_buf[2] = 0;
	ld	hl, #_collision_buf
	ld	(hl), #0x01
	ld	hl, #(_collision_buf + 1)
	ld	(hl), #0x01
	ld	hl, #(_collision_buf + 2)
	ld	(hl), #0x00
;src/rooms/room_2_1.c:46: if (!elevator_move) {
	ld	a, (#_elevator_move)
	or	a, a
	jr	NZ, 00105$
;src/rooms/room_2_1.c:47: if (!elevator_dir) delta_y = -1; else delta_y = 0;
	ld	a, (#_elevator_dir)
	or	a, a
	jr	NZ, 00102$
	ld	hl, #_delta_y
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	jr	00105$
00102$:
	xor	a, a
	ld	hl, #_delta_y
	ld	(hl+), a
	ld	(hl), a
00105$:
;src/rooms/room_2_1.c:49: is_position_safe = 0;
	ld	hl, #_is_position_safe
	ld	(hl), #0x00
;src/rooms/room_2_1.c:50: return;
	jr	00115$
00113$:
;src/rooms/room_2_1.c:54: get_h_coll(x, y);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_h_coll
	add	sp, #4
00115$:
;src/rooms/room_2_1.c:55: }
	inc	sp
	inc	sp
	ret
;src/rooms/room_2_1.c:57: void vcoll_dylan(WORD x, WORD y) {
;	---------------------------------
; Function vcoll_dylan
; ---------------------------------
_vcoll_dylan::
;src/rooms/room_2_1.c:58: if (!dylan_negotiated) {
	ld	a, (#_dylan_negotiated)
	or	a, a
	jr	NZ, 00106$
;src/rooms/room_2_1.c:59: if ((x > (21 * 8)) && (x < (24 * 8)) && (y > (10 * 8))) {
	ldhl	sp,	#2
	ld	a, #0xa8
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
	ld	a, (hl+)
	sub	a, #0xc0
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
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
	ldhl	sp,	#4
	ld	a, #0x50
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
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
;src/rooms/room_2_1.c:60: show_dialog_window(6, &dylan_dialog);
	ld	de, #_dylan_dialog
	push	de
	ld	a, #0x06
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_2_1.c:61: dylan_negotiated = 1;
	ld	hl, #_dylan_negotiated
	ld	(hl), #0x01
00106$:
;src/rooms/room_2_1.c:64: get_v_coll(x, y);
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
;src/rooms/room_2_1.c:65: }
	ret
;src/rooms/room_2_1.c:67: UBYTE dylan_gets_key(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
;	---------------------------------
; Function dylan_gets_key
; ---------------------------------
_dylan_gets_key::
;src/rooms/room_2_1.c:68: if ((!elevator_enabled) && (id == ID_KEY)) {
	ld	a, (#_elevator_enabled)
	or	a, a
	jr	NZ, 00106$
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00106$
;src/rooms/room_2_1.c:69: if ((tile_y == 12) && (tile_x > 19) && (tile_x < 24)) {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x0c
	jr	NZ, 00106$
	ld	a, #0x13
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00106$
	ld	a, (hl)
	sub	a, #0x18
	jr	NC, 00106$
;src/rooms/room_2_1.c:70: show_dialog_window(4, &dylan_thanks);
	ld	de, #_dylan_thanks
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/rooms/room_2_1.c:71: elevator_enabled = 1;
	ld	hl, #_elevator_enabled
	ld	(hl), #0x01
;src/rooms/room_2_1.c:72: dylan_negotiated = 1;
	ld	hl, #_dylan_negotiated
	ld	(hl), #0x01
;src/rooms/room_2_1.c:73: return ID_ITEM_USED;
	ld	e, #0x0f
	ret
00106$:
;src/rooms/room_2_1.c:76: return default_drop(id);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_default_drop
	inc	sp
;src/rooms/room_2_1.c:77: }
	ret
	.area _CODE_4
_room_0_1_map:
	.dw #0x0151
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x22	; 34
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x23	; 35
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x24	; 36
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x24	; 36
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x2d	; 45
	.db #0x13	; 19
	.db #0x2e	; 46
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x2e	; 46
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x38	; 56	'8'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x44	; 68	'D'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x07	; 7
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x49	; 73	'I'
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x44	; 68	'D'
	.db #0x4a	; 74	'J'
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x4a	; 74	'J'
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x59	; 89	'Y'
	.db #0x05	; 5
	.db #0x5a	; 90	'Z'
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x15	; 21
	.db #0x11	; 17
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x5b	; 91
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x3d	; 61
	.db #0x5c	; 92
	.db #0x3f	; 63
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x5d	; 93
	.db #0x13	; 19
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x62	; 98	'b'
	.db #0x06	; 6
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x29	; 41
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x17	; 23
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x5b	; 91
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x59	; 89	'Y'
	.db #0x05	; 5
	.db #0x5a	; 90	'Z'
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x07	; 7
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x59	; 89	'Y'
	.db #0x05	; 5
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x07	; 7
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x6c	; 108	'l'
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x07	; 7
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x22	; 34
	.db #0x5f	; 95
	.db #0x71	; 113	'q'
_room_0_1_coll:
	.dw #0x0070
	.db #0xd7	; 215
	.db #0x01	; 1
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0xda	; 218
	.db #0x01	; 1
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x01	; 1
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x01	; 1
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0x01	; 1
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0x01	; 1
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x06	; 6
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x01	; 1
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xcd	; 205
	.db #0x00	; 0
	.db #0xc5	; 197
	.db #0x01	; 1
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xdd	; 221
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xdd	; 221
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xce	; 206
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x06	; 6
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc5	; 197
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc9	; 201
	.db #0x01	; 1
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xcb	; 203
	.db #0x01	; 1
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x02	; 2
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xcd	; 205
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc4	; 196
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xcf	; 207
	.db #0x01	; 1
	.db #0xc2	; 194
	.db #0x02	; 2
	.db #0xf3	; 243
	.db #0x01	; 1
_room_0_1_tiles:
	.db #0x72	; 114	'r'
	.db #0x00	; 0
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
	.db #0xd5	; 213
	.db #0xf8	; 248
	.db #0xd4	; 212
	.db #0xa0	; 160
	.db #0x94	; 148
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x84	; 132
	.db #0x05	; 5
	.db #0x0b	; 11
	.db #0x17	; 23
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x3b	; 59
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x6e	; 110	'n'
	.db #0x97	; 151
	.db #0x8b	; 139
	.db #0x95	; 149
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
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
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xd0	; 208
	.db #0xa8	; 168
	.db #0x44	; 68	'D'
	.db #0xaa	; 170
	.db #0x12	; 18
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
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xab	; 171
	.db #0xd5	; 213
	.db #0xbb	; 187
	.db #0x51	; 81	'Q'
	.db #0x66	; 102	'f'
	.db #0x35	; 53	'5'
	.db #0x03	; 3
	.db #0xbe	; 190
	.db #0x74	; 116	't'
	.db #0xe9	; 233
	.db #0xdc	; 220
	.db #0xaa	; 170
	.db #0xd4	; 212
	.db #0x82	; 130
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x29	; 41
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0xa2	; 162
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x3a	; 58
	.db #0x77	; 119	'w'
	.db #0x7a	; 122	'z'
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xd6	; 214
	.db #0xa1	; 161
	.db #0x55	; 85	'U'
	.db #0x81	; 129
	.db #0x51	; 81	'Q'
	.db #0x82	; 130
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
	.db #0x42	; 66	'B'
	.db #0x92	; 146
	.db #0x06	; 6
	.db #0x42	; 66	'B'
	.db #0x22	; 34
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x6c	; 108	'l'
	.db #0x52	; 82	'R'
	.db #0x22	; 34
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
	.db #0x03	; 3
	.db #0x1a	; 26
	.db #0x14	; 20
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x89	; 137
	.db #0x40	; 64
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x20	; 32
	.db #0xc1	; 193
	.db #0x3e	; 62
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x84	; 132
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x00	; 0
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
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x50	; 80	'P'
	.db #0xe8	; 232
	.db #0x58	; 88	'X'
	.db #0xa4	; 164
	.db #0x04	; 4
	.db #0xa2	; 162
	.db #0x03	; 3
	.db #0x55	; 85	'U'
	.db #0x22	; 34
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x01	; 1
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
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x1e	; 30
	.db #0x7c	; 124
	.db #0x6e	; 110	'n'
	.db #0xca	; 202
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x8f	; 143
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
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x75	; 117	'u'
	.db #0x7b	; 123
	.db #0xd5	; 213
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x58	; 88	'X'
	.db #0xa8	; 168
	.db #0x54	; 84	'T'
	.db #0x8c	; 140
	.db #0x03	; 3
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xf7	; 247
	.db #0xea	; 234
	.db #0x7f	; 127
	.db #0x7a	; 122	'z'
	.db #0x7d	; 125
	.db #0x79	; 121	'y'
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x1e	; 30
	.db #0x3f	; 63
	.db #0x7a	; 122	'z'
	.db #0xf7	; 247
	.db #0x7a	; 122	'z'
	.db #0x03	; 3
	.db #0xc7	; 199
	.db #0x74	; 116	't'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x03	; 3
	.db #0xa5	; 165
	.db #0x87	; 135
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x3e	; 62
	.db #0x75	; 117	'u'
	.db #0x7f	; 127
	.db #0x75	; 117	'u'
	.db #0xae	; 174
	.db #0xf4	; 244
	.db #0xaa	; 170
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
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x6e	; 110	'n'
	.db #0x97	; 151
	.db #0x8b	; 139
	.db #0x95	; 149
	.db #0x42	; 66	'B'
	.db #0x3e	; 62
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
	.db #0x2d	; 45
	.db #0x19	; 25
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x1a	; 26
	.db #0x15	; 21
	.db #0x22	; 34
	.db #0xaf	; 175
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xf1	; 241
	.db #0xaa	; 170
	.db #0x5b	; 91
	.db #0xcb	; 203
	.db #0x94	; 148
	.db #0x2b	; 43
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0x5c	; 92
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xdd	; 221
	.db #0xaa	; 170
	.db #0xd0	; 208
	.db #0x4a	; 74	'J'
	.db #0x21	; 33
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xc8	; 200
	.db #0x94	; 148
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x6e	; 110	'n'
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x26	; 38
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x4c	; 76	'L'
	.db #0x28	; 40
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xbe	; 190
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xf5	; 245
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x28	; 40
	.db #0x90	; 144
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x7c	; 124
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdd	; 221
	.db #0x69	; 105	'i'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x03	; 3
	.db #0xde	; 222
	.db #0xfa	; 250
	.db #0xdf	; 223
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x29	; 41
	.db #0xb1	; 177
	.db #0xd0	; 208
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0xf9	; 249
	.db #0xd5	; 213
	.db #0xba	; 186
	.db #0xd4	; 212
	.db #0x4c	; 76	'L'
	.db #0x98	; 152
	.db #0x8e	; 142
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x61	; 97	'a'
	.db #0xc1	; 193
	.db #0x83	; 131
	.db #0x82	; 130
	.db #0x05	; 5
	.db #0x85	; 133
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0xc8	; 200
	.db #0x88	; 136
	.db #0x84	; 132
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x42	; 66	'B'
	.db #0x21	; 33
	.db #0x13	; 19
	.db #0x13	; 19
	.db #0x82	; 130
	.db #0x42	; 66	'B'
	.db #0x73	; 115	's'
	.db #0x54	; 84	'T'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x90	; 144
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x8a	; 138
	.db #0x89	; 137
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x28	; 40
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
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
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
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
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x36	; 54	'6'
	.db #0x4a	; 74	'J'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xc8	; 200
	.db #0x94	; 148
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x3e	; 62
	.db #0xdf	; 223
	.db #0x3a	; 58
	.db #0x77	; 119	'w'
	.db #0x7a	; 122	'z'
	.db #0x03	; 3
	.db #0x55	; 85	'U'
	.db #0xe2	; 226
	.db #0xb4	; 180
	.db #0xd9	; 217
	.db #0xac	; 172
	.db #0x45	; 69	'E'
	.db #0xaa	; 170
	.db #0x12	; 18
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
	.db #0x09	; 9
	.db #0x32	; 50	'2'
	.db #0xc2	; 194
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0xfb	; 251
	.db #0xd5	; 213
	.db #0xfa	; 250
	.db #0x57	; 87	'W'
	.db #0xea	; 234
	.db #0xd4	; 212
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x25	; 37
	.db #0x22	; 34
	.db #0x03	; 3
	.db #0x75	; 117	'u'
	.db #0x6b	; 107	'k'
	.db #0x5d	; 93
	.db #0x2a	; 42
	.db #0x34	; 52	'4'
	.db #0x9a	; 154
	.db #0xc8	; 200
	.db #0xc7	; 199
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x33	; 51	'3'
	.db #0x98	; 152
	.db #0xcd	; 205
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x6e	; 110	'n'
	.db #0xc3	; 195
	.db #0xd0	; 208
	.db #0xae	; 174
	.db #0x99	; 153
	.db #0x9b	; 155
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xd8	; 216
	.db #0x8c	; 140
	.db #0x8e	; 142
	.db #0xde	; 222
	.db #0xfa	; 250
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x25	; 37
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x58	; 88	'X'
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x81	; 129
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7d	; 125
	.db #0x7b	; 123
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3a	; 58
	.db #0x7f	; 127
	.db #0xea	; 234
	.db #0xfd	; 253
	.db #0xda	; 218
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x58	; 88	'X'
	.db #0xe6	; 230
	.db #0x51	; 81	'Q'
	.db #0x81	; 129
	.db #0xd1	; 209
	.db #0x03	; 3
	.db #0x1a	; 26
	.db #0x14	; 20
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x03	; 3
	.db #0x7e	; 126
	.db #0x55	; 85	'U'
	.db #0x3e	; 62
	.db #0x34	; 52	'4'
	.db #0x1a	; 26
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xa1	; 161
	.db #0x52	; 82	'R'
	.db #0x04	; 4
	.db #0x88	; 136
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x37	; 55	'7'
	.db #0x4b	; 75	'K'
	.db #0x45	; 69	'E'
	.db #0x4a	; 74	'J'
	.db #0x21	; 33
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7d	; 125
	.db #0x7b	; 123
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_enemies_0_1_tiles:
	.db #0x06	; 6
	.db #0x19	; 25
	.db #0x19	; 25
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x42	; 66	'B'
	.db #0x7f	; 127
	.db #0x75	; 117	'u'
	.db #0x7d	; 125
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0xd2	; 210
	.db #0xde	; 222
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x57	; 87	'W'
	.db #0xdf	; 223
	.db #0x49	; 73	'I'
	.db #0xc9	; 201
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x29	; 41
	.db #0x39	; 57	'9'
	.db #0x4c	; 76	'L'
	.db #0x7c	; 124
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x3c	; 60
	.db #0xfc	; 252
	.db #0x52	; 82	'R'
	.db #0xde	; 222
	.db #0x4a	; 74	'J'
	.db #0xce	; 206
	.db #0x99	; 153
	.db #0x9f	; 159
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
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
_room_1_1_map:
	.dw #0x0134
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0xcd	; 205
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x17	; 23
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2c	; 44
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x25	; 37
	.db #0x33	; 51	'3'
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0xc2	; 194
	.db #0x34	; 52	'4'
	.db #0x2b	; 43
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x37	; 55	'7'
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x35	; 53	'5'
	.db #0x38	; 56	'8'
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x15	; 21
	.db #0x3b	; 59
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x41	; 65	'A'
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0xd7	; 215
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0xd2	; 210
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x17	; 23
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x2b	; 43
	.db #0x2d	; 45
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x2d	; 45
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0xc2	; 194
	.db #0x35	; 53	'5'
	.db #0xc3	; 195
	.db #0x36	; 54	'6'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x1d	; 29
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x35	; 53	'5'
	.db #0xc3	; 195
	.db #0x36	; 54	'6'
	.db #0x35	; 53	'5'
	.db #0xc2	; 194
	.db #0x36	; 54	'6'
	.db #0x35	; 53	'5'
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6d	; 109	'm'
	.db #0x36	; 54	'6'
	.db #0x35	; 53	'5'
	.db #0x6e	; 110	'n'
_room_1_1_coll:
	.dw #0x005f
	.db #0xce	; 206
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xce	; 206
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xce	; 206
	.db #0x01	; 1
	.db #0xd5	; 213
	.db #0x00	; 0
	.db #0xca	; 202
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x06	; 6
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x06	; 6
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0xc8	; 200
	.db #0x01	; 1
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0xc8	; 200
	.db #0x01	; 1
	.db #0xd3	; 211
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x06	; 6
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xe9	; 233
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc8	; 200
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0xc5	; 197
	.db #0x01	; 1
	.db #0xc6	; 198
	.db #0x07	; 7
	.db #0xca	; 202
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0xc5	; 197
	.db #0x01	; 1
	.db #0xc6	; 198
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x01	; 1
_room_1_1_tiles:
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xd0	; 208
	.db #0xa8	; 168
	.db #0x44	; 68	'D'
	.db #0xaa	; 170
	.db #0x12	; 18
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
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x13	; 19
	.db #0x29	; 41
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0xbb	; 187
	.db #0x55	; 85	'U'
	.db #0x0b	; 11
	.db #0x52	; 82	'R'
	.db #0x84	; 132
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
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
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xab	; 171
	.db #0xd5	; 213
	.db #0xbb	; 187
	.db #0x51	; 81	'Q'
	.db #0x66	; 102	'f'
	.db #0x35	; 53	'5'
	.db #0x03	; 3
	.db #0xbe	; 190
	.db #0x74	; 116	't'
	.db #0xe9	; 233
	.db #0xdc	; 220
	.db #0xaa	; 170
	.db #0xd4	; 212
	.db #0x82	; 130
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x29	; 41
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0xa2	; 162
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x3e	; 62
	.db #0x75	; 117	'u'
	.db #0x7f	; 127
	.db #0x75	; 117	'u'
	.db #0xae	; 174
	.db #0xf4	; 244
	.db #0xaa	; 170
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
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x3a	; 58
	.db #0x77	; 119	'w'
	.db #0x7a	; 122	'z'
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xd6	; 214
	.db #0xa1	; 161
	.db #0x55	; 85	'U'
	.db #0x81	; 129
	.db #0x51	; 81	'Q'
	.db #0x82	; 130
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
	.db #0x03	; 3
	.db #0x1a	; 26
	.db #0x14	; 20
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x89	; 137
	.db #0x40	; 64
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x20	; 32
	.db #0xc1	; 193
	.db #0x3e	; 62
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xdd	; 221
	.db #0xaa	; 170
	.db #0xd0	; 208
	.db #0x4a	; 74	'J'
	.db #0x21	; 33
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xc8	; 200
	.db #0x94	; 148
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0xd5	; 213
	.db #0xf8	; 248
	.db #0xd4	; 212
	.db #0xa0	; 160
	.db #0x94	; 148
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x84	; 132
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x03	; 3
	.db #0xaa	; 170
	.db #0xf6	; 246
	.db #0x94	; 148
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x6f	; 111	'o'
	.db #0x69	; 105	'i'
	.db #0xe1	; 225
	.db #0x61	; 97	'a'
	.db #0x61	; 97	'a'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x5b	; 91
	.db #0x5f	; 95
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x3b	; 59
	.db #0x7d	; 125
	.db #0x6a	; 106	'j'
	.db #0x30	; 48	'0'
	.db #0x1a	; 26
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x75	; 117	'u'
	.db #0xba	; 186
	.db #0x54	; 84	'T'
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0x12	; 18
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x56	; 86	'V'
	.db #0x3b	; 59
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0x50	; 80	'P'
	.db #0xd2	; 210
	.db #0xa4	; 164
	.db #0x94	; 148
	.db #0x49	; 73	'I'
	.db #0x95	; 149
	.db #0xb6	; 182
	.db #0xeb	; 235
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x52	; 82	'R'
	.db #0x24	; 36
	.db #0x65	; 101	'e'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0xa1	; 161
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x2b	; 43
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x10	; 16
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
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0x7b	; 123
	.db #0x52	; 82	'R'
	.db #0x8c	; 140
	.db #0xd6	; 214
	.db #0x54	; 84	'T'
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0xc1	; 193
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3a	; 58
	.db #0x7f	; 127
	.db #0xea	; 234
	.db #0xfd	; 253
	.db #0xda	; 218
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x58	; 88	'X'
	.db #0xe6	; 230
	.db #0x51	; 81	'Q'
	.db #0x81	; 129
	.db #0xd1	; 209
	.db #0x03	; 3
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x13	; 19
	.db #0x67	; 103	'g'
	.db #0x8d	; 141
	.db #0x12	; 18
	.db #0x11	; 17
	.db #0x03	; 3
	.db #0x7e	; 126
	.db #0x55	; 85	'U'
	.db #0x3e	; 62
	.db #0x34	; 52	'4'
	.db #0x9a	; 154
	.db #0xcc	; 204
	.db #0xe6	; 230
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0xa1	; 161
	.db #0x52	; 82	'R'
	.db #0x04	; 4
	.db #0x88	; 136
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x12	; 18
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x35	; 53	'5'
	.db #0x4f	; 79	'O'
	.db #0x95	; 149
	.db #0xcb	; 203
	.db #0x95	; 149
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0x57	; 87	'W'
	.db #0xbf	; 191
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x88	; 136
	.db #0xad	; 173
	.db #0x8e	; 142
	.db #0x84	; 132
	.db #0x8a	; 138
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0xba	; 186
	.db #0x5f	; 95
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x8e	; 142
	.db #0x54	; 84	'T'
	.db #0x23	; 35
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x7c	; 124
	.db #0xae	; 174
	.db #0xfe	; 254
	.db #0xae	; 174
	.db #0x75	; 117	'u'
	.db #0x2f	; 47
	.db #0x55	; 85	'U'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x2e	; 46
	.db #0x1e	; 30
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x89	; 137
	.db #0x9a	; 154
	.db #0xd6	; 214
	.db #0x65	; 101	'e'
	.db #0x75	; 117	'u'
	.db #0xb7	; 183
	.db #0xdf	; 223
	.db #0x6b	; 107	'k'
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x90	; 144
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
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
	.db #0x02	; 2
	.db #0x7a	; 122	'z'
	.db #0x1d	; 29
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0xb8	; 184
	.db #0x56	; 86	'V'
	.db #0x89	; 137
	.db #0x41	; 65	'A'
	.db #0x02	; 2
	.db #0xd0	; 208
	.db #0xd0	; 208
	.db #0x54	; 84	'T'
	.db #0x34	; 52	'4'
	.db #0x0f	; 15
	.db #0xb1	; 177
	.db #0x5a	; 90	'Z'
	.db #0xad	; 173
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x44	; 68	'D'
	.db #0x55	; 85	'U'
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x5d	; 93
	.db #0xed	; 237
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x52	; 82	'R'
	.db #0x4a	; 74	'J'
	.db #0xca	; 202
	.db #0x45	; 69	'E'
	.db #0x55	; 85	'U'
	.db #0xcb	; 203
	.db #0x75	; 117	'u'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x75	; 117	'u'
	.db #0x7b	; 123
	.db #0xd5	; 213
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x58	; 88	'X'
	.db #0xa8	; 168
	.db #0x54	; 84	'T'
	.db #0x8c	; 140
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
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x50	; 80	'P'
	.db #0xe8	; 232
	.db #0x58	; 88	'X'
	.db #0xa4	; 164
	.db #0x04	; 4
	.db #0xa2	; 162
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x21	; 33
	.db #0x47	; 71	'G'
	.db #0x8f	; 143
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xac	; 172
	.db #0x42	; 66	'B'
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xeb	; 235
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x75	; 117	'u'
	.db #0x6b	; 107	'k'
	.db #0x5d	; 93
	.db #0x2a	; 42
	.db #0x34	; 52	'4'
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x87	; 135
	.db #0x03	; 3
	.db #0xc2	; 194
	.db #0xa2	; 162
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x75	; 117	'u'
	.db #0xee	; 238
	.db #0xf5	; 245
	.db #0xaa	; 170
	.db #0xf1	; 241
	.db #0xa8	; 168
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0xaa	; 170
	.db #0x02	; 2
	.db #0xa2	; 162
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1d	; 29
	.db #0x1f	; 31
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xd7	; 215
	.db #0xbe	; 190
	.db #0x55	; 85	'U'
	.db #0xea	; 234
	.db #0x5c	; 92
	.db #0x03	; 3
	.db #0xaa	; 170
	.db #0x74	; 116	't'
	.db #0xaa	; 170
	.db #0x44	; 68	'D'
	.db #0xad	; 173
	.db #0x5c	; 92
	.db #0x88	; 136
	.db #0x54	; 84	'T'
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x43	; 67	'C'
	.db #0x47	; 71	'G'
	.db #0x4f	; 79	'O'
	.db #0x4d	; 77	'M'
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xeb	; 235
	.db #0x75	; 117	'u'
	.db #0xa8	; 168
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x1a	; 26
	.db #0x14	; 20
	.db #0x0b	; 11
	.db #0x85	; 133
	.db #0x62	; 98	'b'
	.db #0x91	; 145
	.db #0x10	; 16
	.db #0x00	; 0
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
	.db #0xea	; 234
	.db #0xb7	; 183
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0xf9	; 249
	.db #0xd5	; 213
	.db #0xba	; 186
	.db #0xd4	; 212
	.db #0x4c	; 76	'L'
	.db #0x08	; 8
	.db #0x00	; 0
_enemies_1_1_tiles:
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x09	; 9
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
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
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
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
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
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x0d	; 13
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x18	; 24
	.db #0x1b	; 27
	.db #0x15	; 21
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x40	; 64
	.db #0x48	; 72	'H'
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xd0	; 208
	.db #0xd0	; 208
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x0d	; 13
	.db #0x25	; 37
	.db #0x2d	; 45
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x1d	; 29
	.db #0x1f	; 31
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0xd0	; 208
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x28	; 40
	.db #0xb8	; 184
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0x50	; 80	'P'
	.db #0xd0	; 208
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x0e	; 14
	.db #0x2a	; 42
	.db #0x2f	; 47
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x1d	; 29
	.db #0x1f	; 31
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xa0	; 160
	.db #0x80	; 128
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x2e	; 46
	.db #0x2e	; 46
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x19	; 25
	.db #0x1d	; 29
	.db #0x32	; 50	'2'
	.db #0x36	; 54	'6'
	.db #0x2f	; 47
	.db #0x3f	; 63
	.db #0x0a	; 10
	.db #0x1a	; 26
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x50	; 80	'P'
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x2a	; 42
	.db #0x2e	; 46
	.db #0x0a	; 10
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x05	; 5
	.db #0x17	; 23
	.db #0x10	; 16
	.db #0x12	; 18
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0xd0	; 208
	.db #0xd0	; 208
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x11	; 17
	.db #0x15	; 21
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x13	; 19
	.db #0x17	; 23
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xd0	; 208
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xb0	; 176
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x1a	; 26
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x90	; 144
	.db #0xd0	; 208
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x0a	; 10
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x28	; 40
	.db #0xa8	; 168
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x20	; 32
_room_2_1_map:
	.dw #0x01b6
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x0d	; 13
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x09	; 9
	.db #0x12	; 18
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x09	; 9
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x02	; 2
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x33	; 51	'3'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0xc2	; 194
	.db #0x0d	; 13
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x09	; 9
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0xc4	; 196
	.db #0x0d	; 13
	.db #0x37	; 55	'7'
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x09	; 9
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0xc2	; 194
	.db #0x0d	; 13
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x39	; 57	'9'
	.db #0x41	; 65	'A'
	.db #0x2a	; 42
	.db #0x09	; 9
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x09	; 9
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x0d	; 13
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x1e	; 30
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x39	; 57	'9'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x53	; 83	'S'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x3f	; 63
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x09	; 9
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x58	; 88	'X'
	.db #0x16	; 22
	.db #0x33	; 51	'3'
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x1b	; 27
	.db #0x59	; 89	'Y'
	.db #0x4a	; 74	'J'
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x02	; 2
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x09	; 9
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x5d	; 93
	.db #0x22	; 34
	.db #0x17	; 23
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x09	; 9
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x09	; 9
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x0e	; 14
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x52	; 82	'R'
	.db #0x66	; 102	'f'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x09	; 9
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x69	; 105	'i'
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x09	; 9
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x70	; 112	'p'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x76	; 118	'v'
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x79	; 121	'y'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x79	; 121	'y'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x76	; 118	'v'
_room_2_1_coll:
	.dw #0x002b
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfa	; 250
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xda	; 218
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x01	; 1
	.db #0xc8	; 200
	.db #0x00	; 0
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
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xdb	; 219
	.db #0x01	; 1
_room_2_1_tiles:
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x19	; 25
	.db #0x0e	; 14
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
	.db #0x04	; 4
	.db #0x50	; 80	'P'
	.db #0x55	; 85	'U'
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x50	; 80	'P'
	.db #0x56	; 86	'V'
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x43	; 67	'C'
	.db #0x50	; 80	'P'
	.db #0x56	; 86	'V'
	.db #0x40	; 64
	.db #0x44	; 68	'D'
	.db #0x02	; 2
	.db #0x12	; 18
	.db #0x21	; 33
	.db #0x5d	; 93
	.db #0xe8	; 232
	.db #0x44	; 68	'D'
	.db #0x32	; 50	'2'
	.db #0x6c	; 108	'l'
	.db #0x54	; 84	'T'
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
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
	.db #0xc2	; 194
	.db #0xaa	; 170
	.db #0x42	; 66	'B'
	.db #0x2a	; 42
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x01	; 1
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
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0xa4	; 164
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x13	; 19
	.db #0x85	; 133
	.db #0x12	; 18
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x03	; 3
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x4a	; 74	'J'
	.db #0x59	; 89	'Y'
	.db #0xa2	; 162
	.db #0x66	; 102	'f'
	.db #0xcd	; 205
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x23	; 35
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x1a	; 26
	.db #0x74	; 116	't'
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x72	; 114	'r'
	.db #0xa6	; 166
	.db #0x4d	; 77	'M'
	.db #0x8b	; 139
	.db #0xe6	; 230
	.db #0x49	; 73	'I'
	.db #0x30	; 48	'0'
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0xc8	; 200
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0xc1	; 193
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
	.db #0x81	; 129
	.db #0x17	; 23
	.db #0x82	; 130
	.db #0x15	; 21
	.db #0x03	; 3
	.db #0x2e	; 46
	.db #0x35	; 53	'5'
	.db #0x68	; 104	'h'
	.db #0xd0	; 208
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xb8	; 184
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x45	; 69	'E'
	.db #0x83	; 131
	.db #0x2e	; 46
	.db #0x60	; 96
	.db #0xc9	; 201
	.db #0x1a	; 26
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x82	; 130
	.db #0x14	; 20
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x36	; 54	'6'
	.db #0x5b	; 91
	.db #0xa0	; 160
	.db #0x56	; 86	'V'
	.db #0x04	; 4
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
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xa2	; 162
	.db #0x64	; 100	'd'
	.db #0xcb	; 203
	.db #0x9d	; 157
	.db #0x08	; 8
	.db #0x66	; 102	'f'
	.db #0xcd	; 205
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x2c	; 44
	.db #0x96	; 150
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x51	; 81	'Q'
	.db #0x01	; 1
	.db #0xa8	; 168
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x68	; 104	'h'
	.db #0x08	; 8
	.db #0x51	; 81	'Q'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x1a	; 26
	.db #0x10	; 16
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x39	; 57	'9'
	.db #0x84	; 132
	.db #0x63	; 99	'c'
	.db #0x94	; 148
	.db #0x5b	; 91
	.db #0xa0	; 160
	.db #0x34	; 52	'4'
	.db #0x6e	; 110	'n'
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x08	; 8
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x8b	; 139
	.db #0x85	; 133
	.db #0x02	; 2
	.db #0x89	; 137
	.db #0x18	; 24
	.db #0xb4	; 180
	.db #0x28	; 40
	.db #0x90	; 144
	.db #0x01	; 1
	.db #0x2f	; 47
	.db #0x85	; 133
	.db #0xca	; 202
	.db #0x60	; 96
	.db #0xb2	; 178
	.db #0x52	; 82	'R'
	.db #0x23	; 35
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0xfa	; 250
	.db #0x0a	; 10
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0xaa	; 170
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x6a	; 106	'j'
	.db #0x0a	; 10
	.db #0x5f	; 95
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x9b	; 155
	.db #0x2d	; 45
	.db #0xd0	; 208
	.db #0x2b	; 43
	.db #0x1c	; 28
	.db #0xc2	; 194
	.db #0x31	; 49	'1'
	.db #0x4a	; 74	'J'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xa4	; 164
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xb4	; 180
	.db #0x06	; 6
	.db #0x66	; 102	'f'
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0xc8	; 200
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
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0xca	; 202
	.db #0x03	; 3
	.db #0x63	; 99	'c'
	.db #0x0a	; 10
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x2a	; 42
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
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x45	; 69	'E'
	.db #0xaa	; 170
	.db #0x2d	; 45
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x42	; 66	'B'
	.db #0xa3	; 163
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x42	; 66	'B'
	.db #0x83	; 131
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xf0	; 240
	.db #0x50	; 80	'P'
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x2d	; 45
	.db #0xd0	; 208
	.db #0x9a	; 154
	.db #0x37	; 55	'7'
	.db #0x00	; 0
	.db #0xc5	; 197
	.db #0xa6	; 166
	.db #0x4b	; 75	'K'
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0xb3	; 179
	.db #0x05	; 5
	.db #0x45	; 69	'E'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0xe8	; 232
	.db #0x41	; 65	'A'
	.db #0xa8	; 168
	.db #0x41	; 65	'A'
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x0a	; 10
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0x61	; 97	'a'
	.db #0x0a	; 10
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x0a	; 10
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x0a	; 10
	.db #0x2a	; 42
	.db #0x03	; 3
	.db #0x5f	; 95
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x4f	; 79	'O'
	.db #0xea	; 234
	.db #0x5f	; 95
	.db #0xfa	; 250
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xb4	; 180
	.db #0xca	; 202
	.db #0x07	; 7
	.db #0xb0	; 176
	.db #0x4c	; 76	'L'
	.db #0x12	; 18
	.db #0xcb	; 203
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0xc0	; 192
	.db #0x28	; 40
	.db #0x80	; 128
	.db #0x6c	; 108	'l'
	.db #0x98	; 152
	.db #0x6c	; 108	'l'
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x6a	; 106	'j'
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x0a	; 10
	.db #0x2a	; 42
	.db #0x02	; 2
	.db #0x22	; 34
	.db #0x0a	; 10
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0xf3	; 243
	.db #0xf0	; 240
	.db #0x55	; 85	'U'
	.db #0x50	; 80	'P'
	.db #0xea	; 234
	.db #0xe0	; 224
	.db #0x4d	; 77	'M'
	.db #0x40	; 64
	.db #0xe8	; 232
	.db #0xe0	; 224
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0xe3	; 227
	.db #0xe0	; 224
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xa6	; 166
	.db #0x8d	; 141
	.db #0x40	; 64
	.db #0x33	; 51	'3'
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0xd0	; 208
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x8a	; 138
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x1a	; 26
	.db #0x15	; 21
	.db #0xe2	; 226
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x88	; 136
	.db #0x34	; 52	'4'
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x90	; 144
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x29	; 41
	.db #0x15	; 21
	.db #0x3d	; 61
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x78	; 120	'x'
	.db #0xc9	; 201
	.db #0xbe	; 190
	.db #0xff	; 255
	.db #0xeb	; 235
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0xc0	; 192
	.db #0xc0	; 192
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
	.db #0x50	; 80	'P'
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0xc0	; 192
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x45	; 69	'E'
	.db #0x25	; 37
	.db #0x19	; 25
	.db #0x28	; 40
	.db #0xad	; 173
	.db #0x77	; 119	'w'
	.db #0xad	; 173
	.db #0x02	; 2
	.db #0xa0	; 160
	.db #0xa4	; 164
	.db #0x48	; 72	'H'
	.db #0x28	; 40
	.db #0x93	; 147
	.db #0x2a	; 42
	.db #0x6d	; 109	'm'
	.db #0xd6	; 214
	.db #0x02	; 2
	.db #0x90	; 144
	.db #0x50	; 80	'P'
	.db #0x54	; 84	'T'
	.db #0x34	; 52	'4'
	.db #0x0f	; 15
	.db #0xb1	; 177
	.db #0x5a	; 90	'Z'
	.db #0xad	; 173
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x52	; 82	'R'
	.db #0x4a	; 74	'J'
	.db #0xca	; 202
	.db #0x45	; 69	'E'
	.db #0x55	; 85	'U'
	.db #0xcb	; 203
	.db #0x75	; 117	'u'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x52	; 82	'R'
	.db #0x24	; 36
	.db #0x65	; 101	'e'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x44	; 68	'D'
	.db #0x55	; 85	'U'
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x5d	; 93
	.db #0xed	; 237
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x1e	; 30
	.db #0x17	; 23
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xbe	; 190
	.db #0xc1	; 193
	.db #0xeb	; 235
	.db #0xf7	; 247
	.db #0x7f	; 127
	.db #0xaa	; 170
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xd8	; 216
	.db #0xbc	; 188
	.db #0x74	; 116	't'
	.db #0xe8	; 232
	.db #0x50	; 80	'P'
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
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0xf0	; 240
	.db #0x8d	; 141
	.db #0x5a	; 90	'Z'
	.db #0xb5	; 181
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
	.db #0x7c	; 124
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdd	; 221
	.db #0x69	; 105	'i'
	.db #0x28	; 40
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
	.db #0x36	; 54	'6'
	.db #0xf9	; 249
	.db #0xd5	; 213
	.db #0xba	; 186
	.db #0xd4	; 212
	.db #0x4c	; 76	'L'
	.db #0x08	; 8
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
_enemies_2_1_tiles:
	.db #0x09	; 9
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x2a	; 42
	.db #0x3e	; 62
	.db #0x36	; 54	'6'
	.db #0x3e	; 62
	.db #0x2a	; 42
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x4f	; 79	'O'
	.db #0x4a	; 74	'J'
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xad	; 173
	.db #0xff	; 255
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xf2	; 242
	.db #0x52	; 82	'R'
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xb5	; 181
	.db #0xff	; 255
	.db #0x6d	; 109	'm'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
	.db #0x7c	; 124
	.db #0x6c	; 108	'l'
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xd6	; 214
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xfe	; 254
	.db #0xd6	; 214
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.area _INITIALIZER
__xinit__bite_timer:
	.db #0x00	; 0
__xinit__bat_phase:
	.db #0x00	; 0
__xinit__bat1_pos_x:
	.dw #0x0010
__xinit__bat1_dir:
	.dw #0x0001
__xinit__bat2_pos_x:
	.dw #0x0020
__xinit__bat2_dir:
	.dw #0x0001
__xinit__flame_timer:
	.db #0x00	; 0
__xinit__flame1_phase:
	.db #0x00	; 0
__xinit__flame2_phase:
	.db #0x03	; 3
	.area _CABS (ABS)
