;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12533 (MINGW32)
;--------------------------------------------------------
	.module mushroompie
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init_game
	.globl _reset_world
	.globl _place_room_items
	.globl _init_game_items
	.globl _find_by_room_xy
	.globl _find_by_id
	.globl _pop_by_id
	.globl _push_last
	.globl _show_inventory
	.globl _execute_inventory
	.globl _execute_dialog
	.globl _vbl_interrupt
	.globl _lcd_interrupt
	.globl _check_change_room
	.globl _set_room
	.globl _FadeDMG
	.globl _check_dizzy_evil_collisions
	.globl _check_dizzy_collisions
	.globl _set_dizzy_position
	.globl _set_dizzy_animdata
	.globl _init_dizzy
	.globl _set_enemies_position
	.globl _get_coll
	.globl _get_v_coll
	.globl _get_h_coll
	.globl _get_y_scroll_value
	.globl _get_x_scroll_value
	.globl _update_energy
	.globl _show_energy
	.globl _show_coins
	.globl _sub_coins
	.globl _add_coins
	.globl _show_lives
	.globl _on_dizzy_die
	.globl _init_dizzy_energy
	.globl _init_dizzy_lives
	.globl _init_dizzy_coins
	.globl _unshrink_and_mask
	.globl _multiple_move_sprites_limits
	.globl _multiple_move_sprites
	.globl _multiple_set_sprite_tiles
	.globl _multiple_set_sprite_prop
	.globl _multiple_clear_sprite_tiledata
	.globl _get_map_from_buf
	.globl _put_map_to_buf
	.globl _rle_decompress_data
	.globl _rle_decompress_tilemap
	.globl _get_shrinked_tile_offset
	.globl _unshrink_tiles_to_buf
	.globl _unshrink_tiles
	.globl _set_inc_tiles
	.globl _hUGE_init
	.globl _PlayFx
	.globl _set_bank
	.globl _pop_bank
	.globl _push_bank
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_win_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _waitpadup
	.globl _joypad
	.globl _delay
	.globl _wait_int_handler
	.globl _add_LCD
	.globl _add_VBL
	.globl _lyc_table
	.globl _inventory
	.globl ___lcd_int_state
	.globl _tim_div
	.globl _dizzy_old_pos_y
	.globl _dizzy_old_pos_x
	.globl _dizzy_stun
	.globl _dizzy_falling
	.globl _death_pause
	.globl _game_over
	.globl _joy
	.globl _is_position_safe
	.globl _safe_room_y
	.globl _safe_room_x
	.globl _delta_y
	.globl _delta_x
	.globl _dizzy_tmp_xy
	.globl _dizzy_y
	.globl _dizzy_x
	.globl _current_room
	.globl _current_room_y
	.globl _current_room_x
	.globl _cloud_timer
	.globl _bal_update
	.globl _walk_update
	.globl _ani_update
	.globl _current_dyn_phase
	.globl _double_dyn
	.globl _current_dyn
	.globl _ani_phase
	.globl _ani_type
	.globl _item_stack
	.globl _inventory_item_list
	.globl ___temp_text_ptr2
	.globl ___temp_text_ptr1
	.globl ___temp_text_ptr0
	.globl ___temp_text_buf
	.globl ___temp_item_tiledata2
	.globl ___temp_item_tiledata1
	.globl ___temp_item_tiledata0
	.globl ___temp_bkg_tiles
	.globl ___temp_tiles
	.globl ___temp_tiledata
	.globl ___temp_game_item_desc
	.globl ___temp_game_item3
	.globl ___temp_game_item2
	.globl ___temp_game_item
	.globl _game_item_list
	.globl _game_items
	.globl _item_tiles_hiwater
	.globl _font_tiles_start
	.globl _inventoty_tiles_start
	.globl _window_tiles_hiwater
	.globl ___temp_coll_row
	.globl _collision_buf
	.globl _tile_pos_oy
	.globl _tile_pos_ox
	.globl _tile_pos_y
	.globl _tile_pos_x
	.globl ___temp_scroll_value
	.globl _bkg_scroll_y_target
	.globl _bkg_scroll_x_target
	.globl _dec_energy
	.globl _inc_energy
	.globl _dizzy_energy_old
	.globl _dizzy_energy
	.globl _coins_indicator
	.globl _coins
	.globl _temp_tile_buffer
	.globl _dizzy_energy_indicator
	.globl _dizzy_lives_indicator
	.globl _dizzy_lives
	.globl _digits_start
	.globl _dizzy_energy_start
	.globl _dizzy_live_symbol
	.globl ___temp_m
	.globl ___temp_l
	.globl ___temp_k
	.globl ___temp_j
	.globl ___temp_i
	.globl _tmp_dizzy_y
	.globl _tmp_dizzy_x
	.globl _safe_dizzy_y
	.globl _safe_dizzy_x
	.globl _tmp_room_y
	.globl _tmp_room_x
	.globl _ani_type_old
	.globl _current_animation
	.globl _coll_buf
	.globl _all_items_desc
	.globl _itmdesc_coin2
	.globl _itmdesc_coin1
	.globl _itmdesc_coin0
	.globl _itmdesc_blockage0
	.globl _itmdesc_blockage1
	.globl _itmdesc_blockage2
	.globl _itmdesc_firefly
	.globl _itmdesc_lid
	.globl _itmdesc_jar
	.globl _itmdesc_pie
	.globl _itmdesc_mushrooms
	.globl _itmdesc_grass
	.globl _itmdesc_key
	.globl _itmdesc_pickaxe
	.globl _ethalon_tiles_offsets
	.globl _ethalon_indicator
	.globl _current_coll_idx
	.globl _evil_hide
	.globl _empty_compressed_map
	.globl _ptr_div_reg
	.globl _room_5_1
	.globl _room_4_1
	.globl _room_3_1
	.globl _room_2_1
	.globl _room_1_1
	.globl _room_0_1
	.globl _room_5_0
	.globl _room_4_0
	.globl _room_3_0
	.globl _room_2_0
	.globl _room_1_0
	.globl _room_0_0
	.globl _world_row_1
	.globl _world_row_0
	.globl _dizzy_world
	.globl _fly_delta
	.globl _fly_offsets
	.globl _move_x_data
	.globl _double_y_data
	.globl _move_y_data
	.globl _double_y_dynamics
	.globl _move_y_dynamics
	.globl _animation
	.globl _dead_ani
	.globl _stun_ani
	.globl _jump_l_ani
	.globl _jump_r_ani
	.globl _roll_l_ani
	.globl _roll_r_ani
	.globl _walk_l_ani
	.globl _walk_r_ani
	.globl _up_ani
	.globl _stand_ani
	.globl _dizzy_offsets
	.globl _show_dialog_window
	.globl _default_draw
	.globl _default_drop
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_coll_buf::
	.ds 510
_current_animation::
	.ds 2
_ani_type_old::
	.ds 1
_tmp_room_x::
	.ds 1
_tmp_room_y::
	.ds 1
_safe_dizzy_x::
	.ds 2
_safe_dizzy_y::
	.ds 2
_tmp_dizzy_x::
	.ds 2
_tmp_dizzy_y::
	.ds 2
___temp_i::
	.ds 1
___temp_j::
	.ds 1
___temp_k::
	.ds 1
___temp_l::
	.ds 1
___temp_m::
	.ds 1
_dizzy_live_symbol::
	.ds 1
_dizzy_energy_start::
	.ds 1
_digits_start::
	.ds 1
_dizzy_lives::
	.ds 1
_dizzy_lives_indicator::
	.ds 3
_dizzy_energy_indicator::
	.ds 8
_temp_tile_buffer::
	.ds 16
_coins::
	.ds 1
_coins_indicator::
	.ds 2
_dizzy_energy::
	.ds 1
_dizzy_energy_old::
	.ds 1
_inc_energy::
	.ds 1
_dec_energy::
	.ds 1
_bkg_scroll_x_target::
	.ds 1
_bkg_scroll_y_target::
	.ds 1
___temp_scroll_value::
	.ds 2
_tile_pos_x::
	.ds 1
_tile_pos_y::
	.ds 1
_tile_pos_ox::
	.ds 1
_tile_pos_oy::
	.ds 1
_collision_buf::
	.ds 3
___temp_coll_row::
	.ds 2
_window_tiles_hiwater::
	.ds 1
_inventoty_tiles_start::
	.ds 1
_font_tiles_start::
	.ds 1
_item_tiles_hiwater::
	.ds 1
_game_items::
	.ds 126
_game_item_list::
	.ds 5
___temp_game_item::
	.ds 2
___temp_game_item2::
	.ds 2
___temp_game_item3::
	.ds 2
___temp_game_item_desc::
	.ds 2
___temp_tiledata::
	.ds 2
___temp_tiles::
	.ds 4
___temp_bkg_tiles::
	.ds 4
___temp_item_tiledata0::
	.ds 64
___temp_item_tiledata1::
	.ds 64
___temp_item_tiledata2::
	.ds 64
___temp_text_buf::
	.ds 20
___temp_text_ptr0::
	.ds 2
___temp_text_ptr1::
	.ds 2
___temp_text_ptr2::
	.ds 2
_inventory_item_list::
	.ds 5
_item_stack::
	.ds 5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
___CRASH_HEANDLER_INIT:
	.ds 2
_ani_type::
	.ds 1
_ani_phase::
	.ds 1
_current_dyn::
	.ds 2
_double_dyn::
	.ds 1
_current_dyn_phase::
	.ds 1
_ani_update::
	.ds 1
_walk_update::
	.ds 1
_bal_update::
	.ds 1
_cloud_timer::
	.ds 1
_current_room_x::
	.ds 1
_current_room_y::
	.ds 1
_current_room::
	.ds 2
_dizzy_x::
	.ds 2
_dizzy_y::
	.ds 2
_dizzy_tmp_xy::
	.ds 2
_delta_x::
	.ds 2
_delta_y::
	.ds 2
_safe_room_x::
	.ds 1
_safe_room_y::
	.ds 1
_is_position_safe::
	.ds 1
_joy::
	.ds 1
_game_over::
	.ds 1
_death_pause::
	.ds 1
_dizzy_falling::
	.ds 1
_dizzy_stun::
	.ds 1
_dizzy_old_pos_x::
	.ds 2
_dizzy_old_pos_y::
	.ds 2
_tim_div::
	.ds 1
___lcd_int_state::
	.ds 1
_inventory::
	.ds 1
_lyc_table::
	.ds 8
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
;src/mushroompie.c:293: void lcd_interrupt() NONBANKED __naked 
;	---------------------------------
; Function lcd_interrupt
; ---------------------------------
_lcd_interrupt::
;src/mushroompie.c:349: __endasm;
	ld	A, (#_inventory) ; if !inventory then use lyc_table 0..3 else 4..7
	and	#1
	sla	A
	sla	A
	ld	HL, #___lcd_int_state
	ld	E, (HL)
	add	E
	ld	HL, #_lyc_table
	add	L
	ld	L, A
	ld	A, H
	adc	#0
	ld	H, A ; HL = &lyc_table[__lcd_int_state]
	ld	A,(HL)
	ldh	(#_LYC_REG), A ; setting next interrupt row
	ld	D, A
	ld	A, E
	inc	A
	and	#3
	ld	(#___lcd_int_state), A ; __lcd_int_state++; __lcd_int_state&=3;
	and	#1
	sla	A
	ld	E,A
	xor	#2
	swap	A
	or	E ; E = ((__lcd_int_state & 1) << 5) | (((!__lcd_int_state) & 1) << 1)
	ld	E, A ; when WIN is ON, OBJ are OFF
	ldh	A, (#_LCDC_REG)
	and	#0xDD ; mask other bits except WIN and OBJ
	or	E
	ldh	(#_LCDC_REG), A ; manipulate WIN and OBJ visibiliry
	ld	A, D
	or	A
	ret	NZ
	ld	A, #1
	ld	(#0x2000), A
	call	#_hUGE_dosound
	ld	HL, #___banks_sp ; _current_bank = ((*__banks_sp)), *(uint8_t *)0x2000 = ((*__banks_sp));
	ld	A, (HL+)
	ld	H, (HL)
	ld	L, A
	ld	A, (HL)
	ld	(#0x2000), A
	ret
;src/mushroompie.c:350: }    
;src/mushroompie.c:351: void vbl_interrupt() NONBANKED __naked
;	---------------------------------
; Function vbl_interrupt
; ---------------------------------
_vbl_interrupt::
;src/mushroompie.c:373: __endasm;
	ld	A, (#_bkg_scroll_x_target)
	ldh	(#_SCX_REG), A
	ld	A, (#_bkg_scroll_y_target)
	ldh	(#_SCY_REG), A
	ld	A, (#_tim_div)
	inc	A
	and	#3
	ld	(#_tim_div), A
	jr	NZ, vblint01$
	ld	HL, #_ani_update
	ld	(HL), #1
	vblint01$:
	and #1
	jr	Z, vblint02$
	ld	(#_bal_update), A
	vblint02$:
	ld A, #1
	ld	(#_walk_update), A
	ret
;src/mushroompie.c:374: } 
;src/include/inventory.h:74: void show_dialog_window(const UBYTE lines, const dialog_item* item) NONBANKED {
;	---------------------------------
; Function show_dialog_window
; ---------------------------------
_show_dialog_window::
;src/include/inventory.h:75: push_bank(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
;src/include/inventory.h:76: execute_dialog(lines, item);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	call	_execute_dialog
	add	sp, #3
;src/include/inventory.h:77: pop_bank();
;src/include/inventory.h:78: }
	jp	_pop_bank
_itmdesc_pickaxe:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x0a	; 10
	.dw __str_0
	.dw _pickaxe_tiles
	.dw _pickaxe_mask
_itmdesc_key:
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x0c	; 12
	.dw __str_1
	.dw _key_tiles
	.dw _key_mask
_itmdesc_grass:
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x0c	; 12
	.dw __str_2
	.dw _grass_tiles
	.dw _grass_mask
_itmdesc_mushrooms:
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x06	; 6
	.dw __str_3
	.dw _mushrooms_tiles
	.dw _mushrooms_mask
_itmdesc_pie:
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_4
	.dw _pie_tiles
	.dw _pie_mask
_itmdesc_jar:
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x0e	; 14
	.dw __str_5
	.dw _jar_tiles
	.dw _jar_mask
_itmdesc_lid:
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x04	; 4
	.dw __str_6
	.dw _lid_tiles
	.dw _lid_mask
_itmdesc_firefly:
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.dw __str_7
	.dw #0x0000
	.dw #0x0000
_itmdesc_blockage2:
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x0a	; 10
	.dw __str_8
	.dw _blockage2_tiles
	.dw #0x0000
_itmdesc_blockage1:
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x0a	; 10
	.dw __str_8
	.dw _blockage1_tiles
	.dw #0x0000
_itmdesc_blockage0:
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x09	; 9
	.dw __str_8
	.dw _blockage0_tiles
	.dw #0x0000
_itmdesc_coin0:
	.db #0x89	; 137
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x02	; 2
	.dw __str_9
	.dw _coin_tiles
	.dw _coin_mask
_itmdesc_coin1:
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x05	; 5
	.dw __str_9
	.dw _coin_tiles
	.dw _coin_mask
_itmdesc_coin2:
	.db #0x8b	; 139
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.dw __str_9
	.dw _coin_tiles
	.dw _coin_mask
_all_items_desc:
	.dw _itmdesc_pickaxe
	.dw _itmdesc_key
	.dw _itmdesc_mushrooms
	.dw _itmdesc_grass
	.dw _itmdesc_pie
	.dw _itmdesc_jar
	.dw _itmdesc_lid
	.dw _itmdesc_firefly
	.dw _itmdesc_blockage2
	.dw _itmdesc_blockage1
	.dw _itmdesc_blockage0
	.dw _itmdesc_coin0
	.dw _itmdesc_coin1
	.dw _itmdesc_coin2
__str_0:
	.ascii "HEAVY PICKAXE"
	.db 0x00
__str_1:
	.ascii "ELEVATOR KEY"
	.db 0x00
__str_2:
	.ascii "TUFT OF GRASS"
	.db 0x00
__str_3:
	.ascii "MUSHROOMS"
	.db 0x00
__str_4:
	.ascii "MUSHROOM PIE"
	.db 0x00
__str_5:
	.ascii "GLASS JAR"
	.db 0x00
__str_6:
	.ascii "WOODEN LID"
	.db 0x00
__str_7:
	.ascii "FIREFLY"
	.db 0x00
__str_8:
	.ascii "BOULDERS"
	.db 0x00
__str_9:
	.ascii "COIN"
	.db 0x00
;src/include/inventory.h:81: game_item * show_inventory() NONBANKED {
;	---------------------------------
; Function show_inventory
; ---------------------------------
_show_inventory::
;src/include/inventory.h:82: push_bank(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
;src/include/inventory.h:83: game_item * res = execute_inventory();
	call	_execute_inventory
;src/include/inventory.h:84: pop_bank();
	push	de
	call	_pop_bank
	pop	de
;src/include/inventory.h:85: return res;
;src/include/inventory.h:86: }
	ret
;src/include/inventory.h:157: void place_room_items(const UBYTE row, const UBYTE col, unsigned char * room_buf) NONBANKED {
;	---------------------------------
; Function place_room_items
; ---------------------------------
_place_room_items::
	dec	sp
	dec	sp
;src/include/inventory.h:158: item_tiles_hiwater = window_tiles_hiwater;
	ld	a, (#_window_tiles_hiwater)
	ld	(#_item_tiles_hiwater),a
;src/include/inventory.h:159: __temp_game_item = game_item_list.first;
	ld	de, #(_game_item_list + 1)
	ld	a, (de)
	ld	hl, #___temp_game_item
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/include/inventory.h:160: while (__temp_game_item) {
00110$:
	ld	hl, #___temp_game_item + 1
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00117$
;src/include/inventory.h:161: if ((__temp_game_item->room_row == row) && (__temp_game_item->room_col == col)) {
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#___temp_game_item + 1)
	ldhl	sp,	#1
	ld	(hl), a
	pop	bc
	push	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jp	NZ,00108$
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, c
	jp	NZ,00108$
;src/include/inventory.h:162: __temp_tiledata = __temp_game_item->desc->data;
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0007
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #___temp_tiledata
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/include/inventory.h:163: if (__temp_tiledata) {
	ld	hl, #___temp_tiledata + 1
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00108$
;src/include/inventory.h:164: item_tiles_hiwater -= item_map_size;
	ld	hl, #_item_tiles_hiwater
	ld	a, (hl)
	add	a, #0xfc
	ld	(hl), a
;src/include/inventory.h:167: push_bank(1); 
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
;src/include/inventory.h:168: unshrink_tiles_to_buf(item_map_size, __temp_tiledata->data, __temp_item_tiledata0); 
	ld	hl, #___temp_tiledata
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	de, #___temp_item_tiledata0
	push	de
	push	bc
	ld	a, #0x04
	push	af
	inc	sp
	call	_unshrink_tiles_to_buf
	add	sp, #5
;src/include/inventory.h:161: if ((__temp_game_item->room_row == row) && (__temp_game_item->room_col == col)) {
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/include/inventory.h:162: __temp_tiledata = __temp_game_item->desc->data;
	ld	hl, #0x0005
	add	hl, bc
;src/include/inventory.h:169: __temp_tiledata = (__temp_game_item->desc->mask) ? __temp_game_item->desc->mask : &null_mask;
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	or	a, c
	jr	NZ, 00120$
	ld	bc, #_null_mask
00120$:
	ld	hl, #___temp_tiledata
	ld	a, c
	ld	(hl+), a
;src/include/inventory.h:170: unshrink_tiles_to_buf(item_map_size, __temp_tiledata->data, __temp_item_tiledata2); 
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	de, #___temp_item_tiledata2
	push	de
	push	bc
	ld	a, #0x04
	push	af
	inc	sp
	call	_unshrink_tiles_to_buf
	add	sp, #5
;src/include/inventory.h:171: pop_bank();
	call	_pop_bank
;src/include/inventory.h:174: get_map_from_buf(__temp_game_item->x, __temp_game_item->y, item_width, item_height, __temp_bkg_tiles, room_buf, room_width, room_height);
;src/include/inventory.h:161: if ((__temp_game_item->room_row == row) && (__temp_game_item->room_col == col)) {
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/include/inventory.h:174: get_map_from_buf(__temp_game_item->x, __temp_game_item->y, item_width, item_height, __temp_bkg_tiles, room_buf, room_width, room_height);
	ld	hl, #0x0004
	add	hl, bc
	ld	d, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	h, #0x11
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x1e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#8
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	bc, #___temp_bkg_tiles
	push	bc
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_get_map_from_buf
	add	sp, #10
;src/include/inventory.h:178: __temp_j = current_room->room_tiles->count;
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ld	(#___temp_j),a
;src/include/inventory.h:179: __temp_text_ptr1 = __temp_item_tiledata1;
	ld	hl, #___temp_text_ptr1
	ld	(hl), #<(___temp_item_tiledata1)
	inc	hl
	ld	(hl), #>(___temp_item_tiledata1)
;src/include/inventory.h:180: for (__temp_i = 0; __temp_i < item_map_size; __temp_i++) {
	ld	hl, #___temp_i
	ld	(hl), #0x00
00113$:
;src/include/inventory.h:181: __temp_k = __temp_bkg_tiles[__temp_i];
	ld	a, #<(___temp_bkg_tiles)
	ld	hl, #___temp_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(___temp_bkg_tiles)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
;src/include/inventory.h:182: if (__temp_k >= __temp_j) __temp_k = 0; // merge with bkg tiles only, "modified tile" = empty, can't drop item on item
	ld	(#___temp_k),a
	ld	hl, #___temp_j
	sub	a, (hl)
	jr	C, 00102$
	ld	hl, #___temp_k
	ld	(hl), #0x00
00102$:
;src/include/inventory.h:183: unshrink_tiles_to_buf(1, get_shrinked_tile_offset(__temp_k, current_room->room_tiles->data), __temp_text_ptr1);
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	push	bc
	ld	a, (#___temp_k)
	push	af
	inc	sp
	call	_get_shrinked_tile_offset
	add	sp, #3
	ld	hl, #___temp_text_ptr1
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	call	_unshrink_tiles_to_buf
	add	sp, #5
;src/include/inventory.h:184: __temp_text_ptr1 += 16;
	ld	hl, #___temp_text_ptr1
	ld	a, (hl)
	add	a, #0x10
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;src/include/inventory.h:180: for (__temp_i = 0; __temp_i < item_map_size; __temp_i++) {
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00113$
;src/include/inventory.h:187: __temp_text_ptr0 = __temp_item_tiledata0; __temp_text_ptr1 = __temp_item_tiledata1; __temp_text_ptr2 = __temp_item_tiledata2;
	ld	hl, #___temp_text_ptr0
	ld	(hl), #<(___temp_item_tiledata0)
	inc	hl
	ld	(hl), #>(___temp_item_tiledata0)
	ld	hl, #___temp_text_ptr1
	ld	(hl), #<(___temp_item_tiledata1)
	inc	hl
	ld	(hl), #>(___temp_item_tiledata1)
	ld	hl, #___temp_text_ptr2
	ld	(hl), #<(___temp_item_tiledata2)
	inc	hl
	ld	(hl), #>(___temp_item_tiledata2)
;src/include/inventory.h:188: for (__temp_i = 0; __temp_i < item_tiledata_size; __temp_i++) {
	ld	hl, #___temp_i
	ld	(hl), #0x00
00115$:
;src/include/inventory.h:189: *__temp_text_ptr0 = *__temp_text_ptr1 & *__temp_text_ptr2 | *__temp_text_ptr0;
	ld	hl, #___temp_text_ptr0
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #___temp_text_ptr1
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (___temp_text_ptr1 + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
	ld	hl, #___temp_text_ptr2
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (___temp_text_ptr2 + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	and	a, e
	ld	e, a
	ld	a, (bc)
	or	a, e
	ld	(bc), a
;src/include/inventory.h:190: __temp_text_ptr0++; __temp_text_ptr1++; __temp_text_ptr2++;
	ld	hl, #___temp_text_ptr0
	inc	(hl)
	jr	NZ, 00180$
	inc	hl
	inc	(hl)
00180$:
	ld	hl, #___temp_text_ptr1
	inc	(hl)
	jr	NZ, 00181$
	inc	hl
	inc	(hl)
00181$:
	ld	hl, #___temp_text_ptr2
	inc	(hl)
	jr	NZ, 00182$
	inc	hl
	inc	(hl)
00182$:
;src/include/inventory.h:188: for (__temp_i = 0; __temp_i < item_tiledata_size; __temp_i++) {
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x40
	jr	C, 00115$
;src/include/inventory.h:194: set_bkg_data(item_tiles_hiwater, item_map_size, __temp_item_tiledata0);
	ld	de, #___temp_item_tiledata0
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	ld	a, (#_item_tiles_hiwater)
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;src/include/inventory.h:197: set_inc_tiles(item_tiles_hiwater, item_map_size, __temp_tiles);
	ld	de, #___temp_tiles
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	ld	a, (#_item_tiles_hiwater)
	push	af
	inc	sp
	call	_set_inc_tiles
	add	sp, #4
;src/include/inventory.h:198: put_map_to_buf(__temp_game_item->x, __temp_game_item->y, item_width, item_height, __temp_tiles, room_buf, room_width, room_height);
;src/include/inventory.h:161: if ((__temp_game_item->room_row == row) && (__temp_game_item->room_col == col)) {
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/include/inventory.h:198: put_map_to_buf(__temp_game_item->x, __temp_game_item->y, item_width, item_height, __temp_tiles, room_buf, room_width, room_height);
	ld	hl, #0x0004
	add	hl, bc
	ld	d, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	h, #0x11
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x1e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#8
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	bc, #___temp_tiles
	push	bc
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_put_map_to_buf
	add	sp, #10
00108$:
;src/include/inventory.h:201: __temp_game_item = __temp_game_item->next;
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
	jp	00110$
00117$:
;src/include/inventory.h:203: }
	inc	sp
	inc	sp
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/include/rle_utils.h:2: void set_inc_tiles(UBYTE from, UBYTE count, unsigned char * buf) __naked
;	---------------------------------
; Function set_inc_tiles
; ---------------------------------
_set_inc_tiles::
;src/include/rle_utils.h:22: __endasm;           
	lda	HL, 2(SP) ; Skip return address and registers
	ld	E, (HL) ; E = from
	inc	HL
	ld	D, (HL) ; D = count
	inc	HL
	ld	A, (HL+)
	ld	H, (HL)
	ld	L, A ; HL = buf
	ld	A, E
	$tileset01:
	ld (HL+), A
	inc	A
	dec	D
	jr	NZ, $tileset01
	ret
;src/include/rle_utils.h:23: }
;src/include/rle_utils.h:26: void unshrink_tiles(UBYTE from, UBYTE count, unsigned char * shrinked_tiles) __naked
;	---------------------------------
; Function unshrink_tiles
; ---------------------------------
_unshrink_tiles::
;src/include/rle_utils.h:142: __endasm;           
;	TODO: switching to copy_vram
;	ldh A,(.LCDC)
;	bit 4,A
;	jp NZ,_set_sprite_data
	push	BC
	lda	HL,7(SP) ; Skip return address and registers
	ld	B,(HL) ; BC = data
	dec	HL
	ld	C,(HL)
	dec	HL
	ld	E,(HL) ; E = nb_tiles
	dec	HL
	ld	L,(HL) ; L = first_tile
	ld	A,L
	rlca	; Sign extend (patterns have signed numbers)
	sbc	A
	ld	H,A
	add	HL,HL ; HL *= 16
	add	HL,HL
	add	HL,HL
	add	HL,HL
	push	BC
	ld	BC,#0x9000
	add	HL,BC
	pop	BC
	$unshr02:
	push DE
	ld	A, (BC)
	inc	BC
	ld	E, A ; E = shrink_type
	ld	D, #8
	$unshr03:
; Special version of '.copy_vram'
	bit	3, H ; Bigger than 0x9800
	jr	Z, $unshr04
	bit	4, H
	jr	Z, $unshr04
	res	4, H ; Switch to 0x8800
	$unshr04:
	ld A, E
	cp	#1
	jr	Z, $unshr20
	cp	#2
	jr	Z, $unshr30
	cp	#3
	jr	Z, $unshr40
	cp	#4
	jr	Z, $unshr50
	$unshr10:
	ldh A,(#_STAT_REG)
	and	#0x02
	jr	NZ, $unshr10
	xor	A
	ld	(HL+), A
	ld	(HL+), A
	jr	$unshr0A
	$unshr20:
	ldh A,(#_STAT_REG)
	and	#0x02
	jr	NZ, $unshr20
	ld	A, (BC)
	ld	(HL+), A
	xor	A
	ld	(HL+), A
	inc	BC
	jr	$unshr0A
	$unshr30:
	ldh A,(#_STAT_REG)
	and	#0x02
	jr	NZ, $unshr30
	xor	A
	ld	(HL+), A
	ld	A, (BC)
	ld	(HL+), A
	inc	BC
	jr	$unshr0A
	$unshr40:
	ldh A,(#_STAT_REG)
	and	#0x02
	jr	NZ, $unshr40
	ld	A, (BC)
	ld	(HL+), A
	ld	(HL+), A
	inc	BC
	jr	$unshr0A
	$unshr50:
	ldh A,(#_STAT_REG)
	and	#0x02
	jr	NZ, $unshr50
	ld	A, (BC)
	inc	BC
	ld	(HL+), A
	ld	A, (BC)
	ld	(HL+), A
	inc	BC
	jr	$unshr0A
	$unshr0A:
	dec D
	jr	NZ, $unshr03
	pop	DE
	dec	E
	jr	NZ, $unshr02
	pop	BC
	ret
;src/include/rle_utils.h:143: }
;src/include/rle_utils.h:146: void unshrink_tiles_to_buf(UBYTE count, const unsigned char * shrinked_tiles, unsigned char * dest) __naked
;	---------------------------------
; Function unshrink_tiles_to_buf
; ---------------------------------
_unshrink_tiles_to_buf::
;src/include/rle_utils.h:227: __endasm;           
	push	BC
	lda	HL, 4(SP)
	ld	E, (HL) ; E = count
	inc	HL
	ld	C, (HL)
	inc	HL
	ld	B, (HL) ; BC = source
	inc	HL
	ld	A, (HL+)
	ld	H, (HL)
	ld	L, A ; HL = dest
	$unshb02:
	ld D, #8
	ld	A, (BC)
	inc	BC
	or	A
	jr	Z, $unshb10
	cp	#1
	jr	Z, $unshb20
	cp	#2
	jr	Z, $unshb30
	cp	#3
	jr	Z, $unshb40
	cp	#4
	jr	Z, $unshb50
	jr	$unshb04
	$unshb03:
	dec E
	jr	NZ, $unshb02
	$unshb04:
	pop BC
	ret
	$unshb10:
	xor A
	$unshb11:
	ld (HL+), A
	ld	(HL+), A
	dec	D
	jr	NZ, $unshb11
	jr	$unshb03
	$unshb20:
	ld A, (BC)
	ld	(HL+), A
	xor	A
	ld	(HL+), A
	inc	BC
	dec	D
	jr	NZ, $unshb20
	jr	$unshb03
	$unshb30:
	xor A
	ld	(HL+), A
	ld	A, (BC)
	ld	(HL+), A
	inc	BC
	dec	D
	jr	NZ, $unshb30
	jr	$unshb03
	$unshb40:
	ld A, (BC)
	ld	(HL+), A
	ld	(HL+), A
	inc	BC
	dec	D
	jr	NZ, $unshb40
	jr	$unshb03
	$unshb50:
	ld A, (BC)
	inc	BC
	ld	(HL+), A
	ld	A, (BC)
	ld	(HL+), A
	inc	BC
	dec	D
	jr	NZ, $unshb50
	jr	$unshb03
;src/include/rle_utils.h:228: }
;src/include/rle_utils.h:231: unsigned char * get_shrinked_tile_offset(UBYTE tilenum, const unsigned char * shrinked_tiles) __naked
;	---------------------------------
; Function get_shrinked_tile_offset
; ---------------------------------
_get_shrinked_tile_offset::
;src/include/rle_utils.h:270: __endasm;           
	lda	HL, 4(SP)
	ld	D, (HL)
	dec	HL
	ld	E, (HL) ; DE = shrinked_tiles
	dec	HL
	ld	A, (HL)
	or	A
	ret	Z
	ld	L, A ; L = tilenum
	$unshc02:
	ld A, (DE)
	inc	DE
	cp	#5
	ret	NC
	or	A
	jr	Z, $unshc03
	cp	#4
	ld	A, #16
	jr	Z, $unshc04
	ld	A, #8
	$unshc04:
	add E
	ld	E, A
	ld	A, D
	adc	#0
	ld	D, A
	$unshc03:
	dec L
	jr	NZ, $unshc02
	ret
;src/include/rle_utils.h:271: }
;src/include/rle_utils.h:275: void rle_decompress_tilemap(UBYTE bkg, UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * tiles) __naked
;	---------------------------------
; Function rle_decompress_tilemap
; ---------------------------------
_rle_decompress_tilemap::
;src/include/rle_utils.h:396: __endasm;
	push	BC
	ld	BC, #0x0000 ; local variables: count, ch
	push	BC
	lda	HL, 7(SP)
	ld	D, (HL) ; D = x
	inc	HL
	ld	E, (HL) ; E = y
	lda	HL, 12(SP)
	ld	B, (HL) ; BC = tiles
	dec	HL
	ld	C, (HL)
	dec	HL
	ld	A, (HL-) ; A = h
	ld	H, (HL) ; H = w
	ld	L,A ; L = h
	push	HL ; Store WH
	lda	HL, 8(SP)
	ld	A, (HL) ; A = bkg/win destination
	or	A
	jr	NZ, $decomp0B
	ldh	A, (#_LCDC_REG)
	bit	3, A
	jr	NZ, $decomp01
	ld	HL, #0x9800 ; HL = origin
	jr	$decomp02
	$decomp01:
	ld HL, #0x9C00 ; HL = origin
	jr	$decomp02
	$decomp0B:
	ldh A, (#_LCDC_REG)
	bit	6, A
	jr	NZ, $decomp01
	ld	HL, #0x9800 ; HL = origin
	$decomp02:
	push BC ; Store source
	xor	A
	or	E
	jr	Z, $decomp03
	ld	BC, #0x20 ; One line is 20h tiles
	$decomp04:
	add HL, BC ; Y coordinate
	dec	E
	jr	NZ, $decomp04
	$decomp03:
	ld B, #0x00 ; X coordinate
	ld	C, D
	add	HL, BC
	pop	BC ; BC = source
	pop	DE ; DE = WH
	push	HL ; Store origin
	push	DE ; Store WH
	$decomp05:
	push HL
	lda	HL, 6(SP)
	ld	A, (HL+)
	or	A
	jr	Z, $decomp07
	ld	A, (HL-)
	dec	(HL)
	jr	$decomp08
	$decomp07:
	dec HL
	ld	A, (BC) ; Copy tile
	cp	#0xc0
	jr	Z, $decomp09
	and	#0xc0
	cp	#0xc0
	jr	NZ, $decomp09
	ld	A, (BC)
	and	#0x3f
	dec	A
	ld	(HL+), A
	inc	BC
	ld	A, (BC)
	ld	(HL), A
	inc	BC
	jr	$decomp08
	$decomp09:
	ld A, (BC) ; just single tile
	inc	BC
	$decomp08:
	pop HL
	push	DE
	ld	D, A
	$decomp0A:
	ldh A, (#_STAT_REG)
	and	#0x02
	jr	NZ, $decomp0A
	ld	(HL), D
	inc	HL
	pop	DE
	dec	D
	jr	NZ,$decomp05
	pop	HL ; HL = WH
	ld	D,H ; Restore D = W
	pop	HL ; HL = origin
	dec	E
	jr	Z,$decomp06
	push	BC ; Next line
	ld	BC, #0x20 ; One line is 20h tiles
	add	HL,BC
	pop	BC
	push	HL ; Store current origin
	push	DE ; Store WH
	jr	$decomp05
	$decomp06:
	pop BC ; local variables
	pop	BC
	ret
;src/include/rle_utils.h:397: }
;src/include/rle_utils.h:400: void rle_decompress_data(const unsigned char * data, UWORD size, unsigned char * dest) __naked
;	---------------------------------
; Function rle_decompress_data
; ---------------------------------
_rle_decompress_data::
;src/include/rle_utils.h:476: __endasm;
	push	BC ; 0 bc, 2 ret, 4 data, 6 size, 8 dest, 10 -
	lda	HL, 4(SP)
	ld	E, (HL)
	inc	HL
	ld	D, (HL)
	inc	HL
	ld	C, (HL)
	inc	HL
	ld	B, (HL)
	inc	HL
	ld	A, (HL+)
	ld	H, (HL)
	ld	L, A
	$rle03:
	ld A, (DE)
	and	#0xc0
	cp	#0xc0
	jr	Z, $rle04
	ld	A, (DE)
	ld	(HL+), A
	inc	DE
	dec	BC
	ld	A, C
	or	B
	jr	NZ, $rle03
	pop	BC
	ret
	$rle04:
	push BC
	ld	A, (DE)
	and	#0x3f
	jr	Z, $rle06
	ld	C, A
	inc	DE
	ld	A, (DE)
	$rle07:
	ld (HL+), A
	dec	C
	jr	NZ, $rle07
	inc	DE
	pop	BC
	dec	BC
	ld	A, C
	or	B
	jr	Z, $rle08
	dec	BC
	ld	A, C
	or	B
	jr	NZ, $rle03
	$rle08:
	pop BC
	ret
	$rle06:
	pop BC
	ld	A, (DE)
	ld	(HL+), A
	inc	DE
	dec	BC
	ld	A, C
	or	B
	jr	NZ, $rle03
	pop	BC
	ret
;src/include/rle_utils.h:477: }
;src/include/rle_utils.h:480: void put_map_to_buf(UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * source, unsigned char * buf, UBYTE buf_w, UBYTE buf_h) __naked
;	---------------------------------
; Function put_map_to_buf
; ---------------------------------
_put_map_to_buf::
;src/include/rle_utils.h:611: __endasm;
	push	BC ; ret, bc, x, y, w, h, source, buf, buf_w, buf_h
	lda	HL, 4(SP)
	ld	D, (HL) ; D = x
	inc	HL
	ld	E, (HL) ; E = y
	lda	HL, 9(SP)
	ld	B, (HL) ; BC = source
	dec	HL
	ld	C, (HL)
	dec	HL
	ld	A, (HL-) ; A = h
	ld	H, (HL) ; H = w
	ld	L, A ; L = h
	ld	A, H ; check x bound
	add	D
	push	HL
	lda	HL, 14(SP) ; &buf_w
	cp	(HL) ; buf_w
	jr	C, $putitm08
	ld	A, D
	cp	(HL) ; buf_w
	jp	NC, $putitm09
	ld	A, (HL) ; buf_w
	sub	D
	pop	HL
	ld	H, A
	jr	$putitm01
	$putitm08:
	pop HL
	$putitm01:
	ld A, L ; check y bound
	add	E
	push	HL
	lda	HL, 15(SP) ; &buf_h
	cp	(HL) ; buf_h
	jr	C, $putitm0A
	ld	A, E
	cp	(HL) ; buf_h
	jp	NC, $putitm09
	ld	A, (HL) ; buf_h
	sub	E
	pop	HL
	ld	L, A
	jr	$putitm07
	$putitm0A:
	pop HL
	$putitm07:
	push HL ; Store WH
	lda	HL, 12(SP) ; HL = origin
	ld	A, (HL+)
	ld	H, (HL)
	ld	L, A
	$putitm02:
	push BC ; Store source
	xor	A
	or	E
	jr	Z, $putitm03
	push	HL
	lda	HL, 18(SP) ; &buf_w
	ld	B, #0
	ld	C, (HL) ; buf_w
	pop	HL
	$putitm04:
	add HL, BC ; Y coordinate
	dec	E
	jr	NZ, $putitm04
	$putitm03:
	ld B, #0x00 ; X coordinate
	ld	C, D
	add	HL, BC
	pop	BC ; BC = source
	pop	DE ; DE = WH
	push	HL ; Store origin
	push	DE ; Store WH
	push	BC
	$putitm05:
	ld A, (BC) ; just single tile
	ld	(HL+), A
	inc	BC
	dec	D
	jr	NZ,$putitm05
	pop	BC
	pop	HL ; HL = WH
	ld	D,H ; Restore D = W
	pop	HL ; HL = origin
	dec	E
	jr	Z,$putitm06
	push	HL ; Next line
	lda	HL, 14(SP)
	ld	A, (HL) ; buf_w
	pop	HL
	add	L
	ld	L, A
	ld	A, H
	adc	#0
	ld	H, A
	push	HL
	lda	HL, 8(SP)
	ld	L, (HL)
	ld	H, #0
	add	HL, BC
	ld	B, H
	ld	C, L
	pop	HL
	push	HL ; Store current origin
	push	DE ; Store WH
	push	BC
	jr	$putitm05
	$putitm09:
	pop HL
	$putitm06:
	pop BC
	ret
;src/include/rle_utils.h:612: }
;src/include/rle_utils.h:615: void get_map_from_buf(UBYTE x, UBYTE y, UBYTE w, UBYTE h, unsigned char * dest, unsigned char * buf, UBYTE buf_w, UBYTE buf_h) __naked
;	---------------------------------
; Function get_map_from_buf
; ---------------------------------
_get_map_from_buf::
;src/include/rle_utils.h:746: __endasm;
	push	BC ; ret, bc, x, y, w, h, dest, buf, buf_w, buf_h
	lda	HL, 4(SP)
	ld	D, (HL) ; D = x
	inc	HL
	ld	E, (HL) ; E = y
	lda	HL, 9(SP)
	ld	B, (HL) ; BC = dest
	dec	HL
	ld	C, (HL)
	dec	HL
	ld	A, (HL-) ; A = h
	ld	H, (HL) ; H = w
	ld	L, A ; L = h
	ld	A, H ; check x bound
	add	D
	push	HL
	lda	HL, 14(SP) ; &buf_w
	cp	(HL) ; buf_w
	jr	C, $getitm08
	ld	A, D
	cp	(HL) ; buf_w
	jp	NC, $getitm09
	ld	A, (HL) ; buf_w
	sub	D
	pop	HL
	ld	H, A
	jr	$getitm01
	$getitm08:
	pop HL
	$getitm01:
	ld A, L ; check y bound
	add	E
	push	HL
	lda	HL, 15(SP) ; &buf_h
	cp	(HL) ; buf_h
	jr	C, $getitm0A
	ld	A, E
	cp	(HL) ; buf_h
	jp	NC, $getitm09
	ld	A, (HL) ; buf_h
	sub	E
	pop	HL
	ld	L, A
	jr	$getitm07
	$getitm0A:
	pop HL
	$getitm07:
	push HL ; Store WH
	lda	HL, 12(SP) ; HL = origin
	ld	A, (HL+)
	ld	H, (HL)
	ld	L, A
	$getitm02:
	push BC ; Store dest
	xor	A
	or	E
	jr	Z, $getitm03
	push	HL
	lda	HL, 18(SP) ; &buf_w
	ld	B, #0
	ld	C, (HL) ; buf_w
	pop	HL
	$getitm04:
	add HL, BC ; Y coordinate
	dec	E
	jr	NZ, $getitm04
	$getitm03:
	ld B, #0x00 ; X coordinate
	ld	C, D
	add	HL, BC
	pop	BC ; BC = dest
	pop	DE ; DE = WH
	push	HL ; Store origin
	push	DE ; Store WH
	push	BC
	$getitm05:
	ld A, (HL+)
	ld	(BC), A ; just single tile
	inc	BC
	dec	D
	jr	NZ,$getitm05
	pop	BC
	pop	HL ; HL = WH
	ld	D,H ; Restore D = W
	pop	HL ; HL = origin
	dec	E
	jr	Z,$getitm06
	push	HL ; Next line
	lda	HL, 14(SP)
	ld	A, (HL) ; buf_w
	pop	HL
	add	L
	ld	L, A
	ld	A, H
	adc	#0
	ld	H, A
	push	HL
	lda	HL, 8(SP)
	ld	L, (HL)
	ld	H, #0
	add	HL, BC
	ld	B, H
	ld	C, L
	pop	HL
	push	HL ; Store current origin
	push	DE ; Store WH
	push	BC
	jr	$getitm05
	$getitm09:
	pop HL
	$getitm06:
	pop BC
	ret
;src/include/rle_utils.h:747: }
;src/include/sprite_utils.h:1: void multiple_clear_sprite_tiledata(UBYTE start, UBYTE count) __naked
;	---------------------------------
; Function multiple_clear_sprite_tiledata
; ---------------------------------
_multiple_clear_sprite_tiledata::
;src/include/sprite_utils.h:45: __endasm;
	lda	HL, 2(SP)
	ld	E, (HL) ; E = start
	inc	HL
	ld	D, (HL) ; D = count
	ld	H, #0x00 ; HL = nb_tiles
	ld	L, E
	add	HL, HL ; HL *= 16
	add	HL, HL
	add	HL, HL
	add	HL, HL
	push	BC
	ld	BC, #0x8000
	add	HL, BC
	pop	BC
	push	HL
	ld	L, D
	ld	H, #0
	add	HL, HL ; HL *= 16
	add	HL, HL
	add	HL, HL
	add	HL, HL
	ld	D, H
	ld	E, L ; DE = D * 16
	pop	HL
	$clrspt01:
	ldh A, (#_STAT_REG)
	and	#0x02
	jr	NZ, $clrspt01
	xor	A
	ld	(HL+), A
	dec	DE
	ld	A, D
	or	E
	jr	NZ, $clrspt01
	ret
;src/include/sprite_utils.h:46: }
;src/include/sprite_utils.h:48: void multiple_set_sprite_prop(UBYTE start, UBYTE count, UBYTE prop) __naked
;	---------------------------------
; Function multiple_set_sprite_prop
; ---------------------------------
_multiple_set_sprite_prop::
;src/include/sprite_utils.h:77: __endasm;
	push	BC
	lda	HL, 4(SP)
	ld	C, (HL) ; C = start
	inc	HL
	ld	E, (HL) ; E = count
	inc	HL
	ld	D, (HL) ; D = prop
	ld	B, #0x00
	sla	C ; Multiply C by 4
	sla	C
	ld	HL, #0xC000 + 3
	add	HL, BC
	ld	C, #0x04
	ld	A, D ; Set sprite properties
	$setspp01:
	ld (HL), A
	add	HL, BC
	dec	E
	jr	NZ, $setspp01
	pop	BC
	ret
;src/include/sprite_utils.h:78: }
;src/include/sprite_utils.h:80: void multiple_set_sprite_tiles(UBYTE start, UBYTE count, const unsigned char * tiles) __naked
;	---------------------------------
; Function multiple_set_sprite_tiles
; ---------------------------------
_multiple_set_sprite_tiles::
;src/include/sprite_utils.h:119: __endasm;
	push	BC
	lda	HL, 4(SP)
	ld	C, (HL) ; C = start
	inc	HL
	ld	E, (HL) ; E = count
	inc	HL
	ld	A, (HL+)
	ld	H, (HL)
	ld	L, A
	push	HL ; HL = tiles
	ld	B, #0x00
	sla	C ; Multiply C by 4
	sla	C
	ld	HL, #0xC000 + 2
	add	HL, BC
	ld	C, #0x04
	ld	A, E ; E --> A = count
	pop	DE ; HL --> DE = tiles
	$setspt01:
	push AF
	ld	A, (DE)
	inc	DE
	ld	(HL), A
	add	HL, BC
	pop	AF
	dec	A
	jr	NZ, $setspt01
	pop	BC
	ret
;src/include/sprite_utils.h:120: }
;src/include/sprite_utils.h:122: void multiple_move_sprites(UBYTE start, UBYTE count, UBYTE x, UBYTE y, const unsigned char * offsets) __naked
;	---------------------------------
; Function multiple_move_sprites
; ---------------------------------
_multiple_move_sprites::
;src/include/sprite_utils.h:176: __endasm;
	push	BC
	lda	HL, 4(SP)
	ld	C, (HL) ; C = start
	inc	HL
	ld	A, (HL) ; A = count
	ld	B, #0x00
	sla	C ; Multiply C by 4
	sla	C
	ld	HL, #0xC000
	add	HL, BC
	push	HL
	lda	HL, 11(SP)
	ld	B, (HL)
	dec	HL
	ld	C, (HL) ; BC = offsets
	dec	HL
	ld	D, (HL) ; D = y
	dec	HL
	ld	E, (HL) ; E = x
	pop	HL
	$mmspr02:
	push AF
	ld	A, (BC)
	inc	BC
	add	D
	ld	(HL), A
	ld	A, (BC)
	inc	BC
	push	BC
	ld	BC, #1
	add	HL, BC ; use add instruction to avoid oam bug
	add	E
	ld	(HL), A
	ld	C, #3
	add	HL, BC ; use add instruction to avoid oam bug
	pop	BC
	pop	AF
	dec	A
	jr	NZ, $mmspr02
	pop	BC
	ret
;src/include/sprite_utils.h:177: }
;src/include/sprite_utils.h:179: void multiple_move_sprites_limits(UBYTE start, UBYTE count, UBYTE x, UBYTE y, const unsigned char * offsets, UBYTE dx, UBYTE dy) __naked
;	---------------------------------
; Function multiple_move_sprites_limits
; ---------------------------------
_multiple_move_sprites_limits::
;src/include/sprite_utils.h:281: __endasm;
	push	BC
	lda	HL, 4(SP)
	ld	C, (HL) ; C = start
	inc	HL
	ld	A, (HL) ; A = count
	ld	B, #0x00
	sla	C ; Multiply C by 4
	sla	C
	ld	HL, #0xC000
	add	HL, BC
	push	HL
	lda	HL, 11(SP)
	ld	B, (HL)
	dec	HL
	ld	C, (HL) ; BC = offsets
	dec	HL
	ld	D, (HL) ; D = y
	dec	HL
	ld	E, (HL) ; E = x
	pop	HL
	$mmsprd02:
	push AF
	ld	A, (BC) ; Y coordinate
	inc	BC
	add	D
	push	HL
	ld	H, B
	ld	L, C
	cp	(HL)
	jr	NC, $mmsprd03
	xor	A
	jr	$mmsprd04
	$mmsprd03:
	inc HL
	cp	(HL)
	jr	C, $mmsprd04
	jr	Z, $mmsprd04
	xor	A
	$mmsprd04:
	or A
	jr	Z, $mmsprd07
	lda	HL, 15(SP)
	add	(HL)
	$mmsprd07:
	pop HL
	inc	BC
	inc	BC
	ld	(HL), A
	push	BC
	ld	BC, #1
	add	HL, BC ; use add instruction to avoid oam bug
	pop	BC
	ld	A, (BC) ; X coordinate
	inc	BC
	add	E
	push	HL
	ld	H, B
	ld	L, C
	cp	(HL)
	jr	NC, $mmsprd05
	xor	A
	jr	$mmsprd06
	$mmsprd05:
	inc HL
	cp	(HL)
	jr	C, $mmsprd06
	jr	Z, $mmsprd06
	xor	A
	$mmsprd06:
	or A
	jr	Z, $mmsprd08
	lda	HL, 14(SP)
	add	(HL)
	$mmsprd08:
	pop HL
	inc	BC
	inc	BC
	ld	(HL), A
	push	BC
	ld	BC, #3
	add	HL, BC ; use add instruction to avoid oam bug
	pop	BC
	pop	AF
	dec	A
	jr	NZ, $mmsprd02
	pop	BC
	ret
;src/include/sprite_utils.h:282: }
;src/include/energy.h:26: void unshrink_and_mask(UBYTE npix, const unsigned char * source, unsigned char * dest) {
;	---------------------------------
; Function unshrink_and_mask
; ---------------------------------
_unshrink_and_mask::
	dec	sp
	dec	sp
;src/include/energy.h:27: UBYTE mask = (0xFF << (8 - npix));
	ldhl	sp,	#4
	ld	c, (hl)
	ld	a, #0x08
	sub	a, c
	ld	c, a
	ldhl	sp,	#0
	ld	(hl), #0xff
	inc	c
	jr	00119$
00118$:
	ldhl	sp,	#0
	sla	(hl)
00119$:
	dec	c
	jr	NZ,00118$
;src/include/energy.h:28: source++;
	ldhl	sp,	#5
	inc	(hl)
	jr	NZ, 00120$
	inc	hl
	inc	(hl)
00120$:
;src/include/energy.h:29: for (UBYTE i = 0; i < 8; i++) {
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#1
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x08
	jr	NC, 00105$
;src/include/energy.h:30: *dest = ((*source) & mask); dest++;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (bc)
	ldhl	sp,	#0
	and	a, (hl)
	ld	(de), a
	inc	de
	ldhl	sp,	#7
	ld	a, e
	ld	(hl+), a
;src/include/energy.h:31: *dest = 0x00; dest++;
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	xor	a, a
	ld	(de), a
	inc	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/include/energy.h:32: source++;  
	inc	bc
;src/include/energy.h:29: for (UBYTE i = 0; i < 8; i++) {
	ldhl	sp,	#1
	inc	(hl)
	jr	00103$
00105$:
;src/include/energy.h:34: }
	inc	sp
	inc	sp
	ret
_dizzy_offsets:
	.db #0x26	; 38
	.db #0x04	; 4
	.db #0x2e	; 46
	.db #0x04	; 4
	.db #0x26	; 38
	.db #0x0c	; 12
	.db #0x2e	; 46
	.db #0x0c	; 12
	.db #0x26	; 38
	.db #0x14	; 20
	.db #0x2e	; 46
	.db #0x14	; 20
	.db #0x36	; 54	'6'
	.db #0x04	; 4
	.db #0x36	; 54	'6'
	.db #0x0c	; 12
	.db #0x36	; 54	'6'
	.db #0x14	; 20
_stand_ani:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.dw _m_stand_0
	.dw _m_stand_1
_up_ani:
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.dw _m_stand_0
	.dw _m_up_0
	.dw _m_up_1
	.dw _m_up_2
	.dw _m_up_3
	.dw _m_up_4
	.dw _m_up_5
	.dw _m_up_6
	.dw _m_stand_0
	.dw _m_up_0
	.dw _m_up_1
	.dw _m_up_2
	.dw _m_up_3
	.dw _m_up_4
	.dw _m_up_5
	.dw _m_up_6
_walk_r_ani:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x04	; 4
	.dw _m_walk_r_0
	.dw _m_walk_r_1
	.dw _m_walk_r_2
	.dw _m_walk_r_1
	.dw _m_walk_r_0
	.dw _m_walk_r_3
	.dw _m_walk_r_2
	.dw _m_walk_r_3
_walk_l_ani:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x05	; 5
	.dw _m_walk_l_0
	.dw _m_walk_l_1
	.dw _m_walk_l_2
	.dw _m_walk_l_1
	.dw _m_walk_l_0
	.dw _m_walk_l_3
	.dw _m_walk_l_2
	.dw _m_walk_l_3
_roll_r_ani:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x04	; 4
	.dw _m_walk_r_0
	.dw _m_roll_r_0
	.dw _m_roll_r_1
	.dw _m_roll_r_2
	.dw _m_roll_r_3
	.dw _m_roll_r_4
	.dw _m_roll_r_5
	.dw _m_roll_r_6
_roll_l_ani:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x05	; 5
	.dw _m_walk_l_0
	.dw _m_roll_l_0
	.dw _m_roll_l_1
	.dw _m_roll_l_2
	.dw _m_roll_l_3
	.dw _m_roll_l_4
	.dw _m_roll_l_5
	.dw _m_roll_l_6
_jump_r_ani:
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.dw _m_walk_r_0
	.dw _m_roll_r_0
	.dw _m_roll_r_1
	.dw _m_roll_r_2
	.dw _m_roll_r_3
	.dw _m_roll_r_4
	.dw _m_roll_r_5
	.dw _m_roll_r_6
	.dw _m_walk_r_0
	.dw _m_roll_r_0
	.dw _m_roll_r_1
	.dw _m_roll_r_2
	.dw _m_roll_r_3
	.dw _m_roll_r_4
	.dw _m_roll_r_5
	.dw _m_roll_r_6
_jump_l_ani:
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x05	; 5
	.dw _m_walk_l_0
	.dw _m_roll_l_0
	.dw _m_roll_l_1
	.dw _m_roll_l_2
	.dw _m_roll_l_3
	.dw _m_roll_l_4
	.dw _m_roll_l_5
	.dw _m_roll_l_6
	.dw _m_walk_l_0
	.dw _m_roll_l_0
	.dw _m_roll_l_1
	.dw _m_roll_l_2
	.dw _m_roll_l_3
	.dw _m_roll_l_4
	.dw _m_roll_l_5
	.dw _m_roll_l_6
_stun_ani:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.dw _m_stun_0
	.dw _m_stun_1
	.dw _m_stun_0
	.dw _m_stun_2
	.dw _m_stun_3
	.dw _m_stun_2
	.dw _m_stun_3
	.dw _m_stun_4
_dead_ani:
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x07	; 7
	.db #0x07	; 7
	.dw _m_dead_0
	.dw _m_dead_1
	.dw _m_dead_2
	.dw _m_dead_1
_animation:
	.dw _stand_ani
	.dw _up_ani
	.dw _walk_r_ani
	.dw _walk_l_ani
	.dw _roll_r_ani
	.dw _roll_l_ani
	.dw _stun_ani
	.dw _dead_ani
	.dw _jump_r_ani
	.dw _jump_l_ani
_move_y_dynamics:
	.db #0x20	; 32
	.dw #0xfffc
	.dw #0xfffc
	.dw #0xfffd
	.dw #0xfffe
	.dw #0xfffe
	.dw #0xffff
	.dw #0xfffe
	.dw #0xffff
	.dw #0xffff
	.dw #0xffff
	.dw #0xffff
	.dw #0xffff
	.dw #0x0000
	.dw #0xffff
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0002
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0003
	.dw #0x0004
	.dw #0x0004
_double_y_dynamics:
	.db #0x20	; 32
	.dw #0xfff8
	.dw #0xfff8
	.dw #0xfffa
	.dw #0xfffc
	.dw #0xfffc
	.dw #0xfffc
	.dw #0xfffd
	.dw #0xfffd
	.dw #0xfffd
	.dw #0xfffe
	.dw #0xfffe
	.dw #0xffff
	.dw #0xffff
	.dw #0xffff
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0006
	.dw #0x0008
	.dw #0x0008
_move_y_data:
	.dw #0x0000
	.dw _move_y_dynamics
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw _move_y_dynamics
	.dw _move_y_dynamics
_double_y_data:
	.dw #0x0000
	.dw _double_y_dynamics
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw _double_y_dynamics
	.dw _double_y_dynamics
_move_x_data:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0xffff
	.dw #0x0001
	.dw #0xffff
	.dw #0x0000
	.dw #0x0000
	.dw #0x0001
	.dw #0xffff
_fly_offsets:
	.db #0x28	; 40
	.db #0x08	; 8
_fly_delta:
	.dw #0xfffc
	.dw #0xfffd
	.dw #0xfffe
	.dw #0x0000
	.dw #0x0000
	.dw #0x0002
	.dw #0x0003
	.dw #0x0004
_dizzy_world:
	.dw _world_row_0
	.dw _world_row_1
_world_row_0:
	.db #0x00	; 0
	.dw _room_0_0
	.dw _room_1_0
	.dw _room_2_0
	.dw _room_3_0
	.dw _room_4_0
	.dw _room_5_0
_world_row_1:
	.db #0x01	; 1
	.dw _room_0_1
	.dw _room_1_1
	.dw _room_2_1
	.dw _room_3_1
	.dw _room_4_1
	.dw _room_5_1
_room_0_0:
	.db #0x03	; 3
	.dw _room_0_0_map
	.dw _room_0_0_coll
	.dw _room_0_0_tiles
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
_room_1_0:
	.db #0x03	; 3
	.dw _room_1_0_map
	.dw _room_1_0_coll
	.dw _room_1_0_tiles
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
_room_2_0:
	.db #0x03	; 3
	.dw _room_2_0_map
	.dw _room_2_0_coll
	.dw _room_2_0_tiles
	.dw _enemies_2_0_tiles
	.dw _init_room2_0
	.dw _move_spider
	.dw _draw_spider
	.dw #0x0000
	.dw #0x0000
	.dw _coll_spider
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
_room_3_0:
	.db #0x03	; 3
	.dw _room_3_0_map
	.dw _room_3_0_coll
	.dw _room_3_0_tiles
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
_room_4_0:
	.db #0x03	; 3
	.dw _room_4_0_map
	.dw _room_4_0_coll
	.dw _room_4_0_tiles
	.dw _enemies_4_0_tiles
	.dw _init_room4_0
	.dw _move_flies4_0
	.dw _draw_flies4_0
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw _dizzy_catches_firefly
	.dw #0x0000
	.dw #0x0000
_room_5_0:
	.db #0x03	; 3
	.dw _room_5_0_map
	.dw _room_5_0_coll
	.dw _room_5_0_tiles
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw _grand_gets_pie
	.dw #0x0000
	.dw #0x0000
_room_0_1:
	.db #0x04	; 4
	.dw _room_0_1_map
	.dw _room_0_1_coll
	.dw _room_0_1_tiles
	.dw _enemies_0_1_tiles
	.dw _init_room0_1
	.dw _move_bats0
	.dw _draw_bats0
	.dw _hcoll_darkness
	.dw #0x0000
	.dw _coll_bats
	.dw _dizzy_drops_firefly
	.dw _reset_room0_1
	.dw _draw_room0_1
_room_1_1:
	.db #0x04	; 4
	.dw _room_1_1_map
	.dw _room_1_1_coll
	.dw _room_1_1_tiles
	.dw _enemies_1_1_tiles
	.dw _init_room1_1
	.dw #0x0000
	.dw _draw_flames1_1
	.dw _hcoll_blockage
	.dw _vcoll_blockage
	.dw #0x0000
	.dw _cleaning_path
	.dw _reset_room1
	.dw #0x0000
_room_2_1:
	.db #0x04	; 4
	.dw _room_2_1_map
	.dw _room_2_1_coll
	.dw _room_2_1_tiles
	.dw _enemies_2_1_tiles
	.dw _init_room2
	.dw _move_elevator
	.dw _draw_elevator
	.dw _hcoll_elevator
	.dw _vcoll_dylan
	.dw #0x0000
	.dw _dylan_gets_key
	.dw _reset_room2
	.dw #0x0000
_room_3_1:
	.db #0x05	; 5
	.dw _room_3_1_map
	.dw _room_3_1_coll
	.dw _room_3_1_tiles
	.dw _enemies_34_1_tiles
	.dw _init_room34
	.dw _move_float
	.dw _draw_float3
	.dw _hcoll_float3
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
_room_4_1:
	.db #0x05	; 5
	.dw _room_4_1_map
	.dw _room_4_1_coll
	.dw _room_4_1_tiles
	.dw _enemies_34_1_tiles
	.dw _init_room34
	.dw _move_float
	.dw _draw_float4
	.dw _hcoll_float4
	.dw _vcoll_troll
	.dw #0x0000
	.dw #0x0000
	.dw _reset_room4
	.dw #0x0000
_room_5_1:
	.db #0x05	; 5
	.dw _room_5_1_map
	.dw _room_5_1_coll
	.dw _room_5_1_tiles
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw _hcoll_mushroom
	.dw _vcoll_daisy
	.dw #0x0000
	.dw _daisy_gets_mushrooms
	.dw _reset_room5_1
	.dw #0x0000
_ptr_div_reg:
	.dw #0xff04
_empty_compressed_map:
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
_evil_hide:
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
_current_coll_idx:
	.dw (_coll_buf + 0)
	.dw (_coll_buf + 30)
	.dw (_coll_buf + 60)
	.dw (_coll_buf + 90)
	.dw (_coll_buf + 120)
	.dw (_coll_buf + 150)
	.dw (_coll_buf + 180)
	.dw (_coll_buf + 210)
	.dw (_coll_buf + 240)
	.dw (_coll_buf + 270)
	.dw (_coll_buf + 300)
	.dw (_coll_buf + 330)
	.dw (_coll_buf + 360)
	.dw (_coll_buf + 390)
	.dw (_coll_buf + 420)
	.dw (_coll_buf + 450)
	.dw (_coll_buf + 480)
_ethalon_indicator:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
_ethalon_tiles_offsets:
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x12	; 18
;src/include/energy.h:36: void init_dizzy_coins() { coins = 0; }
;	---------------------------------
; Function init_dizzy_coins
; ---------------------------------
_init_dizzy_coins::
	ld	hl, #_coins
	ld	(hl), #0x00
	ret
;src/include/energy.h:37: void init_dizzy_lives() { dizzy_lives = 3; }
;	---------------------------------
; Function init_dizzy_lives
; ---------------------------------
_init_dizzy_lives::
	ld	hl, #_dizzy_lives
	ld	(hl), #0x03
	ret
;src/include/energy.h:38: void init_dizzy_energy() { dizzy_energy = 16; inc_energy = 48; dec_energy = 0; }
;	---------------------------------
; Function init_dizzy_energy
; ---------------------------------
_init_dizzy_energy::
	ld	hl, #_dizzy_energy
	ld	(hl), #0x10
	ld	hl, #_inc_energy
	ld	(hl), #0x30
	ld	hl, #_dec_energy
	ld	(hl), #0x00
	ret
;src/include/energy.h:40: void on_dizzy_die() {
;	---------------------------------
; Function on_dizzy_die
; ---------------------------------
_on_dizzy_die::
;src/include/energy.h:41: ani_type = ANI_DEAD;
	ld	hl, #_ani_type
	ld	(hl), #0x07
;src/include/energy.h:42: ani_phase = 0; 
	ld	hl, #_ani_phase
	ld	(hl), #0x00
;src/include/energy.h:43: current_dyn = 0; current_dyn_phase = 0;
	xor	a, a
	ld	hl, #_current_dyn
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #_current_dyn_phase
	ld	(hl), #0x00
;src/include/energy.h:44: death_pause = 32;
	ld	hl, #_death_pause
	ld	(hl), #0x20
;src/include/energy.h:45: }
	ret
;src/include/energy.h:46: void show_lives() {
;	---------------------------------
; Function show_lives
; ---------------------------------
_show_lives::
;src/include/energy.h:47: for (__temp_i = 0; __temp_i < 3; __temp_i++) {
	ld	hl, #___temp_i
	ld	(hl), #0x00
00105$:
;src/include/energy.h:48: if (__temp_i < dizzy_lives) dizzy_lives_indicator[__temp_i] = dizzy_live_symbol; else dizzy_lives_indicator[__temp_i] = 0x00;
	ld	a, #<(_dizzy_lives_indicator)
	ld	hl, #___temp_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_dizzy_lives_indicator)
	adc	a, #0x00
	ld	b, a
	ld	a, (hl)
	ld	hl, #_dizzy_lives
	sub	a, (hl)
	jr	NC, 00102$
	ld	a, (#_dizzy_live_symbol)
	ld	(bc), a
	jr	00106$
00102$:
	xor	a, a
	ld	(bc), a
00106$:
;src/include/energy.h:47: for (__temp_i = 0; __temp_i < 3; __temp_i++) {
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00105$
;src/include/energy.h:50: set_win_tiles(15, 1, sizeof(dizzy_lives_indicator), 1, dizzy_lives_indicator);    
	ld	de, #_dizzy_lives_indicator
	push	de
	ld	hl, #0x103
	push	hl
	ld	hl, #0x10f
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/include/energy.h:51: }
	ret
;src/include/energy.h:53: void add_coins(UBYTE n) __naked 
;	---------------------------------
; Function add_coins
; ---------------------------------
_add_coins::
;src/include/energy.h:63: __endasm;
	ld	A, (#_coins)
	lda	HL, 2(SP)
	add	(HL)
	daa
	ld	(#_coins), A
	ret
;src/include/energy.h:64: }
;src/include/energy.h:65: void sub_coins(UBYTE n) __naked 
;	---------------------------------
; Function sub_coins
; ---------------------------------
_sub_coins::
;src/include/energy.h:75: __endasm;
	ld	A, (#_coins)
	lda	HL, 2(SP)
	sub	(HL)
	daa
	ld	(#_coins), A
	ret
;src/include/energy.h:76: }
;src/include/energy.h:77: void show_coins() {
;	---------------------------------
; Function show_coins
; ---------------------------------
_show_coins::
;src/include/energy.h:78: coins_indicator[0] = (coins >> 4) + digits_start;
	ld	bc, #_coins_indicator+0
	ld	a, (#_coins)
	swap	a
	and	a, #0x0f
	ld	hl, #_digits_start
	add	a, (hl)
	ld	(bc), a
;src/include/energy.h:79: coins_indicator[1] = (coins & 0x0F) + digits_start;
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (#_coins)
	and	a, #0x0f
	ld	hl, #_digits_start
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	add	a, l
	ld	(de), a
;src/include/energy.h:80: set_win_tiles(2, 1, sizeof(coins_indicator), 1, coins_indicator);
	push	bc
	ld	hl, #0x102
	push	hl
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/include/energy.h:81: }
	ret
;src/include/energy.h:83: void show_energy() {
;	---------------------------------
; Function show_energy
; ---------------------------------
_show_energy::
;src/include/energy.h:84: push_bank(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
;src/include/energy.h:85: __temp_k = dizzy_energy;
	ld	a, (#_dizzy_energy)
	ld	(#___temp_k),a
;src/include/energy.h:86: for (__temp_i = 0; __temp_i < 8; __temp_i++) {
	ld	hl, #___temp_i
	ld	(hl), #0x00
00108$:
;src/include/energy.h:89: dizzy_energy_indicator[__temp_i] = (dizzy_energy_start + ethalon_indicator[__temp_i]);
	ld	a, #<(_dizzy_energy_indicator)
	ld	hl, #___temp_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_dizzy_energy_indicator)
	adc	a, #0x00
	ld	b, a
;src/include/energy.h:87: if (__temp_k) {
	ld	a, (#___temp_k)
	or	a, a
	jr	Z, 00105$
;src/include/energy.h:89: dizzy_energy_indicator[__temp_i] = (dizzy_energy_start + ethalon_indicator[__temp_i]);
	ld	a, #<(_ethalon_indicator)
	ld	hl, #___temp_i
	add	a, (hl)
	ld	e, a
	ld	a, #>(_ethalon_indicator)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	e, a
;src/include/energy.h:88: if (__temp_k >= 8) {
	ld	a, (#___temp_k)
	sub	a, #0x08
	jr	C, 00102$
;src/include/energy.h:89: dizzy_energy_indicator[__temp_i] = (dizzy_energy_start + ethalon_indicator[__temp_i]);
	ld	a, e
	ld	hl, #_dizzy_energy_start
	add	a, (hl)
	ld	(bc), a
;src/include/energy.h:90: __temp_k -= 8;
	ld	hl, #___temp_k
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
	jr	00109$
00102$:
;src/include/energy.h:92: unshrink_and_mask(__temp_k, ((unsigned char *)energy_tiles) + 1 + ethalon_tiles_offsets[ethalon_indicator[__temp_i]], temp_tile_buffer);
	ld	bc, #_energy_tiles
	inc	bc
	ld	hl, #_ethalon_tiles_offsets
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
	add	hl, bc
	ld	de, #_temp_tile_buffer
	push	de
	push	hl
	ld	a, (#___temp_k)
	push	af
	inc	sp
	call	_unshrink_and_mask
	add	sp, #5
;src/include/energy.h:93: set_win_data(dizzy_energy_start + 3, 1, temp_tile_buffer);
	ld	hl, #_dizzy_energy_start
	ld	a, (hl)
	add	a, #0x03
	ld	de, #_temp_tile_buffer
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_data
	add	sp, #4
;src/include/energy.h:94: dizzy_energy_indicator[__temp_i] = dizzy_energy_start + 3;
	ld	a, #<(_dizzy_energy_indicator)
	ld	hl, #___temp_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_dizzy_energy_indicator)
	adc	a, #0x00
	ld	b, a
	ld	a, (#_dizzy_energy_start)
	add	a, #0x03
	ld	(bc), a
;src/include/energy.h:95: __temp_k = 0;
	ld	hl, #___temp_k
	ld	(hl), #0x00
	jr	00109$
00105$:
;src/include/energy.h:98: dizzy_energy_indicator[__temp_i] = 0x00;
	xor	a, a
	ld	(bc), a
00109$:
;src/include/energy.h:86: for (__temp_i = 0; __temp_i < 8; __temp_i++) {
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x08
	jp	C, 00108$
;src/include/energy.h:101: set_win_tiles(6, 1, sizeof(dizzy_energy_indicator), 1, dizzy_energy_indicator);
	ld	de, #_dizzy_energy_indicator
	push	de
	ld	hl, #0x108
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, #0x06
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;src/include/energy.h:102: pop_bank();
;src/include/energy.h:103: }
	jp	_pop_bank
;src/include/energy.h:104: void update_energy() {
;	---------------------------------
; Function update_energy
; ---------------------------------
_update_energy::
;src/include/energy.h:105: dizzy_energy_old = dizzy_energy;
	ld	a, (#_dizzy_energy)
	ld	(#_dizzy_energy_old),a
;src/include/energy.h:106: if (dec_energy) {
	ld	hl, #_dec_energy
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;src/include/energy.h:107: dec_energy--;
	dec	(hl)
;src/include/energy.h:108: if (dizzy_energy) {
	ld	hl, #_dizzy_energy
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;src/include/energy.h:109: dizzy_energy--;
	dec	(hl)
;src/include/energy.h:110: SND_HIT;
	ld	de, #0x0086
	push	de
	ld	de, #0x0010
	push	de
	ld	de, #0x0041
	push	de
	xor	a, a
	push	af
	ld	de, #0x0000
	push	de
	ld	hl, #0x400
	push	hl
	call	_PlayFx
	add	sp, #12
00102$:
;src/include/energy.h:112: if (!dizzy_energy) dec_energy = 0;
	ld	a, (#_dizzy_energy)
	or	a, a
	jr	NZ, 00112$
	ld	hl, #_dec_energy
	ld	(hl), #0x00
	jr	00112$
00111$:
;src/include/energy.h:113: } else if (inc_energy) {
	ld	a, (#_inc_energy)
	or	a, a
	jr	Z, 00112$
;src/include/energy.h:114: dizzy_energy++; 
	ld	hl, #_dizzy_energy
	inc	(hl)
;src/include/energy.h:115: if (dizzy_energy > 64) { 
	ld	a, #0x40
	sub	a, (hl)
	jr	NC, 00106$
;src/include/energy.h:116: dizzy_energy = 64;
	ld	(hl), #0x40
;src/include/energy.h:117: inc_energy = 0;
	ld	hl, #_inc_energy
	ld	(hl), #0x00
	jr	00112$
00106$:
;src/include/energy.h:118: } else inc_energy--;
	ld	hl, #_inc_energy
	dec	(hl)
00112$:
;src/include/energy.h:120: if (dizzy_energy != dizzy_energy_old) {
	ld	a, (#_dizzy_energy)
	ld	hl, #_dizzy_energy_old
	sub	a, (hl)
	ret	Z
;src/include/energy.h:121: if (!dizzy_energy) { 
	ld	hl, #_dizzy_energy
	ld	a, (hl)
	or	a, a
	jp	NZ,_show_energy
;src/include/energy.h:122: if (!death_pause) {
	ld	hl, #_death_pause
	ld	a, (hl)
	or	a, a
	jp	NZ,_show_energy
;src/include/energy.h:123: if (dizzy_lives) dizzy_lives--;
	ld	hl, #_dizzy_lives
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
	dec	(hl)
00114$:
;src/include/energy.h:124: show_lives();
	call	_show_lives
;src/include/energy.h:125: on_dizzy_die();
	call	_on_dizzy_die
;src/include/energy.h:126: if (!dizzy_lives) game_over = 1;
	ld	hl, #_dizzy_lives
	ld	a, (hl)
	or	a, a
	jp	NZ,_show_energy
	ld	hl, #_game_over
	ld	(hl), #0x01
;src/include/energy.h:129: show_energy();
;src/include/energy.h:131: }
	jp	_show_energy
;src/mushroompie.c:82: WORD get_x_scroll_value(WORD x) {
;	---------------------------------
; Function get_x_scroll_value
; ---------------------------------
_get_x_scroll_value::
;src/mushroompie.c:83: __temp_scroll_value = x - 68;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0044
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	hl, #___temp_scroll_value + 1
	ld	(hl-), a
;src/mushroompie.c:84: if (__temp_scroll_value < 0) return 0; else if (__temp_scroll_value > 80) return 80; 
	ld	a, e
	ld	(hl+), a
	bit	7, (hl)
	jr	Z, 00104$
	ld	de, #0x0000
	ret
00104$:
	ld	hl, #___temp_scroll_value
	ld	a, #0x50
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00118$
	bit	7, d
	jr	NZ, 00119$
	cp	a, a
	jr	00119$
00118$:
	bit	7, d
	jr	Z, 00119$
	scf
00119$:
	jr	NC, 00105$
	ld	de, #0x0050
	ret
00105$:
;src/mushroompie.c:85: return __temp_scroll_value;
	ld	hl, #___temp_scroll_value
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;src/mushroompie.c:86: }
	ret
;src/mushroompie.c:87: WORD get_y_scroll_value(WORD y) {
;	---------------------------------
; Function get_y_scroll_value
; ---------------------------------
_get_y_scroll_value::
;src/mushroompie.c:88: __temp_scroll_value = y - 56;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0038
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	hl, #___temp_scroll_value + 1
	ld	(hl-), a
;src/mushroompie.c:89: if (__temp_scroll_value < 0) return 0; else if (__temp_scroll_value > 16) return 16;
	ld	a, e
	ld	(hl+), a
	bit	7, (hl)
	jr	Z, 00104$
	ld	de, #0x0000
	ret
00104$:
	ld	hl, #___temp_scroll_value
	ld	a, #0x10
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00118$
	bit	7, d
	jr	NZ, 00119$
	cp	a, a
	jr	00119$
00118$:
	bit	7, d
	jr	Z, 00119$
	scf
00119$:
	jr	NC, 00105$
	ld	de, #0x0010
	ret
00105$:
;src/mushroompie.c:90: return __temp_scroll_value;
	ld	hl, #___temp_scroll_value
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;src/mushroompie.c:91: }
	ret
;src/mushroompie.c:97: void get_h_coll(WORD x, WORD y) {
;	---------------------------------
; Function get_h_coll
; ---------------------------------
_get_h_coll::
;src/mushroompie.c:98: tile_pos_x = x >> 3; tile_pos_ox = x & 7;
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
	and	a, #0x07
	ld	(#_tile_pos_ox),a
;src/mushroompie.c:99: tile_pos_y = y >> 3; tile_pos_oy = y & 7;
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
;src/mushroompie.c:100: if (tile_pos_y < room_height) {
	ld	hl, #_tile_pos_y
	ld	a, (hl)
	sub	a, #0x11
	jr	NC, 00106$
;src/mushroompie.c:101: __temp_coll_row = current_coll_idx[tile_pos_y];
	ld	bc, #_current_coll_idx+0
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #___temp_coll_row
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/mushroompie.c:102: collision_buf[0] = __temp_coll_row[tile_pos_x]; collision_buf[1] = __temp_coll_row[tile_pos_x + 1];
	ld	bc, #_collision_buf+0
	ld	a, (#___temp_coll_row)
	ld	hl, #_tile_pos_x
	add	a, (hl)
	ld	e, a
	ld	a, (#___temp_coll_row + 1)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(bc), a
	ld	hl, #_tile_pos_x
	ld	e, (hl)
	ld	d, #0x00
	inc	de
	ld	a, e
	ld	hl, #___temp_coll_row
	add	a, (hl)
	inc	hl
	ld	e, a
	ld	a, d
	adc	a, (hl)
	ld	d, a
	ld	a, (de)
	ld	(#(_collision_buf + 1)),a
;src/mushroompie.c:103: if ((tile_pos_ox) && (tile_pos_x < room_width - 2)) collision_buf[2] = __temp_coll_row[tile_pos_x + 2]; else collision_buf[2] = 0x00;
	inc	bc
	inc	bc
	ld	a, (#_tile_pos_ox)
	or	a, a
	jr	Z, 00102$
	ld	hl, #_tile_pos_x
	ld	a, (hl)
	sub	a, #0x1c
	jr	NC, 00102$
	ld	e, (hl)
	ld	d, #0x00
	inc	de
	inc	de
	ld	a, e
	ld	hl, #___temp_coll_row
	add	a, (hl)
	inc	hl
	ld	e, a
	ld	a, d
	adc	a, (hl)
	ld	d, a
	ld	a, (de)
	ld	(bc), a
	ret
00102$:
	xor	a, a
	ld	(bc), a
	ret
00106$:
;src/mushroompie.c:104: } else { collision_buf[0] = 0x00; collision_buf[1] = 0x00; collision_buf[2] = 0x00; }
	ld	bc, #_collision_buf+0
	xor	a, a
	ld	(bc), a
	ld	hl, #(_collision_buf + 1)
	ld	(hl), #0x00
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;src/mushroompie.c:105: }
	ret
;src/mushroompie.c:106: void get_v_coll(WORD x, WORD y) {
;	---------------------------------
; Function get_v_coll
; ---------------------------------
_get_v_coll::
;src/mushroompie.c:107: tile_pos_x = x >> 3; 
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
;src/mushroompie.c:108: if (tile_pos_x < room_width) {
	ld	a, (hl)
	sub	a, #0x1e
	jr	NC, 00108$
;src/mushroompie.c:109: tile_pos_y = y >> 3;
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
;src/mushroompie.c:110: if (tile_pos_y < room_height) { 
	ld	a, (hl)
	sub	a, #0x11
	jr	NC, 00102$
;src/mushroompie.c:111: collision_buf[0] = current_coll_idx[tile_pos_y][tile_pos_x]; 
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_current_coll_idx
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_tile_pos_x
	add	a, (hl)
	ld	c, a
	jr	NC, 00127$
	inc	b
00127$:
	ld	a, (bc)
	ld	(#_collision_buf),a
	jr	00103$
00102$:
;src/mushroompie.c:113: collision_buf[0] = 0x00; 
	ld	hl, #_collision_buf
	ld	(hl), #0x00
;src/mushroompie.c:114: tile_pos_y = 0; 
	ld	hl, #_tile_pos_y
	ld	(hl), #0x00
00103$:
;src/mushroompie.c:116: if (tile_pos_y < room_height - 1) collision_buf[1] = current_coll_idx[tile_pos_y + 1][tile_pos_x]; else collision_buf[1] = 0x00;
	ld	a, (#_tile_pos_y)
	cp	a,#0x10
	jr	NC, 00105$
	inc	a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_current_coll_idx
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_tile_pos_x
	add	a, (hl)
	ld	c, a
	jr	NC, 00128$
	inc	b
00128$:
	ld	a, (bc)
	ld	(#(_collision_buf + 1)),a
	ret
00105$:
	ld	hl, #(_collision_buf + 1)
	ld	(hl), #0x00
	ret
00108$:
;src/mushroompie.c:117: } else { collision_buf[0] = 0x00; collision_buf[1] = 0x00;}
	ld	bc, #_collision_buf+0
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;src/mushroompie.c:118: }
	ret
;src/mushroompie.c:119: void get_coll(WORD x, WORD y) {
;	---------------------------------
; Function get_coll
; ---------------------------------
_get_coll::
;src/mushroompie.c:120: __temp_i = ((x > 0)?(x >> 3):0);
	ldhl	sp,	#2
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00178$
	bit	7, d
	jr	NZ, 00179$
	cp	a, a
	jr	00179$
00178$:
	bit	7, d
	jr	Z, 00179$
	scf
00179$:
	jr	NC, 00119$
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
	jr	00120$
00119$:
	ld	bc, #0x0000
00120$:
	ld	hl, #___temp_i
	ld	(hl), c
;src/mushroompie.c:121: __temp_j = (x + 16) >> 3; if (__temp_j >= room_width) __temp_j = room_width - 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #___temp_j
	ld	(hl), c
	ld	a, (hl)
	sub	a, #0x1e
	jr	C, 00102$
	ld	(hl), #0x1d
00102$:
;src/mushroompie.c:122: __temp_k = ((y > 0)?(y >> 3):0);
	ldhl	sp,	#4
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00180$
	bit	7, d
	jr	NZ, 00181$
	cp	a, a
	jr	00181$
00180$:
	bit	7, d
	jr	Z, 00181$
	scf
00181$:
	jr	NC, 00121$
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
	jr	00122$
00121$:
	ld	bc, #0x0000
00122$:
	ld	hl, #___temp_k
	ld	(hl), c
;src/mushroompie.c:123: __temp_l = (y + 16) >> 3; if (__temp_l >= room_height) __temp_l = room_height - 1;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #___temp_l
	ld	(hl), c
	ld	a, (hl)
	sub	a, #0x11
	jr	C, 00104$
	ld	(hl), #0x10
00104$:
;src/mushroompie.c:125: collision_buf[0] = 0; collision_buf[1] = 0;
	ld	bc, #_collision_buf+0
	xor	a, a
	ld	(bc), a
	ld	hl, #(_collision_buf + 1)
	ld	(hl), #0x00
;src/mushroompie.c:126: for (__temp_k = __temp_k; __temp_k <= __temp_l; __temp_k++) {
00115$:
	ld	a, (#___temp_l)
	ld	hl, #___temp_k
	sub	a, (hl)
	ret	C
;src/mushroompie.c:127: __temp_coll_row = current_coll_idx[__temp_k];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_current_coll_idx
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #___temp_coll_row
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/mushroompie.c:128: for (__temp_m = __temp_i; __temp_m <= __temp_j; __temp_m++) {
	ld	a, (#___temp_i)
	ld	(#___temp_m),a
00112$:
	ld	a, (#___temp_j)
	ld	hl, #___temp_m
	sub	a, (hl)
	jr	C, 00116$
;src/mushroompie.c:129: switch (__temp_coll_row[__temp_m]) {
	ld	a, (#___temp_coll_row)
	ld	hl, #___temp_m
	add	a, (hl)
	ld	e, a
	ld	a, (#___temp_coll_row + 1)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	cp	a, #0x04
	jr	Z, 00105$
	cp	a, #0x06
	jr	Z, 00106$
	sub	a, #0x07
	jr	Z, 00107$
	jr	00113$
;src/mushroompie.c:130: case 4 : collision_buf[1] = 4; break;
00105$:
	ld	hl, #(_collision_buf + 1)
	ld	(hl), #0x04
	jr	00113$
;src/mushroompie.c:131: case 6 : collision_buf[0] = 6; break;
00106$:
	ld	a, #0x06
	ld	(bc), a
	jr	00113$
;src/mushroompie.c:132: case 7 : collision_buf[0] = 7; return;
00107$:
	ld	a, #0x07
	ld	(bc), a
	ret
;src/mushroompie.c:133: }
00113$:
;src/mushroompie.c:128: for (__temp_m = __temp_i; __temp_m <= __temp_j; __temp_m++) {
	ld	hl, #___temp_m
	inc	(hl)
	jr	00112$
00116$:
;src/mushroompie.c:126: for (__temp_k = __temp_k; __temp_k <= __temp_l; __temp_k++) {
	ld	hl, #___temp_k
	inc	(hl)
;src/mushroompie.c:136: }
	jr	00115$
;src/mushroompie.c:138: void set_enemies_position() {
;	---------------------------------
; Function set_enemies_position
; ---------------------------------
_set_enemies_position::
;src/mushroompie.c:139: if (current_room) {
	ld	hl, #_current_room + 1
	ld	a, (hl-)
	or	a, (hl)
	ret	Z
;src/mushroompie.c:140: if (current_room->room_actions) current_room->room_actions();
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000b
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
;	spillPairReg hl
	ld	a, h
	or	a, c
	jr	Z, 00102$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
00102$:
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/mushroompie.c:141: if (current_room->room_animations) current_room->room_animations();
	ld	hl, #0x000d
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
;	spillPairReg hl
	ld	a, h
	or	a, c
	ret	Z
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
;src/mushroompie.c:143: }
	jp	(hl)
;src/mushroompie.c:146: void init_dizzy() {
;	---------------------------------
; Function init_dizzy
; ---------------------------------
_init_dizzy::
;src/mushroompie.c:147: for(__temp_i = 0; __temp_i < dizzy_sprite_count; __temp_i++)
	ld	hl, #___temp_i
	ld	(hl), #0x00
00103$:
;src/mushroompie.c:148: set_sprite_tile(__temp_i, dizzy_sprites_tileoffset + __temp_i);
	ld	hl, #___temp_i
	ld	c, (hl)
;c:/gb/gbdk/include/gb/gb.h:1185: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;src/mushroompie.c:147: for(__temp_i = 0; __temp_i < dizzy_sprite_count; __temp_i++)
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x09
	jr	C, 00103$
;src/mushroompie.c:149: }
	ret
;src/mushroompie.c:150: void set_dizzy_animdata(const s_data * sprite) {
;	---------------------------------
; Function set_dizzy_animdata
; ---------------------------------
_set_dizzy_animdata::
;src/mushroompie.c:151: push_bank(2); 
	ld	a, #0x02
	push	af
	inc	sp
	call	_push_bank
	inc	sp
;src/mushroompie.c:152: set_sprite_data(dizzy_sprites_tileoffset, dizzy_sprite_count, sprite->data); 
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	push	bc
	ld	a, #0x09
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;src/mushroompie.c:153: pop_bank();
;src/mushroompie.c:154: }
	jp	_pop_bank
;src/mushroompie.c:156: void set_dizzy_position() {
;	---------------------------------
; Function set_dizzy_position
; ---------------------------------
_set_dizzy_position::
;src/mushroompie.c:157: if ((dizzy_old_pos_x != dizzy_x) || (dizzy_old_pos_y != dizzy_y)) {
	ld	a, (#_dizzy_old_pos_x)
	ld	hl, #_dizzy_x
	sub	a, (hl)
	jr	NZ, 00101$
	ld	a, (#_dizzy_old_pos_x + 1)
	ld	hl, #_dizzy_x + 1
	sub	a, (hl)
	jr	NZ, 00101$
	ld	a, (#_dizzy_old_pos_y)
	ld	hl, #_dizzy_y
	sub	a, (hl)
	jr	NZ, 00113$
	ld	a, (#_dizzy_old_pos_y + 1)
	ld	hl, #_dizzy_y + 1
	sub	a, (hl)
	ret	Z
00113$:
00101$:
;src/mushroompie.c:158: bkg_scroll_x_target = get_x_scroll_value(dizzy_x); 
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_x_scroll_value
	pop	hl
	ld	hl, #_bkg_scroll_x_target
	ld	(hl), e
;src/mushroompie.c:159: bkg_scroll_y_target = get_y_scroll_value(dizzy_y);
	ld	hl, #_dizzy_y
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_y_scroll_value
	pop	hl
	ld	hl, #_bkg_scroll_y_target
	ld	(hl), e
;src/mushroompie.c:160: multiple_move_sprites(0, dizzy_sprite_count, dizzy_x - bkg_scroll_x_target, dizzy_y - bkg_scroll_y_target, (unsigned char *)dizzy_offsets);
	ld	a, (#_dizzy_y)
	ld	hl, #_bkg_scroll_y_target
	ld	c, (hl)
	sub	a, c
	ld	b, a
	ld	a, (#_dizzy_x)
	ld	hl, #_bkg_scroll_x_target
	ld	c, (hl)
	sub	a, c
	ld	de, #_dizzy_offsets
	push	de
	push	bc
	inc	sp
	ld	h, a
	ld	l, #0x09
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_multiple_move_sprites
	add	sp, #6
;src/mushroompie.c:161: dizzy_old_pos_x = dizzy_x; dizzy_old_pos_y = dizzy_y;
	ld	a, (#_dizzy_x)
	ld	(#_dizzy_old_pos_x),a
	ld	a, (#_dizzy_x + 1)
	ld	(#_dizzy_old_pos_x + 1),a
	ld	a, (#_dizzy_y)
	ld	(#_dizzy_old_pos_y),a
	ld	a, (#_dizzy_y + 1)
	ld	(#_dizzy_old_pos_y + 1),a
;src/mushroompie.c:163: }    
	ret
;src/mushroompie.c:165: void check_dizzy_collisions() {
;	---------------------------------
; Function check_dizzy_collisions
; ---------------------------------
_check_dizzy_collisions::
	add	sp, #-4
;src/mushroompie.c:167: if (current_room->room_h_coll) current_room->room_h_coll(dizzy_x, dizzy_y + 21); else get_h_coll(dizzy_x, dizzy_y + 21);
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/mushroompie.c:166: if (delta_y >= 0) {
	ld	a, (#_delta_y + 1)
	bit	7, a
	jp	NZ, 00161$
;src/mushroompie.c:167: if (current_room->room_h_coll) current_room->room_h_coll(dizzy_x, dizzy_y + 21); else get_h_coll(dizzy_x, dizzy_y + 21);
	ld	hl, #_dizzy_y
	ld	a, (hl+)
	add	a, #0x15
	ld	e, a
	ld	a, (hl)
	adc	a, #0x00
	ld	d, a
	ld	a, b
	or	a, c
	jr	Z, 00102$
	push	de
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	add	sp, #4
	jr	00103$
00102$:
	push	de
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_h_coll
	add	sp, #4
00103$:
;src/mushroompie.c:169: if ((collision_buf[0] == 1) || (collision_buf[1] == 1) || (collision_buf[2] == 1)) {
	ld	hl, #_collision_buf
	ld	c, (hl)
	ld	a, c
	dec	a
	jr	Z, 00118$
	ld	hl, #(_collision_buf + 1)
	ld	b, (hl)
	ld	a, b
	dec	a
	jr	Z, 00118$
	ld	hl, #(_collision_buf + 2)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, l
	dec	a
	jr	NZ, 00119$
00118$:
;src/mushroompie.c:170: if (tile_pos_oy < 7) delta_y = -1;
	ld	a, (#_tile_pos_oy)
	sub	a, #0x07
	jr	NC, 00120$
	ld	hl, #_delta_y
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	jr	00120$
00119$:
;src/mushroompie.c:171: } else if ((collision_buf[0] == 2) || (collision_buf[1] == 2) || (collision_buf[2] == 2)) {
	ld	a, c
	sub	a, #0x02
	jr	Z, 00113$
	ld	a, b
	sub	a, #0x02
	jr	Z, 00113$
	ld	a, l
	sub	a, #0x02
	jr	NZ, 00114$
00113$:
;src/mushroompie.c:172: if (tile_pos_oy > 4) delta_y = -1; else if (tile_pos_oy < 4) delta_y = 1;
	ld	a, #0x04
	ld	hl, #_tile_pos_oy
	sub	a, (hl)
	jr	NC, 00109$
	ld	hl, #_delta_y
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
	jr	00120$
00109$:
	ld	a, (#_tile_pos_oy)
	sub	a, #0x04
	jr	NC, 00120$
	ld	hl, #_delta_y
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00120$
00114$:
;src/mushroompie.c:173: } else if (!current_dyn) {
	ld	hl, #_current_dyn + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00120$
;src/mushroompie.c:174: delta_y = 1;
	ld	hl, #_delta_y
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00120$:
;src/mushroompie.c:176: if (delta_y > 0) {            
	ld	hl, #_delta_y
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00362$
	bit	7, d
	jr	NZ, 00363$
	cp	a, a
	jr	00363$
00362$:
	bit	7, d
	jr	Z, 00363$
	scf
00363$:
	jp	NC, 00151$
;src/mushroompie.c:177: get_h_coll(dizzy_x, dizzy_y + 21 + delta_y);
	ld	hl, #_dizzy_y
	ld	a, (hl+)
	add	a, #0x15
	ld	c, a
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	ld	a, c
	ld	hl, #_delta_y
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	push	bc
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_h_coll
	add	sp, #4
;src/mushroompie.c:179: if ((collision_buf[0] == 1) || (collision_buf[1] == 1) || (collision_buf[2] == 1)) {
	ld	hl, #_collision_buf
	ld	b, (hl)
	ld	a, b
	dec	a
	jr	Z, 00145$
	ld	hl, #(_collision_buf + 1)
	ld	c, (hl)
	ld	a, c
	dec	a
	jr	Z, 00145$
	ld	hl, #(_collision_buf + 2)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, l
	dec	a
	jr	NZ, 00146$
00145$:
;src/mushroompie.c:180: delta_y = 0; 
	xor	a, a
	ld	hl, #_delta_y
	ld	(hl+), a
	ld	(hl), a
;src/mushroompie.c:181: if (dizzy_falling) SND_TAP;
	ld	a, (#_dizzy_falling)
	or	a, a
	jp	Z, 00162$
	xor	a, a
	push	af
	ld	de, #0x0010
	push	de
	ld	de, #0x0041
	push	de
	xor	a, a
	push	af
	ld	de, #0x0000
	push	de
	ld	hl, #0x400
	push	hl
	call	_PlayFx
	add	sp, #12
	jp	00162$
00146$:
;src/mushroompie.c:182: } else if ((collision_buf[0] == 2) || (collision_buf[1] == 2) || (collision_buf[2] == 2)) {
	ld	a, b
	sub	a, #0x02
	jr	Z, 00140$
	ld	a, c
	sub	a, #0x02
	jr	Z, 00140$
	ld	a, l
	sub	a, #0x02
	jr	NZ, 00141$
00140$:
;src/mushroompie.c:183: if (tile_pos_oy > 4) { 
	ld	a, #0x04
	ld	hl, #_tile_pos_oy
	sub	a, (hl)
	jp	NC, 00162$
;src/mushroompie.c:184: delta_y = 0; 
	xor	a, a
	ld	hl, #_delta_y
	ld	(hl+), a
	ld	(hl), a
;src/mushroompie.c:185: if (dizzy_falling) SND_TAP;
	ld	a, (#_dizzy_falling)
	or	a, a
	jp	Z, 00162$
	xor	a, a
	push	af
	ld	de, #0x0010
	push	de
	ld	de, #0x0041
	push	de
	xor	a, a
	push	af
	ld	de, #0x0000
	push	de
	ld	hl, #0x400
	push	hl
	call	_PlayFx
	add	sp, #12
	jp	00162$
00141$:
;src/mushroompie.c:187: } else if ((collision_buf[0] == 5) || (collision_buf[1] == 5) || (collision_buf[2] == 5)) {
	ld	a, b
	sub	a, #0x05
	jr	Z, 00135$
	ld	a, c
	sub	a, #0x05
	jr	Z, 00135$
	ld	a, l
	sub	a, #0x05
	jr	NZ, 00136$
00135$:
;src/mushroompie.c:188: cloud_timer++; cloud_timer &= 3;
	ld	hl, #_cloud_timer
	inc	(hl)
	ld	a, (hl)
	and	a, #0x03
;src/mushroompie.c:189: if (cloud_timer) { delta_y = 0; dizzy_falling = 0; dizzy_stun = 0; } // clouds are really soft and fluffy
	ld	(hl), a
	or	a, a
	jr	Z, 00162$
	xor	a, a
	ld	hl, #_delta_y
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #_dizzy_falling
	ld	(hl), #0x00
	ld	hl, #_dizzy_stun
	ld	(hl), #0x00
	jr	00162$
00136$:
;src/mushroompie.c:191: is_position_safe = 0;
	ld	hl, #_is_position_safe
	ld	(hl), #0x00
;src/mushroompie.c:192: if (!current_dyn) {
	ld	hl, #_current_dyn + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00162$
;src/mushroompie.c:193: if (dizzy_falling < MAX_STUN_HEIGHT) dizzy_falling++;
	ld	hl, #_dizzy_falling
	ld	a, (hl)
	sub	a, #0x20
	jr	NC, 00162$
	inc	(hl)
	jr	00162$
00151$:
;src/mushroompie.c:196: } else dizzy_falling = 0;
	ld	hl, #_dizzy_falling
	ld	(hl), #0x00
	jr	00162$
00161$:
;src/mushroompie.c:198: if (current_room->room_h_coll) current_room->room_h_coll(dizzy_x, dizzy_y + 4); else get_h_coll(dizzy_x, dizzy_y + 4);
	ld	hl, #_dizzy_y
	ld	a, (hl+)
	add	a, #0x04
	ld	e, a
	ld	a, (hl)
	adc	a, #0x00
	ld	d, a
	ld	a, b
	or	a, c
	jr	Z, 00154$
	push	de
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	add	sp, #4
	jr	00155$
00154$:
	push	de
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_h_coll
	add	sp, #4
00155$:
;src/mushroompie.c:200: if ((collision_buf[0] == 1) || (collision_buf[1] == 1) || (collision_buf[2] == 1)) {
	ld	a, (#_collision_buf + 0)
	dec	a
	jr	Z, 00156$
	ld	a, (#(_collision_buf + 1) + 0)
	dec	a
	jr	Z, 00156$
	ld	a, (#(_collision_buf + 2) + 0)
	dec	a
	jr	NZ, 00162$
00156$:
;src/mushroompie.c:201: delta_y = 0;
	xor	a, a
	ld	hl, #_delta_y
	ld	(hl+), a
	ld	(hl), a
00162$:
;src/mushroompie.c:205: if (!delta_y) {
	ld	hl, #_delta_y + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00166$
;src/mushroompie.c:206: if (dizzy_falling == MAX_STUN_HEIGHT) dizzy_stun = 1;
	ld	a, (#_dizzy_falling)
	sub	a, #0x20
	jr	NZ, 00164$
	ld	hl, #_dizzy_stun
	ld	(hl), #0x01
00164$:
;src/mushroompie.c:207: dizzy_falling = 0;
	ld	hl, #_dizzy_falling
	ld	(hl), #0x00
00166$:
;src/mushroompie.c:210: if (delta_x) {
	ld	hl, #_delta_x + 1
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00182$
;src/mushroompie.c:167: if (current_room->room_h_coll) current_room->room_h_coll(dizzy_x, dizzy_y + 21); else get_h_coll(dizzy_x, dizzy_y + 21);
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;src/mushroompie.c:212: if (current_room->room_v_coll) current_room->room_v_coll(dizzy_x + delta_x, dizzy_y + 8); else get_v_coll(dizzy_x + delta_x, dizzy_y + 8); 
	ld	hl, #_dizzy_y
	ld	a, (hl+)
	add	a, #0x08
	ld	c, a
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	push	de
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_delta_x
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	inc	sp
	inc	sp
	push	hl
	ld	hl, #0x0011
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/mushroompie.c:211: if (delta_x < 0) {
	ld	a, (#_delta_x + 1)
	bit	7, a
	jr	Z, 00174$
;src/mushroompie.c:212: if (current_room->room_v_coll) current_room->room_v_coll(dizzy_x + delta_x, dizzy_y + 8); else get_v_coll(dizzy_x + delta_x, dizzy_y + 8); 
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00168$
	dec	hl
	dec	hl
	push	bc
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	add	sp, #4
	jr	00175$
00168$:
	push	bc
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_v_coll
	add	sp, #4
	jr	00175$
00174$:
;src/mushroompie.c:214: if (current_room->room_v_coll) current_room->room_v_coll(dizzy_x + delta_x + 16, dizzy_y + 8); else get_v_coll(dizzy_x + delta_x + 16, dizzy_y + 8);
	pop	de
	push	de
	ld	hl, #0x0010
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00171$
	push	bc
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	add	sp, #4
	jr	00175$
00171$:
	push	bc
	push	de
	call	_get_v_coll
	add	sp, #4
00175$:
;src/mushroompie.c:217: if ((collision_buf[0] == 1) || (collision_buf[0] == 2) || (collision_buf[1] == 1)) {
	ld	a, (#_collision_buf + 0)
	cp	a, #0x01
	jr	Z, 00176$
	sub	a, #0x02
	jr	Z, 00176$
	ld	a, (#(_collision_buf + 1) + 0)
	dec	a
	jr	NZ, 00182$
00176$:
;src/mushroompie.c:218: delta_x = 0;
	xor	a, a
	ld	hl, #_delta_x
	ld	(hl+), a
	ld	(hl), a
00182$:
;src/mushroompie.c:221: }
	add	sp, #4
	ret
;src/mushroompie.c:223: void check_dizzy_evil_collisions() {
;	---------------------------------
; Function check_dizzy_evil_collisions
; ---------------------------------
_check_dizzy_evil_collisions::
;src/mushroompie.c:224: if (ani_type != ANI_DEAD) {
	ld	a, (#_ani_type)
	sub	a, #0x07
	ret	Z
;src/mushroompie.c:225: if (current_room->room_evil_coll) current_room->room_evil_coll(dizzy_x, dizzy_y + 4);
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0013
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	or	a, c
	jr	Z, 00102$
	ld	hl, #_dizzy_y
	ld	a, (hl+)
	add	a, #0x04
	ld	e, a
	ld	a, (hl)
	adc	a, #0x00
	ld	d, a
	push	de
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	add	sp, #4
00102$:
;src/mushroompie.c:226: get_coll(dizzy_x, dizzy_y + 4);
	ld	hl, #_dizzy_y
	ld	a, (hl+)
	add	a, #0x04
	ld	c, a
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	push	bc
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_coll
	add	sp, #4
;src/mushroompie.c:228: if (collision_buf[0] == 6) {
	ld	a, (#_collision_buf + 0)
	cp	a, #0x06
	jr	NZ, 00108$
;src/mushroompie.c:229: if (dec_energy < 64) dec_energy += 2;
	ld	hl, #_dec_energy
	ld	a,(hl)
	cp	a,#0x40
	ret	NC
	add	a, #0x02
	ld	(hl), a
	ret
00108$:
;src/mushroompie.c:230: } else if (collision_buf[0] == 7) {
	sub	a, #0x07
	ret	NZ
;src/mushroompie.c:231: dizzy_energy = 1; dec_energy = 1;
	ld	hl, #_dizzy_energy
	ld	(hl), #0x01
	ld	hl, #_dec_energy
	ld	(hl), #0x01
;src/mushroompie.c:234: }
	ret
;src/mushroompie.c:242: void set_room(const UBYTE row, const UBYTE col, const UBYTE fade) {
;	---------------------------------
; Function set_room
; ---------------------------------
_set_room::
;src/mushroompie.c:243: if (fade) FADE_OUT;
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
	ld	hl, #0x2c2c
	push	hl
	ld	hl, #0x9300
	push	hl
	call	_FadeDMG
	add	sp, #4
	call	_pop_bank
00102$:
;src/mushroompie.c:244: HIDE_SPRITES; HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;src/mushroompie.c:246: current_room = dizzy_world[row]->rooms[col];
	ld	bc, #_dizzy_world+0
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_current_room
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/mushroompie.c:247: set_bank(current_room->bank);
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	push	af
	inc	sp
	call	_set_bank
	inc	sp
;src/mushroompie.c:250: multiple_move_sprites(evil_sprite_offset, evil_sprite_total_count, 0, 0, (unsigned char *)evil_hide);
	ld	de, #_evil_hide
	push	de
	xor	a, a
	rrca
	push	af
	ld	hl, #0x1009
	push	hl
	call	_multiple_move_sprites
	add	sp, #6
;src/mushroompie.c:247: set_bank(current_room->bank);
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/mushroompie.c:253: unshrink_tiles(0x00, current_room->room_tiles->count, current_room->room_tiles->data); 
	ld	hl, #0x0005
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
	ld	l, #0x00
	push	hl
	call	_unshrink_tiles
	add	sp, #4
;src/mushroompie.c:247: set_bank(current_room->bank);
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/mushroompie.c:255: if (current_room->room_init) current_room->room_init();
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
;	spillPairReg hl
	ld	a, h
	or	a, c
	jr	Z, 00104$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
00104$:
;src/mushroompie.c:247: set_bank(current_room->bank);
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/mushroompie.c:257: if (current_room->room_customdraw) current_room->room_customdraw(); else default_draw();
	ld	hl, #0x0019
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
;	spillPairReg hl
	ld	a, h
	or	a, c
	jr	Z, 00106$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	jr	00107$
00106$:
	call	_default_draw
00107$:
;src/mushroompie.c:259: rle_decompress_data(current_room->room_coll_map->rle_data, (UWORD)current_room->room_coll_map->size, coll_buf);
;src/mushroompie.c:247: set_bank(current_room->bank);
	ld	hl, #_current_room
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_current_room + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;src/mushroompie.c:259: rle_decompress_data(current_room->room_coll_map->rle_data, (UWORD)current_room->room_coll_map->size, coll_buf);
	inc	hl
	inc	hl
	inc	hl
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
	inc	bc
	inc	bc
	ld	de, #_coll_buf
	push	de
	push	hl
	push	bc
	call	_rle_decompress_data
	add	sp, #6
;src/mushroompie.c:261: set_dizzy_position();
	call	_set_dizzy_position
;src/mushroompie.c:263: SCX_REG = bkg_scroll_x_target = get_x_scroll_value(dizzy_x);
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_x_scroll_value
	pop	hl
	ld	a, e
	ld	(#_bkg_scroll_x_target),a
	ldh	(_SCX_REG + 0), a
;src/mushroompie.c:264: SCY_REG = bkg_scroll_y_target = get_y_scroll_value(dizzy_y);
	ld	hl, #_dizzy_y
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_get_y_scroll_value
	pop	hl
	ld	a, e
	ld	(#_bkg_scroll_y_target),a
	ldh	(_SCY_REG + 0), a
;src/mushroompie.c:266: SHOW_BKG; SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/mushroompie.c:267: if (fade) FADE_IN;
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	ret	Z
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
	ld	hl, #0x2c2c
	push	hl
	ld	a, #0x93
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_FadeDMG
	add	sp, #4
;src/mushroompie.c:268: }
	jp	_pop_bank
;src/mushroompie.c:269: void check_change_room() {
;	---------------------------------
; Function check_change_room
; ---------------------------------
_check_change_room::
;src/mushroompie.c:270: dizzy_tmp_xy = dizzy_x + delta_x;
	ld	a, (#_dizzy_x)
	ld	hl, #_delta_x
	add	a, (hl)
	ld	(#_dizzy_tmp_xy),a
	ld	a, (#_dizzy_x + 1)
	ld	hl, #_delta_x + 1
	adc	a, (hl)
	ld	hl, #_dizzy_tmp_xy + 1
	ld	(hl), a
;src/mushroompie.c:271: if (dizzy_tmp_xy < MIN_DIZZY_X) {
	bit	7, (hl)
	jr	Z, 00109$
;src/mushroompie.c:272: if (current_room_x) { current_room_x--; dizzy_x = MAX_DIZZY_X; set_room(current_room_y, current_room_x, 1); }
	ld	hl, #_current_room_x
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
	dec	(hl)
	ld	hl, #_dizzy_x
	ld	a, #0xe0
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, (#_current_room_x)
	ld	h, a
	ld	a, (#_current_room_y)
	ld	l, a
	push	hl
	call	_set_room
	add	sp, #3
00102$:
;src/mushroompie.c:273: delta_x = 0;
	xor	a, a
	ld	hl, #_delta_x
	ld	(hl+), a
	ld	(hl), a
	jr	00110$
00109$:
;src/mushroompie.c:274: } else if (dizzy_tmp_xy > MAX_DIZZY_X) { 
	ld	hl, #_dizzy_tmp_xy
	ld	a, #0xe0
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
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
	jr	NC, 00110$
;src/mushroompie.c:275: current_room_x++; 
	ld	hl, #_current_room_x
	inc	(hl)
;src/mushroompie.c:276: if (current_room_x < WORLD_WIDTH) { dizzy_x = MIN_DIZZY_X; set_room(current_room_y, current_room_x, 1); } else current_room_x = WORLD_WIDTH - 1;
	ld	a, (hl)
	sub	a, #0x06
	jr	NC, 00104$
	xor	a, a
	ld	hl, #_dizzy_x
	ld	(hl+), a
	ld	(hl), a
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, (#_current_room_x)
	ld	h, a
	ld	a, (#_current_room_y)
	ld	l, a
	push	hl
	call	_set_room
	add	sp, #3
	jr	00105$
00104$:
	ld	hl, #_current_room_x
	ld	(hl), #0x05
00105$:
;src/mushroompie.c:277: delta_x = 0;
	xor	a, a
	ld	hl, #_delta_x
	ld	(hl+), a
	ld	(hl), a
00110$:
;src/mushroompie.c:280: dizzy_tmp_xy = dizzy_y + delta_y;
	ld	a, (#_dizzy_y)
	ld	hl, #_delta_y
	add	a, (hl)
	ld	(#_dizzy_tmp_xy),a
	ld	a, (#_dizzy_y + 1)
	ld	hl, #_delta_y + 1
	adc	a, (hl)
	ld	hl, #_dizzy_tmp_xy + 1
	ld	(hl), a
;src/mushroompie.c:281: if (dizzy_tmp_xy < MIN_DIZZY_Y) {
	bit	7, (hl)
	jr	Z, 00119$
;src/mushroompie.c:282: if (current_room_y) { current_room_y--; dizzy_y = MAX_DIZZY_Y; set_room(current_room_y, current_room_x, 1); }
	ld	hl, #_current_room_y
	ld	a, (hl)
	or	a, a
	ret	Z
	dec	(hl)
	ld	hl, #_dizzy_y
	ld	a, #0x78
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, (#_current_room_x)
	ld	h, a
	ld	a, (#_current_room_y)
	ld	l, a
	push	hl
	call	_set_room
	add	sp, #3
	ret
00119$:
;src/mushroompie.c:283: } else if (dizzy_tmp_xy > MAX_DIZZY_Y) {
	ld	hl, #_dizzy_tmp_xy
	ld	a, #0x78
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
	ret	NC
;src/mushroompie.c:284: current_room_y++; 
	ld	hl, #_current_room_y
	inc	(hl)
;src/mushroompie.c:285: if (current_room_y < WORLD_HEIGHT) { dizzy_y = MIN_DIZZY_Y; set_room(current_room_y, current_room_x, 1); } else current_room_y = WORLD_HEIGHT - 1;
	ld	a, (hl)
	sub	a, #0x02
	jr	NC, 00114$
	xor	a, a
	ld	hl, #_dizzy_y
	ld	(hl+), a
	ld	(hl), a
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, (#_current_room_x)
	ld	h, a
	ld	a, (#_current_room_y)
	ld	l, a
	push	hl
	call	_set_room
	add	sp, #3
	ret
00114$:
	ld	hl, #_current_room_y
	ld	(hl), #0x01
;src/mushroompie.c:287: }
	ret
;src/include/inventory.h:88: void push_last(items_list * list, game_item * item) {
;	---------------------------------
; Function push_last
; ---------------------------------
_push_last::
	add	sp, #-6
;src/include/inventory.h:89: if ((!item) || (!list)) return;
	ldhl	sp,	#11
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00107$
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00107$
;src/include/inventory.h:90: list->size++;
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	c
	pop	hl
	push	hl
	ld	(hl), c
;src/include/inventory.h:91: item->next = 0;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0007
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/include/inventory.h:92: if (list->last) list->last->next = item; else list->first = item;
	pop	de
	push	de
	ld	hl, #0x0003
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00105$
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	jr	00106$
00105$:
	pop	hl
	push	hl
	inc	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00106$:
;src/include/inventory.h:93: list->last = item;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00107$:
;src/include/inventory.h:94: }
	add	sp, #6
	ret
;src/include/inventory.h:95: game_item * pop_by_id(items_list * list, const UBYTE id) {
;	---------------------------------
; Function pop_by_id
; ---------------------------------
_pop_by_id::
	add	sp, #-5
;src/include/inventory.h:96: if (!list) return 0;
	ldhl	sp,	#8
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
	ld	de, #0x0000
	jp	00113$
00102$:
;src/include/inventory.h:97: __temp_game_item2 = 0;
	xor	a, a
	ld	hl, #___temp_game_item2
	ld	(hl+), a
	ld	(hl), a
;src/include/inventory.h:98: __temp_game_item = list->first;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #___temp_game_item
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/include/inventory.h:99: while (__temp_game_item) {
00110$:
	ld	hl, #___temp_game_item + 1
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00112$
;src/include/inventory.h:100: if (__temp_game_item->id == id) {
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl), a
;src/include/inventory.h:101: if (__temp_game_item2) __temp_game_item2->next = __temp_game_item->next; else list->first = __temp_game_item->next;
	push	de
	ld	hl, #0x0007
	add	hl, de
	pop	de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
;src/include/inventory.h:100: if (__temp_game_item->id == id) {
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NZ, 00109$
;src/include/inventory.h:101: if (__temp_game_item2) __temp_game_item2->next = __temp_game_item->next; else list->first = __temp_game_item->next;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #___temp_game_item2 + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00104$
	ld	a, (hl+)
	ld	d, (hl)
	add	a, #0x07
	ld	e, a
	jr	NC, 00147$
	inc	d
00147$:
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	jr	00105$
00104$:
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
00105$:
;src/include/inventory.h:102: if (!__temp_game_item->next) list->last = __temp_game_item2;
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	or	a, l
	jr	NZ, 00107$
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	hl, #___temp_game_item2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
00107$:
;src/include/inventory.h:103: list->size--;
	ld	a, (bc)
	dec	a
	ld	(bc), a
;src/include/inventory.h:104: return __temp_game_item;
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	jr	00113$
00109$:
;src/include/inventory.h:106: __temp_game_item2 = __temp_game_item;
	ld	hl, #___temp_game_item2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/include/inventory.h:107: __temp_game_item = __temp_game_item->next;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #___temp_game_item
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	jp	00110$
00112$:
;src/include/inventory.h:109: return 0;
	ld	de, #0x0000
00113$:
;src/include/inventory.h:110: }
	add	sp, #5
	ret
;src/include/inventory.h:111: game_item * find_by_id(items_list * list, const UBYTE id) {
;	---------------------------------
; Function find_by_id
; ---------------------------------
_find_by_id::
;src/include/inventory.h:112: if (!list) return 0;
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
	ld	de, #0x0000
	ret
00102$:
;src/include/inventory.h:113: __temp_game_item = list->first;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	e, c
	ld	d, b
	ld	a, (de)
	ld	hl, #___temp_game_item
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/include/inventory.h:114: while (__temp_game_item) {
00105$:
	ld	hl, #___temp_game_item + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00107$
;src/include/inventory.h:115: if (__temp_game_item->id == id) return __temp_game_item;
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ld	e, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00104$
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ret
00104$:
;src/include/inventory.h:116: __temp_game_item = __temp_game_item->next;
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
	jr	00105$
00107$:
;src/include/inventory.h:118: return 0;
	ld	de, #0x0000
;src/include/inventory.h:119: }
	ret
;src/include/inventory.h:120: game_item * find_by_room_xy(items_list * list, const UBYTE row, const UBYTE col, const UBYTE x, const UBYTE y) {
;	---------------------------------
; Function find_by_room_xy
; ---------------------------------
_find_by_room_xy::
	add	sp, #-4
;src/include/inventory.h:121: if (!list) return 0;
	ldhl	sp,	#7
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
	ld	de, #0x0000
	jp	00114$
00102$:
;src/include/inventory.h:122: __temp_game_item2 = 0;
	xor	a, a
	ld	hl, #___temp_game_item2
	ld	(hl+), a
	ld	(hl), a
;src/include/inventory.h:123: __temp_game_item = list->first;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	e, c
	ld	d, b
	ld	a, (de)
	ld	hl, #___temp_game_item
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/include/inventory.h:124: while (__temp_game_item) {
00111$:
	ld	hl, #___temp_game_item + 1
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00113$
;src/include/inventory.h:125: if ((__temp_game_item->room_row == row) && (__temp_game_item->room_col == col)) {
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#___temp_game_item + 1)
	ldhl	sp,	#1
	ld	(hl), a
	pop	bc
	push	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, c
	jp	NZ,00109$
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, c
	jp	NZ,00109$
;src/include/inventory.h:126: if ((__temp_game_item->x <= (x + 2)) && ((__temp_game_item->x + 1) >= x) &&
	pop	bc
	push	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	b, #0x00
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
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
	inc	bc
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
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
	jr	C, 00109$
;src/include/inventory.h:127: (__temp_game_item->y <= (y + 2)) && ((__temp_game_item->y + 1) >= y)) {
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	b, #0x00
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
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
	jr	C, 00109$
	inc	bc
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
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
	jr	C, 00109$
;src/include/inventory.h:128: __temp_game_item2 = __temp_game_item;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#___temp_game_item2),a
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#___temp_game_item2 + 1),a
00109$:
;src/include/inventory.h:131: __temp_game_item = __temp_game_item->next;
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ld	hl, #___temp_game_item
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	jp	00111$
00113$:
;src/include/inventory.h:133: return __temp_game_item2;
	ld	hl, #___temp_game_item2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
00114$:
;src/include/inventory.h:134: }
	add	sp, #4
	ret
;src/include/inventory.h:137: void init_game_items() {
;	---------------------------------
; Function init_game_items
; ---------------------------------
_init_game_items::
;src/include/inventory.h:138: game_item_list.first = game_item_list.last = game_item_list.size = 0;
	ld	hl, #_game_item_list
	ld	(hl), #0x00
	ld	hl, #(_game_item_list + 3)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_game_item_list + 1)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/include/inventory.h:139: for (__temp_i = 0; __temp_i < GAME_ITEMS_COUNT; __temp_i++) {
	ld	hl, #___temp_i
	ld	(hl), #0x00
00102$:
;src/include/inventory.h:140: __temp_game_item = &game_items[__temp_i];
	ld	hl, #___temp_i
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_game_items
	add	hl,bc
	ld	c, l
	ld	a, h
	ld	hl, #___temp_game_item
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/include/inventory.h:141: __temp_game_item_desc = all_items_desc[__temp_i];
	ld	hl, #___temp_i
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_all_items_desc
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #___temp_game_item_desc
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/include/inventory.h:143: __temp_game_item->id = __temp_game_item_desc->id;
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #___temp_game_item_desc
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(bc), a
;src/include/inventory.h:145: __temp_game_item->room_row = __temp_game_item_desc->room_row; 
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	hl, #___temp_game_item_desc
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ld	a, (de)
	ld	(bc), a
;src/include/inventory.h:146: __temp_game_item->room_col = __temp_game_item_desc->room_col; 
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	hl, #___temp_game_item_desc
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	ld	a, (de)
	ld	(bc), a
;src/include/inventory.h:147: __temp_game_item->x = __temp_game_item_desc->x;
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	hl, #___temp_game_item_desc
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	(bc), a
;src/include/inventory.h:148: __temp_game_item->y = __temp_game_item_desc->y;
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl, #___temp_game_item_desc
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	(bc), a
;src/include/inventory.h:149: __temp_game_item->desc = __temp_game_item_desc;
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl, #___temp_game_item_desc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/include/inventory.h:151: push_last((items_list *)&game_item_list, __temp_game_item);
	ld	hl, #___temp_game_item
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #_game_item_list
	push	de
	call	_push_last
	add	sp, #4
;src/include/inventory.h:139: for (__temp_i = 0; __temp_i < GAME_ITEMS_COUNT; __temp_i++) {
	ld	hl, #___temp_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0e
	jp	C, 00102$
;src/include/inventory.h:153: inventory_item_list.first = inventory_item_list.last = inventory_item_list.size = 0;
	ld	hl, #_inventory_item_list
	ld	(hl), #0x00
	ld	hl, #(_inventory_item_list + 3)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_inventory_item_list + 1)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/include/inventory.h:154: item_stack.first = item_stack.last = item_stack.size = 0;
	ld	hl, #_item_stack
	ld	(hl), #0x00
	ld	hl, #(_item_stack + 3)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_item_stack + 1)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/include/inventory.h:155: }
	ret
;src/include/room_defaults.h:1: void default_draw() {
;	---------------------------------
; Function default_draw
; ---------------------------------
_default_draw::
;src/include/room_defaults.h:3: rle_decompress_data(current_room->room_map->rle_data, (UWORD)current_room->room_map->size, coll_buf);
	ld	hl, #_current_room
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_current_room + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
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
	inc	bc
	inc	bc
	ld	de, #_coll_buf
	push	de
	push	hl
	push	bc
	call	_rle_decompress_data
	add	sp, #6
;src/include/room_defaults.h:4: place_room_items(current_room_y, current_room_x, coll_buf);
	ld	de, #_coll_buf
	push	de
	ld	a, (#_current_room_x)
	ld	h, a
	ld	a, (#_current_room_y)
	ld	l, a
	push	hl
	call	_place_room_items
	add	sp, #4
;src/include/room_defaults.h:6: set_bkg_tiles(0, 3, room_width, room_height, coll_buf);
	ld	de, #_coll_buf
	push	de
	ld	hl, #0x111e
	push	hl
	ld	hl, #0x300
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/include/room_defaults.h:7: }
	ret
;src/include/room_defaults.h:9: UBYTE default_drop(UBYTE id) {
;	---------------------------------
; Function default_drop
; ---------------------------------
_default_drop::
;src/include/room_defaults.h:11: if (id == ID_FIREFLY) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x08
	jr	NZ, 00104$
;src/include/room_defaults.h:12: show_dialog_window(4, &firefly_out);
	ld	de, #_firefly_out
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/include/room_defaults.h:14: temp_item = pop_by_id(&item_stack, ID_JAR);
	ld	a, #0x06
	push	af
	inc	sp
	ld	de, #_item_stack
	push	de
	call	_pop_by_id
	add	sp, #3
	ld	c, e
;src/include/room_defaults.h:15: if (temp_item) push_last(&inventory_item_list, temp_item);
	ld	a,d
	ld	b,a
	or	a, e
	jr	Z, 00102$
	push	bc
	ld	de, #_inventory_item_list
	push	de
	call	_push_last
	add	sp, #4
00102$:
;src/include/room_defaults.h:17: return ID_LID;
	ld	e, #0x07
	ret
00104$:
;src/include/room_defaults.h:19: return ID_ITEM_NONE;
	ld	e, #0x00
;src/include/room_defaults.h:20: }
	ret
;src/mushroompie.c:401: void reset_world() {
;	---------------------------------
; Function reset_world
; ---------------------------------
_reset_world::
	add	sp, #-4
;src/mushroompie.c:402: for (UBYTE row = 0; row < WORLD_HEIGHT; row++) {
	ld	c, #0x00
00110$:
	ld	a, c
	sub	a, #0x02
	jr	NC, 00112$
;src/mushroompie.c:403: for (UBYTE col = 0; col < WORLD_WIDTH; col++) {
	ld	b, #0x00
00107$:
	ld	a, b
	sub	a, #0x06
	jr	NC, 00111$
;src/mushroompie.c:404: const room_t * cur_room = dizzy_world[row]->rooms[col];
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_dizzy_world
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	ld	e, a
	ld	d, l
	inc	de
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/mushroompie.c:405: if ((cur_room) && (cur_room->room_reset)) push_bank(cur_room->bank),cur_room->room_reset(),pop_bank();
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00108$
	pop	de
	push	de
	ld	hl, #0x0017
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
	or	a, l
	jr	Z, 00108$
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	call	_push_bank
	inc	sp
	pop	bc
	ldhl	sp,#2
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
	push	bc
	call	___sdcc_call_hl
	call	_pop_bank
	pop	bc
00108$:
;src/mushroompie.c:403: for (UBYTE col = 0; col < WORLD_WIDTH; col++) {
	inc	b
	jr	00107$
00111$:
;src/mushroompie.c:402: for (UBYTE row = 0; row < WORLD_HEIGHT; row++) {
	inc	c
	jr	00110$
00112$:
;src/mushroompie.c:408: }
	add	sp, #4
	ret
;src/mushroompie.c:410: void init_game() {
;	---------------------------------
; Function init_game
; ---------------------------------
_init_game::
;src/mushroompie.c:411: FADE_OUT;
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
	ld	hl, #0x2c2c
	push	hl
	ld	hl, #0x9300
	push	hl
	call	_FadeDMG
	add	sp, #4
	call	_pop_bank
;src/mushroompie.c:413: reset_world();
	call	_reset_world
;src/mushroompie.c:415: init_game_items();
	call	_init_game_items
;src/mushroompie.c:417: game_over = 0;
	ld	hl, #_game_over
	ld	(hl), #0x00
;src/mushroompie.c:418: init_dizzy_coins(); show_coins();
	call	_init_dizzy_coins
	call	_show_coins
;src/mushroompie.c:419: init_dizzy_lives(); show_lives();
	call	_init_dizzy_lives
	call	_show_lives
;src/mushroompie.c:420: init_dizzy_energy(); show_energy();
	call	_init_dizzy_energy
	call	_show_energy
;src/mushroompie.c:422: current_room_x = 1, current_room_y = 1; 
	ld	hl, #_current_room_x
	ld	(hl), #0x01
	ld	hl, #_current_room_y
	ld	(hl), #0x01
;src/mushroompie.c:423: set_room(current_room_y, current_room_x, 0);    
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_room
	add	sp, #3
;src/mushroompie.c:425: set_dizzy_animdata(&m_stand_0);
	ld	de, #_m_stand_0
	push	de
	call	_set_dizzy_animdata
	pop	hl
;src/mushroompie.c:427: dizzy_x = 116, dizzy_y = 72;
	ld	hl, #_dizzy_x
	ld	a, #0x74
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	ld	hl, #_dizzy_y
	ld	a, #0x48
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/mushroompie.c:428: ani_type = ANI_STAND; ani_phase = 0;
	ld	hl, #_ani_type
	ld	(hl), #0x00
	ld	hl, #_ani_phase
	ld	(hl), #0x00
;src/mushroompie.c:429: set_dizzy_position();
	call	_set_dizzy_position
;src/mushroompie.c:431: delay(200);
	ld	de, #0x00c8
	push	de
	call	_delay
	pop	hl
;src/mushroompie.c:432: FADE_IN;
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
	ld	hl, #0x2c2c
	push	hl
	ld	a, #0x93
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_FadeDMG
	add	sp, #4
;src/mushroompie.c:433: }
	jp	_pop_bank
;src/mushroompie.c:437: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
	dec	sp
;src/mushroompie.c:438: DISPLAY_OFF;
	call	_display_off
;src/mushroompie.c:440: set_bank(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bank
	inc	sp
;src/mushroompie.c:443: NR52_REG = 0x80; // Enables sound, always set this first
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/mushroompie.c:444: NR51_REG = 0xFF; // Enables all channels (left and right)
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/mushroompie.c:445: NR50_REG = 0x77; // Max volume
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/mushroompie.c:447: hUGE_init(song);
	ld	de, #_song
	push	de
	call	_hUGE_init
	pop	hl
;src/mushroompie.c:467: }
	di
;src/mushroompie.c:450: LCDC_REG = 0x44U;
	ld	a, #0x44
	ldh	(_LCDC_REG + 0), a
;src/mushroompie.c:453: STAT_REG = 0x50;
	ld	a, #0x50
	ldh	(_STAT_REG + 0), a
;src/mushroompie.c:454: LYC_REG = 0;
	xor	a, a
	ldh	(_LYC_REG + 0), a
;src/mushroompie.c:456: add_LCD(lcd_interrupt); 
	ld	de, #_lcd_interrupt
	push	de
	call	_add_LCD
	pop	hl
;src/mushroompie.c:457: add_VBL(vbl_interrupt); 
	ld	de, #_vbl_interrupt
	push	de
	call	_add_VBL
	pop	hl
;src/mushroompie.c:463: add_LCD(wait_int_handler);
	ld	de, #_wait_int_handler
	push	de
	call	_add_LCD
	pop	hl
;src/mushroompie.c:466: set_interrupts(VBL_IFLAG | LCD_IFLAG);
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
	ei
;src/mushroompie.c:470: BGP_REG = OBP0_REG = OBP1_REG = 0xFF;
	ld	a, #0xff
	ldh	(_OBP1_REG + 0), a
	ld	a, #0xff
	ldh	(_OBP0_REG + 0), a
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
;src/mushroompie.c:472: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;src/mushroompie.c:473: init_dizzy();
	call	_init_dizzy
;src/mushroompie.c:474: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/mushroompie.c:476: WX_REG = 7; WY_REG = 0;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/mushroompie.c:480: window_tiles_hiwater -= title_tiles.count;
	ld	hl, #_title_tiles
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	hl, #_window_tiles_hiwater
	ld	(hl), a
;src/mushroompie.c:481: unshrink_tiles(window_tiles_hiwater, title_tiles.count, title_tiles.data);
	ld	bc, #_title_tiles + 1
	ld	a, (#_title_tiles + 0)
	push	bc
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_unshrink_tiles
	add	sp, #4
;src/mushroompie.c:483: inventoty_tiles_start = window_tiles_hiwater -= dialog_frame_tiles.count;
	ld	hl, #_dialog_frame_tiles
	ld	c, (hl)
	ld	a, (#_window_tiles_hiwater)
	sub	a, c
	ld	(#_inventoty_tiles_start),a
	ld	hl, #_window_tiles_hiwater
	ld	(hl), a
;src/mushroompie.c:484: unshrink_tiles(window_tiles_hiwater, dialog_frame_tiles.count, dialog_frame_tiles.data);
	ld	bc, #_dialog_frame_tiles + 1
	ld	a, (#_dialog_frame_tiles + 0)
	push	bc
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_unshrink_tiles
	add	sp, #4
;src/mushroompie.c:486: dizzy_energy_start = window_tiles_hiwater -= energy_tiles.count;
	ld	hl, #_energy_tiles
	ld	c, (hl)
	ld	a, (#_window_tiles_hiwater)
	sub	a, c
	ld	(#_dizzy_energy_start),a
	ld	hl, #_window_tiles_hiwater
	ld	(hl), a
;src/mushroompie.c:487: unshrink_tiles(window_tiles_hiwater, energy_tiles.count, energy_tiles.data);
	ld	bc, #_energy_tiles + 1
	ld	a, (#_energy_tiles + 0)
	push	bc
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_unshrink_tiles
	add	sp, #4
;src/mushroompie.c:489: font_tiles_start = window_tiles_hiwater -= font_tiles.count;
	ld	hl, #_font_tiles
	ld	c, (hl)
	ld	a, (#_window_tiles_hiwater)
	sub	a, c
	ld	(#_font_tiles_start),a
	ld	(#_window_tiles_hiwater),a
;src/mushroompie.c:490: digits_start = font_tiles_start + 0x0F;
	ld	hl, #_font_tiles_start
	ld	c, (hl)
	ld	a, c
	add	a, #0x0f
	ld	(#_digits_start),a
;src/mushroompie.c:491: dizzy_live_symbol = font_tiles_start + 0x1F;
	ld	a, c
	add	a, #0x1f
	ld	(#_dizzy_live_symbol),a
;src/mushroompie.c:492: unshrink_tiles(window_tiles_hiwater, font_tiles.count, font_tiles.data);
	ld	bc, #_font_tiles + 1
	ld	a, (#_font_tiles + 0)
	push	bc
	push	af
	inc	sp
	ld	a, (#_window_tiles_hiwater)
	push	af
	inc	sp
	call	_unshrink_tiles
	add	sp, #4
;src/mushroompie.c:494: set_win_tiles(0, 0, 20, 3, title_map);
	ld	de, #_title_map
	push	de
	ld	hl, #0x314
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;src/mushroompie.c:496: current_room_x = 1, current_room_y = 1; 
	ld	hl, #_current_room_x
	ld	(hl), #0x01
	ld	hl, #_current_room_y
	ld	(hl), #0x01
;src/mushroompie.c:498: init_game_items();
	call	_init_game_items
;src/mushroompie.c:499: set_room(current_room_y, current_room_x, 0);
	xor	a, a
	push	af
	inc	sp
	ld	a, (#_current_room_x)
	ld	h, a
	ld	a, (#_current_room_y)
	ld	l, a
	push	hl
	call	_set_room
	add	sp, #3
;src/mushroompie.c:501: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/mushroompie.c:502: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/mushroompie.c:505: FADE_IN;
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
	ld	hl, #0x2c2c
	push	hl
	ld	hl, #0x9301
	push	hl
	call	_FadeDMG
	add	sp, #4
	call	_pop_bank
;src/mushroompie.c:507: show_dialog_window(6, &start_dialog);
	ld	de, #_start_dialog
	push	de
	ld	a, #0x06
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/mushroompie.c:509: init_game();
	call	_init_game
;src/mushroompie.c:517: while(1) {
00208$:
;src/mushroompie.c:518: ani_type_old = ani_type;
	ld	a, (#_ani_type)
	ld	(#_ani_type_old),a
;src/mushroompie.c:520: if (!death_pause) {
	ld	a, (#_death_pause)
	or	a, a
	jp	NZ, 00160$
;src/mushroompie.c:521: joy = joypad();
	call	_joypad
	ld	hl, #_joy
	ld	(hl), e
;src/mushroompie.c:522: __temp_i = animation[ani_type]->interr;
	ld	bc, #_animation+0
	ld	hl, #_ani_type
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
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	(#___temp_i),a
;src/mushroompie.c:523: if ((!current_dyn) && (!dizzy_falling) && ((__temp_i == 255) || (__temp_i == ani_phase))) {
	ld	hl, #_current_dyn + 1
	ld	a, (hl-)
	or	a, (hl)
	jp	NZ, 00122$
	ld	a, (#_dizzy_falling)
	or	a, a
	jp	NZ, 00122$
	ld	a, (#___temp_i)
	inc	a
	jr	Z, 00121$
	ld	a, (#___temp_i)
	ld	hl, #_ani_phase
	sub	a, (hl)
	jp	NZ,00122$
00121$:
;src/mushroompie.c:524: if (!joy) {
	ld	a, (#_joy)
	or	a, a
	jr	NZ, 00119$
;src/mushroompie.c:525: ani_type = ANI_STAND;    
	ld	hl, #_ani_type
	ld	(hl), #0x00
	jp	00122$
00119$:
;src/mushroompie.c:526: } else if (joy & J_LEFT) {
	ld	hl, #_joy
	ld	d, (hl)
;src/mushroompie.c:527: if ((joy & J_UP) || (joy & J_A)) {
	ld	a, d
	and	a, #0x04
	ld	e, #0x00
	push	af
	ld	a, d
	and	a, #0x10
	ld	c, a
	ld	b, #0x00
	pop	af
;src/mushroompie.c:526: } else if (joy & J_LEFT) {
	bit	1, d
	jr	Z, 00116$
;src/mushroompie.c:527: if ((joy & J_UP) || (joy & J_A)) {
	or	a, e
	jr	NZ, 00101$
	ld	a, b
	or	a, c
	jr	Z, 00102$
00101$:
;src/mushroompie.c:528: ani_type = ANI_JUMP_L;
	ld	hl, #_ani_type
	ld	(hl), #0x09
;src/mushroompie.c:529: SND_JUMP;
	ld	de, #0x00c5
	push	de
	ld	de, #0x0078
	push	de
	ld	de, #0x0053
	push	de
	ld	de, #0x0084
	push	de
	ld	de, #0x0065
	push	de
	ld	hl, #0x800
	push	hl
	call	_PlayFx
	add	sp, #12
	jr	00122$
00102$:
;src/mushroompie.c:531: ani_type = ANI_WALK_L;
	ld	hl, #_ani_type
	ld	(hl), #0x03
	jr	00122$
00116$:
;src/mushroompie.c:533: } else if (joy & J_RIGHT) {
	bit	0, d
	jr	Z, 00113$
;src/mushroompie.c:534: if ((joy & J_UP) || (joy & J_A)) {
	or	a, e
	jr	NZ, 00105$
	ld	a, b
	or	a, c
	jr	Z, 00106$
00105$:
;src/mushroompie.c:535: ani_type = ANI_JUMP_R;
	ld	hl, #_ani_type
	ld	(hl), #0x08
;src/mushroompie.c:536: SND_JUMP;
	ld	de, #0x00c5
	push	de
	ld	de, #0x0078
	push	de
	ld	de, #0x0053
	push	de
	ld	de, #0x0084
	push	de
	ld	de, #0x0065
	push	de
	ld	hl, #0x800
	push	hl
	call	_PlayFx
	add	sp, #12
	jr	00122$
00106$:
;src/mushroompie.c:538: ani_type = ANI_WALK_R; 
	ld	hl, #_ani_type
	ld	(hl), #0x02
	jr	00122$
00113$:
;src/mushroompie.c:540: } else if ((joy == J_UP) || (joy == J_A)) {
	ld	a, (#_joy)
	sub	a, #0x04
	jr	Z, 00109$
	ld	a, (#_joy)
	sub	a, #0x10
	jr	NZ, 00122$
00109$:
;src/mushroompie.c:541: ani_type = ANI_UP;
	ld	hl, #_ani_type
	ld	(hl), #0x01
;src/mushroompie.c:542: SND_JUMP;
	ld	de, #0x00c5
	push	de
	ld	de, #0x0078
	push	de
	ld	de, #0x0053
	push	de
	ld	de, #0x0084
	push	de
	ld	de, #0x0065
	push	de
	ld	hl, #0x800
	push	hl
	call	_PlayFx
	add	sp, #12
00122$:
;src/mushroompie.c:545: if (joy == J_B) {
	ld	a, (#_joy)
	sub	a, #0x20
	jp	NZ,00160$
;src/mushroompie.c:546: if (is_position_safe) {
	ld	a, (#_is_position_safe)
	or	a, a
	jp	Z, 00160$
;src/mushroompie.c:547: waitpadup();
	call	_waitpadup
;src/mushroompie.c:548: UBYTE redraw_room = 0, warning_shown = 0, current_item_id = 0;
	ld	bc, #0x0
;src/mushroompie.c:549: tile_pos_x = dizzy_x >> 3, tile_pos_y = dizzy_y >> 3;
	ld	hl, #_dizzy_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	hl, #_tile_pos_x
	ld	(hl), e
	ld	hl, #_dizzy_y
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	hl, #_tile_pos_y
	ld	(hl), e
;src/mushroompie.c:550: __temp_game_item3 = find_by_room_xy(&game_item_list, current_room_y, current_room_x, tile_pos_x, tile_pos_y);
	push	bc
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, (#_tile_pos_x)
	ld	h, a
	ld	a, (#_current_room_x)
	ld	l, a
	push	hl
	ld	a, (#_current_room_y)
	push	af
	inc	sp
	ld	de, #_game_item_list
	push	de
	call	_find_by_room_xy
	add	sp, #6
	pop	bc
	ld	hl, #___temp_game_item3
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/mushroompie.c:551: if (__temp_game_item3) {
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00133$
;src/mushroompie.c:552: current_item_id = __temp_game_item3->id;
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl), a
;src/mushroompie.c:553: if (current_item_id & ID_TREASURE) {
	push	hl
	bit	7, (hl)
	pop	hl
	jr	Z, 00130$
;src/mushroompie.c:554: SND_COIN;
	ld	de, #0x00c7
	push	de
	xor	a, a
	scf
	push	af
	ld	de, #0x0044
	push	de
	ld	de, #0x00b7
	push	de
	ld	de, #0x0000
	push	de
	ld	hl, #0x400
	push	hl
	call	_PlayFx
	add	sp, #12
;src/mushroompie.c:555: pop_by_id(&game_item_list, current_item_id);
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	ld	de, #_game_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
;src/mushroompie.c:556: show_dialog_window(2, &coin_found);
	ld	de, #_coin_found
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/mushroompie.c:557: add_coins(1); 
	ld	a, #0x01
	push	af
	inc	sp
	call	_add_coins
	inc	sp
;src/mushroompie.c:558: show_coins();
	call	_show_coins
;src/mushroompie.c:559: redraw_room = 1;
;src/mushroompie.c:560: warning_shown = 1;
	ld	bc, #0x101
	jr	00133$
00130$:
;src/mushroompie.c:562: if (inventory_item_list.size < 3) {
	ld	a, (#_inventory_item_list + 0)
	sub	a, #0x03
	jr	NC, 00127$
;src/mushroompie.c:563: pop_by_id(&game_item_list, current_item_id);
	push	bc
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ld	de, #_game_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
	ld	hl, #___temp_game_item3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #_inventory_item_list
	push	de
	call	_push_last
	add	sp, #4
	pop	bc
;src/mushroompie.c:565: redraw_room = 1;
	ld	c, #0x01
	jr	00133$
00127$:
;src/mushroompie.c:567: show_dialog_window(2, &too_much_items);
	push	bc
	ld	de, #_too_much_items
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
	pop	bc
;src/mushroompie.c:568: warning_shown = 1;
	ld	b, #0x01
00133$:
;src/mushroompie.c:572: if (!warning_shown) {
	ld	a, b
	or	a, a
	jp	NZ, 00149$
;src/mushroompie.c:573: __temp_game_item3 = show_inventory();
	push	bc
	call	_show_inventory
	pop	bc
	ld	hl, #___temp_game_item3
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/mushroompie.c:574: if (__temp_game_item3) {
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00149$
;src/mushroompie.c:575: current_item_id = __temp_game_item3->id;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (___temp_game_item3 + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	b, (hl)
;src/mushroompie.c:576: pop_by_id(&inventory_item_list, current_item_id);
	push	bc
	push	bc
	inc	sp
	ld	de, #_inventory_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
	pop	bc
;src/mushroompie.c:579: if (current_room->room_use) {
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0015
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00135$
;src/mushroompie.c:580: current_item_id = current_room->room_use(tile_pos_x, tile_pos_y + 1, current_item_id);
	ld	a, (#_tile_pos_y)
	inc	a
	push	bc
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	a, (#_tile_pos_x)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	add	sp, #3
	ld	a, e
	pop	bc
	ld	b, a
	jr	00136$
00135$:
;src/mushroompie.c:581: } else current_item_id = default_drop(current_item_id);
	push	bc
	push	bc
	inc	sp
	call	_default_drop
	inc	sp
	pop	bc
	ld	b, e
00136$:
;src/mushroompie.c:583: if (current_item_id) {
	ld	a, b
	or	a, a
	jr	Z, 00143$
;src/mushroompie.c:584: push_last(&item_stack, __temp_game_item3);
	push	bc
	ld	hl, #___temp_game_item3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #_item_stack
	push	de
	call	_push_last
	add	sp, #4
	pop	bc
;src/mushroompie.c:585: if (current_item_id == ID_ITEM_USED) {
	ld	a, b
	sub	a, #0x0f
	jr	NZ, 00140$
;src/mushroompie.c:586: __temp_game_item3 = 0;
	xor	a, a
	ld	hl, #___temp_game_item3
	ld	(hl+), a
	ld	(hl), a
;src/mushroompie.c:587: redraw_room = 1;
	ld	c, #0x01
	jr	00143$
00140$:
;src/mushroompie.c:589: __temp_game_item3 = pop_by_id(&game_item_list, current_item_id);
	push	bc
	push	bc
	inc	sp
	ld	de, #_game_item_list
	push	de
	call	_pop_by_id
	add	sp, #3
	pop	bc
	ld	hl, #___temp_game_item3
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/mushroompie.c:590: if (!__temp_game_item3) __temp_game_item3 = pop_by_id(&item_stack, current_item_id);
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00143$
	push	bc
	push	bc
	inc	sp
	ld	de, #_item_stack
	push	de
	call	_pop_by_id
	add	sp, #3
	pop	bc
	ld	hl, #___temp_game_item3
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00143$:
;src/mushroompie.c:594: if (__temp_game_item3) {
	ld	hl, #___temp_game_item3 + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00149$
;src/mushroompie.c:595: __temp_game_item3->room_row = current_room_y, __temp_game_item3->room_col = current_room_x;
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	a, (#_current_room_y)
	ld	(bc), a
	ld	hl, #___temp_game_item3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, (#_current_room_x)
	ld	(bc), a
;src/mushroompie.c:596: __temp_game_item3->x = tile_pos_x, __temp_game_item3->y = tile_pos_y + 1;
	ld	hl, #___temp_game_item3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a, (#_tile_pos_x)
	ld	(bc), a
	ld	hl, #___temp_game_item3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (#_tile_pos_y)
	inc	a
	ld	(bc), a
;src/mushroompie.c:597: push_last(&game_item_list, __temp_game_item3);
	ld	hl, #___temp_game_item3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #_game_item_list
	push	de
	call	_push_last
	add	sp, #4
;src/mushroompie.c:598: redraw_room = 1;
	ld	c, #0x01
00149$:
;src/mushroompie.c:602: if (redraw_room) {
	ld	a, c
	or	a, a
	jr	Z, 00160$
;src/mushroompie.c:603: FADE_OUT;
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
	ld	hl, #0x2c2c
	push	hl
	ld	hl, #0x9300
	push	hl
	call	_FadeDMG
	add	sp, #4
	call	_pop_bank
;src/mushroompie.c:579: if (current_room->room_use) {
	ld	hl, #_current_room
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/mushroompie.c:605: if (current_room->room_customdraw) current_room->room_customdraw(); else default_draw();
	ld	hl, #0x0019
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
;	spillPairReg hl
	ld	a, h
	or	a, c
	jr	Z, 00151$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	jr	00152$
00151$:
	call	_default_draw
00152$:
;src/mushroompie.c:606: FADE_IN;
	ld	a, #0x01
	push	af
	inc	sp
	call	_push_bank
	inc	sp
	ld	hl, #0x2c2c
	push	hl
	ld	hl, #0x9301
	push	hl
	call	_FadeDMG
	add	sp, #4
	call	_pop_bank
;src/mushroompie.c:608: rle_decompress_data(current_room->room_coll_map->rle_data, (UWORD)current_room->room_coll_map->size, coll_buf);
;src/mushroompie.c:579: if (current_room->room_use) {
	ld	hl, #_current_room
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_current_room + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;src/mushroompie.c:608: rle_decompress_data(current_room->room_coll_map->rle_data, (UWORD)current_room->room_coll_map->size, coll_buf);
	inc	hl
	inc	hl
	inc	hl
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
	inc	bc
	inc	bc
	ld	de, #_coll_buf
	push	de
	push	hl
	push	bc
	call	_rle_decompress_data
	add	sp, #6
00160$:
;src/mushroompie.c:522: __temp_i = animation[ani_type]->interr;
	ld	hl, #_ani_type
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
;src/mushroompie.c:618: if (double_dyn) current_dyn = double_y_data[ani_type]; else current_dyn = move_y_data[ani_type]; 
	add	hl, hl
	ld	c, l
	ld	b, h
;src/mushroompie.c:614: if (ani_type != ani_type_old) { 
	ld	a, (#_ani_type)
	ld	hl, #_ani_type_old
	sub	a, (hl)
	jr	Z, 00167$
;src/mushroompie.c:615: ani_phase = 0; 
	ld	hl, #_ani_phase
	ld	(hl), #0x00
;src/mushroompie.c:616: ani_update = 1;
	ld	hl, #_ani_update
	ld	(hl), #0x01
;src/mushroompie.c:617: if (!current_dyn) {
	ld	hl, #_current_dyn + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00165$
;src/mushroompie.c:618: if (double_dyn) current_dyn = double_y_data[ani_type]; else current_dyn = move_y_data[ani_type]; 
	ld	a, (#_double_dyn)
	or	a, a
	jr	Z, 00162$
	ld	hl, #_double_y_data
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_current_dyn
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	jr	00165$
00162$:
	ld	hl, #_move_y_data
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_current_dyn
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
00165$:
;src/mushroompie.c:620: current_dyn_phase = 0;
	ld	hl, #_current_dyn_phase
	ld	(hl), #0x00
00167$:
;src/mushroompie.c:622: double_dyn = 0;     
	ld	hl, #_double_dyn
	ld	(hl), #0x00
;src/mushroompie.c:624: if (walk_update) {
	ld	a, (#_walk_update)
	or	a, a
	jp	Z, 00180$
;src/mushroompie.c:625: is_position_safe = 0;
	ld	hl, #_is_position_safe
	ld	(hl), #0x00
;src/mushroompie.c:626: if ((!current_dyn) && ((ani_type == ANI_STAND) || (ani_type == ANI_WALK_L) || (ani_type == ANI_WALK_R))) {
	ld	hl, #_current_dyn + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00169$
	ld	hl, #_ani_type
	ld	a, (hl)
	or	a, a
	jr	Z, 00168$
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00168$
	ld	a, (#_ani_type)
	sub	a, #0x02
	jr	NZ, 00169$
00168$:
;src/mushroompie.c:627: tmp_room_x = current_room_x; tmp_room_y = current_room_y;
	ld	a, (#_current_room_x)
	ld	(#_tmp_room_x),a
	ld	a, (#_current_room_y)
	ld	(#_tmp_room_y),a
;src/mushroompie.c:628: tmp_dizzy_x = dizzy_x; tmp_dizzy_y = dizzy_y;
	ld	a, (#_dizzy_x)
	ld	(#_tmp_dizzy_x),a
	ld	a, (#_dizzy_x + 1)
	ld	(#_tmp_dizzy_x + 1),a
	ld	a, (#_dizzy_y)
	ld	(#_tmp_dizzy_y),a
	ld	a, (#_dizzy_y + 1)
	ld	(#_tmp_dizzy_y + 1),a
;src/mushroompie.c:629: is_position_safe = 1;
	ld	hl, #_is_position_safe
	ld	(hl), #0x01
00169$:
;src/mushroompie.c:632: delta_x = move_x_data[ani_type];
	ld	hl, #_move_x_data
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_delta_x
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/mushroompie.c:634: if ((bal_update) && (current_dyn)) {
	ld	a, (#_bal_update)
	or	a, a
	jr	Z, 00176$
	ld	hl, #_current_dyn + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00176$
;src/mushroompie.c:635: delta_y += current_dyn->steps[current_dyn_phase];
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	inc	de
	ld	hl, #_current_dyn_phase
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_delta_y
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_delta_y
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/mushroompie.c:636: current_dyn_phase++; if (current_dyn_phase >= current_dyn->count) current_dyn = 0;
	ld	hl, #_current_dyn_phase
	inc	(hl)
	ld	a, (bc)
	ld	c, a
	ld	a, (hl)
	sub	a, c
	jr	C, 00177$
	xor	a, a
	ld	hl, #_current_dyn
	ld	(hl+), a
	ld	(hl), a
	jr	00177$
00176$:
;src/mushroompie.c:637: } else delta_y = 0;
	xor	a, a
	ld	hl, #_delta_y
	ld	(hl+), a
	ld	(hl), a
00177$:
;src/mushroompie.c:639: check_change_room();
	call	_check_change_room
;src/mushroompie.c:641: check_dizzy_collisions();
	call	_check_dizzy_collisions
;src/mushroompie.c:642: dizzy_x += delta_x; dizzy_y += delta_y;
	ld	a, (#_dizzy_x)
	ld	hl, #_delta_x
	add	a, (hl)
	ld	hl, #_dizzy_x
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_delta_x + 1
	adc	a, (hl)
	ld	(#_dizzy_x + 1),a
	ld	a, (#_dizzy_y)
	ld	hl, #_delta_y
	add	a, (hl)
	ld	hl, #_dizzy_y
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_delta_y + 1
	adc	a, (hl)
	ld	(#_dizzy_y + 1),a
;src/mushroompie.c:644: set_dizzy_position();
	call	_set_dizzy_position
;src/mushroompie.c:646: set_enemies_position();
	call	_set_enemies_position
;src/mushroompie.c:648: walk_update = 0; bal_update = 0;
	ld	hl, #_walk_update
	ld	(hl), #0x00
	ld	hl, #_bal_update
	ld	(hl), #0x00
;src/mushroompie.c:649: delta_x = delta_y = 0;
	xor	a, a
	ld	hl, #_delta_y
	ld	(hl+), a
	ld	(hl), a
	xor	a, a
	ld	hl, #_delta_x
	ld	(hl+), a
	ld	(hl), a
;src/mushroompie.c:651: update_energy();
	call	_update_energy
00180$:
;src/mushroompie.c:654: if (ani_update) {
	ld	a, (#_ani_update)
	or	a, a
	jp	Z, 00208$
;src/mushroompie.c:655: current_animation = animation[ani_type];
	ld	hl, #_ani_type
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_animation
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_current_animation
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/mushroompie.c:656: wait_vbl_done();
	call	_wait_vbl_done
;src/mushroompie.c:657: set_dizzy_animdata(current_animation->steps[ani_phase]);
	ld	hl, #_current_animation
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl, #_ani_phase
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
	call	_set_dizzy_animdata
	pop	hl
;src/mushroompie.c:658: ani_phase++; 
	ld	hl, #_ani_phase
	inc	(hl)
;src/mushroompie.c:657: set_dizzy_animdata(current_animation->steps[ani_phase]);
	ld	hl, #_current_animation
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/mushroompie.c:659: if (ani_phase >= current_animation->count) {
	ld	a, (bc)
	ld	e, a
	ld	a, (#_ani_phase)
	sub	a, e
	jr	C, 00189$
;src/mushroompie.c:660: if ((dizzy_stun) && (ani_type != ANI_DEAD)) {
	ld	a, (#_dizzy_stun)
	or	a, a
	jr	Z, 00185$
	ld	a, (#_ani_type)
	sub	a, #0x07
	jr	Z, 00185$
;src/mushroompie.c:661: ani_type = ANI_STUN;
	ld	hl, #_ani_type
	ld	(hl), #0x06
;src/mushroompie.c:662: ani_phase = 0;
	ld	hl, #_ani_phase
	ld	(hl), #0x00
;src/mushroompie.c:663: dizzy_stun = 0;
	ld	hl, #_dizzy_stun
	ld	(hl), #0x00
;src/mushroompie.c:664: dec_energy += 10;
	ld	hl, #_dec_energy
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl), a
	jr	00189$
00185$:
;src/mushroompie.c:665: } else if (dizzy_falling) { 
	ld	a, (#_dizzy_falling)
	or	a, a
	jr	Z, 00182$
;src/mushroompie.c:666: ani_type = current_animation->fall_state;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	(#_ani_type),a
;src/mushroompie.c:667: ani_phase = 0;
	ld	hl, #_ani_phase
	ld	(hl), #0x00
	jr	00189$
00182$:
;src/mushroompie.c:669: ani_type = current_animation->next_state;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	(#_ani_type),a
;src/mushroompie.c:670: ani_phase = current_animation->cycle;
	inc	bc
	ld	a, (bc)
	ld	(#_ani_phase),a
00189$:
;src/mushroompie.c:673: ani_update = 0;
	ld	hl, #_ani_update
	ld	(hl), #0x00
;src/mushroompie.c:675: if (ani_type == ANI_DEAD) {
	ld	a, (#_ani_type)
	sub	a, #0x07
	jr	NZ, 00198$
;src/mushroompie.c:676: dizzy_stun = 0;
	ld	hl, #_dizzy_stun
	ld	(hl), #0x00
;src/mushroompie.c:677: if (death_pause) death_pause--;
	ld	hl, #_death_pause
	ld	a, (hl)
	or	a, a
	jr	Z, 00191$
	dec	(hl)
00191$:
;src/mushroompie.c:678: if (!death_pause) {
	ld	a, (#_death_pause)
	or	a, a
	jr	NZ, 00199$
;src/mushroompie.c:679: if (!game_over) {
	ld	a, (#_game_over)
	or	a, a
	jr	NZ, 00193$
;src/mushroompie.c:680: dizzy_x = safe_dizzy_x, dizzy_y = safe_dizzy_y;
	ld	a, (#_safe_dizzy_x)
	ld	(#_dizzy_x),a
	ld	a, (#_safe_dizzy_x + 1)
	ld	(#_dizzy_x + 1),a
	ld	a, (#_safe_dizzy_y)
	ld	(#_dizzy_y),a
	ld	a, (#_safe_dizzy_y + 1)
	ld	(#_dizzy_y + 1),a
;src/mushroompie.c:681: current_room_x = safe_room_x; current_room_y = safe_room_y;
	ld	a, (#_safe_room_x)
	ld	(#_current_room_x),a
	ld	a, (#_safe_room_y)
	ld	(#_current_room_y),a
;src/mushroompie.c:682: set_room(current_room_y, current_room_x, 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, (#_current_room_x)
	ld	h, a
	ld	a, (#_current_room_y)
	ld	l, a
	push	hl
	call	_set_room
	add	sp, #3
;src/mushroompie.c:683: wait_vbl_done();
	call	_wait_vbl_done
;src/mushroompie.c:684: set_dizzy_animdata(&m_stand_0);
	ld	de, #_m_stand_0
	push	de
	call	_set_dizzy_animdata
	pop	hl
;src/mushroompie.c:685: init_dizzy_energy(); 
	call	_init_dizzy_energy
;src/mushroompie.c:686: ani_type = ANI_STAND; ani_phase = 0;
	ld	hl, #_ani_type
	ld	(hl), #0x00
	ld	hl, #_ani_phase
	ld	(hl), #0x00
	jr	00199$
00193$:
;src/mushroompie.c:688: show_dialog_window(5, &game_over_dialog);
	ld	de, #_game_over_dialog
	push	de
	ld	a, #0x05
	push	af
	inc	sp
	call	_show_dialog_window
	add	sp, #3
;src/mushroompie.c:689: init_game();
	call	_init_game
	jr	00199$
00198$:
;src/mushroompie.c:692: } else check_dizzy_evil_collisions();
	call	_check_dizzy_evil_collisions
00199$:
;src/mushroompie.c:694: if (is_position_safe) {
	ld	a, (#_is_position_safe)
	or	a, a
	jp	Z, 00208$
;src/mushroompie.c:695: if (!((dizzy_falling) || (dec_energy))) {
	ld	a, (#_dizzy_falling)
	or	a, a
	jr	NZ, 00201$
	ld	a, (#_dec_energy)
	or	a, a
	jr	NZ, 00201$
;src/mushroompie.c:696: safe_room_x = tmp_room_x, safe_room_y = tmp_room_y; 
	ld	a, (#_tmp_room_x)
	ld	(#_safe_room_x),a
	ld	a, (#_tmp_room_y)
	ld	(#_safe_room_y),a
;src/mushroompie.c:697: safe_dizzy_x = tmp_dizzy_x, safe_dizzy_y = tmp_dizzy_y;
	ld	a, (#_tmp_dizzy_x)
	ld	(#_safe_dizzy_x),a
	ld	a, (#_tmp_dizzy_x + 1)
	ld	(#_safe_dizzy_x + 1),a
	ld	a, (#_tmp_dizzy_y)
	ld	(#_safe_dizzy_y),a
	ld	a, (#_tmp_dizzy_y + 1)
	ld	(#_safe_dizzy_y + 1),a
00201$:
;src/mushroompie.c:699: is_position_safe = 0;
	ld	hl, #_is_position_safe
	ld	(hl), #0x00
	jp	00208$
;src/mushroompie.c:703: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
__xinit____CRASH_HEANDLER_INIT:
	.dw ___HandleCrash
__xinit__ani_type:
	.db #0x00	; 0
__xinit__ani_phase:
	.db #0x00	; 0
__xinit__current_dyn:
	.dw #0x0000
__xinit__double_dyn:
	.db #0x00	; 0
__xinit__current_dyn_phase:
	.db #0x00	; 0
__xinit__ani_update:
	.db #0x00	; 0
__xinit__walk_update:
	.db #0x00	; 0
__xinit__bal_update:
	.db #0x00	; 0
__xinit__cloud_timer:
	.db #0x00	; 0
__xinit__current_room_x:
	.db #0x01	; 1
__xinit__current_room_y:
	.db #0x01	; 1
__xinit__current_room:
	.dw #0x0000
__xinit__dizzy_x:
	.dw #0x0068
__xinit__dizzy_y:
	.dw #0x0048
__xinit__dizzy_tmp_xy:
	.dw #0x0000
__xinit__delta_x:
	.dw #0x0000
__xinit__delta_y:
	.dw #0x0000
__xinit__safe_room_x:
	.db #0x00	; 0
__xinit__safe_room_y:
	.db #0x00	; 0
__xinit__is_position_safe:
	.db #0x01	; 1
__xinit__joy:
	.db #0x00	; 0
__xinit__game_over:
	.db #0x00	; 0
__xinit__death_pause:
	.db #0x00	; 0
__xinit__dizzy_falling:
	.db #0x00	; 0
__xinit__dizzy_stun:
	.db #0x00	; 0
__xinit__dizzy_old_pos_x:
	.dw #0xffff
__xinit__dizzy_old_pos_y:
	.dw #0xffff
__xinit__tim_div:
	.db #0x00	; 0
__xinit____lcd_int_state:
	.db #0x00	; 0
__xinit__inventory:
	.db #0x00	; 0
__xinit__lyc_table:
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x37	; 55	'7'
	.db #0x6f	; 111	'o'
	.area _CABS (ABS)
