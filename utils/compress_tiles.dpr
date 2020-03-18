{$APPTYPE CONSOLE}
uses  windows, classes, sysutils;

type tTile        = array[0..7, 0..1] of byte;
     tTileArray   = array[0..15] of byte;

var fh            : tHandle;
    fn            : ansistring;
    src           : tTile;
    dest          : tTileArray;
    mode          : longint;

function ShrinkTile(const src: tTile; var dest: tTileArray): longint;
var i, j   : longint;
    isnull : boolean;
    isfull : boolean;
    is1    : boolean;
    is2    : boolean;
    is3    : boolean;
begin
  isnull:= true; isfull:= false; is1:= false; is2:= false; is3:= false;
  for i:= 0 to 7 do begin
    isnull:= isnull and ((src[i, 0] = 0) and (src[i, 1] = 0));
    if ((src[i, 0] <> 0) and (src[i, 1] <> 0) and (src[i, 0] <> src[i, 1])) then isfull:= true;
    if ((src[i, 0] <> 0) and (src[i, 1]  = 0)) then is1:= true;
    if ((src[i, 0]  = 0) and (src[i, 1] <> 0)) then is2:= true;
    if ((src[i, 0] <> 0) and (src[i, 1] <> 0) and (src[i, 0] = src[i, 1]))then is3:= true;
  end;
  if isnull then begin
    fillchar(dest, sizeof(dest), 0);
    result:= 0;
  end else
  if isfull then begin
    move(src, dest, sizeof(src));
    result:= 4;
  end else begin
    if is1 then result:= 1 else
    if is2 then result:= 2 else
    if is3 then result:= 3 else result:= -1;
    j:= 0;
    for i:= 0 to 7 do begin
      case result of
        1, 3 : begin dest[j]:= src[i, 0]; inc(j); end;
        2    : begin dest[j]:= src[i, 1]; inc(j); end;
        else   begin writeln('error!'); halt; end;
      end;
    end;
  end;
end;

begin
  fn:= paramstr(1);
  if fileexists(fn) then begin
    fh:= FileOpen(fn, fmOpenRead or fmShareDenyWrite);
    if (fh <> INVALID_HANDLE_VALUE) then try
      while FileRead(fh, src, sizeof(src)) = sizeof(src) do begin
        mode:= ShrinkTile(src, dest);
        write(format('0x%.2x,', [mode]));
        case mode of
          1, 2, 3 : for mode:= 0 to 7 do write(format('0x%.2x,', [dest[mode]]));
          4       : for mode:= 0 to 15 do write(format('0x%.2x,', [dest[mode]]));
        end;
        writeln;
      end;
    finally FileClose(fh); end
  end else writeln('compress_tiles.exe <file_to_compress>');
end.
