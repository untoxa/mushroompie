{$APPTYPE CONSOLE}
uses  windows, classes, sysutils,
      tilepalette;

const tile_row_size  = 2;
      tile_rows      = 8;
      tile_size      = tile_row_size * tile_rows;

      rom_tile_width = 16;

const height_in_tiles  = (272 div 8);
      width_in_tiles   = (1440 div 8);

type  tGlobalMap = array [0..height_in_tiles - 1, 0..width_in_tiles - 1] of word;
      tRoom      = array [0..16, 0..29] of char;

var   fn          : ansistring;
      chrbuf      : tchrbuf;
      tiles       : tTilePalette;
      bmp         : tMemoryStream;
      p1, p2, p3  : pansichar;
      i, j, k, d, l  : longint;
      y, x        : longint;
      ch          : byte;
      globalmap   : tGlobalMap;
      room        : tRoom;

begin
  fn:= paramstr(1);

  if fileexists(fn) then begin
    tiles:= tTilePalette.create;
    bmp:= tMemoryStream.create;
    try
      bmp.LoadFromFile(fn);

      fillchar(globalmap, sizeof(globalmap), 0);

      fillchar(chrbuf, sizeof(chrbuf), 0);
      tiles.AddTile(chrbuf); // zero tile

      p1:= bmp.memory;
      inc(p1, plongint(p1 + $0a)^);
      y:= height_in_tiles - 1; x:= 0;
      l:= 0;
      for i:= 0 to (272 div 8) - 1 do begin
        p2:= p1;
        for j:= 0 to (1440 div 8) - 1 do begin
          p3:= p2;
          fillchar(chrbuf, sizeof(chrbuf), 0);
          for k:= 7 downto 0 do begin
            d:= plongint(p3)^;
            ch:= d and $ff;
            chrbuf[k, 0]:= char(((ch shl 2) and $80) or ((ch shl 5) and $40));
            chrbuf[k, 1]:= char(((ch shl 3) and $80) or ((ch shl 6) and $40));
            ch:= (d shr 8) and $ff;
            chrbuf[k, 0]:= char(byte(chrbuf[k, 0]) or ((ch shl 0) and $20) or ((ch shl 3) and $10));
            chrbuf[k, 1]:= char(byte(chrbuf[k, 1]) or ((ch shl 1) and $20) or ((ch shl 4) and $10));
            ch:= (d shr 16) and $ff;
            chrbuf[k, 0]:= char(byte(chrbuf[k, 0]) or ((ch shr 2) and $8) or ((ch shl 1) and $4));
            chrbuf[k, 1]:= char(byte(chrbuf[k, 1]) or ((ch shr 1) and $8) or ((ch shl 2) and $4));
            ch:= (d shr 24) and $ff;
            chrbuf[k, 0]:= char(byte(chrbuf[k, 0]) or ((ch shr 4) and $2) or ((ch shr 1) and $1));
            chrbuf[k, 1]:= char(byte(chrbuf[k, 1]) or ((ch shr 3) and $2) or ((ch shl 0) and $1));
            inc(p3, 1440 div 2);
          end;
          globalmap[y, x]:= tiles.AddTile(chrbuf);
          inc(x);
          inc(p2, 4);
          inc(l);
        end;
        dec(y); x:= 0;
        inc(p1, (1440 div 2) * 8);
      end;
      writeln('total tiles: ', tiles.count, ' tiles parsed: ', l);

      tiles.Save(changefileext(fn, '.2bpp'));

      for i:= 0 to height_in_tiles div 17 - 1 do
        for j:= 0 to width_in_tiles div 30 - 1 do begin
          with tTilePalette.create do try
            fillchar(chrbuf, sizeof(chrbuf), 0);
            AddTile(chrbuf);

            fillchar(room, sizeof(room), 0);
            for y:= 0 to 16 do
              for x:= 0 to 29 do begin
                k:= globalmap[i * 17 + y, j * 30 + x];
                if tiles.GetTile(k, chrbuf) then room[y, x]:= chr(AddTile(chrbuf))
                                            else writeln('ERROR! Tile: ', k, ' not found!');
              end;
            Save(format('room_%d_%d_tiles.2bpp', [j, i]));
            bmp.Size:= 0;
            bmp.Write(room, sizeof(room));
            bmp.SaveToFile(format('room_%d_%d_map.raw', [j, i]));

          finally free; end;
        end;

    finally
      freeandnil(bmp);
      freeandnil(tiles);
    end;
  end;
end.
