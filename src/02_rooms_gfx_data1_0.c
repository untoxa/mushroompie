//#pragma bank 4
#include <gb/gb.h>
#include "gfx/gfx_types.h"

const rle_data_t const room_0_1_map = {343, {
0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,0x10,
0x11,0x12,0x13,0x01,0x02,0x12,0x13,0xC4,0x00,0x0B,0x0C,0x0D,0x08,0x09,0x0A,0x14,
0x15,0x16,0x17,0x0F,0x10,0x11,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E,0x03,0x1F,0x20,
0x21,0x03,0x1F,0xC4,0x00,0x18,0x19,0x1A,0x0F,0x10,0x11,0x22,0x1D,0x1E,0x23,0x1C,
0x1D,0x1E,0x24,0x01,0x02,0x07,0x25,0x26,0x27,0x01,0x02,0x28,0x29,0x2A,0x2B,0xC5,
0x00,0x2C,0x24,0x1C,0x1D,0x2D,0x13,0x2E,0xC5,0x00,0x2F,0x30,0x31,0x2E,0x32,0x33,
0x34,0x08,0x09,0x0A,0x35,0x36,0x37,0xC5,0x00,0x38,0x39,0x20,0x21,0x03,0x1F,0x3A,
0xC5,0x00,0x3B,0x3C,0x00,0x3A,0x3D,0x3E,0x3F,0x0F,0x10,0x11,0x40,0x41,0x42,0xC5,
0x00,0x43,0x00,0x28,0x29,0x44,0xC7,0x00,0x45,0x46,0xC3,0x00,0x31,0x07,0x1C,0x1D,
0x1E,0x47,0xC9,0x00,0x07,0x44,0x48,0xC7,0x00,0x49,0x4A,0xD2,0x00,0x21,0x48,0xDC,
0x00,0x29,0xC6,0x00,0x4B,0x4C,0x4D,0xC8,0x00,0x2F,0x30,0xCA,0x00,0x2A,0x2B,0xC4,
0x00,0x4E,0x4F,0x50,0x51,0x52,0xC7,0x00,0x3B,0x3C,0xCA,0x00,0x36,0x37,0xC4,0x00,
0x53,0x54,0x55,0x56,0x57,0xC7,0x00,0x45,0x46,0xC7,0x00,0x58,0x26,0x27,0x07,0x08,
0x09,0x0A,0xCE,0x00,0x49,0x4A,0xC4,0x00,0x59,0x05,0x5A,0x32,0x33,0x34,0x0E,0x0F,
0x15,0x11,0xD3,0x00,0x5B,0x14,0x15,0x16,0x3D,0x5C,0x3F,0x1B,0x1C,0x1D,0x5D,0x13,
0xC6,0x00,0x20,0x21,0xC9,0x00,0x08,0x09,0x5E,0x5F,0x60,0x61,0x01,0x02,0x08,0x09,
0x0A,0x03,0x04,0x62,0x06,0xC3,0x00,0x63,0x64,0x29,0x01,0x02,0x17,0x65,0x66,0x67,
0xC2,0x00,0x5B,0x0F,0x10,0x11,0x12,0x13,0x59,0x05,0x5A,0x0F,0x10,0x11,0x07,0x14,
0x15,0x16,0x17,0x59,0x05,0x68,0x69,0x0C,0x0D,0x0E,0x12,0x13,0x07,0x6A,0x6B,0x01,
0x02,0x6C,0x1D,0x1E,0x03,0x1F,0x14,0x15,0x16,0x1C,0x1D,0x1E,0x00,0x22,0x1D,0x1E,
0x07,0x14,0x15,0x16,0x18,0x19,0x1A,0x1B,0x03,0x1F,0x00,0x6D,0x6E,0x01,0x02,0x6F,
0x70,0x0C,0x0D,0x0E,0x22,0x5F,0x71
}};
const rle_data_t const room_0_1_coll = {120, {
0xD7,0x01,0xC4,0x00,0xDA,0x01,0xC4,0x00,0xC9,0x01,0x00,0xC3,0x01,0x00,0xCC,0x01,
0xC5,0x00,0xC6,0x01,0xC6,0x00,0xC2,0x06,0xC2,0x00,0xC9,0x01,0xC5,0x00,0xC6,0x01,
0xC6,0x00,0xC2,0x06,0xC2,0x00,0xC7,0x01,0xC7,0x00,0x01,0x00,0xC2,0x01,0xCD,0x00,
0xC5,0x01,0xCA,0x00,0x01,0xDD,0x00,0x01,0xDD,0x00,0x01,0xC6,0x00,0xC3,0x01,0xC8,
0x00,0xC2,0x06,0xCA,0x00,0x01,0x02,0xD0,0x00,0xC2,0x06,0xCA,0x00,0xC2,0x01,0xD9,
0x00,0x02,0xC5,0x01,0x02,0xD4,0x00,0x02,0xC9,0x01,0xD3,0x00,0x02,0xCB,0x01,0xC6,
0x00,0xC2,0x02,0xC9,0x00,0x02,0xCD,0x01,0x02,0xC3,0x00,0x02,0xC4,0x01,0x02,0xC5,
0x00,0x02,0xCF,0x01,0xC2,0x02,0xF3,0x01
}};
const tile_data_t const room_0_1_tiles = {114, {
0x00,
0x03,0x0F,0x3E,0x77,0xFA,0xD4,0x60,0x34,0x0F,
0x03,0xE0,0xB8,0x56,0x89,0x41,0x02,0x1C,0xE0,
0x03,0xD5,0xF8,0xD4,0xA0,0x94,0x40,0x3F,0x00,
0x03,0x02,0x84,0x05,0x0B,0x17,0x7F,0xBF,0x3B,
0x03,0x00,0xFE,0xFF,0xEA,0xFD,0xEA,0x5D,0xE2,
0x03,0x00,0x00,0x00,0x80,0xC0,0x30,0x88,0x08,
0x03,0x18,0x3C,0x6E,0x97,0x8B,0x95,0x42,0x3C,
0x03,0x01,0x07,0x0F,0x1F,0x3F,0x7D,0x77,0xFD,
0x03,0xFF,0xFD,0xEA,0xBD,0xEA,0xF7,0xA8,0xD5,
0x03,0x00,0xC0,0xA0,0xD0,0xA8,0x44,0xAA,0x12,
0x03,0x00,0x01,0x07,0x0F,0x1F,0x3F,0x7D,0x7B,
0x03,0x3F,0xFF,0xFD,0xEA,0xFD,0xAA,0xF7,0xAA,
0x03,0xF0,0xFE,0xED,0xBE,0xD5,0xA8,0x17,0xEA,
0x03,0x00,0x00,0x80,0xE0,0x50,0x88,0x24,0x82,
0x03,0xEE,0xDD,0xAB,0xD5,0xBB,0x51,0x66,0x35,
0x03,0xBE,0x74,0xE9,0xDC,0xAA,0xD4,0x82,0x50,
0x03,0x81,0x29,0x11,0x01,0xA2,0x42,0x02,0x04,
0x03,0x00,0x03,0x07,0x0E,0x1F,0x3A,0x77,0x7A,
0x03,0xF8,0xFC,0xD6,0xA1,0x55,0x81,0x51,0x82,
0x03,0x7F,0xFA,0xFD,0xB2,0xE5,0xAC,0x55,0x62,
0x03,0x47,0xAC,0xD5,0xA2,0x51,0x24,0x51,0x04,
0x03,0x42,0x92,0x06,0x42,0x22,0x02,0x02,0x02,
0x03,0x00,0x00,0x00,0x30,0x78,0x6C,0x52,0x22,
0x03,0xD5,0xA0,0x83,0x46,0x21,0x18,0x07,0x00,
0x03,0x77,0xAE,0x5D,0x2A,0x4D,0x20,0x00,0xFF,
0x03,0x44,0x88,0x42,0x80,0x00,0x00,0x00,0xFF,
0x03,0x51,0x81,0x01,0x01,0x02,0x04,0x38,0xC0,
0x03,0x1A,0x14,0x0B,0x05,0x02,0x01,0x00,0x00,
0x03,0x89,0x40,0x90,0x00,0x48,0x20,0xC1,0x3E,
0x03,0x04,0x08,0x08,0x10,0x20,0x40,0x80,0x00,
0x03,0x02,0x84,0x04,0x08,0x10,0x60,0x80,0x00,
0x03,0x01,0x03,0x07,0x0F,0x1F,0x3A,0x3D,0x6E,
0x03,0xC0,0xE0,0x50,0xE8,0x58,0xA4,0x04,0xA2,
0x03,0x55,0x22,0x14,0x09,0x04,0x01,0x00,0x00,
0x03,0xDE,0xFA,0xDF,0xBB,0xBB,0x29,0x11,0x10,
0x03,0x1E,0x7C,0x6E,0xCA,0x88,0x88,0x80,0x80,
0x03,0x00,0x00,0x00,0x00,0x01,0x03,0x07,0x8F,
0x03,0x01,0x0F,0x3F,0xFB,0xFF,0xEA,0xFD,0xEA,
0x03,0xC0,0xF0,0xF8,0xAC,0xF2,0xA9,0xD3,0xA9,
0x03,0x75,0x6B,0x5D,0x2A,0x34,0x1A,0x08,0x07,
0x03,0xC2,0xA2,0x02,0x82,0x04,0x08,0x10,0xE0,
0x03,0x00,0x0F,0x1F,0x3F,0x75,0x7B,0xD5,0xFE,
0x03,0x00,0xC0,0x60,0xB0,0x58,0xA8,0x54,0x8C,
0x03,0xFD,0xFC,0xF7,0xEA,0x7F,0x7A,0x7D,0x79,
0x03,0x04,0x0B,0x0F,0x1E,0x3F,0x7A,0xF7,0x7A,
0x03,0xC7,0x74,0x28,0x38,0x28,0x18,0x18,0x18,
0x02,0x00,0x00,0x01,0x02,0x07,0x05,0x2D,0x0E,
0x02,0x00,0x00,0x00,0x20,0x20,0x30,0x50,0x58,
0x03,0xA5,0x87,0x86,0x86,0x82,0x82,0x00,0x00,
0x03,0x1F,0x3E,0x75,0x7F,0x75,0xAE,0xF4,0xAA,
0x03,0x5D,0xFA,0x55,0xAA,0x71,0x2A,0xC4,0x80,
0x03,0x11,0xB5,0x71,0x21,0x51,0x82,0x42,0x02,
0x03,0x18,0x3C,0x6E,0x97,0x8B,0x95,0x42,0x3E,
0x03,0x55,0x3A,0x15,0x0E,0x03,0x01,0x00,0x00,
0x03,0x52,0x06,0x51,0x01,0x41,0x81,0x62,0x1C,
0x03,0x2D,0x19,0x1D,0x1D,0x1A,0x1A,0x0A,0x0A,
0x03,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x03,0x10,0x10,0x10,0x00,0x00,0x00,0x00,0x00,
0x02,0x2D,0x35,0x15,0x33,0x1A,0x15,0x0C,0x00,
0x02,0x78,0xB0,0x60,0xE8,0xC0,0xD0,0xA0,0x00,
0x03,0xDD,0xAA,0xD0,0x4A,0x21,0x10,0x0C,0x03,
0x03,0xC8,0x94,0x08,0x00,0x40,0x01,0x6E,0xFD,
0x03,0x04,0x04,0x08,0x10,0x60,0x80,0x00,0x00,
0x03,0x26,0x14,0x28,0x38,0x28,0x38,0x38,0x30,
0x03,0xE0,0x60,0x60,0x60,0x60,0x40,0x40,0x40,
0x03,0x38,0x30,0x30,0x30,0x20,0x20,0x20,0x00,
0x03,0x0A,0x0A,0x0C,0x0E,0x0C,0x04,0x04,0x04,
0x03,0x4C,0x28,0x50,0x70,0x50,0x70,0x70,0x60,
0x02,0x00,0x0F,0x07,0x00,0x03,0x00,0x07,0x00,
0x02,0x00,0x50,0xA0,0x00,0x40,0x00,0xA0,0x00,
0x03,0x30,0x30,0x30,0x10,0x10,0x10,0x10,0x00,
0x03,0x60,0x60,0x60,0x20,0x20,0x20,0x20,0x00,
0x02,0x01,0x03,0x03,0x00,0x01,0x03,0x01,0x00,
0x02,0x80,0x40,0xC0,0x00,0x80,0x40,0x80,0x00,
0x03,0x7C,0xFB,0xFF,0xFF,0xDD,0x69,0x38,0x30,
0x03,0xDE,0xFA,0xDF,0xBB,0xBB,0x29,0xB1,0xD0,
0x03,0x36,0xF9,0xD5,0xBA,0xD4,0x4C,0x98,0x8E,
0x03,0x00,0x00,0x00,0x00,0x01,0x03,0x02,0x04,
0x03,0x50,0x61,0xC1,0x83,0x82,0x05,0x85,0x09,
0x03,0xC8,0x88,0x84,0x04,0x05,0x04,0x04,0x08,
0x03,0x42,0x21,0x13,0x13,0x82,0x42,0x73,0x54,
0x03,0x00,0x00,0x80,0x80,0x40,0x30,0x90,0x80,
0x03,0x04,0x00,0x00,0x00,0x01,0x00,0x00,0x00,
0x03,0x30,0x50,0x90,0x90,0x40,0x40,0x00,0x00,
0x03,0x84,0x84,0x8A,0x89,0x08,0x00,0x00,0x00,
0x03,0x44,0x48,0x28,0x20,0xC0,0x40,0x00,0x00,
0x03,0x40,0x40,0x20,0x00,0x00,0x00,0x00,0x00,
0x03,0x00,0x00,0x00,0x00,0x01,0x03,0x07,0x0F,
0x03,0x00,0x00,0x01,0x03,0x07,0x1F,0x3F,0x3B,
0x03,0x00,0x00,0x00,0xC0,0x60,0xB0,0x58,0x0C,
0x03,0x00,0x00,0x0C,0x1E,0x36,0x4A,0x44,0x00,
0x03,0xC8,0x94,0x08,0x00,0x40,0x01,0x0E,0xF0,
0x03,0x04,0x07,0x0F,0x3E,0xDF,0x3A,0x77,0x7A,
0x03,0x55,0xE2,0xB4,0xD9,0xAC,0x45,0xAA,0x12,
0x03,0x40,0x12,0x40,0x20,0x00,0x01,0xC2,0x3C,
0x03,0x04,0x04,0x09,0x32,0xC2,0x02,0x01,0x00,
0x03,0x60,0xF0,0xB8,0x5C,0x2C,0x54,0x08,0xF0,
0x03,0x00,0x7E,0xFB,0xD5,0xFA,0x57,0xEA,0xD4,
0x03,0x00,0x00,0x00,0x06,0x0F,0x1B,0x25,0x22,
0x03,0x75,0x6B,0x5D,0x2A,0x34,0x9A,0xC8,0xC7,
0x01,0x07,0x33,0x98,0xCD,0x65,0x64,0x26,0x00,
0x01,0x6E,0xC3,0xD0,0xAE,0x99,0x9B,0x19,0x00,
0x01,0x00,0x00,0xD8,0x8C,0x8E,0xDE,0xFA,0x00,
0x03,0x25,0x10,0x0F,0xC0,0x60,0xB0,0x58,0x0C,
0x03,0x40,0x81,0x07,0x0F,0x1F,0x3F,0x7D,0x7B,
0x03,0x0F,0x1F,0x3A,0x7F,0xEA,0xFD,0xDA,0x7F,
0x03,0xC0,0x60,0xB0,0x58,0xE6,0x51,0x81,0xD1,
0x03,0x1A,0x14,0x0B,0x05,0x02,0x01,0x0C,0x1E,
0x03,0x7E,0x55,0x3E,0x34,0x1A,0x0C,0x06,0x03,
0x03,0xA1,0x52,0x04,0x88,0x10,0x10,0x20,0xC0,
0x03,0x37,0x4B,0x45,0x4A,0x21,0x1E,0x00,0x00,
0x03,0x00,0x81,0x87,0x8F,0x1F,0x3F,0x7D,0x7B,
0x03,0x04,0x04,0x08,0x30,0xC0,0x00,0x00,0x00
}};
const tile_data_t const enemies_0_1_tiles = {4, {
0x19,0x19,0x25,0x3D,0x42,0x7F,0x75,0x7D,0x49,0x49,0x00,0x00,0x00,0x00,0x00,0x00,
0x4C,0x4C,0xD2,0xDE,0x21,0xFF,0x57,0xDF,0x49,0xC9,0x80,0x80,0x00,0x00,0x00,0x00,
0x01,0x01,0x03,0x03,0x1E,0x1F,0x25,0x3D,0x29,0x39,0x4C,0x7C,0x50,0x70,0x30,0x30,
0x40,0x40,0xE0,0xE0,0x3C,0xFC,0x52,0xDE,0x4A,0xCE,0x99,0x9F,0x05,0x07,0x06,0x06,
}};

const rle_data_t const room_1_1_map = {323, {
0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x00,0x0A,0x0B,0x0C,0x0D,0xD0,0x00,
0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0xD0,0x00,
0x1C,0x1D,0x1E,0x1F,0x20,0x1E,0x21,0x22,0x01,0x02,0x03,0x14,0x15,0x16,0x17,0x00,
0x23,0x24,0xCD,0x00,0x25,0x26,0x27,0x28,0x29,0x2A,0x17,0x0E,0x0F,0x10,0x21,0x22,
0x01,0x02,0x03,0x2B,0x2C,0x2D,0x2C,0x2E,0x2F,0xCA,0x00,0x30,0x00,0x31,0x32,0x25,
0x33,0x1C,0x1D,0x1E,0x26,0x27,0x0E,0x0F,0x10,0x34,0x35,0x36,0xC2,0x34,0x2B,0x2E,
0x2F,0xC9,0x00,0x37,0x38,0xC4,0x00,0x25,0x00,0x30,0x00,0x1C,0x1D,0x39,0x05,0x06,
0x35,0x36,0x35,0x36,0x35,0x3A,0xC9,0x00,0x3B,0x3C,0xC9,0x00,0x25,0x11,0x12,0x13,
0x3D,0x3E,0x01,0x02,0x15,0x3F,0xC9,0x00,0x40,0x41,0xC7,0x00,0x37,0x38,0x00,0x1F,
0x20,0x42,0x43,0x44,0x1F,0x20,0x45,0xCA,0x00,0x46,0x47,0xC7,0x00,0x3B,0x3C,0xC3,
0x00,0x48,0x49,0xD7,0x00,0x40,0x41,0xD0,0x00,0x4A,0x4B,0x4C,0xC9,0x00,0x46,0x47,
0xD0,0x00,0x4D,0x4E,0x4F,0xD2,0x00,0x50,0xC8,0x00,0x07,0x08,0x09,0x16,0x17,0xC6,
0x00,0x0A,0x0B,0x0C,0x0D,0x16,0x17,0x0A,0x0B,0x0C,0x0D,0x51,0x52,0xC7,0x00,0x02,
0x03,0x29,0x2A,0x17,0x53,0x54,0x55,0x56,0x53,0x54,0x18,0x19,0x1A,0x1B,0x14,0x15,
0x18,0x19,0x1A,0x1B,0x57,0x58,0x2B,0x2D,0x59,0x5A,0x2D,0x2B,0x2C,0x0F,0x10,0x00,
0x01,0x02,0x03,0xC4,0x00,0x01,0x02,0x03,0x5B,0x5C,0x21,0x22,0x5D,0x5E,0x01,0x02,
0x03,0x36,0xC2,0x35,0xC3,0x36,0x35,0x36,0x1D,0x5F,0x60,0x0E,0x0F,0x10,0x0A,0x0B,
0x0C,0x0D,0x0E,0x0F,0x10,0x61,0x62,0x63,0x64,0x65,0x66,0x0E,0x0F,0x10,0x35,0xC3,
0x36,0x35,0xC2,0x36,0x35,0x00,0x67,0x68,0x1C,0x1D,0x1E,0x18,0x19,0x1A,0x1B,0x1C,
0x1D,0x1E,0x00,0x69,0x6A,0x6B,0x6C,0x6D,0x6E,0x1D,0x1E,0x16,0x17,0x6F,0x70,0x71,
0x36,0x35,0x72
}};
const rle_data_t const room_1_1_coll = {95, {
0xCE,0x01,0xD0,0x00,0xCE,0x01,0xD0,0x00,0xCE,0x01,0xD5,0x00,0xCA,0x01,0x02,0xD6,
0x00,0xC3,0x01,0xC2,0x00,0xC7,0x01,0x02,0xCC,0x00,0xC2,0x06,0xC8,0x00,0xC9,0x01,
0x02,0xCA,0x00,0xC2,0x06,0xCA,0x00,0xC8,0x01,0xD3,0x00,0xC2,0x06,0x00,0xC8,0x01,
0xD3,0x00,0xC2,0x06,0xC3,0x00,0xC2,0x01,0xE9,0x00,0x01,0x02,0xDC,0x00,0xC2,0x01,
0x02,0xDB,0x00,0xC4,0x01,0x02,0xC6,0x00,0x02,0xC8,0x01,0x02,0xC9,0x00,0xC5,0x01,
0xC6,0x07,0xCA,0x01,0x02,0xC8,0x00,0xC5,0x01,0xC6,0x07,0xFF,0x01,0xD0,0x01
}};
const tile_data_t const room_1_1_tiles = {115, {
0x00,
0x03,0x01,0x07,0x0F,0x1F,0x3F,0x7D,0x77,0xFD,
0x03,0xFF,0xFD,0xEA,0xBD,0xEA,0xF7,0xA8,0xD5,
0x03,0x00,0xC0,0xA0,0xD0,0xA8,0x44,0xAA,0x12,
0x03,0x00,0x00,0x00,0x00,0x01,0x03,0x07,0x0F,
0x03,0x01,0x0F,0x3F,0xFB,0xFF,0xEA,0xFD,0xEA,
0x03,0xC0,0xF0,0xF8,0xAC,0xF2,0xA9,0xD3,0xA9,
0x03,0x20,0x20,0x10,0x08,0x06,0x01,0x00,0x00,
0x03,0x13,0x29,0x10,0x00,0x02,0x80,0x70,0x0F,
0x03,0xBB,0x55,0x0B,0x52,0x84,0x08,0x30,0xC0,
0x03,0x00,0x01,0x07,0x0F,0x1F,0x3F,0x7D,0x7B,
0x03,0x3F,0xFF,0xFD,0xEA,0xFD,0xAA,0xF7,0xAA,
0x03,0xF0,0xFE,0xED,0xBE,0xD5,0xA8,0x17,0xEA,
0x03,0x00,0x00,0x80,0xE0,0x50,0x88,0x24,0x82,
0x03,0xEE,0xDD,0xAB,0xD5,0xBB,0x51,0x66,0x35,
0x03,0xBE,0x74,0xE9,0xDC,0xAA,0xD4,0x82,0x50,
0x03,0x81,0x29,0x11,0x01,0xA2,0x42,0x02,0x04,
0x03,0x1F,0x3E,0x75,0x7F,0x75,0xAE,0xF4,0xAA,
0x03,0x5D,0xFA,0x55,0xAA,0x71,0x2A,0xC4,0x80,
0x03,0x11,0xB5,0x71,0x21,0x51,0x82,0x42,0x02,
0x03,0x00,0x03,0x07,0x0E,0x1F,0x3A,0x77,0x7A,
0x03,0xF8,0xFC,0xD6,0xA1,0x55,0x81,0x51,0x82,
0x03,0x0F,0x3E,0x77,0xFA,0xD4,0x60,0x34,0x0F,
0x03,0xE0,0xB8,0x56,0x89,0x41,0x02,0x1C,0xE0,
0x03,0xD5,0xA0,0x83,0x46,0x21,0x18,0x07,0x00,
0x03,0x77,0xAE,0x5D,0x2A,0x4D,0x20,0x00,0xFF,
0x03,0x44,0x88,0x42,0x80,0x00,0x00,0x00,0xFF,
0x03,0x51,0x81,0x01,0x01,0x02,0x04,0x38,0xC0,
0x03,0x1A,0x14,0x0B,0x05,0x02,0x01,0x00,0x00,
0x03,0x89,0x40,0x90,0x00,0x48,0x20,0xC1,0x3E,
0x03,0x04,0x08,0x08,0x10,0x20,0x40,0x80,0x00,
0x03,0xDD,0xAA,0xD0,0x4A,0x21,0x10,0x0C,0x03,
0x03,0xC8,0x94,0x08,0x00,0x40,0x01,0x0E,0xF0,
0x03,0xD5,0xF8,0xD4,0xA0,0x94,0x40,0x3F,0x00,
0x03,0x02,0x84,0x04,0x08,0x10,0x60,0x80,0x00,
0x02,0x08,0x14,0x02,0x02,0x01,0x01,0x01,0x01,
0x02,0x00,0x00,0x0C,0x10,0x10,0x20,0x20,0x48,
0x03,0xAA,0xF6,0x94,0x1C,0x18,0x18,0x08,0x08,
0x03,0x6F,0x69,0xE1,0x61,0x61,0x60,0x60,0x40,
0x03,0x60,0x40,0xC0,0x80,0x80,0x80,0x80,0x00,
0x03,0x5B,0x5F,0x36,0x36,0x36,0x2B,0x2B,0x2B,
0x03,0x07,0x1F,0x3B,0x7D,0x6A,0x30,0x1A,0x07,
0x03,0xFF,0x75,0xBA,0x54,0x22,0x00,0x20,0x80,
0x02,0x01,0x22,0x12,0x0C,0x14,0x56,0x3B,0x56,
0x02,0x50,0xD2,0xA4,0x94,0x49,0x95,0xB6,0xEB,
0x02,0x02,0x02,0x0A,0x52,0x24,0x65,0x95,0x6A,
0x02,0x00,0x80,0x40,0x20,0xA1,0x91,0x92,0x92,
0x02,0x00,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,
0x03,0x40,0x40,0x40,0x40,0x40,0x00,0x40,0x00,
0x03,0x2B,0x07,0x06,0x06,0x06,0x04,0x04,0x04,
0x03,0x10,0x10,0x10,0x10,0x10,0x00,0x10,0x00,
0x03,0x14,0x10,0x14,0x18,0x18,0x18,0x10,0x10,
0x03,0x30,0x7E,0xFE,0xCF,0xA5,0x68,0xAB,0x9A,
0x03,0x38,0x63,0xCB,0xAF,0xE7,0x81,0x2A,0xEC,
0x03,0x38,0xDF,0xDF,0x7B,0x52,0x8C,0xD6,0x54,
0x02,0x00,0x00,0x01,0x02,0x07,0x05,0x2D,0x0E,
0x02,0x00,0x00,0x00,0x20,0x20,0x30,0x50,0x58,
0x03,0x04,0x04,0x08,0x30,0xC1,0x03,0x07,0x0F,
0x02,0x80,0x00,0x00,0x00,0x00,0x00,0x80,0xC0,
0x02,0x2D,0x35,0x15,0x33,0x1A,0x15,0x0C,0x00,
0x02,0x78,0xB0,0x60,0xE8,0xC0,0xD0,0xA0,0x00,
0x03,0x0F,0x1F,0x3A,0x7F,0xEA,0xFD,0xDA,0x7F,
0x03,0xC0,0x60,0xB0,0x58,0xE6,0x51,0x81,0xD1,
0x03,0xE0,0x60,0xA0,0x40,0x80,0x00,0x00,0x00,
0x02,0x00,0x0F,0x07,0x00,0x03,0x00,0x07,0x00,
0x02,0x00,0x50,0xA0,0x00,0x40,0x00,0xA0,0x00,
0x03,0x04,0x04,0x08,0x13,0x67,0x8D,0x12,0x11,
0x03,0x7E,0x55,0x3E,0x34,0x9A,0xCC,0xE6,0x63,
0x03,0xA1,0x52,0x04,0x88,0x10,0x10,0x20,0xC0,
0x03,0x04,0x04,0x08,0x10,0x60,0x80,0x00,0x00,
0x02,0x01,0x03,0x03,0x00,0x01,0x03,0x01,0x00,
0x02,0x80,0x40,0xC0,0x00,0x80,0x40,0x80,0x00,
0x03,0x12,0x08,0x07,0x00,0x00,0x00,0x00,0x00,
0x03,0xA0,0x40,0x80,0x00,0x00,0x00,0x00,0x00,
0x03,0x03,0x0F,0x1F,0x35,0x4F,0x95,0xCB,0x95,
0x03,0x80,0xF0,0xFC,0xDF,0xFF,0x57,0xBF,0x57,
0x03,0x00,0x00,0x00,0x00,0x80,0xC0,0xE0,0xF0,
0x03,0x88,0xAD,0x8E,0x84,0x8A,0x41,0x42,0x40,
0x03,0xBA,0x5F,0xAA,0x55,0x8E,0x54,0x23,0x01,
0x03,0xF8,0x7C,0xAE,0xFE,0xAE,0x75,0x2F,0x55,
0x02,0x00,0x00,0x00,0x1C,0x2E,0x1E,0x03,0x81,
0x02,0x89,0x9A,0xD6,0x65,0x75,0xB7,0xDF,0x6B,
0x02,0x10,0x60,0xC0,0x80,0x90,0x20,0x20,0x40,
0x02,0x03,0x1C,0xE5,0x12,0x40,0x00,0x00,0x00,
0x02,0xC0,0x38,0x27,0x41,0x04,0x00,0x00,0x00,
0x02,0x03,0x1C,0xE9,0x40,0x10,0x00,0x00,0x00,
0x02,0xC0,0x38,0x47,0x12,0x04,0x00,0x00,0x00,
0x02,0x7A,0x1D,0x07,0xE0,0xB8,0x56,0x89,0x41,
0x02,0xD0,0xD0,0x54,0x34,0x0F,0xB1,0x5A,0xAD,
0x02,0x10,0x20,0x44,0x55,0x92,0x92,0x5D,0xED,
0x02,0x10,0x52,0x4A,0xCA,0x45,0x55,0xCB,0x75,
0x03,0x00,0x0F,0x1F,0x3F,0x75,0x7B,0xD5,0xFE,
0x03,0x00,0xC0,0x60,0xB0,0x58,0xA8,0x54,0x8C,
0x03,0x01,0x03,0x07,0x0F,0x1F,0x3A,0x3D,0x6E,
0x03,0xC0,0xE0,0x50,0xE8,0x58,0xA4,0x04,0xA2,
0x03,0x04,0x08,0x08,0x10,0x21,0x47,0x8F,0x1D,
0x03,0x00,0x00,0x00,0x00,0xF0,0xF8,0xAC,0x42,
0x03,0x55,0x3A,0x15,0x0E,0x03,0x01,0x00,0x00,
0x03,0x52,0x06,0x51,0x01,0x41,0x81,0x62,0x1C,
0x03,0x00,0x00,0x00,0x00,0x03,0x0F,0x3E,0x7F,
0x03,0x00,0x00,0x00,0x70,0xFC,0xFE,0xEB,0xFC,
0x03,0x75,0x6B,0x5D,0x2A,0x34,0x1A,0x08,0x87,
0x03,0xC2,0xA2,0x02,0x82,0x04,0x08,0x10,0xE0,
0x03,0x3E,0x75,0xEE,0xF5,0xAA,0xF1,0xA8,0x40,
0x03,0xAA,0x02,0xA2,0x04,0x04,0x08,0x08,0x10,
0x03,0x00,0x01,0x03,0x07,0x0F,0x1D,0x1F,0x1D,
0x03,0xFA,0xFF,0xFA,0xD7,0xBE,0x55,0xEA,0x5C,
0x03,0xAA,0x74,0xAA,0x44,0xAD,0x5C,0x88,0x54,
0x03,0x40,0xC0,0x40,0x43,0x47,0x4F,0x4D,0x40,
0x03,0x00,0x00,0xFE,0xEB,0x75,0xA8,0x44,0x00,
0x03,0x1A,0x14,0x0B,0x85,0x62,0x91,0x10,0x00,
0x03,0x00,0xFD,0x27,0x02,0x02,0x02,0x00,0x00,
0x03,0x00,0xEE,0x11,0x00,0x00,0x00,0x00,0x00,
0x03,0xEA,0xB7,0x14,0x1C,0x0C,0x0C,0x08,0x08,
0x03,0x36,0xF9,0xD5,0xBA,0xD4,0x4C,0x08,0x00,
}};

const rle_data_t const room_2_1_map = {438, {
0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x00,0x02,0x03,0x04,0x05,0x09,0x0A,
0x0B,0x0C,0xC6,0x00,0xC3,0x0D,0xC5,0x00,0x0E,0x0F,0x10,0x11,0x09,0x12,0xC2,0x00,
0x02,0x0F,0x10,0x11,0x13,0x14,0x0B,0x0C,0xC6,0x00,0x15,0x16,0x17,0xC3,0x00,0x18,
0x19,0x1A,0x1B,0x1C,0x1D,0x09,0x1E,0x1F,0x20,0x02,0x1B,0x1C,0x1D,0x09,0x00,0x0B,
0x0C,0xC6,0x00,0x21,0x22,0x17,0x00,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2A,0x2B,
0x2C,0x2D,0x00,0x02,0x28,0x29,0x2A,0x09,0x00,0x0B,0x0C,0xC6,0x00,0x23,0x24,0x23,
0x24,0x2E,0x2F,0x30,0x31,0x32,0x03,0x04,0x05,0x33,0xC3,0x00,0x02,0x03,0x04,0x05,
0x09,0xC7,0x00,0x23,0x24,0x2E,0x2F,0x2E,0x2F,0xC2,0x0D,0xC2,0x00,0x02,0x0F,0x10,
0x11,0x09,0x00,0x34,0x35,0x36,0x0F,0x10,0x11,0x09,0xC5,0x00,0x23,0x24,0x2E,0x2F,
0xC4,0x0D,0x37,0x08,0x38,0x39,0x3A,0x1B,0x1C,0x1D,0x09,0x00,0x3B,0x3C,0x3D,0x1B,
0x1C,0x1D,0x09,0xC5,0x00,0x2E,0x2F,0xC2,0x0D,0x21,0x22,0x06,0x07,0x12,0x00,0x3E,
0x3F,0x40,0x39,0x41,0x2A,0x09,0x42,0x43,0x44,0x45,0x28,0x29,0x2A,0x09,0xC5,0x00,
0xC2,0x0D,0x18,0x19,0x46,0x47,0x48,0x1E,0xC2,0x00,0x49,0x4A,0x4B,0x3F,0x40,0x39,
0x4C,0x4D,0x4E,0x4F,0x50,0x03,0x04,0x05,0x09,0xC7,0x00,0x25,0x26,0x51,0x52,0x2B,
0x2C,0x53,0xC3,0x00,0x49,0x4A,0x4B,0x3F,0x54,0x55,0x56,0x57,0x02,0x0F,0x10,0x11,
0x09,0xC7,0x00,0x30,0x31,0x58,0x16,0x33,0xC5,0x00,0x02,0x1B,0x59,0x4A,0x5A,0x00,
0x5B,0x5C,0x02,0x1B,0x1C,0x1D,0x09,0xC8,0x00,0x01,0x5D,0x22,0x17,0xC5,0x00,0x02,
0x28,0x29,0x2A,0x09,0xC3,0x00,0x02,0x28,0x29,0x2A,0x09,0xC7,0x00,0x5E,0x5F,0x0E,
0x47,0x48,0xC3,0x00,0x60,0x61,0x02,0x03,0x04,0x05,0x09,0xC3,0x00,0x02,0x03,0x04,
0x05,0x09,0xC4,0x00,0x60,0x61,0x62,0x63,0x64,0x65,0x52,0x66,0xC3,0x00,0x67,0x68,
0x02,0x0F,0x10,0x11,0x09,0x69,0x6A,0x69,0x02,0x0F,0x10,0x11,0x09,0x6B,0x6C,0x6A,
0x6B,0x67,0x68,0x6D,0x6E,0x6F,0x15,0x16,0x17,0x70,0x71,0x70,0x72,0x73,0x74,0x75,
0x72,0x73,0x74,0x75,0x72,0x73,0x74,0x75,0x72,0x73,0x74,0x75,0x72,0x73,0x74,0x75,
0x72,0x73,0x74,0x75,0x72,0x73,0x74,0x75,0x72,0x73,0x72,0x73,0x74,0x75,0x72,0x73,
0x74,0x75,0x72,0x73,0x74,0x75,0x72,0x73,0x74,0x75,0x72,0x73,0x74,0x75,0x72,0x73,
0x74,0x75,0x72,0x73,0x74,0x75,0x72,0x73,0x76,0x77,0x78,0x76,0x79,0x7A,0x7B,0x79,
0x76,0x77,0x78,0x76,0x77,0x78,0x76,0x77,0x78,0x79,0x7A,0x7B,0x7A,0x7B,0x79,0x76,
0x77,0x78,0x76,0x77,0x78,0x76
}};
const rle_data_t const room_2_1_coll = {43, {
0xD8,0x00,0xC3,0x01,0xFF,0x00,0xFA,0x00,0x02,0x01,0xD8,0x00,0x02,0xC3,0x01,0xD8,
0x00,0x02,0x01,0xDA,0x00,0xC2,0x01,0xC8,0x00,0x01,0x02,0xDE,0x00,0x01,0x02,0xDE,
0x00,0x01,0x02,0xFF,0x00,0xF3,0x00,0xFF,0x01,0xDB,0x01
}};
const tile_data_t const room_2_1_tiles = {124, {
0x00,
0x03,0x00,0x00,0x08,0x05,0x02,0x02,0x19,0x0E,
0x03,0x08,0x01,0x08,0x01,0x08,0x01,0x08,0x01,
0x03,0x3A,0x46,0x2A,0x16,0x22,0x17,0x32,0x57,
0x03,0xFA,0x5F,0xFA,0x5F,0xFA,0x4F,0xEA,0x4F,
0x03,0x66,0x54,0x6A,0x54,0x66,0x54,0xE6,0x54,
0x04,0x50,0x55,0x80,0x83,0x50,0x56,0x80,0x84,0x50,0x50,0x40,0x43,0x50,0x56,0x40,0x44,
0x02,0x12,0x21,0x5D,0xE8,0x44,0x32,0x6C,0x54,
0x02,0x40,0x30,0xA0,0x00,0x80,0x40,0x80,0x80,
0x03,0x80,0x10,0x80,0x10,0x80,0x10,0x80,0x10,
0x03,0x00,0x00,0x00,0x10,0xA0,0x40,0x40,0x98,
0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,
0x01,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,
0x01,0x38,0x54,0xAA,0xD2,0x82,0x44,0x38,0x00,
0x03,0xC2,0xAA,0x42,0x2A,0x03,0x0A,0x01,0x0A,
0x03,0x3A,0x47,0x2A,0x27,0x2A,0x27,0x32,0x57,
0x03,0xEA,0x4F,0xFA,0x5F,0xFA,0x4F,0xEA,0x4F,
0x03,0xEA,0x54,0x62,0x54,0xEE,0x54,0xEA,0x54,
0x02,0x34,0xA4,0x80,0x00,0x00,0x00,0x00,0x00,
0x03,0x81,0x13,0x85,0x12,0x84,0x10,0x80,0x10,
0x03,0x70,0x80,0x00,0x00,0x00,0x00,0x00,0x00,
0x03,0x00,0x0A,0x02,0x0A,0x02,0x0A,0x01,0x0A,
0x03,0x53,0xFA,0x5F,0xFA,0x5F,0xEA,0x4F,0xFA,
0x03,0x50,0x80,0x50,0x80,0x50,0x40,0x50,0x40,
0x02,0x00,0x00,0x00,0x00,0x00,0x02,0x03,0x04,
0x02,0x00,0x00,0x02,0x4A,0x59,0xA2,0x66,0xCD,
0x04,0x08,0x08,0x01,0x01,0x08,0x08,0x01,0x81,0x08,0x08,0x01,0x41,0x08,0x48,0x01,0x01,
0x03,0x22,0x17,0x2A,0x17,0x2A,0x57,0x22,0x57,
0x03,0xFA,0x5F,0xEA,0x4F,0xEA,0x4F,0xEA,0x5F,
0x03,0x66,0x54,0x66,0x54,0xEA,0x54,0xE6,0x54,
0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x41,0x23,
0x03,0x00,0x00,0x01,0x07,0x1A,0x74,0xA0,0x40,
0x03,0x08,0x70,0xC0,0x00,0x00,0x00,0x00,0x00,
0x03,0x01,0x0A,0x02,0x0A,0x01,0x0A,0x01,0x0A,
0x03,0x5B,0xFA,0x5B,0xFA,0x5F,0xFA,0x4F,0xEA,
0x01,0xFF,0x55,0xAA,0x00,0x20,0x29,0x32,0x29,
0x01,0xFF,0x55,0xAA,0x40,0x00,0x83,0xC6,0x65,
0x02,0x02,0x01,0x0B,0x18,0x04,0x06,0x0B,0x00,
0x02,0x20,0x72,0xA6,0x4D,0x8B,0xE6,0x49,0x30,
0x04,0x08,0xC8,0x01,0x01,0x08,0x48,0x01,0x01,0x08,0x08,0x01,0x41,0x08,0x08,0x01,0xC1,
0x03,0x22,0x57,0x32,0x56,0x32,0x57,0x32,0x16,
0x03,0xFA,0x5F,0xFA,0x5F,0xEA,0x4F,0xEA,0x5F,
0x03,0x62,0x5C,0xEA,0x54,0xE2,0x54,0x66,0x54,
0x03,0x80,0x10,0x80,0x10,0x81,0x17,0x82,0x15,
0x03,0x2E,0x35,0x68,0xD0,0xA0,0x40,0x80,0x00,
0x03,0xB8,0x06,0x00,0x00,0x00,0x00,0x00,0x00,
0x01,0x38,0x28,0x30,0x28,0x31,0x2B,0x32,0x29,
0x01,0xB2,0x58,0x2C,0x96,0x8B,0x45,0x82,0x01,
0x02,0x0A,0x05,0x00,0x01,0x00,0x00,0x00,0x00,
0x02,0x45,0x83,0x2E,0x60,0xC9,0x1A,0x31,0x00,
0x04,0x08,0x08,0x01,0x01,0x08,0x48,0x01,0x01,0x08,0x08,0x01,0xC1,0x08,0x88,0x01,0x01,
0x03,0x82,0x14,0x80,0x10,0x80,0x10,0x80,0x10,
0x02,0x00,0x00,0x00,0x00,0x01,0x02,0x05,0x0E,
0x02,0x00,0x00,0x00,0x20,0x36,0x5B,0xA0,0x56,
0x04,0x08,0x08,0x01,0x01,0x08,0x08,0x01,0x01,0x08,0x08,0x01,0x01,0x08,0x88,0x01,0x01,
0x02,0xA2,0x64,0xCB,0x9D,0x08,0x66,0xCD,0x8A,
0x01,0x0F,0x05,0x0A,0x00,0x02,0x02,0x03,0x02,
0x01,0xFF,0x55,0xAA,0x04,0x00,0x98,0x2C,0x96,
0x04,0xF8,0x08,0x51,0x01,0xA8,0x08,0x01,0x01,0x08,0x08,0x31,0x01,0x68,0x08,0x51,0x01,
0x02,0x08,0x05,0x1A,0x10,0x06,0x09,0x05,0x14,
0x02,0x39,0x84,0x63,0x94,0x5B,0xA0,0x34,0x6E,
0x04,0x08,0x48,0x01,0x01,0x08,0x68,0x01,0xC1,0x08,0x68,0x01,0x81,0x08,0x08,0x01,0x81,
0x01,0x03,0x02,0x03,0x02,0x03,0x02,0x03,0x02,
0x01,0x8B,0x85,0x02,0x89,0x18,0xB4,0x28,0x90,
0x01,0x2F,0x85,0xCA,0x60,0xB2,0x52,0x23,0x12,
0x04,0xFA,0x0A,0x5F,0x0F,0xAA,0x0A,0x0F,0x0F,0x0A,0x0A,0x3F,0x0F,0x6A,0x0A,0x5F,0x0F,
0x02,0x00,0x01,0x02,0x07,0x04,0x02,0x0D,0x08,
0x02,0x9B,0x2D,0xD0,0x2B,0x1C,0xC2,0x31,0x4A,
0x04,0x00,0x01,0x00,0x9A,0x00,0x42,0x00,0x00,0x04,0xA4,0x04,0x04,0x04,0xB4,0x06,0x66,
0x04,0x08,0xC8,0x01,0x01,0x08,0x08,0x01,0x01,0x08,0x08,0x01,0x01,0x08,0x08,0x01,0x01,
0x04,0x02,0x02,0x0A,0x0A,0x02,0x02,0x0A,0xCA,0x03,0x63,0x0A,0x8A,0x01,0x01,0x0A,0x2A,
0x03,0x4F,0xEA,0x5F,0xFA,0x5B,0xFA,0x5F,0xFA,
0x03,0x50,0x80,0x50,0x80,0x50,0x40,0x50,0x80,
0x01,0x03,0x05,0x0A,0x0D,0x08,0x04,0x03,0x00,
0x01,0x83,0x45,0xAA,0x2D,0x28,0x44,0x83,0x00,
0x01,0x83,0x42,0xA3,0x22,0x23,0x42,0x83,0x02,
0x01,0xF0,0x50,0xA0,0x00,0x00,0x30,0x60,0x50,
0x02,0x03,0x04,0x02,0x06,0x05,0x00,0x00,0x00,
0x02,0x2D,0xD0,0x9A,0x37,0x00,0xC5,0xA6,0x4B,
0x04,0x03,0xB3,0x05,0x45,0x02,0x02,0x01,0x41,0x00,0xE0,0x00,0x00,0x00,0xC0,0x00,0x60,
0x03,0x08,0x81,0xE8,0x41,0xA8,0x41,0x28,0x01,
0x04,0x01,0x81,0x0A,0x8A,0x01,0x61,0x0A,0x8A,0x01,0x21,0x0A,0x8A,0x01,0x81,0x0A,0x2A,
0x03,0x5F,0xEA,0x4F,0xEA,0x4F,0xEA,0x5F,0xFA,
0x03,0x80,0x00,0xF0,0x0C,0x00,0x00,0x00,0x00,
0x01,0x20,0x80,0xC0,0x60,0xB0,0x50,0x20,0x10,
0x02,0x00,0x01,0x01,0x00,0x03,0x02,0x00,0x01,
0x02,0xB4,0xCA,0x07,0xB0,0x4C,0x12,0xCB,0x34,
0x02,0x10,0xC0,0x28,0x80,0x6C,0x98,0x6C,0x10,
0x04,0x00,0x00,0x0A,0x6A,0x02,0x82,0x0A,0x2A,0x02,0x22,0x0A,0x8A,0x01,0x41,0x0A,0x0A,
0x04,0xF3,0xF0,0x55,0x50,0xEA,0xE0,0x4D,0x40,0xE8,0xE0,0x44,0x40,0xE3,0xE0,0x50,0x50,
0x01,0x80,0x40,0xA0,0x20,0x20,0x40,0x80,0x00,
0x02,0xA6,0x8D,0x40,0x33,0x24,0x00,0x00,0x00,
0x02,0x80,0xD0,0x38,0x40,0x40,0x00,0x00,0x00,
0x03,0x01,0x0A,0x02,0x0A,0x01,0x0A,0x01,0x8A,
0x01,0x00,0x00,0x00,0x00,0x0C,0x1A,0x15,0xE2,
0x01,0x00,0x00,0x00,0x00,0x00,0x14,0x88,0x34,
0x02,0x10,0x28,0x04,0x04,0x02,0x02,0x02,0x02,
0x02,0x00,0x00,0x18,0x20,0x20,0x40,0x40,0x90,
0x01,0x01,0x02,0x02,0x08,0x48,0x29,0x15,0x3D,
0x01,0x18,0x07,0x78,0xC9,0xBE,0xFF,0xEB,0xFF,
0x01,0x40,0x80,0x40,0x20,0x90,0x90,0xC0,0xC0,
0x03,0x01,0x0A,0x01,0x0A,0x01,0x0A,0x01,0x0A,
0x03,0x50,0x80,0x50,0xC0,0x50,0x40,0x50,0x00,
0x02,0x02,0x45,0x25,0x19,0x28,0xAD,0x77,0xAD,
0x02,0xA0,0xA4,0x48,0x28,0x93,0x2A,0x6D,0xD6,
0x02,0x90,0x50,0x54,0x34,0x0F,0xB1,0x5A,0xAD,
0x02,0x10,0x52,0x4A,0xCA,0x45,0x55,0xCB,0x75,
0x02,0x02,0x02,0x0A,0x52,0x24,0x65,0x95,0x6A,
0x02,0x10,0x20,0x44,0x55,0x92,0x92,0x5D,0xED,
0x01,0x19,0x01,0x0D,0x1E,0x17,0x0B,0x05,0x00,
0x01,0xBE,0xC1,0xEB,0xF7,0x7F,0xAA,0x14,0x00,
0x01,0xE0,0xC0,0xD8,0xBC,0x74,0xE8,0x50,0x00,
0x02,0x08,0x4A,0x52,0x53,0xA2,0xAA,0xD3,0xAE,
0x02,0x09,0x0A,0x2A,0x2C,0xF0,0x8D,0x5A,0xB5,
0x03,0x30,0x7E,0xFE,0xCF,0xA5,0x68,0xAB,0x9A,
0x03,0x70,0xFD,0xF7,0x75,0xE3,0xA0,0x15,0x76,
0x03,0x38,0xDF,0xDF,0x7B,0x52,0x8C,0xD6,0x54,
0x03,0x38,0x63,0xCB,0xAF,0xE7,0x81,0x2A,0xEC,
0x03,0x7C,0xFB,0xFF,0xFF,0xDD,0x69,0x28,0x00,
0x03,0xDE,0xFA,0xDF,0xBB,0xBB,0x29,0x11,0x00,
0x03,0x36,0xF9,0xD5,0xBA,0xD4,0x4C,0x08,0x00,
0x03,0xEA,0xB7,0x14,0x1C,0x0C,0x0C,0x08,0x08,
0x03,0x00,0xFD,0x27,0x02,0x02,0x02,0x00,0x00,
0x03,0x00,0xEE,0x11,0x00,0x00,0x00,0x00,0x00,
}};
const tile_data_t const enemies_2_1_tiles = {9, {
0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,
0x00,0x00,0x1C,0x1C,0x3E,0x2A,0x3E,0x36,0x3E,0x2A,0x1C,0x1C,0x7F,0x7F,0xFF,0xFF,
0x03,0x03,0x07,0x06,0x4F,0x4A,0xEF,0xEF,0xEF,0xAD,0xFF,0xB6,0xFF,0xFF,0xFF,0xFF,
0xC0,0xC0,0xE0,0x60,0xF2,0x52,0xF7,0xF7,0xF7,0xB5,0xFF,0x6D,0xFF,0xFF,0xFF,0xFF,
0x00,0x00,0x38,0x38,0x7C,0x54,0x7C,0x6C,0x7C,0x54,0x38,0x38,0xFE,0xFE,0xFF,0xFF,
0x1F,0x1F,0x00,0x00,0xFF,0xFF,0xFF,0xBD,0xFE,0xC6,0xFE,0xD6,0x7C,0x7C,0x38,0x38,
0xCF,0xCF,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0xE7,0xE7,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0xF0,0xF0,0x00,0x00,0xFE,0xFE,0xFF,0xBD,0xFF,0xC7,0xFE,0xD6,0x7C,0x7C,0x38,0x38
}};