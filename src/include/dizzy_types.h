typedef struct {
    UBYTE count;
    UBYTE rev;
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
