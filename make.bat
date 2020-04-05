@echo off
set PROJ=mushroompie
set GBDK=..\..\gbdk
set GBDKLIB="%GBDK%"\lib\small\asxxxx\
set OBJ=build

echo Cleanup...

if exist %OBJ% rd /s/q %OBJ%
if exist %PROJ%.gb del %PROJ%.gb
if exist %PROJ%.sym del %PROJ%.sym
if exist %PROJ%.map del %PROJ%.map

if not exist %OBJ% mkdir %OBJ%

echo COMPILING WITH SDCC4...

call sdcc4\sdcc-assemble.bat %OBJ%\sdcc4_stub.rel sdcc4\sdcc4stub\__sdcc_call_hl.s

call sdcc4\sdcc-compile.bat src\00_title_gfx_data.c -bo1 -o %OBJ%\00_title_gfx_data.rel
call sdcc4\sdcc-compile.bat src\01_anim_gfx_data.c -bo2 -o %OBJ%\01_anim_gfx_data.rel
call sdcc4\sdcc-compile.bat src\02_rooms_gfx_data0.c -bo3 -o %OBJ%\02_rooms_gfx_data0.rel
call sdcc4\sdcc-compile.bat src\02_rooms_gfx_data1_0.c -bo4 -o %OBJ%\02_rooms_gfx_data1_0.rel
call sdcc4\sdcc-compile.bat src\02_rooms_gfx_data1_1.c -bo5 -o %OBJ%\02_rooms_gfx_data1_1.rel

call sdcc4\sdcc-compile.bat src\%PROJ%.c -o %OBJ%\%PROJ%.rel

echo LINKING WITH GBDK...

%GBDK%\bin\link-gbz80.exe -n -- -z -m -j -yt1 -yo8 -k%GBDKLIB%\gbz80\ -lgbz80.lib -k%GBDKLIB%\gb\ -lgb.lib mushroompie.gb %GBDKLIB%\gb\crt0.o build\sdcc4_stub.rel build\00_title_gfx_data.rel build\01_anim_gfx_data.rel build\02_rooms_gfx_data0.rel build\02_rooms_gfx_data1_0.rel build\02_rooms_gfx_data1_1.rel build\mushroompie.rel

echo DONE!