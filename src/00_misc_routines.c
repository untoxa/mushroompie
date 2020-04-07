#include <gb/gb.h>
#include "include/dizzy_types.h"

#define rle_decompress_to_bkg 0
#define rle_decompress_to_win 1

extern unsigned char empty_compressed_map[];

extern UBYTE __temp_i, __temp_j, __temp_k, __temp_l;
extern unsigned char __temp_text_buf[];

extern UBYTE inventory;
extern UBYTE inventoty_tiles_start, font_tiles_start;

const unsigned char const dlg_left0[]   = {0x00,0x92};
const unsigned char const dlg_left1[]   = {0x93,0x94};
const unsigned char const dlg_left2[]   = {0x00,0x98};

const unsigned char const dlg_right0[]  = {0x92,0x00};
const unsigned char const dlg_right1[]  = {0x94,0x96};
const unsigned char const dlg_right2[]  = {0x98,0x00};

const unsigned char const dlg_center[]  = {0xFF,0x95};
const unsigned char const dlg_vert[]    = {0xFF,0x97}; 

void wait_inventory();

void rle_decompress_tilemap(UBYTE bkg, UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * tiles);

void draw_fancy_frame(UBYTE lines);
UBYTE prepare_text(const unsigned char * src, unsigned char * dest);

void draw_fancy_frame_xy(UBYTE x, UBYTE y, UBYTE width, UBYTE height) {
    __temp_i = x + 2; __temp_l = __temp_i + width;
    __temp_j = y;
    
    set_win_tiles(x, __temp_j, 2, 1, dlg_left0);
    rle_decompress_tilemap(rle_decompress_to_win, __temp_i, __temp_j, width, 1, empty_compressed_map);
    set_win_tiles(__temp_l, __temp_j, 2, 1, dlg_right0);
    __temp_j++;
    
    set_win_tiles(x, __temp_j, 2, 1, dlg_left1);
    rle_decompress_tilemap(rle_decompress_to_win, __temp_i, __temp_j, width, 1, dlg_center);
    set_win_tiles(__temp_l, __temp_j, 2, 1, dlg_right1); 
    __temp_j++;
    
    rle_decompress_tilemap(rle_decompress_to_win, x, __temp_j, width + 4, height, empty_compressed_map);
    rle_decompress_tilemap(rle_decompress_to_win, x + 1, __temp_j, 1, height, dlg_vert);
    rle_decompress_tilemap(rle_decompress_to_win, __temp_l, __temp_j, 1, height, dlg_vert);

    __temp_j += height;
    set_win_tiles(x, __temp_j, 2, 1, dlg_left1);
    rle_decompress_tilemap(rle_decompress_to_win, __temp_i, __temp_j, width, 1, dlg_center);
    set_win_tiles(__temp_l, __temp_j, 2, 1, dlg_right1);
    __temp_j++;
    
    set_win_tiles(x, __temp_j, 2, 1, dlg_left2);
    rle_decompress_tilemap(rle_decompress_to_win, __temp_i, __temp_j, width, 1, empty_compressed_map);
    set_win_tiles(__temp_l, __temp_j, 2, 1, dlg_right2);
}

void execute_dialog(const UBYTE lines, const dialog_item* item) {
    const dialog_item* item_old = 0;
    if (item) {
        wait_inventory();
        wait_vbl_done();
        draw_fancy_frame(lines);
        wait_inventory();          // prevent inventory flicking
        inventory = 1;
        while (item) {
            if ((item_old != item) && (item)) {
                if (item->text) set_win_tiles(2 + item->x, 5 + item->y, prepare_text(item->text, __temp_text_buf), 1, __temp_text_buf);
                item_old = item;
            }
            if (item->key) {
                wait_vbl_done();
                if (joypad() & item->key) {
                    waitpadup();
                    item = item->next;
                    wait_vbl_done();
                } 
            } else item = item->next;
        }    
        waitpadup();
    }
    inventory = 0;
}
