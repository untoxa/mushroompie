#include <gb/gb.h>

#include "include/rle_utils.h"

#include "gfx/rooms_gfx.h"
#include "gfx/dizzy_anim_gfx.h"
#include "gfx/title_gfx.h"

#define room_width 30
#define room_height 17

#define rle_decompress_to_bkg 0
#define rle_decompress_to_win 1

#define MIN_DIZZY_X 0
#define MAX_DIZZY_X ((room_width - 2) * 8)
#define MIN_DIZZY_Y 0
#define MAX_DIZZY_Y ((room_height - 2) * 8)

const fixed const dizzy_offsets[] = {{.w={0x0426}}, {.w={0x0C26}}, {.w={0x1426}}, {.w={0x0436}}, {.w={0x0C36}}, {.w={0x1436}}};

#define dizzy_sprite_count 6
#define dizzy_sprite_tile_count 12
      
enum  animation_type { ANI_STAND, ANI_UP, ANI_WALK_R, ANI_WALK_L, ANI_ROLL_R, ANI_ROLL_L, ANI_STUN, ANI_DEAD, ANI_JUMP_R, ANI_JUMP_L};
      
const ani_data const stand_ani  = { 2, 0, 255, ANI_STAND,  ANI_STAND,  {&m_stand_0, &m_stand_1}};
const ani_data const up_ani     = {16, 0,   0, ANI_STAND,  ANI_UP,     {&m_stand_0, &m_up_0, &m_up_1, &m_up_2, &m_up_3, &m_up_4, &m_up_5, &m_up_6, 
                                                                        &m_stand_0, &m_up_0, &m_up_1, &m_up_2, &m_up_3, &m_up_4, &m_up_5, &m_up_6}};
const ani_data const walk_r_ani = { 8, 0, 255, ANI_STAND,  ANI_ROLL_R, {&m_walk_r_0, &m_walk_r_1, &m_walk_r_2, &m_walk_r_1, &m_walk_r_0, &m_walk_r_3, &m_walk_r_2, &m_walk_r_3}};
const ani_data const walk_l_ani = { 8, 0, 255, ANI_STAND,  ANI_ROLL_L, {&m_walk_l_0, &m_walk_l_1, &m_walk_l_2, &m_walk_l_1, &m_walk_l_0, &m_walk_l_3, &m_walk_l_2, &m_walk_l_3}};
const ani_data const roll_r_ani = { 8, 0, 254, ANI_WALK_R, ANI_ROLL_R, {&m_walk_r_0, &m_roll_r_0, &m_roll_r_1, &m_roll_r_2, &m_roll_r_3, &m_roll_r_4, &m_roll_r_5, &m_roll_r_6}};
const ani_data const roll_l_ani = { 8, 0, 254, ANI_WALK_L, ANI_ROLL_L, {&m_walk_l_0, &m_roll_l_0, &m_roll_l_1, &m_roll_l_2, &m_roll_l_3, &m_roll_l_4, &m_roll_l_5, &m_roll_l_6}};
const ani_data const jump_r_ani = {16, 0,   0, ANI_WALK_R, ANI_ROLL_R, {&m_walk_r_0, &m_roll_r_0, &m_roll_r_1, &m_roll_r_2, &m_roll_r_3, &m_roll_r_4, &m_roll_r_5, &m_roll_r_6,
                                                                        &m_walk_r_0, &m_roll_r_0, &m_roll_r_1, &m_roll_r_2, &m_roll_r_3, &m_roll_r_4, &m_roll_r_5, &m_roll_r_6}};
const ani_data const jump_l_ani = {16, 0,   0, ANI_WALK_L, ANI_ROLL_L, {&m_walk_l_0, &m_roll_l_0, &m_roll_l_1, &m_roll_l_2, &m_roll_l_3, &m_roll_l_4, &m_roll_l_5, &m_roll_l_6,
                                                                        &m_walk_l_0, &m_roll_l_0, &m_roll_l_1, &m_roll_l_2, &m_roll_l_3, &m_roll_l_4, &m_roll_l_5, &m_roll_l_6}};
const ani_data const stun_ani   = { 5, 0, 254, ANI_STAND,  ANI_STAND,  {&m_stun_0, &m_stun_1, &m_stun_2, &m_stun_3, &m_stun_4}};
const ani_data const dead_ani   = { 4, 3, 254, ANI_DEAD,   ANI_DEAD,   {&m_dead_0, &m_dead_1, &m_dead_2, &m_dead_1}};
        
const ani_data * const animation[] = {&stand_ani, &up_ani, &walk_r_ani, &walk_l_ani, &roll_r_ani, &roll_l_ani, &stun_ani, &dead_ani, &jump_r_ani, &jump_l_ani};

const ani_data * current_animation;

typedef struct {
    UBYTE count;
    WORD steps[];
} dyn_data;

const dyn_data   const move_y_dynamics = {32, {-4, -4, -3, -2, -2, -1, -2, -1, -1, -1, -1, -1,  0, -1,  0,  0,  
                                                0,  0,  1,  0,  1,  1,  1,  1,  1,  2,  1,  2,  2,  3,  4,  4}
                                         };
const dyn_data * const move_y_data[]   = {0, &move_y_dynamics, 0,  0, 0,  0, 0, 0, &move_y_dynamics, &move_y_dynamics};
const WORD       const move_x_data[]   = {0, 0,                1, -1, 1, -1, 0, 0, 1,                -1};

unsigned char coll_buf[room_height * room_width];
const unsigned char * const current_coll_idx[room_height] = {  &coll_buf[0],  &coll_buf[30],  &coll_buf[60],  &coll_buf[90], &coll_buf[120], &coll_buf[150], 
                                                             &coll_buf[180], &coll_buf[210], &coll_buf[240], &coll_buf[270], &coll_buf[300], &coll_buf[330], 
                                                             &coll_buf[360], &coll_buf[390], &coll_buf[420], &coll_buf[450], &coll_buf[480]};
             
enum  animation_type ani_type = ANI_STAND, ani_type_old;
UBYTE ani_phase = 0;
UBYTE ani_update = 0, walk_update = 0, bal_update = 0;
UBYTE temp;

const dyn_data * current_dyn = 0;       
UBYTE      current_dyn_phase = 0;

// dizzy position within a room
WORD  dizzy_x = 112, dizzy_y = 72, dizzy_tmp_xy = 0;
WORD  delta_x = 0, delta_y = 0;

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

#define dizzy_sprites_tileoffset 0x00U
UBYTE __temp_i, __temp_k; 
void init_dizzy()
{
    for(__temp_i = 0; __temp_i < dizzy_sprite_count; __temp_i++) {
        set_sprite_tile(__temp_i, dizzy_sprites_tileoffset + (__temp_i << 1));
    }            
}

void set_dizzy_animdata(const s_data * sprite)
{
    __temp_k = (sprite->rev)?S_FLIPX:0;
    if ((get_sprite_prop(0) & S_FLIPX) != __temp_k) {
        for (__temp_i = 0; __temp_i < dizzy_sprite_tile_count; __temp_i++)
            set_sprite_data(dizzy_sprites_tileoffset + __temp_i, 1, dizzy_anim_tiles);
        for (__temp_i = 0; __temp_i <= dizzy_sprite_count; __temp_i++) 
            set_sprite_prop(__temp_i, __temp_k);
    }
    for (__temp_i = 0; __temp_i < dizzy_sprite_tile_count; __temp_i++)
        set_sprite_data(dizzy_sprites_tileoffset + __temp_i, 1, &dizzy_anim_tiles[sprite->data[__temp_i] << 4]);
}
WORD scroll_dx = 0, scroll_dy = 0;
WORD dizzy_old_pos_x = -1, dizzy_old_pos_y = -1; 
void set_dizzy_position() {
    if ((dizzy_old_pos_x != dizzy_x) || (dizzy_old_pos_y != dizzy_y)) {
        bkg_scroll_x_target = scroll_dx = get_x_scroll_value(dizzy_x); 
        bkg_scroll_y_target = scroll_dy = get_y_scroll_value(dizzy_y);
        for(__temp_i = 0; __temp_i < dizzy_sprite_count; __temp_i++) 
            move_sprite(__temp_i, dizzy_x + dizzy_offsets[__temp_i].b.h - scroll_dx, dizzy_y + dizzy_offsets[__temp_i].b.l - scroll_dy);
        dizzy_old_pos_x = dizzy_x; dizzy_old_pos_y = dizzy_y;
    }
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

void check_dizzy_collisions() {
    if (delta_y >= 0) {
        get_h_coll(dizzy_x, dizzy_y + 21);
//        set_win_tiles(1, 1, 3, 1, collision_buf);
        if ((collision_buf[0] == 1) || (collision_buf[1] == 1) || (collision_buf[2] == 1)) {
            if (tile_pos_oy <= 4) delta_y = -1;
        } else if ((collision_buf[0] == 2) || (collision_buf[1] == 2) || (collision_buf[2] == 2)) {
            if (tile_pos_oy > 4) delta_y = -1; else if (tile_pos_oy < 4) delta_y = 1;
        } else if (!current_dyn) {
            delta_y = 1;
        }
        if (delta_y > 0) {            
            get_h_coll(dizzy_x, dizzy_y + 21 + delta_y);
//            set_win_tiles(1, 2, 3, 1, collision_buf);
            if ((collision_buf[0] == 1) || (collision_buf[1] == 1) || (collision_buf[2] == 1)) {
                delta_y = 0;
            } else if ((collision_buf[0] == 2) || (collision_buf[1] == 2) || (collision_buf[2] == 2)) {
                if (tile_pos_oy > 4) delta_y = 0;
            } else {
                if (!current_dyn) {
                    if (dizzy_falling < MAX_STUN_HEIGHT) dizzy_falling++;
                }
            }
            if (!delta_y) {
                if (dizzy_falling == MAX_STUN_HEIGHT) dizzy_stun = 1;
                dizzy_falling = 0;
            }            
        } else dizzy_falling = 0;
    } else {
        get_h_coll(dizzy_x, dizzy_y + 4);
//        set_win_tiles(1, 1, 3, 1, collision_buf);
        if ((collision_buf[0] == 1) || (collision_buf[1] == 1) || (collision_buf[2] == 1)) {
            delta_y = 0;
        }
    }
    
    if (delta_x) {
        if (delta_x < 0) get_v_coll(dizzy_x + delta_x, dizzy_y); else get_v_coll(dizzy_x + delta_x + 16, dizzy_y);
//        set_win_tiles(0, 0, 1, 2, collision_buf);
        if ((collision_buf[0] == 1) || (collision_buf[0] == 2) || (collision_buf[1] == 1)) {
            delta_x = 0;
        }
    }
}

UBYTE current_room_x = 1, current_room_y = 1, __temp_j; 
const room_t * target_room;
unsigned char * __data_ptr;
void set_room(UBYTE row, UBYTE col) {
    wait_vbl_done();
    disable_interrupts();
    target_room = dizzy_world[row]->rooms[col];
    __data_ptr = target_room->room_tiles->data;
    for (__temp_j = 3; __temp_j < (3 + room_height); __temp_j++) {
        set_bkg_tiles(0, __temp_j, 16, 1, dizzy_anim_tiles);
        set_bkg_tiles(16, __temp_j, 16, 1, dizzy_anim_tiles);
    }

    unshrink_tiles(0x00, target_room->room_tiles->count, __data_ptr);  

    rle_decompress_tilemap(rle_decompress_to_bkg, 0, 3, room_width, room_height, target_room->room_map->rle_data);
    rle_decompress_data(target_room->room_coll_map->rle_data, (UWORD)target_room->room_coll_map->size, coll_buf);

    SCX_REG = bkg_scroll_x_target = get_x_scroll_value(dizzy_x);
    SCY_REG = bkg_scroll_y_target = get_y_scroll_value(dizzy_y);
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
const UBYTE const __lyc_table[] = {0, 23,  0,  23,
                                   0, 23, 55, 111};
void lcd_interrupt() __naked 
{
__asm
            ld      A, (#_inventory)        ; if inventory then use lyc_table 0..3 else 4..7
            and     #1
            sla     A
            sla     A
            ld      HL, #___lcd_int_state
            ld      E, (HL)
            add     E
            
            ld      HL, #___lyc_table
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

void vbl_interrupt() __naked
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

UBYTE joy = 0;        
void show_inventory() {
    inventory = 1;
    while(inventory) {
        wait_vbl_done();
        joy = joypad();
        if (joy & J_B) {
            (inventory = 0);
        }
    }
    waitpadup();
}

unsigned char dizzy_lives_indicator[3] = {0x92, 0x92, 0x92};
void main()
{
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
    BGP_REG = 0x63U; OBP0_REG = OBP1_REG = 0x2CU;
            
    SPRITES_8x16;
    init_dizzy();
    set_dizzy_animdata(&m_stand_0);            
    set_dizzy_position();
    SHOW_SPRITES;
    
    WX_REG = 7; WY_REG = 0;
    unshrink_tiles(0x80, 18, title_shrinked_tiles);
    set_win_tiles(0, 0, 20, 3, title_map);
    unshrink_tiles(0x92, 12, misc_shrinked_tiles);
    set_win_tiles(15, 1, sizeof(dizzy_lives_indicator), 1, dizzy_lives_indicator);
    rle_decompress_tilemap(rle_decompress_to_win, 0, 3, 20, 7, inventory_window_map);
    
    enable_interrupts();
    DISPLAY_ON;

//    current_room_x = 5, current_room_y = 0, dizzy_x = 80;  // set any for debugging

    set_room(current_room_y, current_room_x);
    SHOW_BKG;
    
    while(1) {
        ani_type_old = ani_type;

        joy = joypad();
        temp = animation[ani_type]->interr;
        if ((!current_dyn) && (!dizzy_falling) && ((temp == 255) || (temp == ani_phase))) {
            if (!joy) {
                ani_type = ANI_STAND;    
            } else if (joy & J_LEFT) {
                if ((joy & J_UP) || (joy & J_B)) {
                    ani_type = ANI_JUMP_L;
                } else {
                    ani_type = ANI_WALK_L;
                }
            } else if (joy & J_RIGHT) {
                if ((joy & J_UP) || (joy & J_B)) {
                    ani_type = ANI_JUMP_R;
                } else {
                    ani_type = ANI_WALK_R; 
                }
            } else if ((joy == J_UP) || (joy == J_B)) {
                ani_type = ANI_UP;
            }
        }
        if (joy == J_A) {
            show_inventory();
        }
        
        if (ani_type != ani_type_old) { 
            ani_phase = 0; 
            ani_update = 1;
            if (!current_dyn) current_dyn = move_y_data[ani_type]; current_dyn_phase = 0;
        }
                
        if (walk_update) {
            delta_x = move_x_data[ani_type];

            if ((bal_update) && (current_dyn)) {
                delta_y += current_dyn->steps[current_dyn_phase];
                current_dyn_phase++; if (current_dyn_phase >= current_dyn->count) current_dyn = 0;
            } else delta_y = 0;

            check_change_room();

            check_dizzy_collisions();
            dizzy_x += delta_x; dizzy_y += delta_y;

            set_dizzy_position();
            walk_update = 0; bal_update = 0;
            delta_x = delta_y = 0;
        };
        
        if (ani_update) {
            current_animation = animation[ani_type];
            wait_vbl_done();
            set_dizzy_animdata(current_animation->steps[ani_phase]);
            ani_phase++; 
            if (ani_phase >= current_animation->count) {
                if (dizzy_stun) {
                    ani_type = ANI_STUN;
                    ani_phase = 0;
                    dizzy_stun = 0;
                } else if (dizzy_falling) { 
                    ani_type = current_animation->fall_state;
                    ani_phase = 0;
                } else {
                    ani_type = current_animation->next_state;
                    ani_phase = current_animation->cycle;
                }
            }
            ani_update = 0;
        }        
    }
}