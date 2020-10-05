@echo off
@set PROJ=mushroompie
@set GBDK=..\..\gbdk\
@set GBDKLIB=%GBDK%lib\small\asxxxx\
@set OBJ=build\
@set SRC=src\

@set MUSIC_ENABLED=1

@set CFLAGS=-mgbz80 --fsigned-char --no-std-crt0 -I %GBDK%include -I %GBDK%include\asm -I %SRC%include -I music\driver -c
@set CFLAGS=%CFLAGS% --max-allocs-per-node 50000 --opt-code-speed
@rem @set CFLAGS=%CFLAGS% --peep-file peephole\gbz80.rul
@rem @set CFLAGS=%CFLAGS% --profile

@set LNAMES=-g _shadow_OAM=0xC000 -g .STACK=0xE000 -g .refresh_OAM=0xFF80 -b _DATA=0xc0a0 -b _CODE=0x0200
@set LFLAGS=-n -m -j -w -i -k %GBDKLIB%\gbz80\ -l gbz80.lib -k %GBDKLIB%\gb\ -l gb.lib %LNAMES%
@set LFILES=%GBDKLIB%gb\crt0.o

@set ASMFLAGS=-plosgff -I%GBDKLIB%

@set BINFLAGS=-yt 1 -yo 8

@echo Cleanup

@if exist %OBJ% rd /s/q %OBJ%
@if exist %PROJ%.gb del %PROJ%.gb
@if exist %PROJ%.sym del %PROJ%.sym
@if exist %PROJ%.map del %PROJ%.map

@if not exist %OBJ% mkdir %OBJ%

@echo COMPILING WITH SDCC4...

@rem --- music ----------
@if not defined MUSIC_ENABLED (goto :1)
sdcc %CFLAGS% -bo1 -o %OBJ%song.rel music\song.c
@set LFILES=%LFILES% music\driver\driver_lite.obj.o %OBJ%song.rel
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

@echo LINKING...
sdldgb %LFLAGS% %PROJ%.ihx %LFILES% %OBJ%%PROJ%.rel

@echo MAKING BIN...
makebin -Z %BINFLAGS% %PROJ%.ihx %PROJ%.gb

@echo DONE!
