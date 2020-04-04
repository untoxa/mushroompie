@echo off
set PROJ=mushroompie
set BIN=..\..\gbdk-n\bin
set OBJ=build

if exist %OBJ% rd /s/q %OBJ%
if exist %PROJ%.gb del %PROJ%.gb

if not exist %OBJ% mkdir %OBJ%

call %BIN%\gbdk-n-compile.bat src\00_title_gfx_data.c -o %OBJ%\00_title_gfx_data.rel
call %BIN%\gbdk-n-compile.bat src\01_anim_gfx_data.c -o %OBJ%\01_anim_gfx_data.rel
call %BIN%\gbdk-n-compile.bat src\02_rooms_gfx_data0.c -o %OBJ%\02_rooms_gfx_data0.rel
call %BIN%\gbdk-n-compile.bat src\02_rooms_gfx_data1_0.c -o %OBJ%\02_rooms_gfx_data1_0.rel
call %BIN%\gbdk-n-compile.bat src\02_rooms_gfx_data1_1.c -o %OBJ%\02_rooms_gfx_data1_1.rel

call %BIN%\gbdk-n-compile.bat src\%PROJ%.c -o %OBJ%\%PROJ%.rel

call %BIN%\gbdk-n-link.bat %OBJ%\00_title_gfx_data.rel %OBJ%\01_anim_gfx_data.rel %OBJ%\02_rooms_gfx_data0.rel %OBJ%\02_rooms_gfx_data1_0.rel %OBJ%\02_rooms_gfx_data1_1.rel %OBJ%\%PROJ%.rel -o %OBJ%\%PROJ%.ihx 

call %BIN%\gbdk-n-make-rom.bat %OBJ%\%PROJ%.ihx %PROJ%.gb
