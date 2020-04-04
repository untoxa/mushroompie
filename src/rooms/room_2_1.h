const unsigned char const elevator_map[] = {0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8};
const spr_ofs_t const elevator_offsets[] = {{0x00, 0x14}, {0x08, 0x14}, {0x10, 0x14}, {0x18, 0x14}, {0x20, 0x14},
                                            {0x28, 0x08}, {0x28, 0x10}, {0x28, 0x18}, {0x28, 0x20},
                                            {0x48, 0x08}, {0x48, 0x10}, {0x48, 0x18}, {0x48, 0x20}};
#define elevator_sprite_count 13
#define elevator_sprite_offset evil_sprite_offset

#define elevator_pos_x (15 * 8)
#define elevator_min_y (3 * 8)
#define elevator_max_y (9 * 8)
UBYTE elevator_pos_y, elevator_dir, elevator_move, elevator_enabled, dylan_negotiated;
void reset_room2() {
    elevator_pos_y = elevator_min_y, elevator_dir = 1, elevator_move = 0, elevator_enabled = 0; dylan_negotiated = 0;
}
void init_room2() {
    set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
    for (__temp_i = 0; __temp_i < elevator_sprite_count; __temp_i++) 
        set_sprite_tile(elevator_sprite_offset + __temp_i, evil_sprites_tileoffset + elevator_map[__temp_i]);
}
void move_elevator() {
    if (elevator_enabled) {
        elevator_move++; elevator_move &= 1;
        if (!elevator_move) {
            if (elevator_dir) {
                elevator_pos_y++; if (elevator_pos_y >= elevator_max_y) elevator_dir = 0;
            } else {
                elevator_pos_y--; if (elevator_pos_y <= elevator_min_y) elevator_dir = 1;
            }
        }
    }
}
void draw_elevator() {
    if (!elevator_move) {
        multiple_move_sprites(elevator_sprite_offset, elevator_sprite_count, 
                              elevator_pos_x - bkg_scroll_x_target, elevator_pos_y - bkg_scroll_y_target, 
                              (unsigned char *)elevator_offsets);
    }
}
void hcoll_elevator(WORD x, WORD y) {
    if ((elevator_enabled) && (delta_y >= 0)) {
        if ((x >= elevator_pos_x - 8) && (x <= elevator_pos_x + (3 * 8))) {
            if ((y >= elevator_pos_y + ((4 * 8) - 1)) && (y <= elevator_pos_y + ((4 * 8) + 7))) {
                tile_pos_x = x >> 3; tile_pos_ox = x & 7;
                tile_pos_y = y >> 3; tile_pos_oy = (y - elevator_pos_y) & 7;
                collision_buf[0] = 1; collision_buf[1] = 1; collision_buf[2] = 0;
                if (!elevator_move) {
                    if (!elevator_dir) delta_y = -1; else delta_y = 0;
                }
                is_position_safe = 0;
                return;
            }
        }
    }
    get_h_coll(x, y);
}

void vcoll_dylan(WORD x, WORD y) {
    if (!dylan_negotiated) {
        if ((x > (21 * 8)) && (x < (24 * 8)) && (y > (10 * 8))) {
            show_dialog_window(6, &dylan_dialog);
            dylan_negotiated = 1;
        }
    }
    get_v_coll(x, y);
}

UBYTE dylan_gets_key(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
    if ((!elevator_enabled) && (id == ID_KEY)) {
        if ((tile_y == 12) && (tile_x > 19) && (tile_x < 24)) {
            show_dialog_window(4, &dylan_thanks);
            elevator_enabled = 1;
            dylan_negotiated = 1;
            return ID_ITEM_USED;
        }
    }
    return ID_ITEM_NONE;
}