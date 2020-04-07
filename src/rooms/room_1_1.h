UBYTE intro_shown, path_cleaned;
void reset_room1() {
    intro_shown = 0, path_cleaned = 0;
}

void hcoll_blockage(WORD x, WORD y) {
    x; y; 
    if (!intro_shown) {
        show_dialog_window(5, &intro);
        intro_shown = 1;
    }
    get_h_coll(x, y);
}

void vcoll_blockage(WORD x, WORD y) {
    if ((!path_cleaned) && (delta_x >= 0)) {
        if (x >= (17 * 8)) {
            tile_pos_x = x >> 3; 
            collision_buf[0] = 1; collision_buf[1] = 1;
            return;
        }
    }
    get_v_coll(x, y);
}

UBYTE cleaning_path(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
    tile_y;
    if ((!path_cleaned) && (id == ID_PICKAXE)) {
        if (tile_x >= 14) {
            show_dialog_window(2, &cleared_path);
            // remove boulders: 3 items with the same ID
            pop_by_id(&game_item_list, ID_BOULDER0);
            pop_by_id(&game_item_list, ID_BOULDER1);
            pop_by_id(&game_item_list, ID_BOULDER2);
            path_cleaned = 1;
            return ID_ITEM_NONE;
        }
    }
    return default_drop(id);
}