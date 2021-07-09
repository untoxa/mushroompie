#ifndef __RLE_UTILS_INCLUDE
#define __RLE_UTILS_INCLUDE

// fill buffer with incrementing values
void set_inc_tiles(UBYTE from, UBYTE count, unsigned char * buf);
// unshrink 0bpp, 1bpp and 2bpp tiles to vram
void unshrink_tiles(UBYTE from, UBYTE count, unsigned char * shrinked_tiles);
// unshrink tiles to buffer
void unshrink_tiles_to_buf(UBYTE count, const unsigned char * shrinked_tiles, unsigned char * dest);
// unshrink tiles to buffer
unsigned char * get_shrinked_tile_offset(UBYTE tilenum, const unsigned char * shrinked_tiles);
// decompress rle-like compressed map to vram
void rle_decompress_tilemap(UBYTE bkg, UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * tiles);
// decompress rle-like compressed buffer
void rle_decompress_data(const unsigned char * data, UWORD size, unsigned char * dest);
// put tile map to buffer, containing another tilemap with buf_w / buf_h dimentions
void put_map_to_buf(UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * source, unsigned char * buf, UBYTE buf_w, UBYTE buf_h);
// extract tile map from buffer, containing another tilemap with buf_w / buf_h dimentions
void get_map_from_buf(UBYTE x, UBYTE y, UBYTE w, UBYTE h, unsigned char * dest, unsigned char * buf, UBYTE buf_w, UBYTE buf_h);

#endif