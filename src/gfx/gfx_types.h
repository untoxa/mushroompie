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
