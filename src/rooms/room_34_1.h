const spr_ofs_and_lim_t const float_offsets_r3[] = {{0x28, 0, 255, 0x08, 24, 248}, {0x28, 0, 255, 0x10, 24, 248}, {0x28, 0, 255, 0x18, 24, 248}, {0x28, 0, 255, 0x20, 24, 248}};
const spr_ofs_and_lim_t const float_offsets_r4[] = {{0x28, 0, 255, 0x08, 0, 64}, {0x28, 0, 255, 0x10, 0, 64}, {0x28, 0, 255, 0x18, 0, 64}, {0x28, 0, 255, 0x20, 0, 64}};
#define float_sprites_tileoffset evil_sprites_tileoffset
#define float_sprite_offset evil_sprite_offset
#define float_sprite_count 4
UBYTE troll_satisfied, troll_negotiated;
void reset_room4() {
    troll_satisfied = 0, troll_negotiated = 0;
}
void init_room34() {
    set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
    for (__temp_i = evil_sprite_offset; __temp_i < (evil_sprite_offset + 4); __temp_i++) 
        set_sprite_tile(__temp_i, evil_sprites_tileoffset);
}
UBYTE float_move_timer;
#define float_track_len ((17 * 8) + (8 * 8) - (4 * 8))
#define float34_pos_y (15 * 8)
UBYTE float3_move = 1, float4_move = 0;
#define float_length (4 * 8)
#define float3_min_x (13 * 8)
#define float3_max_x (room_width * 8)
WORD float3_pos_x = float3_min_x, float3_dir = 1;
#define float4_min_x (0 - float_length)
#define float4_max_x ((8 * 8) - float_length)
WORD float4_pos_x = float4_min_x, float4_dir = 1;
void move_float() {             // two floats in room 3 and 4 move in sync with each other
    float_move_timer++;
    if (float_move_timer & 1) return;
    if (float3_move) {
        if (float3_dir) {
            float3_pos_x++;
            if (float3_pos_x >= float3_max_x) { float3_dir = 0; float3_move = 0; }
            if (float3_pos_x == float3_max_x - (float_length + 14)) float4_move = 1;
        } else {
            float3_pos_x--;
            if (float3_pos_x <= float3_min_x) float3_dir = 1;
        }
    }    
    if (float4_move) {
        if (float4_dir) {
            float4_pos_x++;
            if (float4_pos_x >= float4_max_x) float4_dir = 0;
        } else {
            float4_pos_x--;
            if (float4_pos_x <= float4_min_x) { float4_dir = 1; float4_move = 0; }
            if (float4_pos_x == float4_min_x + (float_length + 15)) float3_move = 1;
        }
    }
}
void draw_float3() {
    multiple_move_sprites_limits(float_sprite_offset, float_sprite_count, 
                                 float3_pos_x, float34_pos_y, 
                                 (unsigned char *)float_offsets_r3, 
                                 -bkg_scroll_x_target, - bkg_scroll_y_target);
}
void draw_float4() {
    multiple_move_sprites_limits(float_sprite_offset, float_sprite_count, 
                                 float4_pos_x, float34_pos_y, 
                                 (unsigned char *)float_offsets_r4, 
                                 -bkg_scroll_x_target, -bkg_scroll_y_target);
}
void hcoll_float3(WORD x, WORD y) {
    if (delta_y >= 0) {
        if ((x >= float3_pos_x - 8) && (x <= float3_pos_x + (3 * 8))) {            
            if ((y >= float34_pos_y - 1) && (y <= float34_pos_y + 4)) {
                tile_pos_x = x >> 3; tile_pos_ox = (x - float3_pos_x) & 7;
                tile_pos_y = y >> 3; tile_pos_oy = y & 7;
                collision_buf[0] = 1; collision_buf[1] = 1; collision_buf[2] = 0;
                delta_y = 0;
                is_position_safe = 0;
                return;
            }
        }
    }
    get_h_coll(x, y);
}
void hcoll_float4(WORD x, WORD y) {
    if (delta_y >= 0) {
        if ((x >= float4_pos_x - 8) && (x <= float4_pos_x + (3 * 8))) {
            if ((y >= float34_pos_y - 1) && (y <= float34_pos_y + 4)) {
                tile_pos_x = x >> 3; tile_pos_ox = (x - float4_pos_x) & 7;
                tile_pos_y = y >> 3; tile_pos_oy = y & 7;
                collision_buf[0] = 1; collision_buf[1] = 1; collision_buf[2] = 0;
                delta_y = 0;
                is_position_safe = 0;
                return;
            }
        }
    }
    get_h_coll(x, y);
}

#define troll_x_position (22 * 8)
void vcoll_troll(WORD x, WORD y) {
    if (!troll_negotiated) {
        if (x >= troll_x_position) {
            show_dialog_window(4, &troll_dialog);
            troll_negotiated = 1;
        }
    }
    if ((!troll_satisfied) && (coins >= 3)) {
        if (x >= troll_x_position) {
        show_dialog_window(3, &troll_toll);
        sub_coins(3);
        show_coins();
        troll_satisfied = 1;
        }
    }
    if ((!troll_satisfied) && (delta_x >= 0)) {
        if (x >= troll_x_position) {
            tile_pos_x = x >> 3; 
            collision_buf[0] = 1; collision_buf[1] = 1;
            delta_x = -1;
            
            dizzy_stun = 1;
            ani_type = ANI_JUMP_L; ani_phase = 0;
            current_dyn = &move_y_dynamics; current_dyn_phase = 0;            
        }
    }
    get_v_coll(x, y);
}
