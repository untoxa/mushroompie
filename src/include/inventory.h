#define title_height 3

#define ITEM_VISIBLE  0x01
#define ITEM_PICKED   0x02
#define ITEM_TREASURE 0x04

typedef struct {
    UBYTE id;
    UBYTE room_row, room_col, x, y;
    unsigned char * name;
    const tile_data_t * data;    
} game_item_desc;

typedef struct game_item {
    UBYTE status;
    UBYTE room_row, room_col, x, y;
    const game_item_desc * desc;
    struct game_item * next;
} game_item;

typedef struct {
    UBYTE size;
    game_item * first;
    game_item * last;
} items_list;

UBYTE window_tiles_hiwater = 0x80;
UBYTE inventoty_tiles_start, font_tiles_start;

UBYTE item_tiles_hiwater; // grow down !!!

// all items
#define GAME_ITEMS_COUNT 10
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

#define ID_ITEM_NONE 0
#define ID_PICKAXE   1
#define ID_KEY       2
#define ID_BOULDER   8
#define ID_ITEM_USED 255

const game_item_desc const itmdesc_pickaxe   = {ID_PICKAXE, 1, 0, 19, 13, "HEAVY PICKAXE", &pickaxe_tiles};
const game_item_desc const itmdesc_key       = {ID_KEY,     1, 4, 14, 12, "ELEVATOR KEY",  &key_tiles};
const game_item_desc const itmdesc_grass     = {3,          1, 4, 14, 12, "TUFT OF GRASS", &grass_tiles};
const game_item_desc const itmdesc_mushrooms = {4,          1, 0,  7,  6, "MUSHROOMS",     &mushrooms_tiles};
const game_item_desc const itmdesc_coin0     = {5,          1, 1, 18,  2, "COIN",          &coin_tiles};
const game_item_desc const itmdesc_coin1     = {6,          0, 0, 20,  5, "COIN",          &coin_tiles};
const game_item_desc const itmdesc_coin2     = {7,          1, 3,  1,  2, "COIN",          &coin_tiles};
const game_item_desc const itmdesc_blockage2 = {ID_BOULDER, 1, 1, 18, 10, "BOULDERS",      &blockage2_tiles};
const game_item_desc const itmdesc_blockage1 = {ID_BOULDER, 1, 1, 17, 10, "BOULDERS",      &blockage1_tiles};
const game_item_desc const itmdesc_blockage0 = {ID_BOULDER, 1, 1, 17,  9, "BOULDERS",      &blockage0_tiles};

const game_item_desc * const all_items_desc[GAME_ITEMS_COUNT] = {&itmdesc_pickaxe, &itmdesc_key, &itmdesc_mushrooms, &itmdesc_grass,
                                                                 &itmdesc_coin0, &itmdesc_coin1, &itmdesc_coin2, 
                                                                 &itmdesc_blockage2, &itmdesc_blockage1, &itmdesc_blockage0};

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
const tile_data_t const grass_tiles = {4, {
0x02, 0x09,0x09,0x09,0x18,0x18,0x18,0x98,0x91,
0x02, 0x06,0x84,0x84,0x84,0x84,0x84,0xA2,0xA2,
0x02, 0x91,0x91,0x91,0x09,0x0D,0x0D,0x4D,0x4D,
0x02, 0xA2,0x12,0x12,0x52,0x52,0x52,0x52,0x52
}};
const tile_data_t const blockage0_tiles = {4, {
0x03, 0x0F,0x3E,0x77,0xFA,0xD4,0x60,0x34,0x0F,
0x03, 0xE0,0xB8,0x56,0x89,0x41,0x02,0x1C,0xE0,
0x03, 0x0F,0x1F,0x3A,0x7F,0xEA,0xFD,0xDA,0x7F,
0x03, 0xC0,0x60,0xB0,0x58,0xE6,0x51,0x81,0xD1
}};
const tile_data_t const blockage1_tiles = {4, {
0x00, 
0x00,
0x03, 0x18,0x3C,0x6E,0x97,0x8B,0x95,0x42,0x3C,
0x03, 0x07,0x1F,0x3A,0x6D,0xFA,0xD5,0xFA,0x7F
}};
const tile_data_t const blockage2_tiles = {4, {
0x00, 
0x00,
0x00,
0x03, 0xC0,0x70,0x88,0x54,0x02,0x41,0x01,0xFE
}};


const unsigned char const dlg_left0[]   = {0x00,0x92};
const unsigned char const dlg_left1[]   = {0x93,0x94};
const unsigned char const dlg_left2[]   = {0x00,0x98};

const unsigned char const dlg_right0[]  = {0x92,0x00};
const unsigned char const dlg_right1[]  = {0x94,0x96};
const unsigned char const dlg_right2[]  = {0x98,0x00};

const unsigned char const dlg_center[]  = {0xFF,0x95};
const unsigned char const dlg_vert[]    = {0xFF,0x97}; 

const tile_data_t const dialog_frame_tiles = {7, {
0x03,0x00,0x3C,0x52,0x6A,0x52,0x6A,0x52,0x6A,
0x03,0x00,0x3F,0x55,0x6A,0x55,0x40,0x3F,0x00,
0x03,0x91,0x66,0x5A,0xAC,0x35,0x5A,0x66,0x89,
0x03,0x00,0xFF,0x55,0xAA,0x55,0x00,0xFF,0x00,
0x03,0x00,0xFC,0x56,0xAA,0x56,0x02,0xFC,0x00,
0x03,0x52,0x6A,0x52,0x6A,0x52,0x6A,0x52,0x6A,
0x03,0x52,0x6A,0x52,0x6A,0x52,0x6A,0x3C,0x00,
}};

const UBYTE const selector_offset[4] = {(6 + title_height), (2 + title_height), (3 + title_height), (4 + title_height)};
const unsigned char const selector_empty[]  = {0x00};  
UBYTE inventory_selection, old_inventory_selection;


UBYTE __prepare_text_len;
UBYTE prepare_text(const unsigned char * src, unsigned char * dest){
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

game_item * show_inventory() {
    wait_inventory();
    wait_vbl_done();
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
        set_win_tiles(3, 5, prepare_text("N O T H I N G", __temp_text_buf), 1, __temp_text_buf);
    }
    set_win_tiles(5, 9, prepare_text("DON'T DROP", __temp_text_buf), 1, __temp_text_buf);
    prepare_text("><", __temp_text_buf);
     
    inventory_selection = 0, old_inventory_selection = 1;
     
    wait_inventory();
    inventory = 1;    
    do {
        wait_vbl_done();
        if (inventory_selection != old_inventory_selection) {
            wait_inventory();
            set_win_tiles(2, selector_offset[old_inventory_selection], 1, 1, selector_empty);
            set_win_tiles(17, selector_offset[old_inventory_selection], 1, 1, selector_empty);
            wait_inventory();
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

void show_dialog_window(const UBYTE lines, const dialog_item* item) {
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
                joy = joypad();
                if (joy & item->key) {
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
        if (__temp_game_item->desc->id == id) {
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
        
        __temp_game_item->status = ITEM_VISIBLE;
 
        __temp_game_item->room_row = __temp_game_item_desc->room_row; 
        __temp_game_item->room_col = __temp_game_item_desc->room_col; 
        __temp_game_item->x = __temp_game_item_desc->x;
        __temp_game_item->y = __temp_game_item_desc->y;
        __temp_game_item->desc = __temp_game_item_desc;
        
        push_last((items_list *)&game_item_list, __temp_game_item);
    }    
    inventory_item_list.first = inventory_item_list.last = inventory_item_list.size = 0;
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

void place_room_items(const UBYTE row, const UBYTE col, unsigned char * room_buf) {
    item_tiles_hiwater = 0;
    __temp_game_item = game_item_list.first;
    while (__temp_game_item) {
        if ((__temp_game_item->room_row == row) && (__temp_game_item->room_col == col)) {
            __temp_tiledata = __temp_game_item->desc->data;
            item_tiles_hiwater -= __temp_tiledata->count;
            unshrink_tiles(item_tiles_hiwater, __temp_tiledata->count, __temp_tiledata->data);
            set_inc_tiles(item_tiles_hiwater, __temp_tiledata->count, __temp_tiles);
            place_item_to_room_buf(__temp_game_item->x, __temp_game_item->y, 2, 2, __temp_tiles, room_buf);
        }
        __temp_game_item = __temp_game_item->next;
    }
}