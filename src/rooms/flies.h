#ifndef __FIREFLIES_INCLUDE
#define __FIREFLIES_INCLUDE

typedef struct {
    WORD x, y;
} fly_coord_t; 

const spr_ofs_t const fly_offsets[] = {{0x28, 0x08}};
const WORD const fly_delta[8] = { -4, -3, -2, 0, 0, 2, 3, 4 };

#endif