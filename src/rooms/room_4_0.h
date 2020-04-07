#include "flies.h"

#define fly_sprite_offset0 evil_sprite_offset

fly_coord_t flies[3]; // = {{(14 * 8), (5 * 8)}, {(6 * 8), (9 * 8)}, {(22 * 8), (12 * 8)}};
fly_coord_t * fly_ptr;
UBYTE fly_phase;

void init_room4_0() {
    set_sprite_data(evil_sprites_tileoffset, current_room->raw_enemies_tiles->count, current_room->raw_enemies_tiles->data);
}

void move_flies4_0() {
    for (__temp_i = 0; __temp_i < 3; __temp_i++) {
        fly_ptr = &flies[__temp_i];
        if (fly_phase & 1) {
            fly_ptr->x += fly_delta[(*(ptr_div_reg)) & 7];
            if (fly_ptr->x < 0) fly_ptr->x = 0; 
            else if (fly_ptr->x > (room_width * 8)) fly_ptr->x = ((room_width * 8) - 1);
        } else {
            fly_ptr->y += fly_delta[(*(ptr_div_reg)) & 7];
            if (fly_ptr->y < 0) fly_ptr->y = 0; 
            else if (fly_ptr->y > (room_height * 8)) fly_ptr->y = ((room_height * 8) - 1);
        }
    }
}

void draw_flies4_0() {
    switch (fly_phase) {
        case 0 : set_sprite_tile(fly_sprite_offset0,     evil_sprites_tileoffset); break;
        case 1 : set_sprite_tile(fly_sprite_offset0 + 1, evil_sprites_tileoffset); break;
        case 2 : set_sprite_tile(fly_sprite_offset0 + 2, evil_sprites_tileoffset); break;
        
        case 4 : set_sprite_tile(fly_sprite_offset0,     (evil_sprites_tileoffset + 1)); break;
        case 5 : set_sprite_tile(fly_sprite_offset0 + 1, (evil_sprites_tileoffset + 1)); break;
        case 6 : set_sprite_tile(fly_sprite_offset0 + 2, (evil_sprites_tileoffset + 1)); break;
    }
    fly_phase++; fly_phase &= 7;
    for (__temp_i = 0; __temp_i < 3; __temp_i++) {
        fly_ptr = &flies[__temp_i];
        multiple_move_sprites(fly_sprite_offset0 + __temp_i, 1, 
                              fly_ptr->x - bkg_scroll_x_target, fly_ptr->y - bkg_scroll_y_target,
                              (unsigned char *)fly_offsets);
    }
}

fly_coord_t * find_firefly(UBYTE tile_x, UBYTE tile_y) {
    UBYTE ff_tile_x, ff_tile_y;
    for (__temp_i = 0; __temp_i < 3; __temp_i++) {
        fly_ptr = &flies[__temp_i];
        
        ff_tile_x = fly_ptr->x >> 3, ff_tile_y = fly_ptr->y >> 3;        
        
        if ((ff_tile_x >= tile_x) && (ff_tile_x <= tile_x + 2) &&
            (ff_tile_y >= tile_y) && (ff_tile_y <= tile_y + 1)) return fly_ptr;
    }
    return 0;
}

UBYTE dizzy_catches_firefly(UBYTE tile_x, UBYTE tile_y, UBYTE id) {
    game_item * temp_item;
    fly_coord_t * temp_fly;
    if (id == ID_LID) {
        temp_item = find_by_id(&inventory_item_list, ID_JAR);
        if (temp_item) {
            temp_fly = find_firefly(tile_x, tile_y);
            if (temp_fly) {
                // LID + JAR + FIREFLY = CAUGHT FIREFLY
                temp_item = pop_by_id(&inventory_item_list, ID_JAR);
                if (temp_item) push_last(&item_stack, temp_item);

                temp_item = pop_by_id(&game_item_list, ID_FIREFLY);
                if (!temp_item) temp_item = pop_by_id(&item_stack, ID_FIREFLY);
                if (temp_item) push_last(&inventory_item_list, temp_item);                
       
                temp_fly->x = 8, temp_fly->y = 8;
       
                show_dialog_window(2, &firefly_caught);
       
                return ID_ITEM_USED;
            }
        }
    }
    return default_drop(id);
}
