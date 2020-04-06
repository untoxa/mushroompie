#include <gb/gb.h>

#include "include/bank_stack.h"

#include "include/dizzy_types.h"

#include "include/rle_utils.h"
#include "include/sprite_utils.h"

#include "include/dialogs.h"

#define dizzy_sprite_count 9
#define dizzy_sprites_tileoffset 0x00U
#define dizzy_sprite_offset 0x00U
#define dizzy_sprite_tile_count 9

#include "gfx/title_gfx_data.h"
#include "gfx/anim_gfx_data.h"
#include "gfx/rooms_gfx.h"

#define room_width 30
#define room_height 17

#define rle_decompress_to_bkg 0
#define rle_decompress_to_win 1

#define MIN_DIZZY_X 0
#define MAX_DIZZY_X ((room_width - 2) * 8)
#define MIN_DIZZY_Y 0
#define MAX_DIZZY_Y ((room_height - 2) * 8)

const unsigned char const empty_compressed_map[] = {0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00,
                                                    0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00}; // 504 rle-compressed nulls to clear screen regions

#define evil_sprite_total_count 16
const spr_ofs_t const evil_hide[evil_sprite_total_count] = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, 
                                                            {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}};
#define evil_sprites_tileoffset dizzy_sprite_tile_count
#define evil_sprite_offset dizzy_sprite_count
          
unsigned char coll_buf[room_height * room_width];
const unsigned char * const current_coll_idx[room_height] = {  &coll_buf[0],  &coll_buf[30],  &coll_buf[60],  &coll_buf[90], &coll_buf[120], &coll_buf[150], 
                                                             &coll_buf[180], &coll_buf[210], &coll_buf[240], &coll_buf[270], &coll_buf[300], &coll_buf[330], 
                                                             &coll_buf[360], &coll_buf[390], &coll_buf[420], &coll_buf[450], &coll_buf[480]};
             
const ani_data * current_animation;
enum  animation_type ani_type = ANI_STAND, ani_type_old;
UBYTE ani_phase = 0;

const dyn_data * current_dyn = 0;       
UBYTE double_dyn = 0, current_dyn_phase = 0;

UBYTE ani_update = 0, walk_update = 0, bal_update = 0;
UBYTE cloud_timer = 0;

// current room coordinates and descriptor
UBYTE current_room_x = 1, current_room_y = 1; 
const room_t * current_room = 0;

// dizzy position within a room
WORD  dizzy_x = 104, dizzy_y = 72, dizzy_tmp_xy = 0;
WORD  delta_x = 0, delta_y = 0;

// resurrection position
UBYTE safe_room_x = 0, safe_room_y = 0; 
UBYTE tmp_room_x, tmp_room_y; 
WORD  safe_dizzy_x, safe_dizzy_y; 
WORD  tmp_dizzy_x, tmp_dizzy_y;
UBYTE is_position_safe = 1;

// joystick
UBYTE joy = 0;

// some general purpose variables
UBYTE __temp_i, __temp_j, __temp_k, __temp_l, __temp_m; 

#include "include/energy.h"

#define MAX_STUN_HEIGHT 32
UBYTE dizzy_falling = 0, dizzy_stun = 0;

UBYTE bkg_scroll_x_target, bkg_scroll_y_target;
WORD __temp_scroll_value;
WORD get_x_scroll_value(WORD x) {
    __temp_scroll_value = x - 68;
    if (__temp_scroll_value < 0) return 0; else if (__temp_scroll_value > 80) return 80; 
    return __temp_scroll_value;
}
WORD get_y_scroll_value(WORD y) {
    __temp_scroll_value = y - 56;
    if (__temp_scroll_value < 0) return 0; else if (__temp_scroll_value > 16) return 16;
    return __temp_scroll_value;
}

UBYTE tile_pos_x, tile_pos_y, tile_pos_ox, tile_pos_oy;
unsigned char collision_buf[3];                         // TODO: use bits instead of array: 0x01 if ground, 0x02 if small rock and so on
const unsigned char * __temp_coll_row;

void get_h_coll(WORD x, WORD y) {
    tile_pos_x = x >> 3; tile_pos_ox = x & 7;
    tile_pos_y = y >> 3; tile_pos_oy = y & 7;
    if (tile_pos_y < room_height) {
        __temp_coll_row = current_coll_idx[tile_pos_y];
        collision_buf[0] = __temp_coll_row[tile_pos_x]; collision_buf[1] = __temp_coll_row[tile_pos_x + 1];
        if ((tile_pos_ox) && (tile_pos_x < room_width - 2)) collision_buf[2] = __temp_coll_row[tile_pos_x + 2]; else collision_buf[2] = 0x00;
    } else { collision_buf[0] = 0x00; collision_buf[1] = 0x00; collision_buf[2] = 0x00; }
}
void get_v_coll(WORD x, WORD y) {
    tile_pos_x = x >> 3; 
    if (tile_pos_x < room_width) {
        tile_pos_y = y >> 3;
        if (tile_pos_y < room_height) { 
            collision_buf[0] = current_coll_idx[tile_pos_y][tile_pos_x]; 
        } else { 
            collision_buf[0] = 0x00; 
            tile_pos_y = 0; 
        }
        if (tile_pos_y < room_height - 1) collision_buf[1] = current_coll_idx[tile_pos_y + 1][tile_pos_x]; else collision_buf[1] = 0x00;
    } else { collision_buf[0] = 0x00; collision_buf[1] = 0x00;}
}
void get_coll(WORD x, WORD y) {
    __temp_i = ((x > 0)?(x >> 3):0);
    __temp_j = (x + 16) >> 3; if (__temp_j >= room_width) __temp_j = room_width - 1;
    __temp_k = ((y > 0)?(y >> 3):0);
    __temp_l = (y + 16) >> 3; if (__temp_l >= room_height) __temp_l = room_height - 1;
    
    collision_buf[0] = 0; collision_buf[1] = 0;
    for (__temp_k = __temp_k; __temp_k <= __temp_l; __temp_k++) {
        __temp_coll_row = current_coll_idx[__temp_k];
        for (__temp_m = __temp_i; __temp_m <= __temp_j; __temp_m++) {
            switch (__temp_coll_row[__temp_m]) {
                case 4 : collision_buf[1] = 4; break;
                case 6 : collision_buf[0] = 6; break;
                case 7 : collision_buf[0] = 7; return;
            }
        }
    }
}

void set_enemies_position() {
    if (current_room) {
        if (current_room->room_actions) current_room->room_actions();
        if (current_room->room_animations) current_room->room_animations();
    }
}

// dizzy animation and placing
void init_dizzy() {
    for(__temp_i = 0; __temp_i < dizzy_sprite_count; __temp_i++)
        set_sprite_tile(__temp_i, dizzy_sprites_tileoffset + __temp_i);
}
void set_dizzy_animdata(const s_data * sprite) NONBANKED {
    set_bank(2);
    __temp_k = (sprite->rev)?S_FLIPX:0;
    if ((get_sprite_prop(0) & S_FLIPX) != __temp_k) {
        multiple_clear_sprite_tiles(0, dizzy_sprite_tile_count);
        multiple_set_sprite_prop(0, dizzy_sprite_count, __temp_k);
        wait_vbl_done();
    }
    for (__temp_i = 0; __temp_i < dizzy_sprite_tile_count; __temp_i++)
        set_sprite_data(dizzy_sprites_tileoffset + __temp_i, 1, &dizzy_anim_tiles[sprite->data[__temp_i] << 4]);
}
WORD dizzy_old_pos_x = -1, dizzy_old_pos_y = -1; 
void set_dizzy_position() {
    if ((dizzy_old_pos_x != dizzy_x) || (dizzy_old_pos_y != dizzy_y)) {
        bkg_scroll_x_target = get_x_scroll_value(dizzy_x); 
        bkg_scroll_y_target = get_y_scroll_value(dizzy_y);
        multiple_move_sprites(0, dizzy_sprite_count, dizzy_x - bkg_scroll_x_target, dizzy_y - bkg_scroll_y_target, (unsigned char *)dizzy_offsets);
        dizzy_old_pos_x = dizzy_x; dizzy_old_pos_y = dizzy_y;
    }
}    

void check_dizzy_collisions() {
    if (delta_y >= 0) {
        if (current_room->room_h_coll) current_room->room_h_coll(dizzy_x, dizzy_y + 21); else get_h_coll(dizzy_x, dizzy_y + 21);
//set_win_tiles(1, 1, 3, 1, collision_buf);
        if ((collision_buf[0] == 1) || (collision_buf[1] == 1) || (collision_buf[2] == 1)) {
            if (tile_pos_oy < 7) delta_y = -1;
        } else if ((collision_buf[0] == 2) || (collision_buf[1] == 2) || (collision_buf[2] == 2)) {
            if (tile_pos_oy > 4) delta_y = -1; else if (tile_pos_oy < 4) delta_y = 1;
        } else if (!current_dyn) {
            delta_y = 1;
        }
        if (delta_y > 0) {            
            get_h_coll(dizzy_x, dizzy_y + 21 + delta_y);
//set_win_tiles(1, 2, 3, 1, collision_buf);
            if ((collision_buf[0] == 1) || (collision_buf[1] == 1) || (collision_buf[2] == 1)) {
                delta_y = 0;
            } else if ((collision_buf[0] == 2) || (collision_buf[1] == 2) || (collision_buf[2] == 2)) {
                if (tile_pos_oy > 4) delta_y = 0;
            } else if ((collision_buf[0] == 5) || (collision_buf[1] == 5) || (collision_buf[2] == 5)) {
                cloud_timer++; cloud_timer &= 3;
                if (cloud_timer) delta_y = 0;
            } else {
                is_position_safe = 0;
                if (!current_dyn) {
                    if (dizzy_falling < MAX_STUN_HEIGHT) dizzy_falling++;
                }
            }
        } else dizzy_falling = 0;
    } else {
        if (current_room->room_h_coll) current_room->room_h_coll(dizzy_x, dizzy_y + 4); else get_h_coll(dizzy_x, dizzy_y + 4);
//set_win_tiles(1, 1, 3, 1, collision_buf);
        if ((collision_buf[0] == 1) || (collision_buf[1] == 1) || (collision_buf[2] == 1)) {
            delta_y = 0;
        }
    }

    if (!delta_y) {
        if (dizzy_falling == MAX_STUN_HEIGHT) dizzy_stun = 1;
        dizzy_falling = 0;
    }            
    
    if (delta_x) {
        if (delta_x < 0) {
            if (current_room->room_v_coll) current_room->room_v_coll(dizzy_x + delta_x, dizzy_y + 8); else get_v_coll(dizzy_x + delta_x, dizzy_y + 8); 
        } else {
            if (current_room->room_v_coll) current_room->room_v_coll(dizzy_x + delta_x + 16, dizzy_y + 8); else get_v_coll(dizzy_x + delta_x + 16, dizzy_y + 8);
        }
//set_win_tiles(0, 0, 1, 2, collision_buf);
        if ((collision_buf[0] == 1) || (collision_buf[0] == 2) || (collision_buf[1] == 1)) {
            delta_x = 0;
        }
    }
}

void check_dizzy_evil_collisions() {
    if (ani_type != ANI_DEAD) {
        if (current_room->room_evil_coll) current_room->room_evil_coll(dizzy_x, dizzy_y + 2);
        get_coll(dizzy_x, dizzy_y + 2);
//set_win_tiles(2, 0, 2, 1, collision_buf);
        if (collision_buf[0] == 6) {
            if (dec_energy < 64) dec_energy += 2;
        } else if (collision_buf[0] == 7) {
            dizzy_energy = 1; dec_energy = 1;
        }
    }
}

void place_room_items(const UBYTE row, const UBYTE col, unsigned char * room_buf);

void set_room(const UBYTE row, const UBYTE col) NONBANKED {
    wait_vbl_done();
    disable_interrupts();
    current_room = dizzy_world[row]->rooms[col];
    
    set_bank(current_room->bank);
    
    // hide all possible evil sprites
    multiple_move_sprites(evil_sprite_offset, evil_sprite_total_count, 0, 0, (unsigned char *)evil_hide);

    // clear screen to avoid flickering
    for (__temp_j = 3; __temp_j < (3 + room_height); __temp_j++)
        rle_decompress_tilemap(rle_decompress_to_bkg, 0, __temp_j, 32, 1, empty_compressed_map);

    // unshrink background tiles
    unshrink_tiles(0x00, current_room->room_tiles->count, current_room->room_tiles->data); 

    // init room handler
    if (current_room->room_init) current_room->room_init();
 
    SCX_REG = bkg_scroll_x_target = get_x_scroll_value(dizzy_x);
    SCY_REG = bkg_scroll_y_target = get_y_scroll_value(dizzy_y);

    // decompress background tiles and collision map
    rle_decompress_data(current_room->room_map->rle_data, (UWORD)current_room->room_map->size, coll_buf);
    place_room_items(current_room_y, current_room_x, coll_buf);
    // draw background
    set_bkg_tiles(0, 3, room_width, room_height, coll_buf);
    // decompress collision map
    rle_decompress_data(current_room->room_coll_map->rle_data, (UWORD)current_room->room_coll_map->size, coll_buf);

    set_dizzy_position();

    enable_interrupts();
}
void check_change_room() {
    dizzy_tmp_xy = dizzy_x + delta_x;
    if (dizzy_tmp_xy < MIN_DIZZY_X) {
        if (current_room_x) { current_room_x--; dizzy_x = MAX_DIZZY_X; set_room(current_room_y, current_room_x); }
        delta_x = 0;
    } else if (dizzy_tmp_xy > MAX_DIZZY_X) { 
        current_room_x++; 
        if (current_room_x < WORLD_WIDTH) { dizzy_x = MIN_DIZZY_X; set_room(current_room_y, current_room_x); } else current_room_x = WORLD_WIDTH - 1;
        delta_x = 0;
    }
    
    dizzy_tmp_xy = dizzy_y + delta_y;
    if (dizzy_tmp_xy < MIN_DIZZY_Y) {
        if (current_room_y) { current_room_y--; dizzy_y = MAX_DIZZY_Y; set_room(current_room_y, current_room_x); }
    } else if (dizzy_tmp_xy > MAX_DIZZY_Y) {
        current_room_y++; 
        if (current_room_y < WORLD_HEIGHT) { dizzy_y = MIN_DIZZY_Y; set_room(current_room_y, current_room_x); } else current_room_y = WORLD_HEIGHT - 1;
    }    
}

UBYTE tim_div = 0;    
UBYTE __lcd_int_state = 0, inventory = 0;
UBYTE lyc_table[] = {0, 23,  0,  23, 
                     0, 23, 55, 111};
void lcd_interrupt() NONBANKED __naked 
{
__asm
            ld      A, (#_inventory)        ; if inventory then use lyc_table 0..3 else 4..7
            and     #1
            sla     A
            sla     A
            ld      HL, #___lcd_int_state
            ld      E, (HL)
            add     E
            
            ld      HL, #_lyc_table
            add     L
            ld      L, A
            ld      A, H
            adc     #0
            ld      H, A                    ; HL = &lyc_table[__lcd_int_state]
            
            ld      A,(HL)
            ldh     (#_LYC_REG), A          ; setting next interrupt row
            
            ld      A, E            
            inc     A
            and     #3
            ld      (#___lcd_int_state), A  ; __lcd_int_state++; __lcd_int_state&=3;

            and     #1
            sla     A
            ld      E,A
            xor     #2
            swap    A
            or      E                       ; E = ((__lcd_int_state & 1) << 5) | (((!__lcd_int_state) & 1) << 1)
            ld      E, A                    ; when WIN is ON, OBJ are OFF
            ldh     A, (#_LCDC_REG)
            and     #0xDD                   ; mask other bits except WIN and OBJ
            or      E
            ldh     (#_LCDC_REG), A         ; manipulate WIN and OBJ visibiliry
            ret
__endasm;
}    
void vbl_interrupt() NONBANKED __naked
{
__asm
            ld      A, (#_bkg_scroll_x_target)
            ldh     (#_SCX_REG), A
            ld      A, (#_bkg_scroll_y_target)
            ldh     (#_SCY_REG), A
            
            ld      A, (#_tim_div)
            inc     A
            and     #3
            ld      (#_tim_div), A
            jr      NZ, $vblint01 
            ld      HL, #_ani_update
            ld      (HL), #1
$vblint01:  and     #1
            jr      Z, $vblint02
            ld      (#_bal_update), A
$vblint02:  ld      A, #1
            ld      (#_walk_update), A        
            ret
__endasm;
} 
void wait_inventory() __naked
{
__asm
$my_vbl01:  ld      A, (#___lcd_int_state)
            and     #1
            jr      NZ, $my_vbl01
            ret
__endasm;
}

#include "include/inventory.h"

// room specific handlers
#include "rooms/room_0_1.h"
#include "rooms/room_1_1.h"
#include "rooms/room_2_1.h" 
#include "rooms/room_34_1.h"
#include "rooms/room_5_1.h" 

void reset_world() {
    for (UBYTE row = 0; row < WORLD_HEIGHT; row++) {
        for (UBYTE col = 0; col < WORLD_WIDTH; col++) {
            const room_t * cur_room = dizzy_world[row]->rooms[col];
            if ((cur_room) && (cur_room->room_reset)) cur_room->room_reset();
        }
    }
}

void init_game() {
    reset_world();
    init_game_items();
    game_over = 0;
    init_dizzy_coins(); show_coins();
    init_dizzy_lives(); show_lives();
    init_dizzy_energy(); show_energy();
    current_room_x = 1, current_room_y = 1; 
    set_room(current_room_y, current_room_x);
    set_dizzy_animdata(&m_stand_0);            
    dizzy_x = 104, dizzy_y = 72;
    ani_type = ANI_STAND; ani_phase = 0;
    set_dizzy_position();
}

void main() {
    DISPLAY_OFF;
    disable_interrupts();
    
    LCDC_REG = 0x44U;

    // initialize LCD interrupts
    STAT_REG = 0x45;
    LYC_REG = 0;
    add_LCD(lcd_interrupt);
    add_VBL(vbl_interrupt);
    
    set_interrupts(VBL_IFLAG | LCD_IFLAG);
    
    // load palettes
    BGP_REG = 0x93U; OBP0_REG = OBP1_REG = 0x2CU;
    
    SPRITES_8x8;
    init_dizzy();
    SHOW_SPRITES;
    
    WX_REG = 7; WY_REG = 0;
        
    set_bank(1);
    unshrink_tiles(window_tiles_hiwater, title_shrinked_tiles.count, title_shrinked_tiles.data);
    inventoty_tiles_start = window_tiles_hiwater += title_shrinked_tiles.count;
         
    unshrink_tiles(window_tiles_hiwater, dialog_frame_tiles.count, dialog_frame_tiles.data);
    font_tiles_start = window_tiles_hiwater += dialog_frame_tiles.count;
    digits_start = font_tiles_start + 0x0F;
    dizzy_live_symbol = font_tiles_start + 0x1F;

    unshrink_tiles(window_tiles_hiwater, font_tiles.count, font_tiles.data);
    dizzy_energy_start = window_tiles_hiwater += font_tiles.count;

    unshrink_tiles(window_tiles_hiwater, energy_tiles.count, energy_tiles.data);
    window_tiles_hiwater += energy_tiles.count;

    set_win_tiles(0, 0, 20, 3, title_map);
        
    current_room_x = 1, current_room_y = 1; 

    set_room(current_room_y, current_room_x);

    SHOW_BKG;
    
    enable_interrupts();
    DISPLAY_ON;
    
    show_dialog_window(6, &start_dialog);
    init_game();
        
// --- debugging --------------
//current_room_x = 5, current_room_y = 0, dizzy_x = 80; set_room(current_room_y, current_room_x); //dizzy_y = 30; // set any for debugging
//elevator_enabled = 1;
//coins = 3; show_coins();
// ----------------------------

    while(1) {
        ani_type_old = ani_type;

        if (!death_pause) {
            joy = joypad();
            __temp_i = animation[ani_type]->interr;
            if ((!current_dyn) && (!dizzy_falling) && ((__temp_i == 255) || (__temp_i == ani_phase))) {
                if (!joy) {
                    ani_type = ANI_STAND;    
                } else if (joy & J_LEFT) {
                    if ((joy & J_UP) || (joy & J_A)) {
                        ani_type = ANI_JUMP_L;
                    } else {
                        ani_type = ANI_WALK_L;
                    }
                } else if (joy & J_RIGHT) {
                    if ((joy & J_UP) || (joy & J_A)) {
                        ani_type = ANI_JUMP_R;
                    } else {
                        ani_type = ANI_WALK_R; 
                    }
                } else if ((joy == J_UP) || (joy == J_A)) {
                    ani_type = ANI_UP;
                }
            }
            if (joy == J_B) {
                if (is_position_safe) {
                    waitpadup();
                    UBYTE redraw_room = 0, warning_shown = 0, current_item_id = 0;
                    tile_pos_x = dizzy_x >> 3, tile_pos_y = dizzy_y >> 3;
                    __temp_game_item3 = find_by_room_xy(&game_item_list, current_room_y, current_room_x, tile_pos_x, tile_pos_y);
                    if (__temp_game_item3) {
                        current_item_id = __temp_game_item3->desc->id;
                        if (!(current_item_id & ID_TREASURE)) {
                            if (inventory_item_list.size < 3) {
                                pop_by_id(&game_item_list, current_item_id);
                                push_last(&inventory_item_list, __temp_game_item3);
                                redraw_room = 1;
                            } else {
                                show_dialog_window(2, &too_much_items);
                                warning_shown = 1;
                            }
                        } else {
                            pop_by_id(&game_item_list, current_item_id);
                            show_dialog_window(2, &coin_found);
                            add_coins(1); 
                            show_coins();
                            redraw_room = 1;
                            warning_shown = 1;
                        }
                    }
                    if (!warning_shown) {
                        __temp_game_item3 = show_inventory();
                        if (__temp_game_item3) {
                            current_item_id = __temp_game_item3->desc->id;
                            pop_by_id(&inventory_item_list, current_item_id);
                            // put or use item
                            if (current_room->room_use) {
                                current_item_id = current_room->room_use(tile_pos_x, tile_pos_y + 1, current_item_id);
                                if (current_item_id) __temp_game_item3 = pop_by_id(&game_item_list, current_item_id);
                            }
                            if (__temp_game_item3) {
                                __temp_game_item3->room_row = current_room_y, __temp_game_item3->room_col = current_room_x;
                                __temp_game_item3->x = tile_pos_x, __temp_game_item3->y = tile_pos_y + 1;
                                push_last(&game_item_list, __temp_game_item3);
                                redraw_room = 1;
                            }
                        }
                    }
                    if (redraw_room) {
                        set_bank(current_room->bank);
                        rle_decompress_data(current_room->room_map->rle_data, (UWORD)current_room->room_map->size, coll_buf);
                        place_room_items(current_room_y, current_room_x, coll_buf);
                        set_bkg_tiles(0, 3, room_width, room_height, coll_buf);
                        rle_decompress_data(current_room->room_coll_map->rle_data, (UWORD)current_room->room_coll_map->size, coll_buf);
                    }
                }
            }
        }
        
        if (ani_type != ani_type_old) { 
            ani_phase = 0; 
            ani_update = 1;
            if (!current_dyn) {
                if (double_dyn) current_dyn = double_y_data[ani_type]; else current_dyn = move_y_data[ani_type]; 
            }
            current_dyn_phase = 0;
        }
        double_dyn = 0;     
                
        if (walk_update) {
            is_position_safe = 0;
            if ((!current_dyn) && ((ani_type == ANI_STAND) || (ani_type == ANI_WALK_L) || (ani_type == ANI_WALK_R))) {
                tmp_room_x = current_room_x; tmp_room_y = current_room_y;
                tmp_dizzy_x = dizzy_x; tmp_dizzy_y = dizzy_y;
                is_position_safe = 1;
            }
            
            delta_x = move_x_data[ani_type];

            if ((bal_update) && (current_dyn)) {
                delta_y += current_dyn->steps[current_dyn_phase];
                current_dyn_phase++; if (current_dyn_phase >= current_dyn->count) current_dyn = 0;
            } else delta_y = 0;

            check_change_room();

            check_dizzy_collisions();
            dizzy_x += delta_x; dizzy_y += delta_y;

            set_dizzy_position();

            set_enemies_position();

            walk_update = 0; bal_update = 0;
            delta_x = delta_y = 0;

            update_energy();
        };
        
        if (ani_update) {
            current_animation = animation[ani_type];
            wait_vbl_done();
            set_dizzy_animdata(current_animation->steps[ani_phase]);
            ani_phase++; 
            if (ani_phase >= current_animation->count) {
                if ((dizzy_stun) && (ani_type != ANI_DEAD)) {
                    ani_type = ANI_STUN;
                    ani_phase = 0;
                    dizzy_stun = 0;
                    dec_energy += 10;
                } else if (dizzy_falling) { 
                    ani_type = current_animation->fall_state;
                    ani_phase = 0;
                } else {
                    ani_type = current_animation->next_state;
                    ani_phase = current_animation->cycle;
                }
            }
            ani_update = 0;

            if (ani_type == ANI_DEAD) {
                dizzy_stun = 0;
                if (death_pause) death_pause--;
                if (!death_pause) {
                    if (!game_over) {
                        dizzy_x = safe_dizzy_x, dizzy_y = safe_dizzy_y;
                        current_room_x = safe_room_x; current_room_y = safe_room_y;
                        set_room(current_room_y, current_room_x);
                        set_dizzy_animdata(&m_stand_0);
                        init_dizzy_energy(); 
                        ani_type = ANI_STAND; ani_phase = 0;
                    } else {
                        show_dialog_window(5, &game_over_dialog);
                        init_game();
                    }
                }
            } else check_dizzy_evil_collisions();

            if (is_position_safe) {
                if (!((dizzy_falling) || (dec_energy))) {
                    safe_room_x = tmp_room_x, safe_room_y = tmp_room_y; 
                    safe_dizzy_x = tmp_dizzy_x, safe_dizzy_y = tmp_dizzy_y;
                }
                is_position_safe = 0;
            }
        }        
    }
}