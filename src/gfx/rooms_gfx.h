#define WORLD_WIDTH 6
#define WORLD_HEIGHT 2

typedef void (*room_actions_t)();
typedef void (*room_checkcoll_t)(WORD x, WORD y);
typedef UBYTE (*room_useitem_t)(UBYTE tile_x, UBYTE tile_y, UBYTE id);

typedef struct {
    UBYTE bank;
    rle_data_t * room_map;
    rle_data_t * room_coll_map;
    tile_data_t * room_tiles;
    tile_data_t * raw_enemies_tiles;
    room_actions_t room_init, room_actions, room_animations;
    room_checkcoll_t room_h_coll, room_v_coll, room_evil_coll;
    room_useitem_t room_use;
    room_actions_t room_reset;
} room_t;

typedef struct {
    UBYTE width;
    room_t * rooms[];
} world_row;

// room 0_1 handlers
void init_room0(); void move_bats0(); void draw_bats0();
void coll_bats(WORD x, WORD y);
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

const world_row const world_row_0 = {0, {&room_0_0, &room_1_0, &room_2_0, &room_3_0, &room_4_0, &room_5_0}};
const world_row const world_row_1 = {1, {&room_0_1, &room_1_1, &room_2_1, &room_3_1, &room_4_1, &room_5_1}};

const room_t const room_0_0 = {3, &room_0_0_map, &room_0_0_coll, &room_0_0_tiles, 0, 0, 0, 0, 0, 0, 0, 0, 0};
const room_t const room_1_0 = {3, &room_1_0_map, &room_1_0_coll, &room_1_0_tiles, 0, 0, 0, 0, 0, 0, 0, 0, 0};
const room_t const room_2_0 = {3, &room_2_0_map, &room_2_0_coll, &room_2_0_tiles, 0, 0, 0, 0, 0, 0, 0, 0, 0};
const room_t const room_3_0 = {3, &room_3_0_map, &room_3_0_coll, &room_3_0_tiles, 0, 0, 0, 0, 0, 0, 0, 0, 0};  // empty room
const room_t const room_4_0 = {3, &room_3_0_map, &room_3_0_coll, &room_3_0_tiles, 0, 0, 0, 0, 0, 0, 0, 0, 0};  // empty room
const room_t const room_5_0 = {3, &room_5_0_map, &room_5_0_coll, &room_5_0_tiles, 0, 0, 0, 0, 0, 0, 0, 0, 0};

const room_t const room_0_1 = {4, &room_0_1_map, &room_0_1_coll, &room_0_1_tiles, &enemies_0_1_tiles,  &init_room0,  &move_bats0,    &draw_bats0,    0,               0,               &coll_bats, 0,               0};
const room_t const room_1_1 = {4, &room_1_1_map, &room_1_1_coll, &room_1_1_tiles, 0,                   0,            0,              0,              &hcoll_blockage, &vcoll_blockage, 0,          &cleaning_path,  &reset_room1};
const room_t const room_2_1 = {4, &room_2_1_map, &room_2_1_coll, &room_2_1_tiles, &enemies_2_1_tiles,  &init_room2,  &move_elevator, &draw_elevator, &hcoll_elevator, &vcoll_dylan,    0,          &dylan_gets_key, &reset_room2};
const room_t const room_3_1 = {5, &room_3_1_map, &room_3_1_coll, &room_3_1_tiles, &enemies_34_1_tiles, &init_room34, &move_float,    &draw_float3,   &hcoll_float3,   0,               0,          0,               0};
const room_t const room_4_1 = {5, &room_4_1_map, &room_4_1_coll, &room_4_1_tiles, &enemies_34_1_tiles, &init_room34, &move_float,    &draw_float4,   &hcoll_float4,   &vcoll_troll,    0,          0,               &reset_room4};
const room_t const room_5_1 = {5, &room_5_1_map, &room_5_1_coll, &room_5_1_tiles, 0,                   0,            0,              0,              0,               0,               0,          0,               0};

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
