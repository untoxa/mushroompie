@echo off
set PROJ=mushroompie
set BIN=..\..\gbdk-n\bin
set OBJ=build

if "%1"=="clean" (
	if exist %OBJ% rd /s/q %OBJ%
	if exist %PROJ%.gb del %PROJ%.gb
	goto end
)

if not exist %OBJ% mkdir %OBJ%

call %BIN%\gbdk-n-compile.bat src\%PROJ%.c -o %OBJ%\%PROJ%.rel
call %BIN%\gbdk-n-link.bat %OBJ%\%PROJ%.rel -o %OBJ%\%PROJ%.ihx
call %BIN%\gbdk-n-make-rom.bat %OBJ%\%PROJ%.ihx %PROJ%.gb

:end
