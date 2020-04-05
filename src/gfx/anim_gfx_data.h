const spr_ofs_t const dizzy_offsets[dizzy_sprite_count] = {{0x26, 0x04}, {0x2E, 0x04}, {0x26, 0x0C},
                                                           {0x2E, 0x0C}, {0x26, 0x14}, {0x2E, 0x14},
                                                           {0x36, 0x04}, {0x36, 0x0C}, {0x36, 0x14}};

enum  animation_type { ANI_STAND, ANI_UP, ANI_WALK_R, ANI_WALK_L, ANI_ROLL_R, ANI_ROLL_L, ANI_STUN, ANI_DEAD, ANI_JUMP_R, ANI_JUMP_L };
      
const ani_data const stand_ani  = { 2, 0, 255, ANI_STAND,  ANI_STAND,  {&m_stand_0, &m_stand_1}};
const ani_data const up_ani     = {16, 0,   0, ANI_STAND,  ANI_UP,     {&m_stand_0, &m_up_0, &m_up_1, &m_up_2, &m_up_3, &m_up_4, &m_up_5, &m_up_6, 
                                                                        &m_stand_0, &m_up_0, &m_up_1, &m_up_2, &m_up_3, &m_up_4, &m_up_5, &m_up_6}};
const ani_data const walk_r_ani = { 8, 0, 255, ANI_STAND,  ANI_ROLL_R, {&m_walk_r_0, &m_walk_r_1, &m_walk_r_2, &m_walk_r_1, &m_walk_r_0, &m_walk_r_3, &m_walk_r_2, &m_walk_r_3}};
const ani_data const walk_l_ani = { 8, 0, 255, ANI_STAND,  ANI_ROLL_L, {&m_walk_l_0, &m_walk_l_1, &m_walk_l_2, &m_walk_l_1, &m_walk_l_0, &m_walk_l_3, &m_walk_l_2, &m_walk_l_3}};
const ani_data const roll_r_ani = { 8, 0, 254, ANI_WALK_R, ANI_ROLL_R, {&m_walk_r_0, &m_roll_r_0, &m_roll_r_1, &m_roll_r_2, &m_roll_r_3, &m_roll_r_4, &m_roll_r_5, &m_roll_r_6}};
const ani_data const roll_l_ani = { 8, 0, 254, ANI_WALK_L, ANI_ROLL_L, {&m_walk_l_0, &m_roll_l_0, &m_roll_l_1, &m_roll_l_2, &m_roll_l_3, &m_roll_l_4, &m_roll_l_5, &m_roll_l_6}};
const ani_data const jump_r_ani = {16, 0,   0, ANI_WALK_R, ANI_ROLL_R, {&m_walk_r_0, &m_roll_r_0, &m_roll_r_1, &m_roll_r_2, &m_roll_r_3, &m_roll_r_4, &m_roll_r_5, &m_roll_r_6,
                                                                        &m_walk_r_0, &m_roll_r_0, &m_roll_r_1, &m_roll_r_2, &m_roll_r_3, &m_roll_r_4, &m_roll_r_5, &m_roll_r_6}};
const ani_data const jump_l_ani = {16, 0,   0, ANI_WALK_L, ANI_ROLL_L, {&m_walk_l_0, &m_roll_l_0, &m_roll_l_1, &m_roll_l_2, &m_roll_l_3, &m_roll_l_4, &m_roll_l_5, &m_roll_l_6,
                                                                        &m_walk_l_0, &m_roll_l_0, &m_roll_l_1, &m_roll_l_2, &m_roll_l_3, &m_roll_l_4, &m_roll_l_5, &m_roll_l_6}};
const ani_data const stun_ani   = { 8, 0, 254, ANI_STAND,  ANI_STAND,  {&m_stun_0, &m_stun_1, &m_stun_0, &m_stun_2, &m_stun_3, &m_stun_2, &m_stun_3, &m_stun_4}};
const ani_data const dead_ani   = { 4, 3, 254, ANI_DEAD,   ANI_DEAD,   {&m_dead_0, &m_dead_1, &m_dead_2, &m_dead_1}};
        
const ani_data * const animation[] = {&stand_ani, &up_ani, &walk_r_ani, &walk_l_ani, &roll_r_ani, &roll_l_ani, &stun_ani, &dead_ani, &jump_r_ani, &jump_l_ani};

const dyn_data   const move_y_dynamics   = {32, {-4, -4, -3, -2, -2, -1, -2, -1, -1, -1, -1, -1,  0, -1,  0,  0,  
                                                  0,  0,  1,  0,  1,  1,  1,  1,  1,  2,  1,  2,  2,  3,  4,  4}
                                           };
const dyn_data   const double_y_dynamics = {32, {-8, -8, -6, -4, -4, -4, -3, -3, -3, -2, -2, -1, -1, -1,  -0,  0,  
                                                  0,  0,  1,  1,  1,  2,  2,  3,  3,  3,  4,  4,  4,  6,   8,  8}
                                           };
const dyn_data * const move_y_data[]   = {0, &move_y_dynamics,   0,  0, 0,  0, 0, 0, &move_y_dynamics,   &move_y_dynamics};
const dyn_data * const double_y_data[] = {0, &double_y_dynamics, 0,  0, 0,  0, 0, 0, &double_y_dynamics, &double_y_dynamics};
const WORD       const move_x_data[]   = {0, 0,                  1, -1, 1, -1, 0, 0, 1,                  -1};

extern s_data m_empty;
            
extern s_data m_stand_0;
extern s_data m_stand_1;

extern s_data m_walk_r_0;
extern s_data m_walk_r_1;
extern s_data m_walk_r_2;
extern s_data m_walk_r_3;

extern s_data m_walk_l_0;
extern s_data m_walk_l_1;
extern s_data m_walk_l_2;
extern s_data m_walk_l_3;

extern s_data m_roll_r_0;
extern s_data m_roll_r_1;
extern s_data m_roll_r_2;
extern s_data m_roll_r_3;
extern s_data m_roll_r_4;
extern s_data m_roll_r_5;
extern s_data m_roll_r_6;

extern s_data m_roll_l_0;
extern s_data m_roll_l_1;
extern s_data m_roll_l_2;
extern s_data m_roll_l_3;
extern s_data m_roll_l_4;
extern s_data m_roll_l_5;
extern s_data m_roll_l_6;

extern s_data m_stun_0;
extern s_data m_stun_1;
extern s_data m_stun_2;
extern s_data m_stun_3;
extern s_data m_stun_4;

extern s_data m_up_0;
extern s_data m_up_1;
extern s_data m_up_2;
extern s_data m_up_3;
extern s_data m_up_4;
extern s_data m_up_5;
extern s_data m_up_6;

extern s_data m_dead_0;
extern s_data m_dead_1;
extern s_data m_dead_2;

extern unsigned char dizzy_anim_tiles[];
