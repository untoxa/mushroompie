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

game_item game_items[] = {{0, 1, 1, 10, 10, {0x9E, 0x9F, 0xA0, 0xA1}, &itmdesc_pickaxe}, 
                          {0, 1, 1, 10, 10, {0xA2, 0xA3, 0xA4, 0xA5}, &itmdesc_key}, 
                          {0, 1, 1, 10, 10, {0xA6, 0xA7, 0xA8, 0xA9}, &itmdesc_mushrooms}};

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

const tile_data_t const exit_tiles = {4, {
0x01, 0x00,0x6E,0x73,0x30,0x3E,0x30,0x73,0x6E,
0x01, 0x00,0x77,0x63,0x36,0x1C,0x36,0x63,0x77,
0x01, 0x00,0x3F,0x4C,0x18,0x18,0x18,0x0D,0x7E,
0x01, 0x00,0x7F,0x5D,0x0C,0x0C,0x0C,0x1C,0x18
}};

const unsigned char const empty_compressed_map[] = {0xFF, 0x00};                // 63 nulls
const unsigned char const selector_top[] = {0x93, 0x00, 0x00, 0x99};  
const unsigned char const selector_bottom[] = {0x9B, 0x00, 0x00, 0x9D};
