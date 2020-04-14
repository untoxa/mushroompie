@echo off
set PROJ=mushroompie
set GBDK=..\..\gbdk
set GBDKLIB="%GBDK%"\lib\small\asxxxx\
set OBJ=build

@rem set GBT_PLAYER_ENABLED=1

set CFLAGS=-Isrc\include -Isrc\gbt_player
set LFLAGS=-n -- -z -m -j -yt1 -yo8 -k%GBDKLIB%\gbz80\ -lgbz80.lib -k%GBDKLIB%\gb\ -lgb.lib 
set LFILES=%GBDKLIB%\gb\crt0.o

echo Cleanup...

if exist %OBJ% rd /s/q %OBJ%
if exist %PROJ%.gb del %PROJ%.gb
if exist %PROJ%.sym del %PROJ%.sym
if exist %PROJ%.map del %PROJ%.map

if not exist %OBJ% mkdir %OBJ%

echo COMPILING WITH SDCC4...

@rem --- stub ----------------
call sdcc4\sdcc-assemble.bat %OBJ%\sdcc4_stub.rel sdcc4\sdcc4stub\__sdcc_call_hl.s
set LFILES=%LFILES% build\sdcc4_stub.rel

@rem --- gbt player ----------
if not defined GBT_PLAYER_ENABLED (goto :1)
call sdcc4\sdcc-assemble.bat %OBJ%\gbt_player.rel src\gbt_player\gbt_player.s
call sdcc4\sdcc-assemble.bat %OBJ%\gbt_player_bank1.rel src\gbt_player\gbt_player_bank1.s
set CFLAGS=%CFLAGS% -DGBT_PLAYER_ENABLED
set LFILES=%LFILES% %OBJ%\gbt_player.rel %OBJ%\gbt_player_bank1.rel
:1

@rem --- library -------------
call sdcc4\sdcc-compile.bat %CFLAGS% src\00_bank_stack.c -o %OBJ%\00_bank_stack.rel
call sdcc4\sdcc-compile.bat %CFLAGS% src\00_sound.c -o %OBJ%\00_sound.rel
set LFILES=%LFILES% %OBJ%\00_bank_stack.rel %OBJ%\00_sound.rel

@rem --- resources -----------
call sdcc4\sdcc-compile.bat %CFLAGS% src\00_title_gfx_data.c -bo1 -o %OBJ%\00_title_gfx_data.rel
call sdcc4\sdcc-compile.bat %CFLAGS% src\00_dialogs_data.c -bo1 -o %OBJ%\00_dialogs_data.rel
call sdcc4\sdcc-compile.bat %CFLAGS% src\00_misc_routines.c -bo1 -o %OBJ%\00_misc_routines.rel
set LFILES=%LFILES% build\00_title_gfx_data.rel %OBJ%\00_dialogs_data.rel %OBJ%\00_misc_routines.rel 

call sdcc4\sdcc-compile.bat %CFLAGS% src\01_anim_gfx_data.c -bo2 -o %OBJ%\01_anim_gfx_data.rel
set LFILES=%LFILES% build\01_anim_gfx_data.rel 

call sdcc4\sdcc-compile.bat %CFLAGS% src\02_rooms_gfx_data0.c -bo3 -o %OBJ%\02_rooms_gfx_data0.rel
call sdcc4\sdcc-compile.bat %CFLAGS% src\02_rooms_gfx_data1_0.c -bo4 -o %OBJ%\02_rooms_gfx_data1_0.rel
call sdcc4\sdcc-compile.bat %CFLAGS% src\02_rooms_gfx_data1_1.c -bo5 -o %OBJ%\02_rooms_gfx_data1_1.rel
set LFILES=%LFILES% build\02_rooms_gfx_data0.rel build\02_rooms_gfx_data1_0.rel build\02_rooms_gfx_data1_1.rel

@rem --- game ----------------
call sdcc4\sdcc-compile.bat src\%PROJ%.c -o %OBJ%\%PROJ%.rel

echo LINKING WITH GBDK...

%GBDK%\bin\link-gbz80.exe %LFLAGS% %PROJ%.gb %LFILES% %OBJ%\%PROJ%.rel 

echo DONE!