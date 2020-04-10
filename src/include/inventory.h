#include "dizzy_types.h"

#define title_height 3

#define item_width 2
#define item_height 2
#define item_map_size (item_width * item_height)
#define item_tiledata_size (item_map_size * 16)

UBYTE window_tiles_hiwater;
UBYTE inventoty_tiles_start, font_tiles_start;

UBYTE item_tiles_hiwater; // grow down !!!
// all items
struct game_item game_items[GAME_ITEMS_COUNT];

// items in the game
items_list game_item_list;

// temp variables
game_item * __temp_game_item;
game_item * __temp_game_item2;
game_item * __temp_game_item3;
const game_item_desc * __temp_game_item_desc;
const tile_data_t * __temp_tiledata;
unsigned char __temp_tiles[item_map_size], __temp_bkg_tiles[item_map_size];
unsigned char __temp_item_tiledata0[item_tiledata_size], __temp_item_tiledata1[item_tiledata_size], __temp_item_tiledata2[item_tiledata_size];
unsigned char __temp_text_buf[20];
unsigned char * __temp_text_ptr;

// inventory
items_list inventory_item_list;
items_list item_stack;

const game_item_desc const itmdesc_pickaxe   = {ID_PICKAXE,               1,   1,  3, 10, "HEAVY PICKAXE", &pickaxe_tiles,   &pickaxe_mask};
const game_item_desc const itmdesc_key       = {ID_KEY,                   1,   4, 14, 12, "ELEVATOR KEY",  &key_tiles,       &key_mask};
const game_item_desc const itmdesc_grass     = {ID_GRASS,                 1,   4, 14, 12, "TUFT OF GRASS", &grass_tiles,     &grass_mask};
const game_item_desc const itmdesc_mushrooms = {ID_MUSHROOMS,             1,   0,  7,  6, "MUSHROOMS",     &mushrooms_tiles, &mushrooms_mask};
const game_item_desc const itmdesc_pie       = {ID_PIE,                 255, 255,  0,  0, "MUSHROOM PIE",  &pie_tiles,       &pie_mask};
const game_item_desc const itmdesc_jar       = {ID_JAR,                   0,   5,  2, 14, "GLASS JAR",     &jar_tiles,       &jar_mask};
const game_item_desc const itmdesc_lid       = {ID_LID,                   0,   2,  7,  4, "WOODEN LID",    &lid_tiles,       &lid_mask};

const game_item_desc const itmdesc_firefly   = {ID_FIREFLY,             255, 255,  0,  0, "FIREFLY",       0,                0};

// decoration objects 
const game_item_desc const itmdesc_blockage2 = {ID_BOULDER0,              1,   1, 18, 10, "BOULDERS",      &blockage2_tiles, 0};
const game_item_desc const itmdesc_blockage1 = {ID_BOULDER1,              1,   1, 17, 10, "BOULDERS",      &blockage1_tiles, 0};
const game_item_desc const itmdesc_blockage0 = {ID_BOULDER2,              1,   1, 17,  9, "BOULDERS",      &blockage0_tiles, 0};

// treasures
const game_item_desc const itmdesc_coin0     = {ID_COIN0 | ID_TREASURE,   1,   1, 18,  2, "COIN",          &coin_tiles,      &coin_mask};
const game_item_desc const itmdesc_coin1     = {ID_COIN1 | ID_TREASURE,   0,   0, 20,  5, "COIN",          &coin_tiles,      &coin_mask};
const game_item_desc const itmdesc_coin2     = {ID_COIN2 | ID_TREASURE,   1,   3,  1,  2, "COIN",          &coin_tiles,      &coin_mask};
                                                                                                                                                  
const game_item_desc * const all_items_desc[GAME_ITEMS_COUNT] = {&itmdesc_pickaxe, &itmdesc_key, &itmdesc_mushrooms, &itmdesc_grass, &itmdesc_pie,
                                                                 &itmdesc_jar, &itmdesc_lid, &itmdesc_firefly,
                                                                 &itmdesc_blockage2, &itmdesc_blockage1, &itmdesc_blockage0,
                                                                 &itmdesc_coin0, &itmdesc_coin1, &itmdesc_coin2};

extern tile_data_t null_mask;

extern tile_data_t coin_tiles, coin_mask;
extern tile_data_t pickaxe_tiles, pickaxe_mask;
extern tile_data_t key_tiles, key_mask;
extern tile_data_t mushrooms_tiles, mushrooms_mask;
extern tile_data_t grass_tiles, grass_mask;
extern tile_data_t blockage0_tiles;
extern tile_data_t blockage1_tiles;
extern tile_data_t blockage2_tiles;
extern tile_data_t pie_tiles, pie_mask;
extern tile_data_t jar_tiles, jar_mask;
extern tile_data_t lid_tiles, lid_mask;

void execute_dialog(const UBYTE lines, const dialog_item* item);
void show_dialog_window(const UBYTE lines, const dialog_item* item) NONBANKED {
    push_bank(1);
    execute_dialog(lines, item);
    pop_bank();
}

game_item * execute_inventory();
game_item * show_inventory() NONBANKED {
    push_bank(1);
    game_item * res = execute_inventory();
    pop_bank();
    return res;
}

void push_last(items_list * list, game_item * item) {
    if ((!item) || (!list)) return;
    list->size++;
    item->next = 0;
    if (list->last) list->last->next = item; else list->first = item;
    list->last = item;
}
game_item * pop_by_id(items_list * list, const UBYTE id) {
    if (!list) return 0;
    __temp_game_item2 = 0;
    __temp_game_item = list->first;
    while (__temp_game_item) {
        if (__temp_game_item->id == id) {
            if (__temp_game_item2) __temp_game_item2->next = __temp_game_item->next; else list->first = __temp_game_item->next;
            if (!__temp_game_item->next) list->last = __temp_game_item2;
            list->size--;
            return __temp_game_item;
        }
        __temp_game_item2 = __temp_game_item;
        __temp_game_item = __temp_game_item->next;
    }
    return 0;
}
game_item * find_by_id(items_list * list, const UBYTE id) {
    if (!list) return 0;
    __temp_game_item = list->first;
    while (__temp_game_item) {
        if (__temp_game_item->id == id) return __temp_game_item;
        __temp_game_item = __temp_game_item->next;
    }
    return 0;
}
game_item * find_by_room_xy(items_list * list, const UBYTE row, const UBYTE col, const UBYTE x, const UBYTE y) {
    if (!list) return 0;
    __temp_game_item2 = 0;
    __temp_game_item = list->first;
    while (__temp_game_item) {
        if ((__temp_game_item->room_row == row) && (__temp_game_item->room_col == col)) {
            if ((__temp_game_item->x <= (x + 2)) && ((__temp_game_item->x + 1) >= x) &&
                (__temp_game_item->y <= (y + 2)) && ((__temp_game_item->y + 1) >= y)) {
                __temp_game_item2 = __temp_game_item;
            }
        }
        __temp_game_item = __temp_game_item->next;
    }
    return __temp_game_item2;
}


void init_game_items() {
    game_item_list.first = game_item_list.last = game_item_list.size = 0;
    for (__temp_i = 0; __temp_i < GAME_ITEMS_COUNT; __temp_i++) {
        __temp_game_item = &game_items[__temp_i];
        __temp_game_item_desc = all_items_desc[__temp_i];
        
        __temp_game_item->id = __temp_game_item_desc->id;
 
        __temp_game_item->room_row = __temp_game_item_desc->room_row; 
        __temp_game_item->room_col = __temp_game_item_desc->room_col; 
        __temp_game_item->x = __temp_game_item_desc->x;
        __temp_game_item->y = __temp_game_item_desc->y;
        __temp_game_item->desc = __temp_game_item_desc;
        
        push_last((items_list *)&game_item_list, __temp_game_item);
    }    
    inventory_item_list.first = inventory_item_list.last = inventory_item_list.size = 0;
    item_stack.first = item_stack.last = item_stack.size = 0;
}

void place_room_items(const UBYTE row, const UBYTE col, unsigned char * room_buf) NONBANKED {
//    item_tiles_hiwater = 0;
    item_tiles_hiwater = window_tiles_hiwater;
    __temp_game_item = game_item_list.first;
    while (__temp_game_item) {
        if ((__temp_game_item->room_row == row) && (__temp_game_item->room_col == col)) {
            __temp_tiledata = __temp_game_item->desc->data;
            if (__temp_tiledata) {
                item_tiles_hiwater -= item_map_size;
                
                // unshrink item's tiledata
                push_bank(1); 
                unshrink_tiles_to_buf(item_map_size, __temp_tiledata->data, __temp_item_tiledata0); 
                __temp_tiledata = (__temp_game_item->desc->mask) ? __temp_game_item->desc->mask : &null_mask;
                unshrink_tiles_to_buf(item_map_size, __temp_tiledata->data, __temp_item_tiledata2); 
                pop_bank();
                
                // get tiles under the item
                get_map_from_buf(__temp_game_item->x, __temp_game_item->y, item_width, item_height, __temp_bkg_tiles, room_buf, room_width, room_height);
                // merge tiledata with itemdata
                
                __temp_text_ptr = __temp_item_tiledata1;
                for (__temp_i = 0; __temp_i < item_map_size; __temp_i++) {
                    __temp_bkg_tiles[__temp_i] = (__temp_bkg_tiles[__temp_i] < current_room->room_tiles->count) ? __temp_bkg_tiles[__temp_i] : 0;
                    unshrink_tiles_to_buf(1, get_shrinked_tile_offset(__temp_bkg_tiles[__temp_i], current_room->room_tiles->data), __temp_text_ptr);
                    __temp_text_ptr += 16;
                }
                for (__temp_i = 0; __temp_i < item_tiledata_size; __temp_i++) {
                    __temp_item_tiledata0[__temp_i] = (__temp_item_tiledata1[__temp_i] & __temp_item_tiledata2[__temp_i]) | __temp_item_tiledata0[__temp_i];
                }
                // upload modified tiledata
                set_bkg_data(item_tiles_hiwater, item_map_size, __temp_item_tiledata0);
                
                // put modifies item tiles with merged background
                set_inc_tiles(item_tiles_hiwater, item_map_size, __temp_tiles);
                put_map_to_buf(__temp_game_item->x, __temp_game_item->y, item_width, item_height, __temp_tiles, room_buf, room_width, room_height);
            }
        }
        __temp_game_item = __temp_game_item->next;
    }
}