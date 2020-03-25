typedef struct {
    UBYTE count;
    UBYTE rev;
    unsigned char data[];
} s_data; 

typedef struct {
    UBYTE count, cycle, interr, next_state, fall_state;
    s_data * steps[];
} ani_data;

const s_data const m_empty     = {9, 0, {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}};
                                  
const s_data const m_stand_0   = {9, 0, {0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09}};
const s_data const m_stand_1   = {9, 0, {0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,0x10,0x11,0x12}};        
                                  
const s_data const m_walk_r_0  = {9, 0, {0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B}};
const s_data const m_walk_r_1  = {9, 0, {0x13,0x14,0x15,0x1C,0x17,0x1D,0x1E,0x1F,0x20}};
const s_data const m_walk_r_2  = {9, 0, {0x01,0x21,0x22,0x23,0x05,0x24,0x25,0x26,0x27}};
const s_data const m_walk_r_3  = {9, 0, {0x13,0x28,0x15,0x29,0x17,0x18,0x2A,0x2B,0x2C}};            
                                  
const s_data const m_walk_l_0  = {9, 1, {0x17,0x18,0x15,0x16,0x13,0x14,0x1B,0x1A,0x19}};
const s_data const m_walk_l_1  = {9, 1, {0x17,0x1D,0x15,0x1C,0x13,0x14,0x20,0x1F,0x1E}};
const s_data const m_walk_l_2  = {9, 1, {0x05,0x24,0x22,0x23,0x01,0x21,0x27,0x26,0x25}};
const s_data const m_walk_l_3  = {9, 1, {0x17,0x18,0x15,0x29,0x13,0x28,0x2C,0x2B,0x2A}};            
                                  
const s_data const m_roll_r_0  = {9, 0, {0x00,0x2D,0x2E,0x2F,0x30,0x31,0x32,0x33,0x34}};
const s_data const m_roll_r_1  = {9, 0, {0x00,0x35,0x36,0x37,0x00,0x38,0x39,0x3A,0x3B}};
const s_data const m_roll_r_2  = {9, 0, {0x3C,0x3D,0x3E,0x3F,0x00,0x40,0x41,0x42,0x43}};
const s_data const m_roll_r_3  = {9, 0, {0x44,0x45,0x46,0x47,0x48,0x49,0x4A,0x4B,0x4C}};
const s_data const m_roll_r_4  = {9, 0, {0x00,0x4D,0x4E,0x4F,0x50,0x51,0x52,0x53,0x54}};
const s_data const m_roll_r_5  = {9, 0, {0x00,0x55,0x00,0x56,0x00,0x57,0x58,0x59,0x5A}};
const s_data const m_roll_r_6  = {9, 0, {0x5B,0x5C,0x5D,0x5E,0x5F,0x60,0x61,0x62,0x63}};
                                  
const s_data const m_roll_l_0  = {9, 1, {0x30,0x31,0x2E,0x2F,0x00,0x2D,0x34,0x33,0x32}};
const s_data const m_roll_l_1  = {9, 1, {0x00,0x38,0x36,0x37,0x00,0x35,0x3B,0x3A,0x39}};
const s_data const m_roll_l_2  = {9, 1, {0x00,0x40,0x3E,0x3F,0x3C,0x3D,0x43,0x42,0x41}};
const s_data const m_roll_l_3  = {9, 1, {0x48,0x49,0x46,0x47,0x44,0x45,0x4C,0x4B,0x4A}};
const s_data const m_roll_l_4  = {9, 1, {0x50,0x51,0x4E,0x4F,0x00,0x4D,0x54,0x53,0x52}};
const s_data const m_roll_l_5  = {9, 1, {0x00,0x57,0x00,0x56,0x00,0x55,0x5A,0x59,0x58}};
const s_data const m_roll_l_6  = {9, 1, {0x5F,0x60,0x5D,0x5E,0x5B,0x5C,0x63,0x62,0x61}};
                                  
const s_data const m_stun_0    = {9, 0, {0x64,0x65,0x66,0x67,0x68,0x69,0x6A,0x6B,0x6C}};
const s_data const m_stun_1    = {9, 0, {0x6D,0x6E,0x6F,0x70,0x71,0x72,0x6A,0x6B,0x6C}};
const s_data const m_stun_2    = {9, 0, {0x00,0x73,0x74,0x75,0x5F,0x76,0x6A,0x6B,0x77}};
const s_data const m_stun_3    = {9, 0, {0x00,0x78,0x74,0x79,0x5F,0x7A,0x6A,0x6B,0x77}};
const s_data const m_stun_4    = {9, 0, {0x00,0x7B,0x74,0x7C,0x5F,0x7D,0x6A,0x7E,0x6C}};
                                  
const s_data const m_up_0      = {9, 0, {0x7F,0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87}};
const s_data const m_up_1      = {9, 0, {0x00,0x88,0x00,0x89,0x00,0x8A,0x8B,0x8C,0x8D}};
const s_data const m_up_2      = {9, 0, {0x7F,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95}};
const s_data const m_up_3      = {9, 0, {0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E}};
const s_data const m_up_4      = {9, 0, {0x7F,0x9F,0x8F,0xA0,0x91,0xA1,0xA2,0x94,0xA3}};
const s_data const m_up_5      = {9, 0, {0x00,0xA4,0x00,0xA5,0x00,0xA6,0xA7,0xA8,0xA9}};
const s_data const m_up_6      = {9, 0, {0x00,0xAA,0xAB,0xAC,0x00,0xAD,0xAE,0x6B,0xAF}};
                                  
const s_data const m_dead_0    = {9, 0, {0x00,0xAA,0xAB,0xAC,0x00,0xAD,0xAE,0x6B,0xAF}};
const s_data const m_dead_1    = {9, 0, {0x00,0xA4,0x00,0xA5,0x00,0xA6,0xA7,0xA8,0xA9}};
const s_data const m_dead_2    = {9, 0, {0x7F,0x9F,0x8F,0xA0,0x91,0xA1,0xA2,0x94,0xA3}};

const unsigned char const dizzy_anim_tiles[] = {
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00,
0x33,0x01,0x7B,0x31,0xFF,0x79,0xFF,0x7B,0x7F,0x3B,0x3F,0x03,0x07,0x03,0x03,0x01,
0x00,0x00,0x00,0x00,0x00,0x00,0x3E,0x00,0x7F,0x3E,0xFF,0x7F,0xFF,0xFF,0xC9,0xFF,
0x88,0xFF,0xAA,0xFF,0x88,0xFF,0xFF,0xFF,0xFF,0xFF,0xBE,0xFF,0xC1,0xFF,0xF7,0xFF,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0xC0,0x80,0xC0,0x80,
0xE6,0xC0,0xEF,0xC6,0xFF,0xCF,0xFF,0xEF,0xFF,0xEE,0xFE,0xE0,0xF0,0xE0,0xE0,0xC0,
0x03,0x01,0x01,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x01,0x00,
0xFF,0xFF,0xFF,0x7F,0xFF,0x00,0xF7,0xE3,0xB6,0xE3,0x7D,0xF7,0xFF,0xF7,0xF7,0x00,
0xE0,0xC0,0xC0,0x00,0x80,0x00,0xC0,0x80,0xC0,0x80,0xE0,0xC0,0xE0,0xC0,0xC0,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x03,0x01,
0x03,0x01,0x03,0x01,0x1F,0x03,0x7F,0x1B,0xFF,0x7B,0xFF,0x7B,0xFF,0x79,0x7B,0x01,
0x00,0x00,0x00,0x00,0x3E,0x00,0x7F,0x3E,0xFF,0x7F,0xFF,0xFF,0xC9,0xFF,0x88,0xFF,
0xAA,0xFF,0x88,0xFF,0xFF,0xFF,0xFF,0xFF,0xBE,0xFF,0xC1,0xFF,0xF7,0xFF,0xFF,0xFF,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0xC0,0x80,0xC0,0x80,0xE0,0xC0,
0xE0,0xC0,0xE0,0xC0,0xFC,0xE0,0xFF,0xEC,0xFF,0xEF,0xFF,0xEF,0xFF,0xCF,0xEF,0xC0,
0x01,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x01,0x00,
0xFF,0x7F,0x7F,0x00,0xE3,0x00,0xF7,0xE3,0xB6,0xE3,0x7D,0xF7,0xFF,0xF7,0xF7,0x00,
0xC0,0x00,0x00,0x00,0x80,0x00,0xC0,0x80,0xC0,0x80,0xE0,0xC0,0xE0,0xC0,0xC0,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x07,0x03,
0x07,0x03,0x07,0x03,0x0F,0x07,0x0F,0x07,0x0F,0x07,0x07,0x03,0x07,0x03,0x07,0x03,
0x00,0x00,0x00,0x00,0x7C,0x00,0xFE,0x7C,0xFF,0xFE,0xFF,0xFF,0xF9,0xFF,0xF1,0xFF,
0xF5,0xFF,0xF1,0xFF,0xFF,0xE7,0xFF,0xDB,0xFF,0xBD,0xFE,0xBD,0xFF,0xBD,0xFF,0xDB,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0x80,0x00,0xC0,0x80,
0xC0,0x80,0xC0,0x80,0xE0,0xC0,0xE0,0xC0,0xE0,0xC0,0x40,0x80,0xC0,0x80,0xC0,0x80,
0x03,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x01,0x00,0x01,0x00,0x00,0x00,
0xFF,0xE6,0xE6,0x00,0xF8,0x20,0xFE,0xD8,0xFF,0xE6,0xFF,0xFB,0xFF,0xFB,0xFF,0x00,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0x80,0x00,0x00,0x00,
0xF5,0xFF,0xF1,0xFF,0xFF,0xF8,0xFF,0xF7,0xFF,0xEF,0xFF,0xF7,0xFF,0xFB,0xFF,0xFD,
0xC0,0x80,0xC0,0x80,0xE0,0xC0,0xE0,0x40,0xC0,0x80,0xC0,0x80,0x80,0x00,0x80,0x00,
0x03,0x00,0x03,0x00,0x07,0x03,0x0F,0x07,0x0F,0x07,0x07,0x03,0x03,0x00,0x00,0x00,
0xFF,0xFE,0xFE,0x00,0xDD,0x88,0xFF,0x9D,0xFF,0xDF,0xFF,0xEF,0xFF,0xEE,0xFE,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0xC0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,
0x03,0x01,0x0B,0x01,0x1F,0x0B,0x3F,0x1B,0x7F,0x3B,0x7F,0x3B,0x7F,0x39,0x3B,0x01,
0x00,0x00,0x00,0x00,0x00,0x00,0x3E,0x00,0x7F,0x3E,0xFF,0x7F,0xFF,0xFF,0xFC,0xFF,
0xF8,0xFF,0xFA,0xFF,0xF8,0xFF,0xFF,0xFF,0xFF,0xFF,0xFD,0xFF,0xFE,0xFF,0xFF,0xFF,
0xE0,0xC0,0xE8,0xC0,0xFC,0xC8,0xFE,0xEC,0xFF,0xEE,0xFF,0xEE,0x3F,0xCE,0xEE,0xC0,
0x07,0x01,0x0F,0x06,0x1F,0x0F,0x3F,0x1E,0x1F,0x0F,0x0F,0x07,0x07,0x03,0x03,0x00,
0xFF,0xFF,0xFF,0x7F,0xFF,0x00,0x03,0x01,0x87,0x03,0xC3,0x81,0x81,0x00,0x00,0x00,
0xE0,0xC0,0xC0,0x00,0xF0,0xC0,0xF8,0xF0,0xFC,0xF8,0xF8,0xF0,0xF0,0xC0,0xC0,0x00,
0x07,0x03,0x07,0x03,0x0F,0x06,0x0F,0x05,0x07,0x03,0x07,0x03,0x07,0x03,0x03,0x00,
0xF5,0xFF,0xF1,0xFF,0xFF,0x3F,0xFF,0xDF,0xFB,0xEF,0xFC,0xDF,0xFF,0xBF,0xFF,0x7F,
0x00,0x00,0x03,0x00,0x07,0x03,0x0F,0x07,0x0F,0x07,0x07,0x03,0x03,0x00,0x00,0x00,
0xFF,0xFE,0xFE,0x00,0xDD,0x88,0xFF,0x9D,0xFF,0xEF,0xFF,0xEF,0xFF,0xEE,0xFE,0x00,
0x80,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0xC0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,
0x01,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x03,0x01,0x03,0x01,0x05,0x00,0x0E,0x04,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x1F,0x03,0x7F,0x1F,0xFF,0x7F,
0xFF,0xFF,0xFF,0xFF,0xFE,0xFF,0xFE,0xE3,0xFE,0xDD,0xFF,0xBD,0xFF,0xBD,0xFE,0x5B,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0x00,0xF0,0xE0,0xF8,0xF0,0xFC,0xF8,
0xFC,0xF8,0xFC,0xF8,0x1C,0xF8,0x9C,0xF8,0x38,0xF0,0xF8,0xF0,0xF0,0xE0,0xF0,0xE0,
0x1E,0x0E,0x3E,0x1C,0x1F,0x0E,0x0F,0x06,0x07,0x01,0x03,0x01,0x01,0x00,0x00,0x00,
0x7E,0x27,0xBF,0x0F,0xCF,0x80,0xC0,0x80,0xC0,0x80,0xE0,0xC0,0xC0,0x80,0x80,0x00,
0x60,0xC0,0x40,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x3C,0x00,0x7F,0x3C,0x7F,0x3C,0x7D,0x38,0x7E,0x34,0x7E,0x34,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0E,0x00,
0x7F,0x0E,0xFF,0x7F,0xFF,0x7F,0xFF,0xFF,0xFF,0xC7,0xFF,0xBB,0xFF,0x7D,0xFE,0x7D,
0xC0,0x00,0xF0,0xC0,0xF8,0xF0,0xFC,0xF8,0xFE,0xFC,0xFE,0xFC,0xFE,0xFC,0x3E,0xFC,
0x3D,0x08,0x79,0x30,0x78,0x30,0x30,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0xFE,0xAB,0xEE,0xD7,0xEF,0x7F,0xEF,0x7F,0x7F,0x0E,0x0E,0x00,0x00,0x00,0x00,0x00,
0x9E,0xFC,0x1C,0xF8,0xF8,0xF0,0xF0,0xC0,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x01,0x07,0x03,0x0F,0x07,0x1F,0x07,
0x3F,0x1A,0x7E,0x38,0x38,0x10,0x10,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x03,0x01,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0xC0,0x80,0xE0,0xC0,0xE0,0xC0,
0xDF,0x00,0x3F,0x1F,0x7F,0x27,0x7F,0x1B,0xFF,0x7D,0xFF,0xBD,0xFF,0xBD,0x3F,0xDB,
0x00,0x00,0xC0,0x00,0xE0,0xC0,0xF0,0xE0,0xF8,0xF0,0xF8,0xF0,0xF8,0xF0,0xFC,0xF8,
0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x79,0xE7,0xFC,0xFF,0xF8,0x7F,0x78,0x3F,0x3F,0x0F,0x0F,0x03,0x03,0x00,0x00,0x00,
0xFC,0xF8,0xFC,0xF8,0xFC,0xF8,0xF8,0xF0,0xF8,0xF0,0xF0,0xE0,0xE0,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x02,0x01,0x07,0x03,0x07,0x03,0x07,0x03,
0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0x00,0xFF,0xDF,0xFF,0xDF,0xFF,0x67,0x7F,0x03,
0x67,0x00,0xFF,0x67,0xFF,0xDB,0xFF,0xBD,0x3F,0xDD,0xFF,0xBD,0xFF,0xDB,0xFF,0xE7,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0x80,0x00,0x80,0x00,0x80,0x00,
0x00,0x00,0xC0,0x00,0xE0,0xC0,0xE0,0xC0,0xF0,0xE0,0xF0,0xE0,0xF0,0xE0,0xF0,0xE0,
0x03,0x01,0x03,0x01,0x03,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x8F,0xFF,0xAF,0xFF,0x8F,0xFF,0x9F,0xFF,0xFF,0xFF,0xFF,0x7F,0x7F,0x3E,0x3E,0x00,
0xE0,0xC0,0xE0,0xC0,0xE0,0xC0,0xC0,0x80,0xC0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,
0x01,0x00,0x03,0x01,0x07,0x03,0x07,0x03,0x0F,0x07,0x1F,0x0F,0x1C,0x0F,0x39,0x1F,
0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x01,0x07,0x03,0x03,0x01,0x7B,0x01,
0xFF,0x79,0x3F,0xFC,0xBF,0xE6,0xFF,0x9B,0xFF,0x7D,0xFF,0xBD,0x7F,0xBB,0x7F,0xC7,
0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0xC0,0x80,0xE0,0xC0,0xF0,0xA0,0xF8,0x70,
0xFC,0xB8,0xFC,0x78,0xF8,0x70,0xF0,0x00,0x80,0x00,0xC0,0x80,0xC0,0x80,0xE0,0xC0,
0x38,0x1F,0x3F,0x1F,0x1F,0x0F,0x1F,0x0F,0x0F,0x07,0x07,0x00,0x00,0x00,0x00,0x00,
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFE,0xFE,0xF8,0xF8,0xC0,0xC0,0x00,0x00,0x00,
0xC0,0x80,0xC0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x03,0x00,0x0F,0x03,0x1F,0x0F,0x38,0x1F,0x79,0x3F,0x7C,0x3F,0x7F,0x3F,
0x70,0x00,0xFE,0x70,0xF7,0xFE,0xF7,0xFE,0x7F,0xE3,0x7F,0xDD,0x7F,0xBE,0xFF,0xBE,
0x00,0x00,0x00,0x00,0x0C,0x00,0x1E,0x0C,0x9E,0x0C,0xBC,0x10,0x7E,0x2C,0x7E,0x2C,
0x7F,0x3F,0x7F,0x3F,0x3F,0x1F,0x1F,0x0F,0x0F,0x03,0x03,0x00,0x00,0x00,0x00,0x00,
0xFF,0xDD,0xFF,0xE3,0xFF,0xFF,0xFF,0xFE,0xFF,0xFE,0xFE,0x78,0x78,0x00,0x00,0x00,
0xBE,0x1C,0xFE,0x3C,0xFE,0x3C,0x3C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x01,0x07,0x03,0x0F,0x07,0x0F,0x07,
0x1F,0x0F,0x1F,0x0F,0x1F,0x0F,0x0F,0x07,0x0F,0x07,0x0F,0x07,0x07,0x03,0x07,0x03,
0x00,0x00,0x00,0x00,0x00,0x00,0xF0,0x00,0xFC,0xF0,0xFE,0xFC,0xCF,0xFE,0xC7,0xFF,
0xD7,0xFF,0xC7,0xFF,0xFF,0xE3,0xFE,0xDD,0xFF,0xDE,0xFF,0xDE,0xFF,0xDC,0xFF,0xE3,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x00,
0xC0,0x80,0xC0,0x80,0x40,0x80,0x60,0xC0,0xE0,0xC0,0xC0,0x80,0xC0,0x80,0x80,0x00,
0x03,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0xFF,0xFC,0xFC,0x78,0x7C,0x00,0x0F,0x04,0x1F,0x0F,0x0F,0x07,0x0F,0x07,0x07,0x00,
0x00,0x00,0x70,0x00,0xF8,0x70,0xF8,0xB0,0xF0,0xC0,0xC0,0x80,0x80,0x00,0x00,0x00,
0x00,0x00,0x01,0x00,0x07,0x01,0x0F,0x04,0x1C,0x08,0x18,0x00,0x3A,0x10,0x3F,0x12,
0x1F,0x07,0x07,0x02,0x03,0x01,0x03,0x01,0x03,0x01,0x07,0x03,0x1F,0x03,0x3F,0x1B,
0x80,0x00,0xCC,0x80,0xFE,0xCC,0xCD,0x80,0x80,0x00,0x3E,0x00,0x7F,0x3E,0xFF,0x7E,
0xFF,0x4D,0xFF,0xB3,0xFB,0xCD,0xAB,0xFE,0x88,0xFF,0xBE,0xFF,0xFF,0xFF,0xF7,0xFF,
0x00,0x00,0x00,0x00,0xC0,0x00,0xE8,0xC0,0xDC,0x08,0x3E,0x1C,0x1C,0x08,0x08,0x00,
0xBC,0x08,0xF8,0xB0,0xF0,0x00,0xE0,0x40,0xE0,0xC0,0xF0,0xE0,0xFC,0xE0,0xFE,0xEC,
0x7F,0x3B,0xFF,0x79,0xFD,0x78,0xFB,0x71,0x73,0x01,0x01,0x00,0x00,0x00,0x00,0x00,
0xFF,0xFF,0xFF,0x1C,0xFF,0xEB,0xFF,0xF7,0xFF,0xF7,0xFF,0xF7,0xF7,0x63,0x63,0x00,
0xFF,0xEE,0xFF,0x4F,0xDF,0x8F,0xEF,0xC7,0xE7,0xC0,0xC0,0x80,0x80,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x05,0x00,0x0E,0x04,0x1F,0x0E,0x0E,0x04,0x04,0x00,0x0E,0x04,
0x07,0x02,0x03,0x00,0x03,0x01,0x03,0x01,0x03,0x01,0x07,0x03,0x1F,0x03,0x3F,0x1B,
0x00,0x00,0xCC,0x00,0xFF,0xCC,0xCF,0x01,0x01,0x00,0x3E,0x00,0x7F,0x3E,0xFF,0x6F,
0xFF,0x56,0xFF,0xB9,0xF9,0xD6,0xBA,0xEF,0x88,0xFF,0xBE,0xFF,0xFF,0xFF,0xF7,0xFF,
0x00,0x00,0x80,0x00,0xC0,0x80,0xE0,0xC0,0xD0,0x80,0xB8,0x10,0x1C,0x08,0x88,0x00,
0xDC,0x08,0xFE,0xDC,0xDC,0x08,0xE8,0xC0,0xE0,0xC0,0xF0,0xE0,0xFC,0xE0,0xFE,0xEC,
0x01,0x00,0x01,0x00,0x03,0x01,0x02,0x01,0x07,0x03,0x07,0x03,0x1F,0x03,0x3F,0x1B,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x3E,0x00,0x7F,0x3E,0xFF,0x7F,
0xFF,0xFF,0x7D,0xFF,0xBB,0xFF,0x10,0xFF,0xBB,0xFF,0x7D,0xFF,0xFF,0xFF,0xDF,0xFF,
0xC0,0x80,0xF0,0x80,0xF8,0xB0,0xFC,0xB8,0xFC,0xB8,0xEC,0xC8,0xFC,0xE8,0xF8,0xE0,
0xF0,0xE0,0xE0,0x40,0xC0,0x80,0xE0,0xC0,0xE0,0xC0,0xC0,0x80,0x80,0x00,0x00,0x00,
0x01,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x07,0x03,0x07,0x03,0x1F,0x03,0x3F,0x1B,
0xFF,0xFF,0xDF,0xFF,0xEE,0xFF,0x84,0xFF,0xEE,0xFF,0xDF,0xFF,0xFF,0xFF,0xFD,0xFF,
0xD0,0x80,0x78,0x90,0xFC,0xD8,0x3C,0xD8,0xFC,0xD8,0x7C,0xE8,0xF8,0xE0,0xF0,0xE0,
0x01,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x03,0x01,0x07,0x03,0x1F,0x03,0x3F,0x1B,
0xFF,0xFF,0xC9,0xFF,0x88,0xFF,0xAA,0xFF,0x88,0xFF,0xFF,0xFF,0xBE,0xFF,0xC1,0xFF,
0xC0,0x80,0xC0,0x80,0xE0,0xC0,0xE0,0xC0,0xE0,0xC0,0xF0,0xE0,0xFC,0xE0,0xFE,0xEC,
0xF7,0xFF,0xFF,0x1C,0xFF,0xEB,0xFF,0xF7,0xFF,0xF7,0xFF,0xF7,0xF7,0x63,0x63,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,
0x03,0x01,0x03,0x01,0x07,0x03,0x17,0x03,0x3F,0x13,0x7F,0x3B,0xFF,0x7B,0xFB,0x71,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x3E,0x00,0xFF,0x3E,0xFF,0xFF,
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xC9,0xFF,0x88,0xFF,0xAA,0xFF,0xFF,0xFF,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,
0xE0,0xC0,0xE0,0xC0,0xF0,0xE0,0xF4,0xE0,0xFE,0xE4,0xFF,0xEE,0xFF,0xEF,0xEF,0xC7,
0x79,0x30,0x30,0x00,0x01,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x01,0x00,0x00,0x00,
0xFF,0x7F,0xFF,0x00,0xF7,0xE3,0xB6,0xE3,0x7D,0xF7,0xFF,0xF7,0xF7,0xE3,0xE3,0x00,
0xCF,0x06,0x86,0x00,0xC0,0x80,0xC0,0x80,0xE0,0xC0,0xE0,0xC0,0xC0,0x80,0x80,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x01,0x13,0x01,
0x00,0x00,0x00,0x00,0x63,0x00,0xFF,0x63,0x7F,0x1C,0xFF,0x7F,0xFF,0xFF,0xFF,0xFF,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00,0xE0,0xC0,0xE4,0xC0,
0x3F,0x13,0x7F,0x3B,0xFF,0x7B,0xFB,0x71,0x7B,0x31,0x31,0x00,0x00,0x00,0x00,0x00,
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xC9,0xFF,0xFF,0x3E,0x3E,0x00,
0xFE,0xE4,0xFF,0xEE,0xFF,0xEF,0xEF,0xC7,0xEF,0xC6,0xC6,0x80,0x80,0x00,0x00,0x00,
0x03,0x01,0x03,0x01,0x01,0x00,0x01,0x00,0x01,0x00,0x03,0x01,0x1F,0x03,0x3F,0x1B,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xE3,0x00,0xF7,0xE3,
0xFF,0xF7,0xFF,0xF7,0xF7,0xE3,0xFF,0x80,0xFF,0x7F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0xC0,0x80,
0xE0,0xC0,0xE0,0xC0,0xC0,0x80,0xC0,0x80,0xC0,0x00,0xE0,0xC0,0xFC,0xE0,0xFF,0xEC,
0xFF,0x7B,0xFF,0x73,0xFF,0x73,0xF3,0x61,0x63,0x01,0x01,0x00,0x00,0x00,0x00,0x00,
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x3E,0x3E,0x00,
0xFF,0xEF,0xFF,0xE7,0xFF,0xE7,0xE7,0xC3,0xE3,0xC0,0xC0,0x80,0x80,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x00,0x00,
0x01,0x00,0x00,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x77,0x03,0xFF,0x73,0xFF,0x7B,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xF7,0x00,0xFF,0xF7,0xFF,0xF7,0xF7,0xE3,
0xF7,0xE3,0xFF,0x00,0xFF,0x7F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00,0xE0,0xC0,0xE0,0xC0,0xC0,0x80,
0xC0,0x80,0x80,0x00,0xC0,0x00,0xE0,0xC0,0xE0,0xC0,0xF7,0xE0,0xFF,0xE7,0xFF,0xEF,
0xFF,0x7B,0xFF,0x79,0xFB,0x61,0x61,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x7F,0x7F,0x1C,0x1C,0x00,
0xFF,0xEF,0xFF,0xCF,0xEF,0xC3,0xC3,0x80,0xC0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,
0x03,0x01,0x03,0x01,0x01,0x00,0x01,0x00,0x01,0x00,0x03,0x01,0x07,0x03,0x67,0x03,
0xFF,0xF7,0xFF,0xF7,0xF7,0xE3,0xFF,0xE3,0xFF,0x1C,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
0xE0,0xC0,0xE0,0xC0,0xC0,0x80,0xC0,0x80,0xC0,0x00,0xE0,0xC0,0xF0,0xE0,0xF3,0xE0,
0xFF,0x63,0xFF,0x7B,0xFF,0x7B,0x7F,0x39,0x3B,0x01,0x01,0x00,0x00,0x00,0x00,0x00,
0xFF,0xE3,0xFF,0xEF,0xFF,0xEF,0xFF,0xCE,0xEE,0xC0,0xC0,0x80,0x80,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x01,0x03,0x01,0x01,0x00,0x63,0x00,
0x00,0x00,0x00,0x00,0xE3,0x00,0xF7,0xE3,0xFF,0xF7,0xFF,0xF7,0xFF,0xEB,0xFF,0xEB,
0x00,0x00,0x00,0x00,0x80,0x00,0xC0,0x80,0xE0,0xC0,0xE0,0xC0,0xC0,0x80,0xE3,0x80,
0xF7,0x63,0xFF,0x73,0xFF,0x7B,0x7F,0x39,0x3B,0x01,0x01,0x00,0x00,0x00,0x00,0x00,
0xFF,0x6B,0xFF,0x9C,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x3E,0x3E,0x00,
0xF7,0x63,0xFF,0xE7,0xFF,0xEF,0xFF,0xCE,0xEE,0xC0,0xC0,0x80,0x80,0x00,0x00,0x00,
0x00,0x00,0x01,0x00,0x03,0x01,0x63,0x01,0xF7,0x63,0xFF,0x73,0xFF,0x7B,0x7F,0x3B,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x3E,0x00,
0xFF,0x3E,0xC9,0xFF,0x88,0xFF,0xAA,0xFF,0xFF,0xFF,0xBE,0xFF,0xC1,0xFF,0xF7,0xFF,
0x80,0x00,0xC0,0x80,0xE0,0xC0,0xE3,0xC0,0xF7,0xE3,0xFF,0xE7,0xFF,0xEF,0xFF,0xEE,
0x3F,0x03,0x03,0x01,0x01,0x00,0x03,0x01,0x03,0x01,0x01,0x00,0x00,0x00,0x00,0x00,
0xFE,0xE0,0xE0,0x40,0xC0,0x80,0xE0,0xC0,0xE0,0xC0,0xC0,0x80,0x80,0x00,0x00,0x00,
};

const unsigned char const enemies_tiles[] = {
0xFF,0x38,0xD7,0x7C,0xAB,0xFE,0xD3,0xFE,0x83,0xFE,0xC6,0x7C,0x7C,0x38,0x38,0x00
};