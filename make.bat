@echo off
@set PROJ=mushroompie
@set GBDK=..\..\gbdk\
@set GBDKLIB=%GBDK%lib\small\asxxxx\
@set OBJ=build\
@set SRC=src\

@rem @set GBT_PLAYER_ENABLED=1

@set CFLAGS=-mgbz80 --no-std-crt0 -I %GBDK%include -I %GBDK%include\asm -I %SRC%include -c
@set CFLAGS=%CFLAGS% --max-allocs-per-node 50000 --opt-code-speed
@set CFLAGS=%CFLAGS% --peep-file peephole\gbz80.rul
@rem @set CFLAGS=%CFLAGS% --profile

@set LFLAGS=-n -- -z -m -j -yt1 -yo8 -k%GBDKLIB%gbz80\ -lgbz80.lib -k%GBDKLIB%gb\ -lgb.lib
@set LFILES=%GBDKLIB%gb\crt0.o

@set ASMFLAGS=-plosgff -I"libc"

@echo Cleanup

@if exist %OBJ% rd /s/q %OBJ%
@if exist %PROJ%.gb del %PROJ%.gb
@if exist %PROJ%.sym del %PROJ%.sym
@if exist %PROJ%.map del %PROJ%.map

@if not exist %OBJ% mkdir %OBJ%

@echo COMPILING WITH SDCC4...

@rem --- gbt player ----------
@if not defined GBT_PLAYER_ENABLED (goto :1)
sdasgb %ASMFLAGS% %OBJ%gbt_player.rel %SRC%gbt_player\gbt_player.s
sdasgb %ASMFLAGS% %OBJ%gbt_player_bank1.rel %SRC%gbt_player\gbt_player_bank1.s
sdcc %CFLAGS% %SRC%03_music_data.c -bo6 -o %OBJ%03_music_data.rel
@set CFLAGS=%CFLAGS% -DGBT_PLAYER_ENABLED -I %SRC%gbt_player 
@set LFILES=%LFILES% %OBJ%gbt_player.rel %OBJ%gbt_player_bank1.rel %OBJ%03_music_data.rel
:1

@rem --- library -------------
sdcc %CFLAGS% %SRC%00_bank_stack.c -o %OBJ%00_bank_stack.rel
sdcc %CFLAGS% %SRC%00_sound.c -o %OBJ%00_sound.rel
@set LFILES=%LFILES% %OBJ%00_bank_stack.rel %OBJ%00_sound.rel

@rem --- resources -----------
sdcc %CFLAGS% %SRC%00_title_gfx_data.c -bo1 -o %OBJ%00_title_gfx_data.rel
sdcc %CFLAGS% %SRC%00_dialogs_data.c -bo1 -o %OBJ%00_dialogs_data.rel
sdcc %CFLAGS% %SRC%00_misc_routines.c -bo1 -o %OBJ%00_misc_routines.rel
@set LFILES=%LFILES% %OBJ%00_title_gfx_data.rel %OBJ%00_dialogs_data.rel %OBJ%00_misc_routines.rel 

sdcc %CFLAGS% %SRC%01_anim_gfx_data.c -bo2 -o %OBJ%01_anim_gfx_data.rel
@set LFILES=%LFILES% %OBJ%01_anim_gfx_data.rel 

sdcc %CFLAGS% %SRC%02_rooms_gfx_data0.c -bo3 -o %OBJ%02_rooms_gfx_data0.rel
sdcc %CFLAGS% %SRC%02_rooms_gfx_data1_0.c -bo4 -o %OBJ%02_rooms_gfx_data1_0.rel
sdcc %CFLAGS% %SRC%02_rooms_gfx_data1_1.c -bo5 -o %OBJ%02_rooms_gfx_data1_1.rel
@set LFILES=%LFILES% %OBJ%02_rooms_gfx_data0.rel %OBJ%02_rooms_gfx_data1_0.rel %OBJ%02_rooms_gfx_data1_1.rel

@rem --- game ----------------
sdcc %CFLAGS% %SRC%%PROJ%.c -o %OBJ%%PROJ%.rel

@echo LINKING WITH GBDK...

%GBDK%bin\link-gbz80.exe %LFLAGS% %PROJ%.gb %LFILES% %OBJ%%PROJ%.rel 

@echo DONE!
