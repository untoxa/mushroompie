#ifndef __SPRITE_UTILS_INCLUDE
#define __SPRITE_UTILS_INCLUDE

void multiple_clear_sprite_tiledata(UBYTE start, UBYTE count);
void multiple_set_sprite_prop(UBYTE start, UBYTE count, UBYTE prop);
void multiple_set_sprite_tiles(UBYTE start, UBYTE count, const unsigned char * tiles);
void multiple_move_sprites(UBYTE start, UBYTE count, UBYTE x, UBYTE y, const unsigned char * offsets);
void multiple_move_sprites_limits(UBYTE start, UBYTE count, UBYTE x, UBYTE y, const unsigned char * offsets, UBYTE dx, UBYTE dy);


#endif