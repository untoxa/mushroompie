{$APPTYPE CONSOLE}
uses  windows, classes, sysutils, math;

const tile_row_size  = 2;
      tile_rows      = 8;
      tile_size      = tile_row_size * tile_rows;

      rom_tile_width = 16;

type  pchrbuf           = ^tchrbuf;
      tchrbuf           = array[0..tile_rows - 1, 0..tile_row_size - 1] of char;

var   fn, fd, mode      : ansistring;
      s, x, y, ofs, cnt : longint;

      chrbuf            : tchrbuf;
      rct               : tRect;

type  tTilePalette      = class(tList)
        destructor  destroy; override;
        function    IndexOf(const abuf: tchrbuf): longint;
        function    AddTile(const abuf: tchrbuf): ansichar;
        function    TileToArray(idx: longint): ansistring;
      end;

{ tTilePalette }

destructor tTilePalette.destroy;
var i : longint;
    p : pointer;
begin
  for i:= 0 to count - 1 do begin
    p:= items[i];
    if assigned(p) then freemem(p);
  end;
  Clear;
  inherited destroy;
end;

function tTilePalette.IndexOf(const abuf: tchrbuf): longint;
var i : longint;
begin
  result:= -1;
  i:= 0;
  while (i < count) do begin
    if comparemem(items[i], @abuf, sizeof(abuf)) then begin
      result:= i;
      i:= count;
    end else inc(i);
  end;
end;

function tTilePalette.AddTile(const abuf: tchrbuf): ansichar;
var idx : longint;
    buf : pchrbuf;
begin
  idx:= IndexOf(abuf);
  if (idx < 0) then begin
    buf:= allocmem(sizeof(abuf));
    buf^:= abuf;
    idx:= add(buf);
  end;
  result:= chr(idx);
end;

function tTilePalette.TileToArray(idx: longint): ansistring;
var buf : pansichar;
begin
  setlength(result, 0);
  if (idx >= 0) and (idx < count) then begin
    buf:= items[idx];
    if assigned(buf) then
      for idx:= 0 to sizeof(tchrbuf) - 1 do
        result:= format('%s0x%.2x,', [result, byte(buf[idx])]);
  end;
end;

{ misc functions }

function readrect(const arectstr: ansistring; var name: ansistring): tRect;
begin
  fillchar(result, sizeof(result), 0);
  with tStringList.create do try
    CommaText:= arectstr;
    if (count >= 4) then begin
      result.Left:= strtointdef(strings[0], 0);
      result.Top:= strtointdef(strings[1], 0);
      result.Right:= result.Left + strtointdef(strings[2], 0) - 1;
      result.Bottom:= result.Top + strtointdef(strings[3], 0) - 1;
      if (count >= 5) then name:= strings[4] else name:= '';
    end else writeln('ERROR READING RECT: "', arectstr, '"');
  finally free; end;
end;

function coords2ofs(x, y : longint): longint;
begin result:= y * rom_tile_width * tile_size + x * tile_size; end;

{ main }

var tiles       : tTilePalette;
    sprite, ttl : ansistring;
    sidx        : longint;
    txt         : TextFile;
    mode8x16    : boolean = false;
begin
  fn:= paramstr(1);
  fd:= paramstr(2);
  mode:= paramstr(3);
  if (length(mode) > 0) then
    if (AnsiCompareText(mode, '8x16') <> 0) then begin
      writeln('invalid mode: "', mode, '" must be "8x16"');
      halt;
    end else mode8x16:= true;

  if fileexists(fn) and fileexists(fd) then begin
    if mode8x16 then writeln('; using 8x16 mode');
    tiles:= tTilePalette.create;
    s:= FileOpen(fn, fmOpenRead or fmShareDenyNone);
    try
      fillchar(chrbuf, sizeof(chrbuf), 0);
      tiles.AddTile(chrbuf);

      assignfile(txt, fd); reset(txt);
      while not eof(txt) do begin
        readln(txt, sprite);
        rct:= readrect(sprite, ttl);

        setlength(sprite, 4096);
        sidx:= 0;

        y:= rct.Top;
        while y <= rct.Bottom do begin
          for x:= rct.Left to rct.Right do begin
            ofs:= coords2ofs(x, y);
            fileseek(s, ofs, soFromBeginning);
            cnt:= FileRead(s, chrbuf, sizeof(chrbuf));
            if cnt <> sizeof(chrbuf) then begin writeln('ERROR READING FILE!'); halt; end;
            inc(sidx);
            sprite[sidx]:= tiles.AddTile(chrbuf);

            if mode8x16 then begin
              if (y + 1 <= rct.Bottom) then begin
                ofs:= coords2ofs(x, y + 1);
                fileseek(s, ofs, soFromBeginning);
                cnt:= FileRead(s, chrbuf, sizeof(chrbuf));
                if cnt <> sizeof(chrbuf) then begin writeln('ERROR READING FILE!'); halt; end;
              end else fillchar(chrbuf, sizeof(chrbuf), 0);
              inc(sidx);
              sprite[sidx]:= tiles.AddTile(chrbuf);
            end;
          end;
          if mode8x16 then inc(y, 2) else inc(y);
        end;
        setlength(sprite, sidx);

        writeln(format('%s = %d,%d', [ttl, rct.Right - rct.Left + 1, rct.Bottom - rct.Top + 1]));
        for x:= 1 to length(sprite) do begin
          write(format('0x%.2x,', [byte(sprite[x])]));
          if x mod 16 = 0 then writeln;
        end;
        writeln;
      end;
      writeln;
      writeln(tiles.count, ',');
      for x:= 0 to tiles.count - 1 do writeln(tiles.TileToArray(x));
    finally
      closefile(txt);
      FileClose(s);
      freeandnil(tiles);
    end;
  end else writeln('USAGE:'#$0d#$0a'cutter.exe <source> <meta> '#$0d#$0a'OR:'#$0d#$0a'cutter.exe <source> <meta> 8x16');
end.
