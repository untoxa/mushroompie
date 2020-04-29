#include "sound.h"

#ifdef GBT_PLAYER_ENABLED
#include <gbt_player.h>
extern UINT8 music_mute_frames;
#endif

const UINT8 const FX_REG_SIZES[] = {5, 4, 5, 4, 3};
const UINT8 const FX_ADDR_LO[]   = {0x10, 0x16, 0x1A, 0x20, 0x24};

void PlayFx(SOUND_CHANNEL channel, UINT8 mute_frames, ...) {
    channel; mute_frames;
__asm
            push    BC
            
            lda     HL, 4(SP)
            ld      B, #0            
            ld      C, (HL)     ; BC = channel
            ld      HL, #_FX_REG_SIZES
            add     HL, BC
            ld      E, (HL)     ; E = FX_REG_SIZES[channel]
            
            ld      HL, #_FX_ADDR_LO
            add     HL, BC
            ld      B, #0xFF
            ld      C, (HL)     ; BC = 0xFF00 + FX_ADDR_LO[channel]
            
            lda     HL, 6(SP) // varargs
$plfx01:
            ld      A, (HL+)
            inc     HL
            ld      (BC), A
            inc     BC
            dec     E
            
            jr      NZ, $plfx01

            pop     BC
__endasm;
#ifdef GBT_PLAYER_ENABLED	
	if(channel != CHANNEL_5) {
		gbt_enable_channels(~(0xF & (1 << channel)));
	}
	music_mute_frames = mute_frames;
#endif
}