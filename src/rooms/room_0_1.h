const spr_ofs_t const bat_offsets[] = {{0x28, 0x08}, {0x28, 0x10}};

#define bat_sprite_count 2
#define bat1_sprite_offset evil_sprite_offset
#define bat2_sprite_offset (evil_sprite_offset + bat_sprite_count)

#define fly_sprite_count 1
#define fly_sprite_offset1 (bat2_sprite_offset + bat_sprite_count)

#define total_room0_1_evil ((bat_sprite_count * 2) + fly_sprite_count)

const unsigned char const bftn[] = {9, 10, 11, 12, 13, 11, 12, 9, 10, 14};
const unsigned char * const evils[] = {&bftn[0], &bftn[5]};

UBYTE room_dark, bite_timer, warning_shown;
void reset_room0_1() {
    room_dark = 1; warning_shown = 0;
}
void init_room0_1() {
    set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
}
void draw_room0_1() {
    if (room_dark) {
        rle_decompress_tilemap(rle_decompress_to_bkg, 0, 3, room_width, room_height, empty_compressed_map);
    } else default_draw();
}

#define bat_length
#define bat1_pos_y (7 * 8)
#define bat1_min_x (2 * 8)
#define bat1_max_x (25 * 8)

#define bat2_pos_y (11 * 8)
#define bat2_min_x (4 * 8)
#define bat2_max_x (21 * 8)
UBYTE bat_phase = 0;  

WORD firefly_pos_x, firefly_pos_y;

WORD bat1_pos_x = bat1_min_x, bat1_dir = 1;
WORD bat2_pos_x = bat2_min_x, bat2_dir = 1;
void move_bats0() {
    if (room_dark) return;
    if (bat1_dir) {
        bat1_pos_x++; if (bat1_pos_x >= bat1_max_x) bat1_dir = 0;
    } else {
        bat1_pos_x--; if (bat1_pos_x <= bat1_min_x) bat1_dir = 1;
    }
    if (bat2_dir) {
        bat2_pos_x++; if (bat2_pos_x >= bat2_max_x) bat2_dir = 0;
    } else {
        bat2_pos_x--; if (bat2_pos_x <= bat2_min_x) bat2_dir = 1;
    }
    if (bat_phase & 1) {
        firefly_pos_x += fly_delta[(*(ptr_div_reg)) & 7];
        if (firefly_pos_x < 0) firefly_pos_x = 0; 
        else if (firefly_pos_x > (room_width * 8)) firefly_pos_x = ((room_width * 8) - 1);
    } else {
        firefly_pos_y += fly_delta[(*(ptr_div_reg)) & 7];
        if (firefly_pos_y < 0) firefly_pos_y = 0; 
        else if (firefly_pos_y > (room_height * 8)) firefly_pos_y = ((room_height * 8) - 1);
    }
}

void draw_bats0() {
    if (room_dark) return;
    if (bat_phase == 0) {
        multiple_set_sprite_tiles(evil_sprite_offset, total_room0_1_evil, evils[0]);        
    } else if (bat_phase == 4) {
        multiple_set_sprite_tiles(evil_sprite_offset, total_room0_1_evil, evils[1]);        
    }
    bat_phase++; bat_phase &= 7;
    multiple_move_sprites(bat1_sprite_offset, bat_sprite_count, 
                          bat1_pos_x - bkg_scroll_x_target, bat1_pos_y - bkg_scroll_y_target, 
                          (unsigned char *)bat_offsets);    
    multiple_move_sprites(bat2_sprite_offset, bat_sprite_count, 
                          bat2_pos_x - bkg_scroll_x_target, bat2_pos_y - bkg_scroll_y_target, 
                          (unsigned char *)bat_offsets);    
    multiple_move_sprites(fly_sprite_offset1, fly_sprite_count, 
                          firefly_pos_x - bkg_scroll_x_target, firefly_pos_y - bkg_scroll_y_target,
                          (unsigned char *)fly_offsets);
}

void coll_bats(WORD x, WORD y) {
    if (room_dark) return;
    if (!((bat1_pos_x > x + 16) || 
          (bat1_pos_x + 16 < x) ||
          (bat1_pos_y > y + 20) ||
          (bat1_pos_y + 8 < y))) {
        dec_energy += 3;
    } else if (!((bat2_pos_x > x + 16) || 
                 (bat2_pos_x + 16 < x) ||
                 (bat2_pos_y > y + 20) ||
                 (bat2_pos_y + 8 < y))) {
        dec_energy += 3;
    }
}

void hcoll_darkness(WORD x, WORD y) {
    if (room_dark) {
        if (!warning_shown) {
            show_dialog_window(4, &darkness_warn);
            warning_shown = 1;
        }
        if (x < (MAX_DIZZY_X - 8)) {
            is_position_safe = 0;
            bite_timer++; bite_timer &= 3;
            if ((!bite_timer) && (!dec_energy)) dec_energy++;
        }
    }
    get_h_coll(x, y);
}

UBYTE dizzy_drops_firefly(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
    game_item * temp_item;
    if (id == ID_FIREFLY) {
        room_dark = 0; firefly_pos_x = (25 * 8); firefly_pos_y = (9 * 8);
    } else if (id == ID_LID) {
        temp_item = find_by_id(&inventory_item_list, ID_JAR);
        if (temp_item) {
            UBYTE ff_tile_x = firefly_pos_x >> 3, ff_tile_y = firefly_pos_y >> 3;
            if ((ff_tile_x >= tile_x) && (ff_tile_x <= tile_x + 2) &&
                (ff_tile_y >= tile_y) && (ff_tile_y <= tile_y + 1)) {
                // LID + JAR + FIREFLY = CAUGHT FIREFLY
                temp_item = pop_by_id(&inventory_item_list, ID_JAR);
                if (temp_item) push_last(&item_stack, temp_item);

                temp_item = pop_by_id(&game_item_list, ID_FIREFLY);
                if (!temp_item) temp_item = pop_by_id(&item_stack, ID_FIREFLY);
                if (temp_item) push_last(&inventory_item_list, temp_item);                
       
                show_dialog_window(2, &firefly_caught);
       
                multiple_move_sprites(evil_sprite_offset, evil_sprite_total_count, 0, 0, (unsigned char *)evil_hide);           
                room_dark = 1;
                return ID_ITEM_USED;
            }
        }
    }
    return default_drop(id);
}
