#ifndef __DIZZY_TYTPES_INCLUDE
#define __DIZZY_TYTPES_INCLUDE

#define room_width 30
#define room_height 17

#define dizzy_sprite_count 9
#define dizzy_sprites_tileoffset 0x00U
#define dizzy_sprite_offset 0x00U
#define dizzy_sprite_tile_count 9

#define evil_sprite_total_count 16
#define evil_sprites_tileoffset dizzy_sprite_tile_count
#define evil_sprite_offset dizzy_sprite_count

#define MIN_DIZZY_X 0
#define MAX_DIZZY_X ((room_width - 2) * 8)
#define MIN_DIZZY_Y 0
#define MAX_DIZZY_Y ((room_height - 2) * 8)

typedef struct {
    UBYTE count;
    unsigned char data[];
} s_data; 

typedef struct {
    UBYTE count, cycle, interr, next_state, fall_state;
    s_data * steps[];
} ani_data;

typedef struct {
    UWORD size;
    unsigned char rle_data[];
} rle_data_t;

typedef struct {
    UBYTE count;
    unsigned char data[];
} tile_data_t;

typedef struct {
    UBYTE y, x;
} spr_ofs_t;

typedef struct {
    UBYTE y, min_y, max_y, x, min_x, max_x;
} spr_ofs_and_lim_t;

typedef struct {
    UBYTE count;
    WORD steps[];
} dyn_data;

typedef struct dialog_item {
  UBYTE x, y;  
  unsigned char * text;
  UBYTE key; 
  struct dialog_item* next;
} dialog_item;

typedef struct {
    UBYTE id;
    UBYTE room_row, room_col, x, y;
    unsigned char * name;
    const tile_data_t * data;
    const tile_data_t * mask;    
} game_item_desc;

typedef struct game_item {
    UBYTE id;
    UBYTE room_row, room_col, x, y;
    const game_item_desc * desc;
    struct game_item * next;
} game_item;

typedef struct {
    UBYTE size;
    game_item * first;
    game_item * last;
} items_list;

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
    room_actions_t room_reset, room_customdraw;
} room_t;

typedef struct {
    UBYTE width;
    room_t * rooms[];
} world_row;

typedef struct {
    WORD x, y;
} fly_coord_t; 

enum  animation_type { ANI_STAND, ANI_UP, ANI_WALK_R, ANI_WALK_L, ANI_ROLL_R, ANI_ROLL_L, ANI_STUN, ANI_DEAD, ANI_JUMP_R, ANI_JUMP_L };

enum  item_identifiers { ID_ITEM_NONE, ID_PICKAXE, ID_KEY, ID_GRASS, ID_MUSHROOMS, ID_PIE, ID_JAR, ID_LID, ID_FIREFLY,
                         ID_COIN0, ID_COIN1, ID_COIN2, 
                         ID_BOULDER0, ID_BOULDER1, ID_BOULDER2, 
                         __ID_LAST_ITEM };
#define ID_TREASURE  0x80
#define ID_ITEM_USED __ID_LAST_ITEM

// all items
#define GAME_ITEMS_COUNT (__ID_LAST_ITEM - 1)

#endif