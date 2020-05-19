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

const unsigned char const dlg_unpacked[] = {0x00,0xE7,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xE7,0x00,
                                            0xE8,0xE9,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xE9,0xEB,                                           

                                            0x00,0xEC,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xEC,0x00,
                                            0x00,0xEC,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xEC,0x00,
                                            0x00,0xEC,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xEC,0x00,
                                            0x00,0xEC,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xEC,0x00,
                                            0x00,0xEC,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xEC,0x00,
                                            0x00,0xEC,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xEC,0x00,
                                            0x00,0xEC,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xEC,0x00,
                                            0x00,0xEC,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xEC,0x00,
                                            0x00,0xEC,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xEC,0x00,

                                            0xE8,0xE9,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xEA,0xE9,0xEB,
                                            0x00,0xED,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xED,0x00};   

const unsigned char * const dlg_idx[]    =  {&dlg_unpacked[220], &dlg_unpacked[200], &dlg_unpacked[180], &dlg_unpacked[160], &dlg_unpacked[140],
                                             &dlg_unpacked[120], &dlg_unpacked[100], &dlg_unpacked[80],  &dlg_unpacked[60],  &dlg_unpacked[40]};                                           

void rle_decompress_tilemap(UBYTE bkg, UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * tiles);

UBYTE prepare_text(const unsigned char * src, unsigned char * dest) __naked
{
    src; dest;
__asm
            push    BC
            lda     HL, 4(SP)   
            ld      C, (HL)     
            inc     HL
            ld      B, (HL)     ; BC = source
            inc     HL
            ld      A, (HL+)    
            ld      H, (HL)     
            ld      L, A        ; HL = dest
            
            ld      DE, #0
$preptxt02: ld      A, (BC)
            inc     BC
            or      A
            jr      Z, $preptxt01

            cp      #32         ; ' '
            jr      C, $preptxt03
            sub     #33
            cp      #58         ; font length in chars
            jr      NC, $preptxt03
            
            ld      D, A
            ld      A, (#_font_tiles_start)
            add     D
            
            ld      (HL+), A
            inc     E
            jr      $preptxt02
            
$preptxt03: xor     A

            ld      (HL+), A
            inc     E
            jr      $preptxt02
            
$preptxt01: ld      D, #0
            pop     BC
            ret
__endasm;           
}

void draw_fancy_frame(UBYTE lines) {
    if (lines < 11) {
        __temp_j = ((lines + 4) << 3); __temp_k = ((144 - __temp_j) >> 1);
        lyc_table[6] = __temp_k; lyc_table[7] = __temp_k + __temp_j;
        set_win_tiles(0, title_height, 20, 2, dlg_unpacked);
        set_win_tiles(0, title_height + 2, 20, lines + 2, (unsigned char *)dlg_idx[lines]);
    } else { 
        lyc_table[6] = 0; lyc_table[7] = 23; // don't draw if window too large
    }
}

// information dialog

void execute_dialog(const UBYTE lines, const dialog_item* item) {
    const dialog_item* item_old = 0;
    if (item) {
        draw_fancy_frame(lines);
        wait_vbl_done();          // prevent inventory flicking
        inventory = 1;
        while (item) {
            if ((item_old != item) && (item)) {
                wait_vbl_done();
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
    wait_vbl_done();
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
    
    __temp_i = 0;
    if (inventory_item_list.size > 0) {
        __temp_j = (2 + title_height);
        __temp_game_item = inventory_item_list.first;        
        while (__temp_game_item) {            
            inventory_items[__temp_i] = __temp_game_item;
            wait_vbl_done();
            set_win_tiles(3, __temp_j, prepare_text(__temp_game_item->desc->name, __temp_text_buf), 1, __temp_text_buf);
            __temp_i++; __temp_j ++;
            __temp_game_item = __temp_game_item->next;
        }
    } else {
        wait_vbl_done();
        set_win_tiles(3, 6, prepare_text("N O T H I N G", __temp_text_buf), 1, __temp_text_buf);
    }
    set_win_tiles(5, 9, prepare_text("DON'T DROP", __temp_text_buf), 1, __temp_text_buf);
    prepare_text("><", __temp_text_buf);
     
    inventory_selection = 0, old_inventory_selection = 1;
     
    wait_vbl_done();
    inventory = 1;    
    do {
        if (inventory_selection != old_inventory_selection) {
            __temp_l = selector_offset[old_inventory_selection], __temp_k = selector_offset[inventory_selection];
            wait_vbl_done();
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
            wait_vbl_done();
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
