const spr_ofs_t const flames_offsets[] = {{0x28, 0x08}, {0x28, 0x10}, {0x30, 0x08}, {0x30, 0x10}};

#define flame_sprite_count 4
#define flame1_sprite_offset evil_sprite_offset
#define flame2_sprite_offset (evil_sprite_offset + flame_sprite_count)
#define flame1_pos_x (3 * 8)
#define flame1_pos_y (5 * 8)
#define flame2_pos_x (12 * 8)
#define flame2_pos_y (7 * 8)

const unsigned char ftn[] = {  9, 10, 25, 26, 11, 12, 27, 28, 13, 14, 29, 30, 15, 16, 31, 32, 
                              17, 18, 33, 34, 19, 20, 35, 36, 21, 22, 37, 38, 23, 24, 39, 40 };
const unsigned char * const flames[] = {&ftn[0], &ftn[4], &ftn[8], &ftn[12], &ftn[16], &ftn[20], &ftn[24], &ftn[28]};

UBYTE flame_timer = 0, flame1_phase = 0, flame2_phase = 3;

UBYTE intro_shown, path_cleaned;
void reset_room1() {
    intro_shown = 0, path_cleaned = 0;
}
void init_room1_1() {
    set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
}
void draw_flames1_1() {
    if (!flame_timer) {
        flame1_phase++; flame1_phase &= 7;
        flame2_phase++; flame2_phase &= 7;
        multiple_set_sprite_tiles(flame1_sprite_offset, flame_sprite_count, flames[flame1_phase]);
        multiple_set_sprite_tiles(flame2_sprite_offset, flame_sprite_count, flames[flame2_phase]);
    }
    flame_timer++; flame_timer &= 7;
    multiple_move_sprites(flame1_sprite_offset, flame_sprite_count, 
                          flame1_pos_x - bkg_scroll_x_target, flame1_pos_y - bkg_scroll_y_target, 
                          (unsigned char *)flames_offsets);    
    multiple_move_sprites(flame2_sprite_offset, flame_sprite_count, 
                          flame2_pos_x - bkg_scroll_x_target, flame2_pos_y - bkg_scroll_y_target, 
                          (unsigned char *)flames_offsets);
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