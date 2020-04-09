#define WORLD_WIDTH 6
#define WORLD_HEIGHT 2

// fly coordinates and dynamics
const spr_ofs_t const fly_offsets[] = {{0x28, 0x08}};
const WORD const fly_delta[8] = { -4, -3, -2, 0, 0, 2, 3, 4 };

// room default handlers
UBYTE default_drop(UBYTE id);

// room 4_0 handlers
void init_room4_0(); void move_flies4_0(); void draw_flies4_0();
UBYTE dizzy_catches_firefly(UBYTE tile_x, UBYTE tile_y, UBYTE id);
// room 5_0 handlers
UBYTE grand_gets_pie(UBYTE tile_x, UBYTE tile_y, UBYTE id);
// room 0_1 handlers
void reset_room0_1();
void init_room0_1(); void move_bats0(); void draw_bats0();
void coll_bats(WORD x, WORD y);
void draw_room0_1();
void hcoll_darkness(WORD x, WORD y);
UBYTE dizzy_drops_firefly(UBYTE tile_x, UBYTE tile_y, UBYTE id);
// room 1_1 handlers
void reset_room1();
void hcoll_blockage(WORD x, WORD y);
void vcoll_blockage(WORD x, WORD y);
UBYTE cleaning_path(UBYTE tile_x, UBYTE tile_y, UBYTE id);
// room 2_1 handlers
void init_room2(); void move_elevator(); void draw_elevator(); 
void hcoll_elevator(WORD x, WORD y);
void vcoll_dylan(WORD x, WORD y);
UBYTE dylan_gets_key(UBYTE tile_x, UBYTE tile_y, UBYTE id);
void reset_room2();
// rooms 3_1 and 4_1 handlers
void init_room34(); void move_float(); void draw_float3(); void draw_float4();
void hcoll_float3(WORD x, WORD y);
void hcoll_float4(WORD x, WORD y);
void vcoll_troll(WORD x, WORD y);
void reset_room4();
const world_row * const dizzy_world[] = {&world_row_0, &world_row_1};
// rooms 5_1
extern void reset_room5_1();
extern void hcoll_mushroom(WORD x, WORD y);
extern void vcoll_daisy(WORD x, WORD y);
UBYTE daisy_gets_mushrooms(UBYTE tile_x, UBYTE tile_y, UBYTE id);

const world_row const world_row_0 = {0, {&room_0_0, &room_1_0, &room_2_0, &room_3_0, &room_4_0, &room_5_0}};
const world_row const world_row_1 = {1, {&room_0_1, &room_1_1, &room_2_1, &room_3_1, &room_4_1, &room_5_1}};

const room_t const room_0_0 = {3, &room_0_0_map, &room_0_0_coll, &room_0_0_tiles, 0,                   0,             0,              0,              0,               0,               0,          0,                      0,              0};
const room_t const room_1_0 = {3, &room_1_0_map, &room_1_0_coll, &room_1_0_tiles, 0,                   0,             0,              0,              0,               0,               0,          0,                      0,              0};
const room_t const room_2_0 = {3, &room_2_0_map, &room_2_0_coll, &room_2_0_tiles, 0,                   0,             0,              0,              0,               0,               0,          0,                      0,              0};
const room_t const room_3_0 = {3, &room_3_0_map, &room_3_0_coll, &room_3_0_tiles, 0,                   0,             0,              0,              0,               0,               0,          0,                      0,              0};  // empty room
const room_t const room_4_0 = {3, &room_4_0_map, &room_4_0_coll, &room_4_0_tiles, &enemies_4_0_tiles,  &init_room4_0, &move_flies4_0, &draw_flies4_0, 0,               0,               0,          &dizzy_catches_firefly, 0,              0};
const room_t const room_5_0 = {3, &room_5_0_map, &room_5_0_coll, &room_5_0_tiles, 0,                   0,             0,              0,              0,               0,               0,          &grand_gets_pie,        0,              0};

const room_t const room_0_1 = {4, &room_0_1_map, &room_0_1_coll, &room_0_1_tiles, &enemies_0_1_tiles,  &init_room0_1, &move_bats0,    &draw_bats0,    &hcoll_darkness, 0,               &coll_bats, &dizzy_drops_firefly,   &reset_room0_1, &draw_room0_1};
const room_t const room_1_1 = {4, &room_1_1_map, &room_1_1_coll, &room_1_1_tiles, 0,                   0,             0,              0,              &hcoll_blockage, &vcoll_blockage, 0,          &cleaning_path,         &reset_room1,   0};
const room_t const room_2_1 = {4, &room_2_1_map, &room_2_1_coll, &room_2_1_tiles, &enemies_2_1_tiles,  &init_room2,   &move_elevator, &draw_elevator, &hcoll_elevator, &vcoll_dylan,    0,          &dylan_gets_key,        &reset_room2,   0};
const room_t const room_3_1 = {5, &room_3_1_map, &room_3_1_coll, &room_3_1_tiles, &enemies_34_1_tiles, &init_room34,  &move_float,    &draw_float3,   &hcoll_float3,   0,               0,          0,                      0,              0};
const room_t const room_4_1 = {5, &room_4_1_map, &room_4_1_coll, &room_4_1_tiles, &enemies_34_1_tiles, &init_room34,  &move_float,    &draw_float4,   &hcoll_float4,   &vcoll_troll,    0,          0,                      &reset_room4,   0};
const room_t const room_5_1 = {5, &room_5_1_map, &room_5_1_coll, &room_5_1_tiles, 0,                   0,             0,              0,              &hcoll_mushroom, &vcoll_daisy,    0,          &daisy_gets_mushrooms,  &reset_room5_1, 0};

extern rle_data_t  room_0_0_map;
extern rle_data_t  room_0_0_coll;
extern tile_data_t room_0_0_tiles;

extern rle_data_t  room_1_0_map;
extern rle_data_t  room_1_0_coll;
extern tile_data_t room_1_0_tiles;

extern rle_data_t  room_2_0_map;
extern rle_data_t  room_2_0_coll;
extern tile_data_t room_2_0_tiles;

extern rle_data_t  room_3_0_map;
extern rle_data_t  room_3_0_coll;
extern tile_data_t room_3_0_tiles;

extern rle_data_t  room_4_0_map;
extern rle_data_t  room_4_0_coll;
extern tile_data_t room_4_0_tiles;
extern tile_data_t enemies_4_0_tiles;

extern rle_data_t  room_5_0_map;
extern rle_data_t  room_5_0_coll;
extern tile_data_t room_5_0_tiles;

extern rle_data_t  room_0_1_map;
extern rle_data_t  room_0_1_coll;
extern tile_data_t room_0_1_tiles;
extern tile_data_t enemies_0_1_tiles;

extern rle_data_t  room_1_1_map;
extern rle_data_t  room_1_1_coll;
extern tile_data_t room_1_1_tiles;

extern rle_data_t  room_2_1_map;
extern rle_data_t  room_2_1_coll;
extern tile_data_t room_2_1_tiles;
extern tile_data_t enemies_2_1_tiles;

extern rle_data_t  room_3_1_map;
extern rle_data_t  room_3_1_coll;
extern tile_data_t room_3_1_tiles;
extern tile_data_t enemies_34_1_tiles;

extern rle_data_t  room_4_1_map;
extern rle_data_t  room_4_1_coll;
extern tile_data_t room_4_1_tiles;

extern rle_data_t  room_5_1_map;
extern rle_data_t  room_5_1_coll;
extern tile_data_t room_5_1_tiles;
