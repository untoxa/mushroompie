#include <gb/gb.h>
#include "include/dizzy_types.h"

#define title_height 3

#define rle_decompress_to_bkg 0
#define rle_decompress_to_win 1

extern unsigned char empty_compressed_map[];
extern unsigned char lyc_table[];

extern UBYTE __temp_i, __temp_j, __temp_k, __temp_l;
extern unsigned char __temp_text_buf[];

extern UBYTE inventory;
extern UBYTE inventoty_tiles_start, font_tiles_start;

const unsigned char const dlg_left0[]   = {0x00,0xE7};  //{0x00,0x92};
const unsigned char const dlg_left1[]   = {0xE8,0xE9};  //{0x93,0x94};
const unsigned char const dlg_left2[]   = {0x00,0xED};  //{0x00,0x98};
                                                        
const unsigned char const dlg_right0[]  = {0xE7,0x00};  //{0x92,0x00};
const unsigned char const dlg_right1[]  = {0xE9,0xEB};  //{0x94,0x96};
const unsigned char const dlg_right2[]  = {0xED,0x00};  //{0x98,0x00};
                                                        
const unsigned char const dlg_center[]  = {0xFF,0xEA};  //{0xFF,0x95};
const unsigned char const dlg_vert[]    = {0xFF,0xEC};  //{0xFF,0x97};

void wait_inventory_2_4();
void wait_inventory_4();

void rle_decompress_tilemap(UBYTE bkg, UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * tiles);

UBYTE __prepare_text_len;
UBYTE prepare_text(const unsigned char * src, unsigned char * dest) {
    __prepare_text_len = 0;
    while((*src)) {
        if ((*src > ' ') && (*src < '[')) {
            *dest++ = *src - (' ' + 1) + font_tiles_start;
        } else *dest++ = 0;
        src++;
        __prepare_text_len++;
    }
    return __prepare_text_len;
}

void draw_fancy_frame_xy(UBYTE x, UBYTE y, UBYTE width, UBYTE height) {
    __temp_i = x + 2; __temp_l = __temp_i + width;
    __temp_j = y;
    
    wait_vbl_done();
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

void draw_fancy_frame(UBYTE lines) {
    __temp_j = ((lines + 4) << 3); __temp_k = ((144 - __temp_j) >> 1);
    lyc_table[6] = __temp_k; lyc_table[7] = __temp_k + __temp_j;
    draw_fancy_frame_xy(0, title_height, 16, lines);
}

// information dialog

void execute_dialog(const UBYTE lines, const dialog_item* item) {
    const dialog_item* item_old = 0;
    if (item) {
        draw_fancy_frame(lines);
        wait_inventory_4();          // prevent inventory flicking
        inventory = 1;
        while (item) {
            if ((item_old != item) && (item)) {
                wait_inventory_4();
                if (item->text) set_win_tiles(2 + item->x, 5 + item->y, prepare_text(item->text, __temp_text_buf), 1, __temp_text_buf);
                item_old = item;
            }
            if (item->key) {
                wait_vbl_done();
                if (joypad() & item->key) {
                    waitpadup();
                    item = item->next;
                } 
            } else item = item->next;
        }    
        waitpadup();
    }
    wait_inventory_4();
    inventory = 0;
}

// inventory dialog

const UBYTE const selector_offset[4] = {(6 + title_height), (2 + title_height), (3 + title_height), (4 + title_height)};
const unsigned char const selector_empty[]  = {0x00};  

extern items_list inventory_item_list;
extern game_item * __temp_game_item;

game_item * inventory_items[3];
UBYTE inventory_selection, old_inventory_selection;
UBYTE inventory_joy;
game_item * execute_inventory() {
    draw_fancy_frame(5);
    
    wait_inventory_4();
    __temp_i = 0;
    if (inventory_item_list.size > 0) {
        __temp_j = (2 + title_height);
        __temp_game_item = inventory_item_list.first;        
        while (__temp_game_item) {            
            inventory_items[__temp_i] = __temp_game_item;
            set_win_tiles(3, __temp_j, prepare_text(__temp_game_item->desc->name, __temp_text_buf), 1, __temp_text_buf);
            __temp_i++; __temp_j ++;
            __temp_game_item = __temp_game_item->next;
        }
    } else {
        set_win_tiles(3, 6, prepare_text("N O T H I N G", __temp_text_buf), 1, __temp_text_buf);
    }
    set_win_tiles(5, 9, prepare_text("DON'T DROP", __temp_text_buf), 1, __temp_text_buf);
    prepare_text("><", __temp_text_buf);
     
    inventory_selection = 0, old_inventory_selection = 1;
     
    wait_inventory_4();
    inventory = 1;    
    do {
        if (inventory_selection != old_inventory_selection) {
            __temp_l = selector_offset[old_inventory_selection], __temp_k = selector_offset[inventory_selection];
            wait_inventory_4();
            set_win_tiles(2, __temp_l, 1, 1, selector_empty);
            set_win_tiles(17, __temp_l, 1, 1, selector_empty);
            set_win_tiles(2, __temp_k, 1, 1, __temp_text_buf);
            set_win_tiles(17, __temp_k, 1, 1, __temp_text_buf + 1);

            old_inventory_selection = inventory_selection;
            waitpadup();
        }
        inventory_joy = joypad();
        if (inventory_joy & (J_UP | J_LEFT)) {
            if (inventory_selection) inventory_selection--; else inventory_selection = __temp_i;
        } else if (inventory_joy & (J_DOWN | J_RIGHT)) {
            inventory_selection++; if (inventory_selection > __temp_i) inventory_selection = 0;
        } else if (inventory_joy & J_B) {
            waitpadup();
            wait_inventory_4();
            inventory = 0;
            if (inventory_selection) return inventory_items[inventory_selection - 1];
        }
    } while(inventory);
    return 0;
}

// fade to black

UBYTE FadeStep(UBYTE pal, UBYTE step) __naked {
    pal; step;
__asm
            lda     HL, 3(SP)
            ld      A, (HL-)
            ld      E, (HL)
            or      A
            jr      Z, $fadeout03
            ld      D, A
            push    BC
$fadeout00: 
            ld      B, #4
$fadeout01:
            ld      A, E
            and     #3
            cp      #3
            jr      Z, $fadeout02
            inc     A
           
$fadeout02: srl     A
            rr      C
            srl     A
            rr      C
            
            srl     E
            srl     E

            dec     B
            jr      NZ, $fadeout01

            ld      E, C

            dec     D
            jr      NZ, $fadeout00
            pop     BC                    
            ret   
            
$fadeout03: ld      D, #0
            ret
__endasm;
}

void FadeDMG(UBYTE dir, UBYTE bgp, UBYTE obp0, UBYTE obp1) {
	UBYTE j; 
    for (UBYTE i = 0; i < 4; i++) {
        if (dir) j = 3 - i; else j = i;
        wait_vbl_done();
        BGP_REG  = FadeStep(bgp,  j); 
        OBP0_REG = FadeStep(obp0, j); 
        OBP1_REG = FadeStep(obp1, j);
        delay(50);
    }
}
