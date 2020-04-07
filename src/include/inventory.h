#include "dizzy_types.h"

#define title_height 3

UBYTE window_tiles_hiwater = 0x80;
UBYTE inventoty_tiles_start, font_tiles_start;

UBYTE item_tiles_hiwater; // grow down !!!

enum  item_identifiers { ID_ITEM_NONE, ID_PICKAXE, ID_KEY, ID_GRASS, ID_MUSHROOMS, ID_PIE, ID_JAR, ID_LID, ID_FIREFLY,
                         ID_COIN0, ID_COIN1, ID_COIN2, 
                         ID_BOULDER0, ID_BOULDER1, ID_BOULDER2, 
                         __ID_LAST_ITEM };
#define ID_TREASURE  0x80
#define ID_ITEM_USED __ID_LAST_ITEM

// all items
#define GAME_ITEMS_COUNT (__ID_LAST_ITEM - 1)
struct game_item game_items[GAME_ITEMS_COUNT];

// items in the game
items_list game_item_list = {0, 0, 0};

// temp variables
game_item * __temp_game_item;
game_item * __temp_game_item2;
game_item * __temp_game_item3;
const game_item_desc * __temp_game_item_desc;
const tile_data_t * __temp_tiledata;
unsigned char __temp_tiles[4];
unsigned char __temp_text_buf[20];
unsigned char * __temp_text_ptr;

// inventory
game_item * inventory_items[3] = {0, 0, 0};
items_list inventory_item_list = {0, 0, 0};
items_list item_stack = {0, 0, 0};

const game_item_desc const itmdesc_pickaxe   = {ID_PICKAXE,               1,   1,  3, 10, "HEAVY PICKAXE", &pickaxe_tiles};
const game_item_desc const itmdesc_key       = {ID_KEY,                   1,   4, 14, 12, "ELEVATOR KEY",  &key_tiles};
const game_item_desc const itmdesc_grass     = {ID_GRASS,                 1,   4, 14, 12, "TUFT OF GRASS", &grass_tiles};
const game_item_desc const itmdesc_mushrooms = {ID_MUSHROOMS,             1,   0,  7,  6, "MUSHROOMS",     &mushrooms_tiles};
const game_item_desc const itmdesc_pie       = {ID_PIE,                 255, 255,  0,  0, "MUSHROOM PIE",  &pie_tiles};
const game_item_desc const itmdesc_jar       = {ID_JAR,                   0,   5,  2, 14, "GLASS JAR",     &jar_tiles};
const game_item_desc const itmdesc_lid       = {ID_LID,                   0,   2,  7,  4, "WOODEN LID",    &lid_tiles};

//const game_item_desc const itmdesc_jar       = {ID_JAR,                   1,   1,  0,  8, "GLASS JAR",     &jar_tiles};
//const game_item_desc const itmdesc_lid       = {ID_LID,                   1,   1,  0,  8, "WOODEN LID",    &lid_tiles};

const game_item_desc const itmdesc_firefly   = {ID_FIREFLY,             255, 255,  0,  0, "FIREFLY",       0};

// decoration objects 
const game_item_desc const itmdesc_blockage2 = {ID_BOULDER0,              1,   1, 18, 10, "BOULDERS",      &blockage2_tiles};
const game_item_desc const itmdesc_blockage1 = {ID_BOULDER1,              1,   1, 17, 10, "BOULDERS",      &blockage1_tiles};
const game_item_desc const itmdesc_blockage0 = {ID_BOULDER2,              1,   1, 17,  9, "BOULDERS",      &blockage0_tiles};

// treasures
const game_item_desc const itmdesc_coin0     = {ID_COIN0 | ID_TREASURE,   1,   1, 18,  2, "COIN",          &coin_tiles};
const game_item_desc const itmdesc_coin1     = {ID_COIN1 | ID_TREASURE,   0,   0, 20,  5, "COIN",          &coin_tiles};
const game_item_desc const itmdesc_coin2     = {ID_COIN2 | ID_TREASURE,   1,   3,  1,  2, "COIN",          &coin_tiles};
                                                                                                                                                  
const game_item_desc * const all_items_desc[GAME_ITEMS_COUNT] = {&itmdesc_pickaxe, &itmdesc_key, &itmdesc_mushrooms, &itmdesc_grass, &itmdesc_pie,
                                                                 &itmdesc_jar, &itmdesc_lid, &itmdesc_firefly,
                                                                 &itmdesc_blockage2, &itmdesc_blockage1, &itmdesc_blockage0,
                                                                 &itmdesc_coin0, &itmdesc_coin1, &itmdesc_coin2};

extern tile_data_t coin_tiles;
extern tile_data_t pickaxe_tiles;
extern tile_data_t key_tiles;
extern tile_data_t mushrooms_tiles;
extern tile_data_t grass_tiles;
extern tile_data_t blockage0_tiles;
extern tile_data_t blockage1_tiles;
extern tile_data_t blockage2_tiles;
extern tile_data_t pie_tiles;
extern tile_data_t jar_tiles;
extern tile_data_t lid_tiles;

const UBYTE const selector_offset[4] = {(6 + title_height), (2 + title_height), (3 + title_height), (4 + title_height)};
const unsigned char const selector_empty[]  = {0x00};  
UBYTE inventory_selection, old_inventory_selection;

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

void draw_fancy_frame_xy(UBYTE x, UBYTE y, UBYTE width, UBYTE height);

void draw_fancy_frame(UBYTE lines) {
    __temp_j = ((lines + 4) << 3); __temp_k = ((144 - __temp_j) >> 1);
    lyc_table[6] = __temp_k; lyc_table[7] = __temp_k + __temp_j;
    push_bank(1);    
    draw_fancy_frame_xy(0, title_height, 16, lines);
    pop_bank();
}

game_item * show_inventory() {
    wait_inventory();
    draw_fancy_frame(5);
    
    __temp_i = 0;
    if (inventory_item_list.size > 0) {
        __temp_j = (2 + title_height);
        __temp_game_item = inventory_item_list.first;        
        while (__temp_game_item) {
            wait_inventory();
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
     
    wait_inventory();
    inventory = 1;    
    do {
        if (inventory_selection != old_inventory_selection) {
            wait_inventory();
            set_win_tiles(2, selector_offset[old_inventory_selection], 1, 1, selector_empty);
            set_win_tiles(17, selector_offset[old_inventory_selection], 1, 1, selector_empty);
            set_win_tiles(2, selector_offset[inventory_selection], 1, 1, &__temp_text_buf[0]);
            set_win_tiles(17, selector_offset[inventory_selection], 1, 1, &__temp_text_buf[1]);
            old_inventory_selection = inventory_selection;
            waitpadup();
        }
        joy = joypad();
        if (joy & (J_UP | J_LEFT)) {
            if (inventory_selection) inventory_selection--; else inventory_selection = __temp_i;
        } else if (joy & (J_DOWN | J_RIGHT)) {
            inventory_selection++; if (inventory_selection > __temp_i) inventory_selection = 0;
        } else if (joy & J_B) {
            waitpadup();
            inventory = 0;
            if (inventory_selection) return inventory_items[inventory_selection - 1];
        }
    } while(inventory);
    return 0;
}

void execute_dialog(const UBYTE lines, const dialog_item* item);

void show_dialog_window(const UBYTE lines, const dialog_item* item) NONBANKED {
    push_bank(1);
    execute_dialog(lines, item);
    pop_bank();
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

void place_item_to_room_buf(UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * tiles, unsigned char * room_buf) __naked
{
    x; y; w; h; tiles; room_buf;
__asm
            push    BC          ; ret, bc, x, y, w, h, tiles, buf
                        
            lda     HL, 4(SP)    
            ld      D, (HL)     ; D = x
            inc     HL
            ld      E, (HL)     ; E = y
            lda     HL, 9(SP)
            ld      B, (HL)     ; BC = tiles
            dec     HL
            ld      C, (HL)
            dec     HL
            ld      A, (HL-)    ; A = h
            ld      H, (HL)     ; H = w
            ld      L, A        ; L = h

            ld      A, H        ; check x bound
            add     D
            cp      #room_width
            jr      C, $putitm01
            ld      A, D
            cp      #room_width
            jp      NC, $putitm06
            ld      A, #room_width
            sub     D
            ld      H, A

$putitm01:  ld      A, L        ; check y bound
            add     E
            cp      #room_height
            jr      C, $putitm07
            ld      A, E
            cp      #room_height
            jp      NC, $putitm06
            ld      A, #room_height
            sub     E
            ld      L, A

$putitm07:  push    HL          ; Store WH
            
            lda     HL, 12(SP)  ; HL = origin
            ld      A, (HL+)
            ld      H, (HL)
            ld      L, A


$putitm02:  push    BC          ; Store source
            xor     A
            or      E
            jr      Z, $putitm03

            ld      BC, #room_width
$putitm04:  add     HL, BC      ; Y coordinate
            dec     E
            jr      NZ, $putitm04
            
$putitm03:  ld      B, #0x00    ; X coordinate
            ld      C, D
            add     HL, BC

            pop     BC          ; BC = source
            pop     DE          ; DE = WH
            
            push    HL          ; Store origin
            push    DE          ; Store WH
            push    BC
                                    
$putitm05:  ld      A, (BC)     ; just single tile
            ld      (HL+), A
            inc     BC

            dec     D
            jr      NZ,$putitm05
            
            pop     BC
            
            pop     HL          ; HL = WH
            ld      D,H         ; Restore D = W
            pop     HL          ; HL = origin
            dec     E
            jr      Z,$putitm06

            push    BC          ; Next line
            ld      BC, #room_width
            add     HL,BC
            pop     BC

            push    HL
            lda     HL, 8(SP)
            ld      L, (HL)
            
            ld      H, #0
            add     HL, BC
            ld      B, H
            ld      C, L
            pop     HL
            push    HL          ; Store current origin

            push    DE          ; Store WH
            push    BC
            
            jr      $putitm05
            
$putitm06:  pop     BC
            ret
__endasm;
}

void place_room_items(const UBYTE row, const UBYTE col, unsigned char * room_buf) NONBANKED {
    item_tiles_hiwater = 0;
    push_bank(1);
    __temp_game_item = game_item_list.first;
    while (__temp_game_item) {
        if ((__temp_game_item->room_row == row) && (__temp_game_item->room_col == col)) {
            __temp_tiledata = __temp_game_item->desc->data;
            if (__temp_tiledata) {
                item_tiles_hiwater -= __temp_tiledata->count;
                unshrink_tiles(item_tiles_hiwater, __temp_tiledata->count, __temp_tiledata->data);
                set_inc_tiles(item_tiles_hiwater, __temp_tiledata->count, __temp_tiles);
                place_item_to_room_buf(__temp_game_item->x, __temp_game_item->y, 2, 2, __temp_tiles, room_buf);
            }
        }
        __temp_game_item = __temp_game_item->next;
    }
    pop_bank();
}