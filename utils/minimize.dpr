{$APPTYPE CONSOLE}
uses  windows, classes, sysutils,
      tilepalette;

var   i, j                  : longint;
      src_tiles, dest_tiles : tTilePalette;
      src_map, dest_map     : tMemoryStream;
      chrbuf                : tchrbuf;
      fmap, ftiles          : ansistring;
begin
  fmap:= paramstr(1); ftiles:= paramstr(2);

  if fileexists(fmap) and fileexists(ftiles) then begin
    src_tiles  := tTilePalette.create;
    dest_tiles := tTilePalette.create;
    src_map    := tMemoryStream.create;
    dest_map   := tMemoryStream.create;
    try
      src_tiles.Load(ftiles);
      src_map.LoadFromFile(fmap);

      fillchar(chrbuf, sizeof(chrbuf), 0);
      dest_tiles.AddTile(chrbuf);

      for i:= 0 to src_map.Size - 1 do begin
        if src_tiles.GetTile(ord(pansichar(src_map.memory)[i]), chrbuf) then begin
          j:= dest_tiles.AddTile(chrbuf);
          dest_map.Write(j, 1);
        end;
      end;

      dest_tiles.Save(changefileext(ftiles, '.new.2bpp'));
      dest_map.SaveToFile(changefileext(fmap, '.new.raw'));
    finally
      freeandnil(src_tiles);
      freeandnil(dest_tiles);
      freeandnil(src_map);
      freeandnil(dest_map);
    end;
  end else writeln('minimize.exe <mapfile> <tilefile>');  
end.
