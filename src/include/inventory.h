#define title_height 3

typedef struct {
    UBYTE id;
    unsigned char * name;
    const tile_data_t * data;    
} game_item_desc;

typedef struct {
    UBYTE status;
    UBYTE room_x, room_y;
    UBYTE x, y;
    unsigned char tiles[4];
    const game_item_desc * desc;
} game_item;

UBYTE window_tiles_hiwater = 0x80;
UBYTE inventoty_tiles_start, font_tiles_start;

game_item game_items[] = {{0, 1, 1, 10, 10, {0x01, 0x02, 0x03, 0x04}, &itmdesc_pickaxe}, 
                          {0, 1, 1, 10, 10, {0x01, 0x02, 0x03, 0x04}, &itmdesc_key}, 
                          {0, 1, 1, 10, 10, {0x01, 0x02, 0x03, 0x04}, &itmdesc_mushrooms}};

game_item * inventory_items[3] = {0, 0, 0};

const game_item_desc const itmdesc_coin      = {1, "COIN",      &coin_tiles};
const game_item_desc const itmdesc_pickaxe   = {2, "PICKAXE",   &pickaxe_tiles};
const game_item_desc const itmdesc_key       = {3, "KEY",       &key_tiles};
const game_item_desc const itmdesc_mushrooms = {4, "MUSHROOMS", &mushrooms_tiles};

const tile_data_t const coin_tiles = {4, {
0x01, 0x00,0x03,0x0C,0x13,0x2E,0x2C,0x58,0x59,
0x01, 0x00,0xE0,0x18,0xE4,0x3A,0x1E,0xCD,0xCF,
0x01, 0x5E,0x58,0x59,0x2C,0x2E,0x17,0x0D,0x03,
0x01, 0x3D,0x0F,0xCF,0xDE,0x3E,0xFC,0x78,0xE0,
}};
const tile_data_t const pickaxe_tiles = {4, {
0x02, 0x60,0xF0,0xF8,0x78,0x34,0x0E,0x07,0x03,
0x02, 0x00,0x00,0x00,0x01,0x01,0x01,0x03,0x83,
0x02, 0x01,0x00,0x00,0x00,0x00,0x00,0x03,0x3F,
0x02, 0xC7,0xE7,0x4E,0x1E,0x3C,0x7B,0xF6,0xC4
}};
const tile_data_t const key_tiles = {4, {
0x01, 0x3E,0x7F,0xE3,0xC1,0xC1,0xE3,0x7F,0x3E,
0x01, 0x00,0x00,0x80,0x80,0x80,0x80,0x40,0xE0,
0x01, 0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,
0x01, 0xF0,0x78,0x3C,0xDE,0xEF,0xB6,0x70,0x20
}};
const tile_data_t const mushrooms_tiles = {4, {
0x03, 0x0C,0x1F,0x3F,0x70,0x06,0x02,0x1D,0x39,
0x03, 0x1C,0x0C,0x94,0x20,0x20,0x40,0x4C,0x3C,
0x03, 0x71,0x65,0x05,0x3B,0x33,0x29,0x09,0x00,
0x03, 0x7C,0x3C,0x8C,0x20,0x4E,0x46,0xCA,0x00
}};

const unsigned char const dlg_left0[]   = {0x00,0x92};
const unsigned char const dlg_left1[]   = {0x93,0x94};
const unsigned char const dlg_left2[]   = {0x00,0x97};
const unsigned char const dlg_left3[]   = {0x00,0x98};

const unsigned char const dlg_right0[]  = {0x92,0x00};
const unsigned char const dlg_right1[]  = {0x94,0x96};
const unsigned char const dlg_right2[]  = {0x97,0x00};
const unsigned char const dlg_right3[]  = {0x98,0x00};

const unsigned char const dlg_center0[] = {0xD0,0x00};
const unsigned char const dlg_center1[] = {0xD0,0x95};

const tile_data_t const dialog_frame_tiles = {7, {
0x03,0x00,0x3C,0x52,0x6A,0x52,0x6A,0x52,0x6A,
0x03,0x00,0x3F,0x55,0x6A,0x55,0x40,0x3F,0x00,
0x03,0x91,0x66,0x5A,0xAC,0x35,0x5A,0x66,0x89,
0x03,0x00,0xFF,0x55,0xAA,0x55,0x00,0xFF,0x00,
0x03,0x00,0xFC,0x56,0xAA,0x56,0x02,0xFC,0x00,
0x03,0x52,0x6A,0x52,0x6A,0x52,0x6A,0x52,0x6A,
0x03,0x52,0x6A,0x52,0x6A,0x52,0x6A,0x3C,0x00,
}};

const unsigned char const selector_top[]    = {0x00,0x92,0x00,0x00,0x92,0x00,
                                               0x93,0x94,0x95,0x95,0x94,0x96};  
const unsigned char const selector_bottom[] = {0x93,0x94,0x95,0x95,0x94,0x96,
                                               0x00,0x98,0x00,0x00,0x98,0x00};                                               
const unsigned char const selector_left[]   = {0x00,0x97,0x00,0x97};
const unsigned char const selector_right[]  = {0x97,0x00,0x97,0x00};

const unsigned char const selector_empty[]  = {0x00,0x00,0x00,0x00,0x00,0x00,
                                               0x00,0x00,0x00,0x00,0x00,0x00};  

UBYTE prepare_text(const unsigned char * src, unsigned char * dest){
    UBYTE len = 0;
    while((*src)) {
        *dest = *src - 32 + font_tiles_start;
        src++; dest++;
        len++;
    }
    *dest = 0;
    return len;
}
  
void draw_fancy_frame_xy(UBYTE x, UBYTE y, UBYTE width, UBYTE height) {
    wait_vbl_done();
    __temp_i = y;
    set_win_tiles(x, __temp_i, 2, 1, dlg_left0);
    rle_decompress_tilemap(rle_decompress_to_win, x + 2, __temp_i, width, 1, dlg_center0);
    set_win_tiles(x + width + 2, __temp_i, 2, 1, dlg_right0);
    __temp_i++;
    set_win_tiles(x, __temp_i, 2, 1, dlg_left1);
    rle_decompress_tilemap(rle_decompress_to_win, x + 2, __temp_i, width, 1, dlg_center1);
    set_win_tiles(x + width + 2, __temp_i, 2, 1, dlg_right1); 
    for (__temp_j = 0; __temp_j < height; __temp_j++) {
        __temp_i++;
        set_win_tiles(x, __temp_i, 2, 1, dlg_left2);
        rle_decompress_tilemap(rle_decompress_to_win, x + 2, __temp_i, width, 1, dlg_center0);
        set_win_tiles(x + width + 2, __temp_i, 2, 1, dlg_right2);        
    }
    __temp_i++;
    set_win_tiles(x, __temp_i, 2, 1, dlg_left1);
    rle_decompress_tilemap(rle_decompress_to_win, x + 2, __temp_i, width, 1, dlg_center1);
    set_win_tiles(x + width + 2, __temp_i, 2, 1, dlg_right1);
    __temp_i++;
    set_win_tiles(x, __temp_i, 2, 1, dlg_left3);
    rle_decompress_tilemap(rle_decompress_to_win, x + 2, __temp_i, width, 1, dlg_center0);
    set_win_tiles(x + width + 2, __temp_i, 2, 1, dlg_right3);
}

void draw_fancy_frame(UBYTE lines) {
    __temp_j = ((lines + 4) << 3); __temp_k = ((144 - __temp_j) >> 1);
    lyc_table[6] = __temp_k; lyc_table[7] = __temp_k + __temp_j;    
    draw_fancy_frame_xy(0, title_height, 16, lines);
}

void show_inventory() {
    unsigned char temp_tiles[4];        
    game_item * current_itm;
    const tile_data_t * tiledata;
    unsigned char text_buf[20];
    
    draw_fancy_frame(7);
    set_win_tiles(2, 11, prepare_text("A:USE/DROP B:OUT", text_buf), 1, text_buf);

    __temp_i = 0; __temp_j = 5; __temp_k = window_tiles_hiwater;
    while (__temp_i < 3) {
        current_itm = inventory_items[__temp_i];
        if (current_itm) {
            tiledata = current_itm->desc->data;
            unshrink_tiles(__temp_k, tiledata->count, tiledata->data);
            set_inc_tiles(__temp_k, tiledata->count, temp_tiles);
            set_win_tiles(__temp_j, (title_height + 4), 2, 2, temp_tiles);
            __temp_j += 4; __temp_k += 4;
        }
        __temp_i++;
    }

    UBYTE selection = 0, old_selection = 1;
          
    wait_inventory();          // prevent inventory flicking
    inventory = 1;
    while(inventory) {
        wait_vbl_done();
        if (selection != old_selection) {
            // erase old cursor            
            __temp_i = 3 + (old_selection << 2);
            set_win_tiles(__temp_i, (title_height + 2), 6, 2, selector_empty);
            set_win_tiles(__temp_i, (title_height + 4), 2, 2, selector_empty);
            set_win_tiles(__temp_i + 4, (title_height + 4), 2, 2, selector_empty);
            set_win_tiles(__temp_i, (title_height + 6), 6, 2, selector_empty);
            // draw new cursor
            __temp_i = 3 + (selection << 2);
            set_win_tiles(__temp_i, (title_height + 2), 6, 2, selector_top);
            set_win_tiles(__temp_i, (title_height + 4), 2, 2, selector_left);
            set_win_tiles(__temp_i + 4, (title_height + 4), 2, 2, selector_right);
            set_win_tiles(__temp_i, (title_height + 6), 6, 2, selector_bottom);
            waitpadup();
            old_selection = selection;
        }
        joy = joypad();
        if (joy & J_LEFT) {
            if (selection) selection--; else selection = 2;
        } else if (joy & J_RIGHT) {
            selection++; if (selection == 3) selection = 0;
        } else if (joy & J_A) {
            inventory = 0;
        } if (joy & J_B) {
            inventory = 0;
        } 
    }
    waitpadup();
}

void show_dialog_and_wait_key(const UBYTE key) {
    wait_inventory();
    inventory = 1;
    while(inventory) {
        wait_vbl_done();
        joy = joypad();
        if (joy & key) inventory = 0;
    }
    waitpadup();
}

void show_dialog_window(const UBYTE lines, const dialog_item* item) {
    unsigned char text_buf[20];
    const dialog_item* item_old = 0;
    if (item) {
        draw_fancy_frame(lines);
        wait_inventory();          // prevent inventory flicking
        inventory = 1;
        while (item) {
            wait_vbl_done();
            if ((item_old != item) && (item)) {
                set_win_tiles(2 + item->x, 5 + item->y, prepare_text(item->text, text_buf), 1, text_buf);
                item_old = item;
            }
            if (item->key) {
                joy = joypad();
                if (joy & item->key) {
                    waitpadup();
                    item = item->next;
                } 
            } else item = item->next;
        }    
        waitpadup();
    }
    inventory = 0;
}