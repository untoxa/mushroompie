const spr_ofs_t const bat1_offsets[] = {{0x28, 0x08}, {0x28, 0x10}};
const spr_ofs_t const bat2_offsets[] = {{0x28, 0x08}, {0x28, 0x10}};
#define bat_sprite_count 2
#define bat1_sprite_offset evil_sprite_offset
#define bat2_sprite_offset (evil_sprite_offset + bat_sprite_count)
void init_room0() {
    set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
}
#define bat_length
#define bat1_pos_y (7 * 8)
#define bat1_min_x (2 * 8)
#define bat1_max_x (25 * 8)

#define bat2_pos_y (11 * 8)
#define bat2_min_x (4 * 8)
#define bat2_max_x (21 * 8)
WORD bat1_pos_x = bat1_min_x, bat1_dir = 1;
WORD bat2_pos_x = bat2_min_x, bat2_dir = 1;
void move_bats0() {
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
}
UBYTE bat_phase = 0;  
void draw_bats0() {
    if (bat_phase == 0) {
        set_sprite_tile(bat1_sprite_offset + 0, evil_sprites_tileoffset + 0);
        set_sprite_tile(bat1_sprite_offset + 1, evil_sprites_tileoffset + 1);
        set_sprite_tile(bat2_sprite_offset + 0, evil_sprites_tileoffset + 2);
        set_sprite_tile(bat2_sprite_offset + 1, evil_sprites_tileoffset + 3);
    } else if (bat_phase == 4) {
        set_sprite_tile(bat2_sprite_offset + 0, evil_sprites_tileoffset + 0);
        set_sprite_tile(bat2_sprite_offset + 1, evil_sprites_tileoffset + 1);
        set_sprite_tile(bat1_sprite_offset + 0, evil_sprites_tileoffset + 2);
        set_sprite_tile(bat1_sprite_offset + 1, evil_sprites_tileoffset + 3);
    }
    bat_phase++; bat_phase &= 7;
    multiple_move_sprites(bat1_sprite_offset, bat_sprite_count, 
                          bat1_pos_x - bkg_scroll_x_target, bat1_pos_y - bkg_scroll_y_target, 
                          (unsigned char *)bat1_offsets);    
    multiple_move_sprites(bat2_sprite_offset, bat_sprite_count, 
                          bat2_pos_x - bkg_scroll_x_target, bat2_pos_y - bkg_scroll_y_target, 
                          (unsigned char *)bat2_offsets);    
}

void coll_bats(WORD x, WORD y) {
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