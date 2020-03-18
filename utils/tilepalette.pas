unit tilepalette;

interface

uses  windows, classes, sysutils;

const tile_row_size  = 2;
      tile_rows      = 8;
      tile_size      = tile_row_size * tile_rows;

      rom_tile_width = 16;

type  pchrbuf           = ^tchrbuf;
      tchrbuf           = array[0..tile_rows - 1, 0..tile_row_size - 1] of char;

type  tTilePalette      = class(tList)
        destructor  destroy; override;
        function    IndexOf(const abuf: tchrbuf): longint;
        function    AddTile(const abuf: tchrbuf): longint;
        function    AddRawTile(const abuf: tchrbuf): longint;
        function    GetTile(idx: longint; var abuf: tchrbuf): boolean;
        function    TileToArray(idx: longint): ansistring;
        procedure   Save(const afilename: ansistring);
        procedure   Load(const afilename: ansistring);
      end;

implementation

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

function tTilePalette.AddTile(const abuf: tchrbuf): longint;
var buf : pchrbuf;
begin
  result:= IndexOf(abuf);
  if (result < 0) then begin
    buf:= allocmem(sizeof(abuf));
    buf^:= abuf;
    result:= add(buf);
  end;
end;

function tTilePalette.AddRawTile(const abuf: tchrbuf): longint;
var buf : pchrbuf;
begin
  buf:= allocmem(sizeof(abuf));
  buf^:= abuf;
  result:= add(buf);
end;

function tTilePalette.GetTile(idx: longint; var abuf: tchrbuf): boolean;
begin
  result:= (idx >= 0) and (idx < count);
  if result then abuf:=  pchrbuf(items[idx])^;
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

procedure tTilePalette.Save(const afilename: ansistring);
var i : longint;
begin
  with tMemoryStream.create do try
    for i:= 0 to count - 1 do write(pchrbuf(items[i])^, sizeof(tchrbuf));
    SaveToFile(afilename);
  finally free; end;
  writeln(afilename, ' saved: ', count, ' tiles');
end;

procedure tTilePalette.Load(const afilename: ansistring);
var i : longint;
begin
  with tMemoryStream.create do try
    LoadFromFile(afilename);
    seek(0, soFromBeginning);
    i:= 0;
    while (i < size) do begin
      AddRawTile(pchrbuf(pansichar(memory) + i)^);
      inc(i, sizeof(tchrbuf));
    end;
  finally free; end;
  writeln(afilename, ' loaded: ', count, ' tiles');
end;

end.