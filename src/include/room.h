#ifndef __ROOMS_INCLUDE
#define __ROOMS_INCLUDE

#define rle_decompress_to_bkg 0
#define rle_decompress_to_win 1

extern UBYTE * ptr_div_reg; 
          
extern unsigned char coll_buf[];
extern unsigned char * current_coll_idx[];
             
extern enum  animation_type ani_type;
extern UBYTE ani_phase;

extern dyn_data * current_dyn;       
extern dyn_data move_y_dynamics, double_y_dynamics;
extern UBYTE double_dyn, current_dyn_phase;

extern UBYTE current_room_x, current_room_y; 
extern room_t * current_room;

extern WORD  dizzy_x, dizzy_y;
extern WORD  delta_x, delta_y;

extern UBYTE is_position_safe;

extern UBYTE dizzy_falling, dizzy_stun;

extern UBYTE bkg_scroll_x_target, bkg_scroll_y_target;

extern UBYTE tile_pos_x, tile_pos_y, tile_pos_ox, tile_pos_oy;
extern UBYTE collision_buf[];

extern spr_ofs_t evil_hide[];

extern spr_ofs_t fly_offsets[];
extern WORD fly_delta[];

extern UBYTE __temp_i, __temp_j, __temp_k, __temp_l, __temp_m; 

// collisions 
void get_h_coll(WORD x, WORD y);
void get_v_coll(WORD x, WORD y);
void get_coll(WORD x, WORD y);

// money and energy 
extern UBYTE coins;
extern UBYTE dizzy_energy, inc_energy, dec_energy;

void sub_coins(UBYTE n);
void show_coins();

// inventory
extern items_list game_item_list;
extern items_list inventory_item_list;
extern items_list item_stack;

void push_last(items_list * list, game_item * item);
game_item * pop_by_id(items_list * list, const UBYTE id);
game_item * find_by_id(items_list * list, const UBYTE id);

// defaults
void default_draw();
UBYTE default_drop(UBYTE id);

// misc routines
void multiple_move_sprites(UBYTE start, UBYTE count, UBYTE x, UBYTE y, const unsigned char * offsets);
void multiple_move_sprites_limits(UBYTE start, UBYTE count, UBYTE x, UBYTE y, const unsigned char * offsets, UBYTE dx, UBYTE dy);
void multiple_set_sprite_tiles(UBYTE start, UBYTE count, const unsigned char * tiles);

extern unsigned char empty_compressed_map[];
void rle_decompress_tilemap(UBYTE bkg, UBYTE x, UBYTE y, UBYTE w, UBYTE h, const unsigned char * tiles);

#endif
