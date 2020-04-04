#pragma bank 5
#include <gb/gb.h>
#include "gfx/gfx_types.h"

const rle_data_t const room_3_1_map = {150, {
0xFC,0x00,0x01,0xC2,0x02,0x03,0xDA,0x00,0x04,0xC2,0x05,0x06,0xDA,0x00,0xC4,0x07,
0xEF,0x00,0x08,0x09,0x0A,0x0B,0x0C,0x0D,0xD8,0x00,0x0E,0x0F,0x10,0x11,0x12,0x13,
0xFF,0x00,0xC7,0x00,0x14,0x15,0x16,0xD6,0x00,0x17,0x18,0xC2,0x19,0x1A,0x1B,0x1C,
0x1D,0x1E,0xD4,0x00,0x1F,0x20,0x21,0xC2,0x22,0x23,0x24,0x25,0x26,0x27,0xD4,0x00,
0x28,0x29,0x2A,0x22,0x2B,0x23,0x2C,0x2D,0x2E,0xD4,0x00,0x2F,0x30,0x31,0x32,0x33,
0x34,0x35,0x36,0x37,0x38,0x30,0x39,0x3A,0xD1,0x00,0x3B,0x3C,0x3D,0x3E,0x3B,0x3C,
0x3D,0x3E,0x3B,0x3C,0x3D,0x3F,0x40,0xD1,0x00,0x3B,0x3C,0x3D,0x3E,0x3B,0x3C,0x3D,
0x3E,0x3B,0x3C,0x3D,0x3E,0x41,0x42,0x43,0x42,0x44,0x45,0x43,0x42,0x44,0x45,0x43,
0x42,0x44,0x45,0x43,0x42,0x44,0x45,0x46,0x47,0x48,0x49,0x48,0x49,0x48,0x47,0x4A,
0x46,0x4B,0x4A,0x46,0xD1,0x00
}};
const rle_data_t const room_3_1_coll = {33, {
0xFF,0x00,0xF9,0x00,0xC4,0x01,0xEF,0x00,0xC6,0x05,0xD8,0x00,0xC6,0x05,0xFF,0x00,
0xFF,0x00,0xFF,0x00,0xD8,0x00,0xCC,0x01,0x02,0xD1,0x00,0xCD,0x01,0xD1,0x07,0xDE,
0x01
}};
const tile_data_t const room_3_1_tiles = {76, {
0x00,
0x01,0xFF,0x55,0xAA,0x00,0x20,0x29,0x32,0x29,
0x01,0xFF,0x55,0xAA,0x40,0x00,0x83,0xC6,0x65,
0x01,0xFF,0xAA,0x55,0x00,0x04,0x94,0x4C,0x94,
0x01,0x38,0x28,0x30,0x28,0x31,0x2B,0x32,0x29,
0x01,0xB2,0x58,0x2C,0x96,0x8B,0x45,0x82,0x01,
0x01,0x1C,0x14,0x0C,0x14,0x8C,0xD4,0x4C,0x94,
0x01,0x38,0x54,0xAA,0xD2,0x82,0x44,0x38,0x00,
0x01,0x00,0x00,0x00,0x00,0x00,0x03,0x07,0x1F,
0x01,0x00,0x1D,0x3F,0x3F,0x17,0x2F,0xDB,0xB5,
0x01,0x18,0x7C,0xFE,0xFE,0x7C,0xFB,0xF5,0xEF,
0x01,0x06,0x6F,0xFD,0xFE,0xBF,0x5F,0xFF,0xFE,
0x01,0x00,0xB8,0xFC,0xFC,0xE8,0xF4,0xDB,0xAD,
0x01,0x00,0x00,0x00,0x00,0x00,0xC0,0xE0,0xF8,
0x01,0x1F,0x1F,0x6B,0xF5,0xEF,0x7D,0xAA,0x40,
0x01,0xFF,0xFF,0xF7,0xFF,0x6E,0xB5,0x4A,0xA1,
0x01,0xF5,0xFF,0xEF,0x55,0xAA,0x57,0xAB,0x05,
0x01,0xFD,0xFF,0x6D,0xFB,0xAE,0x55,0xAA,0x41,
0x01,0xFB,0xB7,0xFA,0xD5,0xEB,0x55,0xAE,0x44,
0x01,0xF8,0xF8,0xD6,0xAF,0xF7,0xBE,0x55,0x02,
0x02,0x00,0x00,0x00,0x00,0x02,0x04,0x12,0x09,
0x02,0x00,0x00,0x00,0x00,0x24,0x4B,0xDB,0x9B,
0x02,0x00,0x00,0x00,0x00,0x00,0x30,0xB8,0x72,
0x02,0x00,0x00,0x40,0x41,0x41,0xE3,0x00,0x40,
0x02,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0x80,
0x02,0x00,0x00,0x40,0x40,0x40,0xE0,0x00,0x40,
0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,
0x02,0x0D,0x26,0x17,0x26,0x08,0x52,0x2B,0x19,
0x02,0x5D,0x38,0x27,0xCE,0x14,0xBB,0xCB,0x87,
0x02,0x96,0x6E,0x6C,0x40,0xD6,0x34,0x31,0xBB,
0x02,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0x00,
0x02,0x00,0x00,0x07,0x0A,0x00,0x00,0x00,0x00,
0x02,0xC1,0x40,0xFF,0xAA,0x00,0x40,0xC0,0x40,
0x02,0x80,0x80,0xF3,0xAA,0x00,0x40,0xC0,0x40,
0x02,0xC0,0x40,0xFF,0xAA,0x00,0x40,0xC0,0x40,
0x02,0xC0,0x40,0xF0,0xA0,0x00,0x40,0xC0,0x40,
0x02,0x44,0x31,0x02,0x1A,0x53,0x24,0x15,0x01,
0x02,0x31,0x68,0xDB,0x33,0x09,0x59,0xCC,0x63,
0x02,0x90,0x0E,0x9C,0xC9,0x83,0x71,0xA6,0xA8,
0x02,0x00,0x00,0x80,0x00,0x00,0x80,0x80,0x00,
0x02,0x00,0x00,0x0F,0x0A,0x00,0x00,0x00,0x00,
0x02,0xC0,0x40,0xFD,0xAC,0x00,0x40,0xC0,0x40,
0x02,0xC0,0x40,0xFF,0xAA,0x00,0x20,0x20,0x20,
0x02,0xC0,0x40,0xF7,0xA2,0x00,0x40,0xC0,0x40,
0x02,0x1A,0x03,0x05,0x00,0x00,0x00,0x00,0x00,
0x02,0x2D,0x46,0x28,0x54,0x1E,0x3E,0x7C,0xBE,
0x02,0x5C,0xAE,0x84,0x20,0x00,0x00,0x00,0x00,
0x02,0x40,0x40,0x50,0x4A,0x24,0xA6,0xA9,0x56,
0x02,0x08,0x4A,0x52,0x53,0xA2,0xAA,0xD3,0xAE,
0x02,0xC8,0x44,0x22,0xAA,0x49,0x49,0xBA,0xB7,
0x02,0x60,0x60,0x50,0x4A,0x24,0xA6,0xA9,0x56,
0x02,0xC8,0x4A,0x52,0x53,0xA2,0xAA,0xD3,0xAE,
0x02,0xC9,0x4A,0x2A,0x2C,0xF0,0x8D,0x5A,0xB5,
0x02,0xC0,0x40,0x50,0x4A,0x24,0xA6,0xA9,0x56,
0x02,0x09,0x4B,0x52,0x53,0xA2,0xAA,0xD3,0xAE,
0x02,0xBF,0x65,0x22,0xAA,0x49,0x49,0xBA,0xB7,
0x02,0x40,0xC0,0x50,0x4A,0x24,0xA6,0xA9,0x56,
0x02,0x09,0x0A,0x2A,0x2C,0xF0,0x8D,0x5A,0xB5,
0x02,0x00,0x00,0x18,0x20,0x20,0x40,0x40,0x90,
0x03,0x30,0x7E,0xFE,0xCF,0xA5,0x68,0xAB,0x9A,
0x03,0x70,0xFD,0xF7,0x75,0xE3,0xA0,0x15,0x76,
0x03,0x38,0xDF,0xDF,0x7B,0x52,0x8C,0xD6,0x54,
0x03,0x38,0x63,0xCB,0xAF,0xE7,0x81,0x2A,0xEC,
0x03,0x38,0x63,0xCB,0xAF,0xE7,0x81,0x2B,0xED,
0x02,0xA0,0xA4,0x48,0x28,0x93,0xEA,0xED,0xD6,
0x03,0xF0,0xFE,0xFE,0xCF,0xA5,0x68,0xAB,0x9A,
0x02,0x03,0x1C,0xE9,0x40,0x10,0x00,0x00,0x00,
0x02,0xC0,0x38,0x27,0x41,0x04,0x00,0x00,0x00,
0x02,0xC0,0x38,0x47,0x12,0x04,0x00,0x00,0x00,
0x02,0x03,0x1C,0xE5,0x12,0x40,0x00,0x00,0x00,
0x03,0xDE,0xFA,0xDF,0xBB,0xBB,0x29,0x11,0x00,
0x03,0xEA,0xB7,0x14,0x1C,0x0C,0x0C,0x08,0x08,
0x03,0x00,0xFD,0x27,0x02,0x02,0x02,0x00,0x00,
0x03,0x00,0xEE,0x11,0x00,0x00,0x00,0x00,0x00,
0x03,0x7C,0xFB,0xFF,0xFF,0xDD,0x69,0x28,0x00,
0x03,0x36,0xF9,0xD5,0xBA,0xD4,0x4C,0x08,0x00,
}};
const tile_data_t const enemies_34_1_tiles = {1, {
0xFF,0x38,0xD7,0x7C,0xAB,0xFE,0xD3,0xFE,0x83,0xFE,0xC6,0x7C,0x7C,0x38,0x38,0x00
}};

const rle_data_t const room_4_1_map = {188, {
0xE4,0x00,0x01,0x02,0x03,0x04,0xD8,0x00,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,
0xD6,0x00,0x0D,0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0xFF,0x00,0xFF,0x00,0xE2,0x00,
0x15,0x16,0x17,0x18,0xDA,0x00,0x19,0x1A,0x1B,0x1C,0xDA,0x00,0x1D,0x1E,0x1F,0x20,
0x21,0xCC,0x00,0x22,0x23,0x24,0x25,0x26,0xC2,0x00,0x27,0x28,0xC4,0x00,0x29,0x2A,
0x2B,0x2C,0x2D,0xCC,0x00,0x2E,0x2F,0x30,0x31,0x32,0xC2,0x00,0x33,0x34,0xC3,0x00,
0x35,0x36,0x37,0x38,0x39,0x3A,0xCB,0x00,0x3B,0x3C,0x3D,0x3E,0x3F,0x40,0xC2,0x00,
0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4A,0x4B,0x43,0x44,0x4C,0xC8,0x00,
0x4D,0x4E,0x4F,0x50,0x51,0x52,0x4F,0x50,0x51,0x52,0x4F,0x50,0x51,0x52,0x4F,0x50,
0x51,0x52,0x4F,0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x53,0x54,0x55,0x56,0x57,0x58,
0x51,0x52,0x4F,0x50,0x51,0x52,0x4F,0x50,0x51,0x52,0x4F,0x50,0x51,0x52,0x4F,0x50,
0x51,0x52,0x4F,0x50,0xC8,0x00,0x4F,0x50,0x51,0x52,0x4F,0x50,0x51,0x52,0x4F,0x50,
0x51,0x52,0x4F,0x50,0x51,0x52,0x4F,0x50,0x51,0x52,0x4F,0x50}};
const rle_data_t const room_4_1_coll = {49, {
0xE4,0x00,0xC4,0x05,0xD8,0x00,0xC8,0x05,0xD6,0x00,0xC8,0x05,0xFF,0x00,0xFF,0x00,
0xE2,0x00,0xC4,0x04,0xDA,0x00,0xC4,0x04,0xDA,0x00,0xC4,0x04,0xDA,0x00,0xC4,0x04,
0xDA,0x00,0xC4,0x04,0xDA,0x00,0xC4,0x04,0xCC,0x00,0x02,0xD5,0x01,0xC8,0x07,0xF4,
0x01
}};
const tile_data_t const room_4_1_tiles = {89, {
0x00,
0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x72,
0x01,0x00,0x00,0x00,0x00,0x00,0xC0,0x70,0xB8,
0x01,0x00,0x00,0x00,0x00,0x00,0x03,0x0F,0x07,
0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,
0x01,0x00,0x00,0x00,0x00,0x00,0x03,0x07,0x1F,
0x01,0x00,0x1D,0x3F,0x3F,0x17,0x2F,0xDB,0xB5,
0x01,0xFB,0x5F,0xAF,0xF5,0xFB,0xF7,0xFF,0xFF,
0x01,0x78,0xD4,0xAE,0xFD,0xFB,0xDF,0xB7,0xEB,
0x01,0x2E,0x7D,0x7F,0xBD,0x7E,0xFF,0xEF,0xD5,
0x01,0x80,0x60,0xF1,0xF3,0xCF,0xF7,0xFB,0xF5,
0x01,0x00,0xB8,0xFC,0xFC,0xE8,0xF4,0xDB,0xAD,
0x01,0x00,0x00,0x00,0x00,0x00,0xC0,0xE0,0xF8,
0x01,0x1F,0x1F,0x6B,0xF5,0xEF,0x7D,0xAA,0x40,
0x01,0xFF,0xFF,0xF7,0xFF,0x6E,0xB5,0x4A,0xA1,
0x01,0xBF,0xED,0x5F,0xAB,0xD7,0xAA,0x75,0x22,
0x01,0xF7,0xFD,0xB6,0xDF,0x75,0xAA,0x55,0x82,
0x01,0xAB,0xDF,0xF7,0xAA,0x55,0xEA,0xD5,0xA0,
0x01,0x6E,0xFB,0x77,0xAE,0x55,0xEA,0x55,0x0A,
0x01,0xFF,0xFF,0xEF,0xFF,0x76,0xAD,0x52,0x85,
0x01,0xF8,0xF8,0xD6,0xAF,0xF7,0xBE,0x55,0x02,
0x02,0x00,0x00,0x00,0x00,0x06,0x0B,0x03,0x05,
0x02,0x00,0x06,0x01,0x07,0x48,0x1F,0x4E,0x24,
0x02,0x00,0x00,0xF6,0xFA,0xDC,0x07,0x19,0x36,
0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x85,
0x02,0x01,0x00,0x01,0x02,0x01,0x06,0x09,0x01,
0x02,0xB1,0x2A,0x51,0x6E,0x89,0x71,0xBF,0x9E,
0x02,0xCF,0xD7,0xAE,0x5E,0xBF,0x38,0xD9,0xF2,
0x02,0xC5,0xAC,0x68,0xE2,0xD6,0xF8,0x5C,0xEC,
0x02,0x04,0x12,0x19,0x1C,0x20,0x3F,0x1F,0x0E,
0x02,0x01,0xA6,0x06,0x78,0x0D,0xF1,0xFE,0xAF,
0x02,0xB1,0xDA,0xED,0x64,0x73,0x75,0x73,0xF0,
0x02,0x70,0xB0,0x70,0xF5,0xF0,0xE5,0x00,0x55,
0x02,0x00,0x00,0x00,0x00,0xC0,0x20,0x20,0x10,
0x02,0x00,0x00,0x01,0x01,0x01,0x09,0x09,0x09,
0x02,0x00,0x08,0x08,0x04,0x04,0x04,0x84,0x84,
0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,
0x02,0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x80,
0x02,0x00,0x00,0x00,0x00,0x14,0x16,0x32,0x32,
0x02,0x00,0x10,0x10,0x20,0x20,0x20,0x21,0x21,
0x02,0x00,0x00,0x80,0x80,0x80,0x90,0x90,0x90,
0x02,0x03,0x10,0x17,0x2C,0x2E,0x2F,0x2E,0x5F,
0x02,0x47,0xA0,0x00,0x41,0xAA,0x57,0x3E,0xC6,
0x02,0xE0,0x04,0x0A,0x15,0xA3,0x57,0x8D,0x5E,
0x02,0x80,0x95,0x80,0x1B,0x09,0x00,0x3F,0x3D,
0x02,0x58,0x08,0x48,0x64,0x02,0x56,0xA6,0x58,
0x02,0x18,0x18,0x18,0x98,0x91,0x91,0x91,0x91,
0x02,0x84,0x84,0x84,0xA8,0xA8,0xA8,0x18,0x18,
0x02,0x60,0x21,0x21,0x21,0x21,0x21,0x45,0x45,
0x02,0x90,0x90,0x90,0x18,0x18,0x18,0x19,0x89,
0x02,0x32,0x32,0x32,0x34,0x24,0x34,0x14,0x14,
0x02,0x21,0x21,0x21,0x15,0x15,0x15,0x18,0x18,
0x02,0x18,0x18,0x18,0x19,0x89,0x89,0x89,0x89,
0x02,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,
0x02,0x5F,0x4F,0x97,0x2A,0x31,0x1C,0x06,0x00,
0x02,0xAA,0xC7,0xC7,0xFF,0x55,0x02,0xA0,0x0F,
0x02,0xFF,0xFA,0xFF,0xEA,0x55,0xA0,0x05,0xE0,
0x02,0x00,0x81,0x47,0xA7,0x47,0x13,0x47,0x0F,
0x02,0x04,0x54,0xA4,0xC8,0xA8,0xC8,0xE8,0xC8,
0x02,0x00,0x00,0x18,0x04,0x04,0x02,0x02,0x09,
0x02,0x09,0x0D,0x0D,0x4D,0x4D,0x4D,0x79,0xD9,
0x02,0x59,0x59,0x59,0x59,0x55,0x55,0x65,0x65,
0x02,0x45,0x48,0x48,0x4A,0x4A,0x4A,0x4A,0x4A,
0x02,0x89,0x89,0x89,0x90,0xB0,0xB0,0xB2,0xB2,
0x02,0x14,0x14,0x94,0x94,0x94,0x92,0x92,0x52,
0x02,0x9A,0x9A,0x9A,0x9A,0xAA,0xAA,0xA6,0xA6,
0x02,0x90,0xB0,0xB0,0xB2,0xB2,0xB2,0x9E,0x9B,
0x02,0x40,0x40,0x50,0x4A,0x24,0xA6,0xA9,0x56,
0x02,0x08,0x4A,0x52,0x53,0xA2,0xAA,0xD3,0xAE,
0x02,0x08,0x04,0x22,0xAA,0x49,0x49,0xBA,0xB7,
0x02,0x40,0x40,0x40,0x5C,0x21,0x8B,0xAD,0x52,
0x02,0x87,0x7D,0x00,0x04,0x7E,0x7E,0xBC,0x00,
0x02,0xBC,0x3F,0x7D,0x6F,0x15,0xAA,0x05,0x00,
0x02,0xFF,0xBF,0xF9,0xBF,0x17,0xAA,0x55,0x00,
0x02,0x03,0xF5,0xFD,0xE9,0x53,0xA7,0x0F,0x00,
0x02,0xE4,0xF0,0xEA,0xD8,0xDA,0xB5,0x0A,0xB7,
0x02,0x09,0x0A,0x2A,0x2C,0xF0,0x8D,0x5A,0xB5,
0x02,0x05,0x25,0x12,0x14,0xC9,0x54,0xB7,0x6B,
0x03,0x00,0x28,0x69,0xDD,0xFF,0xFF,0xFB,0x7C,
0x03,0x30,0x7E,0xFE,0xCF,0xA5,0x68,0xAB,0x9A,
0x03,0x70,0xFD,0xF7,0x75,0xE3,0xA0,0x15,0x76,
0x03,0x38,0xDF,0xDF,0x7B,0x52,0x8C,0xD6,0x54,
0x03,0x38,0x63,0xCB,0xAF,0xE7,0x81,0x2A,0xEC,
0x02,0x03,0x1C,0xE5,0x12,0x40,0x00,0x00,0x00,
0x02,0xC0,0x38,0x27,0x41,0x04,0x00,0x00,0x00,
0x02,0x03,0x1C,0xE9,0x40,0x10,0x00,0x00,0x00,
0x02,0xC0,0x38,0x47,0x12,0x04,0x00,0x00,0x00,
0x03,0x33,0x7F,0xFF,0xCF,0xA5,0x68,0xAB,0x9A,
0x03,0xF0,0xFD,0xF7,0xF5,0xE3,0xA0,0x15,0x76
}};

const rle_data_t const room_5_1_map = {366, {
0xC8,0x00,0x01,0x02,0x03,0x04,0x05,0x06,0xC6,0x00,0xC2,0x07,0xC6,0x00,0x08,0x09,
0xC7,0x00,0x0A,0x01,0x0B,0x0C,0x0D,0x0E,0x0F,0x10,0xCA,0x00,0x11,0x12,0x13,0x14,
0x15,0xC6,0x00,0x16,0x17,0x00,0x18,0x19,0x1A,0x1B,0x1C,0xCB,0x00,0x1D,0x00,0x1D,
0x1E,0x1F,0xC5,0x00,0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2A,0xC9,
0x00,0xC3,0x07,0x2B,0x1A,0xC4,0x00,0x2C,0x29,0x2D,0x2E,0x2F,0x30,0x03,0x04,0x05,
0x31,0x29,0x32,0xC5,0x00,0x33,0xC6,0x00,0x08,0x09,0xC5,0x00,0x34,0x35,0xC2,0x00,
0x36,0x0C,0x0D,0x0E,0x37,0x38,0xC6,0x00,0x39,0xC4,0x00,0x3A,0x3B,0x08,0x15,0xC7,
0x00,0x3C,0x29,0x3D,0x19,0x1A,0x1B,0x3E,0x32,0xC6,0x00,0x3F,0xC4,0x00,0x40,0x41,
0x08,0x1F,0xC7,0x00,0x42,0x29,0x43,0x25,0x26,0x27,0x44,0xC5,0x00,0x45,0x46,0x47,
0x46,0x47,0x46,0x47,0x46,0x47,0x48,0x1A,0xC8,0x00,0x01,0x02,0x03,0x04,0x05,0x06,
0x49,0x4A,0x4B,0xC2,0x00,0x4C,0x4D,0x4E,0x4D,0x4E,0x4D,0x4E,0x4D,0x4E,0x48,0x09,
0xC8,0x00,0x01,0x0B,0x0C,0x0D,0x0E,0x4F,0x50,0xC4,0x00,0x51,0x4E,0x4D,0x4E,0x4D,
0x4E,0x4D,0x4E,0x4D,0x48,0x15,0xC9,0x00,0x18,0x19,0x1A,0x1B,0x52,0xC5,0x00,0x53,
0x54,0x55,0x54,0x55,0x54,0x55,0x54,0x55,0x56,0x1F,0xC9,0x00,0x24,0x25,0x26,0x27,
0x06,0xC6,0x00,0x57,0x58,0x59,0x5A,0x57,0x5A,0x57,0x5B,0x5C,0x1A,0xC5,0x00,0x5D,
0x5E,0x5F,0x00,0x24,0x03,0x04,0x05,0x06,0xC6,0x00,0x60,0x61,0x62,0x63,0x64,0x65,
0x60,0x66,0x67,0x09,0x40,0x41,0x68,0x69,0x6A,0x6B,0x6C,0x6D,0x00,0x24,0x0C,0x0D,
0x0E,0x06,0xC6,0x00,0x6E,0x6F,0xC2,0x6E,0x70,0x71,0x6E,0x6F,0x72,0x15,0x73,0x74,
0x75,0xC2,0x76,0x74,0x75,0x77,0x78,0x24,0x19,0x1A,0x1B,0x06,0x3A,0x3B,0xC3,0x00,
0x79,0x57,0x5A,0xC2,0x6E,0x70,0x7A,0x57,0x5A,0x7B,0x1F,0xC8,0x74,0x7C,0x7D,0x25,
0x26,0x27,0x06,0x40,0x41,0x68,0x69,0x6A,0x7E,0xC2,0x6E,0x5A,0x6E,0x70,0x71,0xC2,
0x6E,0x7B,0x1A,0xC2,0x75,0xC3,0x74,0x75,0xC3,0x74,0x75,0xC3,0x74,0x75,0x74,0x75,
0x74,0x75,0xC2,0x74,0xC2,0x75,0x74,0x75,0x74,0x75,0x74,0xC2,0x75,0x74
}};
const rle_data_t const room_5_1_coll = {68, {
0xDC,0x00,0xC2,0x01,0xDC,0x00,0xC2,0x01,0xDC,0x00,0xC2,0x01,0xD9,0x00,0x02,0xC4,
0x01,0xDC,0x00,0xC2,0x01,0xDC,0x00,0xC2,0x01,0xDC,0x00,0xC2,0x01,0xD3,0x00,0x02,
0xCA,0x01,0xDC,0x00,0xC2,0x01,0xDC,0x00,0xC2,0x01,0xDC,0x00,0xC2,0x01,0xDC,0x00,
0xC2,0x01,0xDC,0x00,0xC2,0x01,0xDC,0x00,0xC9,0x01,0x02,0xD4,0x00,0xCA,0x01,0x02,
0xD3,0x00,0xE0,0x01
}};
const tile_data_t const room_5_1_tiles = {127, {
0x00,
0x02,0x31,0x54,0x66,0x0B,0x01,0x14,0x06,0x0B,
0x04,0x08,0x88,0x01,0xC1,0x08,0x68,0x01,0x01,0x08,0x48,0x01,0xA1,0x08,0x48,0x01,0x61,
0x03,0x3A,0x46,0x2A,0x16,0x22,0x17,0x32,0x57,
0x03,0xFA,0x5F,0xFA,0x5F,0xFA,0x4F,0xEA,0x4F,
0x03,0x66,0x54,0x6A,0x54,0x66,0x54,0xE6,0x54,
0x03,0x80,0x10,0x80,0x10,0x80,0x10,0x80,0x10,
0x01,0x38,0x54,0xAA,0xD2,0x82,0x44,0x38,0x00,
0x03,0x0A,0x01,0x0A,0x03,0x0A,0x02,0x0A,0x02,
0x03,0xFA,0x5F,0xFA,0x5B,0xFA,0x5F,0xEA,0x4F,
0x03,0x00,0x00,0x00,0x00,0x00,0x20,0x40,0x40,
0x04,0x08,0xA8,0x01,0xC1,0x08,0x08,0x01,0x41,0x08,0x88,0x01,0x41,0x08,0x68,0x01,0x21,
0x03,0x3A,0x47,0x2A,0x27,0x2A,0x27,0x32,0x57,
0x03,0xEA,0x4F,0xFA,0x5F,0xFA,0x4F,0xEA,0x4F,
0x03,0xEA,0x54,0x62,0x54,0xEE,0x54,0xEA,0x54,
0x03,0x80,0x10,0x80,0x10,0x80,0x10,0x81,0x13,
0x03,0x00,0x10,0xA0,0x40,0x40,0x98,0x70,0x80,
0x01,0x00,0x30,0x28,0x30,0x2A,0x33,0x28,0x30,
0x01,0x00,0x00,0x00,0x00,0x00,0x01,0xDB,0x6C,
0x01,0x00,0x30,0x28,0x30,0xAA,0xB3,0x28,0x30,
0x04,0x0A,0x0A,0x01,0x01,0x0A,0x0A,0x01,0x01,0x0A,0x0A,0x02,0x02,0xCA,0x0A,0x61,0x01,
0x03,0xEA,0x4F,0xFA,0x5F,0xFA,0x5B,0xFA,0x5B,
0x03,0x06,0x03,0x01,0x00,0x00,0x00,0x00,0x00,
0x03,0x80,0x80,0x80,0xC0,0x60,0x70,0x38,0x2C,
0x04,0x08,0x08,0x01,0x41,0x08,0x88,0x01,0xE1,0x08,0x08,0x01,0x21,0x08,0x08,0x01,0x01,
0x03,0x22,0x17,0x2A,0x17,0x2A,0x57,0x22,0x57,
0x03,0xFA,0x5F,0xEA,0x4F,0xEA,0x4F,0xEA,0x5F,
0x03,0x66,0x54,0x66,0x54,0xEA,0x54,0xE6,0x54,
0x04,0x85,0x85,0x12,0x12,0x84,0x84,0x10,0x10,0x80,0x80,0x10,0x10,0x80,0x80,0x10,0x11,
0x01,0x28,0x30,0x28,0x30,0x28,0x30,0x28,0x00,
0x03,0x0A,0x01,0x0A,0x02,0x0A,0x02,0x0A,0x00,
0x03,0xFA,0x4F,0xEA,0x5F,0xFA,0x5F,0xFA,0x53,
0x02,0x00,0x00,0x00,0x00,0x10,0x9B,0x2D,0xD0,
0x02,0x01,0x02,0x00,0x00,0x00,0x00,0x80,0x40,
0x03,0xE6,0x1B,0x0D,0x06,0x04,0x03,0x21,0x10,
0x03,0x10,0x30,0xB0,0xF0,0x70,0x2C,0x16,0x8F,
0x03,0x08,0x01,0x08,0x01,0x08,0x01,0x08,0x01,
0x03,0x22,0x57,0x32,0x56,0x32,0x57,0x32,0x16,
0x03,0xFA,0x5F,0xFA,0x5F,0xEA,0x4F,0xEA,0x5F,
0x03,0x62,0x5C,0xEA,0x54,0xE2,0x54,0x66,0x54,
0x04,0x80,0x83,0x10,0x14,0x80,0x84,0x10,0x11,0x80,0x84,0x10,0x16,0x80,0x84,0x10,0x11,
0x02,0x2B,0x1C,0xC2,0x31,0x4A,0x2D,0xD0,0x9A,
0x02,0x00,0x00,0x40,0xA0,0x80,0x20,0x60,0xD0,
0x04,0x2A,0x0A,0x41,0x01,0xAA,0x0A,0xC1,0x01,0x8A,0x0A,0x41,0x01,0x2A,0x0A,0x01,0x01,
0x02,0x07,0x04,0x02,0x0D,0x08,0x03,0x04,0x02,
0x04,0x00,0x00,0x00,0xA0,0x00,0x00,0x03,0xB3,0x00,0x60,0x00,0xB0,0x00,0x40,0x00,0x00,
0x03,0x09,0x1F,0x60,0x80,0x00,0x00,0x00,0x00,
0x03,0x43,0xA1,0x70,0x0C,0x02,0x01,0x00,0x00,
0x03,0x88,0x61,0xA8,0x41,0x28,0x01,0x88,0x61,
0x04,0x80,0x81,0x10,0x14,0x80,0x81,0x10,0x16,0x80,0x80,0x10,0x10,0x80,0x85,0x10,0x14,
0x02,0xA0,0x00,0xA0,0xC0,0x40,0x30,0xA0,0x00,
0x01,0x00,0x00,0x00,0x3C,0x7E,0x7E,0x3C,0x00,
0x02,0x37,0x00,0xCD,0x91,0x00,0x00,0x00,0x00,
0x02,0x40,0xE0,0x00,0x00,0x00,0x00,0x00,0x00,
0x04,0x28,0x28,0x01,0x01,0x08,0x08,0x01,0x01,0x08,0x08,0x01,0x01,0x08,0x08,0x01,0x81,
0x04,0x80,0x81,0x10,0x13,0x80,0x82,0x10,0x10,0x80,0x86,0x10,0x15,0x80,0x80,0x10,0x13,
0x02,0x20,0x5C,0x30,0x00,0x00,0x00,0x00,0x40,
0x01,0x10,0x18,0x18,0x18,0x18,0x18,0x18,0x18,
0x02,0x00,0x00,0x18,0x04,0x04,0x02,0x02,0x09,
0x02,0x08,0x14,0x20,0x20,0x40,0x40,0x40,0x40,
0x02,0x00,0x00,0x02,0x05,0x01,0x04,0x06,0x0B,
0x04,0x08,0xC8,0x01,0x21,0x08,0x28,0x01,0x81,0x08,0x28,0x01,0x61,0x08,0x28,0x01,0x81,
0x04,0x80,0x84,0x10,0x10,0x80,0x85,0x10,0x16,0x80,0x82,0x10,0x14,0x80,0x83,0x10,0x15,
0x01,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x00,
0x02,0x05,0x25,0x12,0x14,0xC9,0x54,0xB6,0x6B,
0x02,0x40,0xA2,0xA4,0x98,0x14,0xB5,0xEE,0xB5,
0x02,0x01,0x04,0x06,0x0B,0x0C,0x01,0x01,0x02,
0x04,0x08,0x88,0x01,0x21,0x08,0x88,0x01,0x61,0x08,0x08,0x01,0x01,0x08,0xA8,0x01,0x21,
0x04,0x80,0x80,0x10,0x16,0x80,0x85,0x10,0x12,0x80,0x84,0x10,0x14,0x80,0x80,0x10,0x10,
0x01,0x01,0x03,0x02,0x05,0x05,0x0A,0x0B,0x1A,
0x01,0x3B,0x56,0xD4,0xF5,0xB5,0xB5,0xD6,0xDE,
0x01,0x77,0x8B,0xB7,0xAA,0xAA,0xAA,0xEE,0xDD,
0x04,0x4A,0x0A,0x41,0x01,0xCA,0x0A,0xE3,0x03,0xEA,0x0A,0x62,0x02,0x6A,0x0A,0x42,0x02,
0x03,0x00,0x00,0x00,0x00,0x00,0x41,0x23,0x2E,
0x03,0x00,0x01,0x07,0x1A,0x74,0xA0,0x40,0xB8,
0x03,0x70,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,
0x01,0x12,0x1A,0x35,0x35,0x25,0x2D,0x25,0x55,
0x01,0xAA,0xBA,0xAA,0xAB,0xAA,0xA2,0xA2,0x22,
0x01,0x55,0x55,0x55,0x6A,0x6A,0x6A,0x22,0x20,
0x03,0x80,0x10,0x80,0x11,0x87,0x12,0x85,0x12,
0x03,0x35,0x68,0xD0,0xA0,0x40,0x80,0x00,0x00,
0x01,0x55,0x6D,0x6D,0x25,0xAD,0xED,0xAB,0xAB,
0x03,0x84,0x10,0x80,0x10,0x80,0x10,0x80,0x10,
0x01,0xFF,0xAF,0xDA,0xAE,0x0A,0x10,0x00,0x00,
0x04,0xFF,0x00,0xBF,0x00,0xEA,0x00,0xA7,0x00,0x7A,0x68,0x55,0x55,0x72,0x72,0x55,0x55,
0x04,0xFF,0x00,0xEB,0x00,0xBA,0x00,0x28,0x00,0x47,0x46,0x55,0x55,0x70,0x70,0x55,0x55,
0x04,0xEA,0x0A,0xE1,0x01,0xAA,0x0A,0x02,0x02,0x6A,0x6A,0x42,0x42,0x6A,0x6A,0x40,0x40,
0x03,0x70,0x55,0x78,0x55,0x7C,0x55,0x6C,0x45,
0x01,0x00,0x7F,0x7F,0x2A,0x00,0x70,0x60,0x30,
0x01,0x00,0xEF,0xFF,0xAA,0x00,0x07,0x06,0x0F,
0x03,0x78,0x55,0x7A,0x55,0x66,0x55,0x66,0x55,
0x01,0x00,0x55,0xFF,0xFF,0x00,0x60,0xE0,0x60,
0x03,0x6A,0x41,0x6A,0x41,0x6A,0x41,0x6A,0x41,
0x03,0x00,0x03,0x0F,0x1F,0x3F,0x7F,0x7E,0x7D,
0x03,0x00,0xFE,0xA1,0xC0,0xA8,0x45,0xA8,0xD5,
0x03,0x00,0x00,0x80,0x40,0x20,0x10,0x10,0x10,
0x03,0x6E,0x41,0x6A,0x51,0x7A,0x55,0x6C,0x45,
0x01,0x60,0x70,0x60,0x00,0x7E,0x7F,0x2A,0x00,
0x01,0x06,0x07,0x06,0x00,0xFF,0xFF,0xAA,0x00,
0x03,0x66,0x55,0x46,0x55,0x3A,0x55,0x7E,0x55,
0x01,0x00,0x7E,0x7F,0x2A,0x00,0x70,0x60,0x30,
0x01,0x00,0xFF,0xFF,0xAA,0x00,0x07,0x06,0x0F,
0x01,0xF0,0x60,0xE0,0x00,0x55,0xFF,0xF7,0x00,
0x03,0x6A,0x41,0x6A,0x43,0x6A,0x42,0x6A,0x42,
0x02,0x08,0x4A,0x52,0x53,0xA2,0xAA,0xD3,0xAE,
0x02,0x09,0x0A,0x2A,0x2C,0xF0,0x8D,0x5A,0xB5,
0x02,0x08,0x49,0x50,0x50,0xA6,0xAA,0xD5,0xAB,
0x04,0x2A,0x2A,0x00,0x00,0x00,0x00,0x00,0x50,0x00,0x20,0x00,0x60,0x01,0x91,0x03,0x63,
0x03,0xAA,0x00,0xD0,0xE8,0xD0,0xE8,0xD4,0xEE,
0x03,0xA0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x03,0x6C,0x45,0x6E,0x55,0x7A,0x55,0x72,0x55,
0x03,0x7E,0x55,0x76,0x55,0x46,0x55,0x70,0x55,
0x01,0x60,0x70,0x60,0x70,0x60,0x70,0x60,0xB0,
0x01,0x06,0x07,0x06,0x07,0x06,0x03,0x06,0x07,
0x03,0x6A,0x41,0x6A,0x41,0x6A,0x42,0x6A,0x41,
0x03,0x70,0xFD,0xF7,0x75,0xE3,0xA0,0x15,0x76,
0x03,0x38,0xDF,0xDF,0x7B,0x52,0x8C,0xD6,0x54,
0x03,0xF4,0x7C,0x7D,0xEF,0x4B,0x33,0x5B,0x51,
0x03,0xC0,0xF7,0xDF,0xD5,0x8D,0x82,0x57,0xD9,
0x03,0x00,0x00,0x80,0xC0,0xC1,0xEF,0xEF,0xDE,
0x03,0x00,0x00,0x00,0x00,0x80,0xC0,0xE0,0x60,
0x02,0x00,0x00,0xC1,0x21,0x22,0x12,0x12,0x4A,
0x01,0x06,0x07,0x06,0x07,0x06,0x0F,0x06,0x07,
0x03,0x6A,0x41,0x6A,0x42,0x6A,0x42,0x6A,0x40,
0x03,0xA0,0xA0,0xA4,0x75,0xFF,0xFF,0xEE,0xF0,
0x03,0x08,0x01,0x08,0x81,0xC8,0xE1,0x68,0xA1,
0x02,0x2A,0x2D,0x95,0xA4,0x48,0xA5,0xB7,0x5D,
}};
