sdcc -mgbz80 --no-std-crt0 --data-loc 0xc0a0 -L "%GBDK%\lib" "%GBDK%\lib\crt0.rel" gb.lib -o a.ihx %*
