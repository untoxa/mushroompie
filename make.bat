@echo off
set PROJ=mushroompie
set GBDK=..\..\gbdk
set OBJ=build

if exist %OBJ% rd /s/q %OBJ%
if exist %PROJ%.gb del %PROJ%.gb
if exist %PROJ%.sym del %PROJ%.sym
if exist %PROJ%.map del %PROJ%.map

if not exist %OBJ% mkdir %OBJ%

echo COMPILING WITH SDCC4...
call sdcc4\sdcc-assemble.bat %OBJ%\sdcc4_stub.rel src\sdcc4\__sdcc_call_hl.s src\sdcc4\div.s src\sdcc4\mul.s

call sdcc4\sdcc-compile.bat src\00_title_gfx_data.c -o %OBJ%\00_title_gfx_data.rel
call sdcc4\sdcc-compile.bat src\01_anim_gfx_data.c -o %OBJ%\01_anim_gfx_data.rel
call sdcc4\sdcc-compile.bat src\02_rooms_gfx_data0.c -o %OBJ%\02_rooms_gfx_data0.rel
call sdcc4\sdcc-compile.bat src\02_rooms_gfx_data1_0.c -o %OBJ%\02_rooms_gfx_data1_0.rel
call sdcc4\sdcc-compile.bat src\02_rooms_gfx_data1_1.c -o %OBJ%\02_rooms_gfx_data1_1.rel

call sdcc4\sdcc-compile.bat src\%PROJ%.c -o %OBJ%\%PROJ%.rel

echo LINKING WITH GBDK...
@rem %GBDK%\bin\lcc.exe -Wl-m -Wl-j -Wl-yt2 -Wl-yo8 -Wl-ya1 -o %PROJ%.gb %OBJ%\sdcc4_stub.rel %OBJ%\00_title_gfx_data.rel %OBJ%\01_anim_gfx_data.rel %OBJ%\02_rooms_gfx_data0.rel %OBJ%\02_rooms_gfx_data1_0.rel %OBJ%\02_rooms_gfx_data1_1.rel %OBJ%\%PROJ%.rel
%GBDK%\bin\lcc.exe -Wl-m -Wl-j -Wl-yt1 -Wl-yo8 -o %PROJ%.gb %OBJ%\sdcc4_stub.rel %OBJ%\00_title_gfx_data.rel %OBJ%\01_anim_gfx_data.rel %OBJ%\02_rooms_gfx_data0.rel %OBJ%\02_rooms_gfx_data1_0.rel %OBJ%\02_rooms_gfx_data1_1.rel %OBJ%\%PROJ%.rel

echo DONE!