#include "dizzy_types.h"

UBYTE dizzy_live_symbol;
UBYTE dizzy_energy_start;
UBYTE digits_start;

extern tile_data_t energy_tiles;

UBYTE dizzy_lives;
unsigned char dizzy_lives_indicator[3];
unsigned char dizzy_energy_indicator[8];
unsigned char temp_tile_buffer[16];
const unsigned char const ethalon_indicator[8] = {0, 1, 1, 1, 1, 1, 1, 2};
const UBYTE const ethalon_tiles_offsets[3] = {0, 9, 18};  

UBYTE coins;
unsigned char coins_indicator[2];

UBYTE dizzy_energy, dizzy_energy_old;
UBYTE inc_energy;
UBYTE dec_energy;

UBYTE game_over = 0;
UBYTE death_pause = 0;

void unshrink_and_mask(UBYTE npix, const unsigned char * source, unsigned char * dest) {
    UBYTE mask = (0xFF << (8 - npix));
    source++;
    for (UBYTE i = 0; i < 8; i++) {
        *dest = ((*source) & mask); dest++;
        *dest = 0x00; dest++;
        source++;  
    }        
}

void init_dizzy_coins() { coins = 0; }
void init_dizzy_lives() { dizzy_lives = 3; }
void init_dizzy_energy() { dizzy_energy = 16; inc_energy = 48; dec_energy = 0; }

void on_dizzy_die() {
    ani_type = ANI_DEAD;
    ani_phase = 0; 
    current_dyn = 0; current_dyn_phase = 0;
    death_pause = 32;
}
void show_lives() {
    for (__temp_i = 0; __temp_i < 3; __temp_i++) {
        if (__temp_i < dizzy_lives) dizzy_lives_indicator[__temp_i] = dizzy_live_symbol; else dizzy_lives_indicator[__temp_i] = 0x00;
    }
    set_win_tiles(15, 1, sizeof(dizzy_lives_indicator), 1, dizzy_lives_indicator);    
}

void add_coins(UBYTE n) __naked 
{
    n;
__asm 
            ld      A, (#_coins)
            lda     HL, 2(SP)
            add     (HL)
            daa
            ld      (#_coins), A
            ret
__endasm;
}
void sub_coins(UBYTE n) __naked 
{
    n;
__asm 
            ld      A, (#_coins)
            lda     HL, 2(SP)
            sub     (HL)
            daa
            ld      (#_coins), A
            ret
__endasm;
}
void show_coins() {
    coins_indicator[0] = (coins >> 4) + digits_start;
    coins_indicator[1] = (coins & 0x0F) + digits_start;
    set_win_tiles(2, 1, sizeof(coins_indicator), 1, coins_indicator);
}

void show_energy() {
    push_bank(1);
    __temp_k = dizzy_energy;
    for (__temp_i = 0; __temp_i < 8; __temp_i++) {
        if (__temp_k) {
            if (__temp_k >= 8) {
                dizzy_energy_indicator[__temp_i] = (dizzy_energy_start + ethalon_indicator[__temp_i]);
                __temp_k -= 8;
            } else {
                unshrink_and_mask(__temp_k, ((unsigned char *)energy_tiles) + 1 + ethalon_tiles_offsets[ethalon_indicator[__temp_i]], temp_tile_buffer);
                set_win_data(dizzy_energy_start + 3, 1, temp_tile_buffer);
                dizzy_energy_indicator[__temp_i] = dizzy_energy_start + 3;
                __temp_k = 0;
            }
        } else {
            dizzy_energy_indicator[__temp_i] = 0x00;
        }
    }
    set_win_tiles(6, 1, sizeof(dizzy_energy_indicator), 1, dizzy_energy_indicator);
    pop_bank();
}
void update_energy() {
    dizzy_energy_old = dizzy_energy;
    if (dec_energy) {
        dec_energy--;
        if (dizzy_energy) {
            dizzy_energy--;
            SND_HIT;
        }
        if (!dizzy_energy) dec_energy = 0;
    } else if (inc_energy) {
        dizzy_energy++; 
        if (dizzy_energy > 64) { 
            dizzy_energy = 64;
            inc_energy = 0;
        } else inc_energy--;
    }
    if (dizzy_energy != dizzy_energy_old) {
        if (!dizzy_energy) { 
            if (!death_pause) {
                if (dizzy_lives) dizzy_lives--;
                show_lives();
                on_dizzy_die();
                if (!dizzy_lives) game_over = 1;
            }
        }
        show_energy();
    }
}