//const spr_ofs_t const spider_offsets[] = {{0x28, 0x08}, {0x28, 0x10}};

#define spider_pos_x (19 * 8)
#define spider_min_y (7  * 8)
#define spider_min_draw_y ((6 + 2 + 3)  * 8)
#define spider_max_y ((12 * 8) - 2)

const spr_ofs_and_lim_t const spider_net_ofs[] = {{0x00, spider_min_draw_y, 255, 0x08, 0, 255}, {0x08, spider_min_draw_y, 255, 0x08, 0, 255}, {0x10, spider_min_draw_y, 255, 0x08, 0, 255}, 
                                                  {0x18, spider_min_draw_y, 255, 0x08, 0, 255}, {0x20, spider_min_draw_y, 255, 0x08, 0, 255}, {0x28, spider_min_draw_y, 255, 0x08, 0, 255}};
const spr_ofs_t const spider_offsets[] = {{0x28, 0x08}, {0x28, 0x10}};


#define spider_sprite_count 2
#define spider_net_sprite_count 6
#define spider_sprite_offset evil_sprite_offset
#define spider_net_sprite_offset (spider_sprite_offset + (spider_sprite_count * 2))

const unsigned char const spidernettn[] = {13, 13, 13, 13, 13, 13, 13}; 
const unsigned char const spidertn[]    = {9, 10, 11, 12};
const unsigned char * const spider0[]   = {&spidertn[0], &spidertn[2]};

void init_room2_0() {
    set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
    multiple_set_sprite_tiles(spider_net_sprite_offset, spider_net_sprite_count, spidernettn);
}

UBYTE spider_phase = 0, spider_dir = 1;  

WORD  spider_pos_y = spider_min_y;

void move_spider() {
    if (spider_phase & 1) {
        if (spider_dir) {
            spider_pos_y += 2; if (spider_pos_y >= spider_max_y) spider_dir = 0;
        } else {
            spider_pos_y--; if (spider_pos_y <= spider_min_y) spider_dir = 1;
        }
    }
}

void draw_spider() {
    if (spider_phase == 0) {
        multiple_set_sprite_tiles(evil_sprite_offset, spider_sprite_count, spider0[0]);        
    } else if (spider_phase == 4) {
        multiple_set_sprite_tiles(evil_sprite_offset, spider_sprite_count, spider0[1]);        
    }
    spider_phase++; spider_phase &= 7;
    multiple_move_sprites_limits(spider_net_sprite_offset, spider_net_sprite_count, 
                                 spider_pos_x, (spider_pos_y & 0xFFF8), 
                                 (unsigned char *)spider_net_ofs, 
                                 -bkg_scroll_x_target, -bkg_scroll_y_target);    
    multiple_move_sprites(spider_sprite_offset, spider_sprite_count, 
                          spider_pos_x - bkg_scroll_x_target, spider_pos_y - bkg_scroll_y_target, 
                          (unsigned char *)spider_offsets);    
}

void coll_spider(WORD x, WORD y) {
    if (!((spider_pos_x > x + 16) || 
          (spider_pos_x + 16 < x) ||
          (spider_pos_y > y + 20) ||
          (spider_pos_y + 8 < y))) {
        dec_energy += 3;
    }
}
