UBYTE dasy_negotiated;
void reset_room5_1() {
    dasy_negotiated = 0;
}

#define mushroom_pos_x (4 * 8)
#define mushroom_pos_y (12 * 8)

void hcoll_mushroom(WORD x, WORD y) {
    if (delta_y >= 0) {
        if ((x >= (mushroom_pos_x - 8)) && (x <= (mushroom_pos_x + (2 * 8)))) {
            if ((y >= (mushroom_pos_y - 1)) && (y <= (mushroom_pos_y + 4))) {
                tile_pos_x = x >> 3; tile_pos_ox = (x - float4_pos_x) & 7;
                tile_pos_y = y >> 3; tile_pos_oy = y & 7;
                collision_buf[0] = 1; collision_buf[1] = 1; collision_buf[2] = 0;
                delta_y = 0;
                is_position_safe = 0;
                double_dyn = 1;
                return;
            }
        }
    }
    get_h_coll(x, y);
}

void vcoll_daisy(WORD x, WORD y) {
    if (!dasy_negotiated) {
        if ((y > (14 * 8)) && (x > (17 * 8)) && (x < (19 * 8))) {
            show_dialog_window(5, &daisy_dialog);
            dasy_negotiated = 1;
        }
    }
    get_v_coll(x, y);
}

UBYTE daisy_gets_mushrooms(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
    if (id == ID_MUSHROOMS) {
        if ((tile_y == 14) && (tile_x > 14) && (tile_x < 19)) {
            show_dialog_window(7, &daisy_gives_pie);
            return ID_PIE;
        }
    }
    return default_drop(id);
}