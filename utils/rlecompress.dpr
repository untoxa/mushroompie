{$APPTYPE CONSOLE}
uses  windows, classes, sysutils;

const mask_flags      : byte = $c0;
      mask_counter    : byte = $3f;
      last_byte_token : byte = $c1; // 0xc1, <byte> means 1 repeat of byte

type tRLECompressor = class(tMemoryStream)
     private
       fCount       : longint;
       fLast        : byte;
       procedure  EncodeByte(avalue: byte);
     public
       procedure  Start;
       function   Write(const buffer; count: longint): longint; override;
       function   Stop: longint;
     end;

{ tRLECompressor }

procedure tRLECompressor.Start;
begin
  Clear;
  FCount:= 0;
end;

function tRLECompressor.Stop: longint;
var tmp : byte;
begin
  if (fCount > 0) then begin
    if (fCount = 1) then begin
      if (fLast <> mask_flags) then begin
        if (fLast and mask_flags = mask_flags) then begin
          tmp:= mask_flags or fCount;
          inherited Write(tmp, 1);
          inherited Write(fLast, 1);
        end else inherited Write(fLast, 1);
      end else inherited Write(fLast, 1);
    end else begin
      tmp:= mask_flags or fCount;
      inherited Write(tmp, 1);
      inherited Write(fLast, 1);
    end;
  end;
  fCount:= 0;
  result:= Size;
end;

procedure tRLECompressor.EncodeByte(avalue: byte);
begin
  if (fCount > 0) then begin
    if (fLast <> avalue) then begin
      Stop;
      fLast:= avalue; fCount:= 1;
    end else begin
      if (fCount < mask_counter) then begin
        inc(fCount);
      end else begin
        Stop;
        fLast:= avalue; fCount:= 1;
      end;
    end;
  end else begin
    fLast:= avalue; fCount:= 1;
  end;
end;

function tRLECompressor.Write(const buffer; count: Integer): longint;
var  pt : ^byte;
begin
  pt:= @buffer;
  for result:= 0 to count - 1 do begin
    EncodeByte(pt^); inc(pt);
  end;
  result:= count;
end;

var src      : tMemoryStream;
    dest     : tRLECompressor;
    fn       : ansistring;
    p        : pansichar;
    tileofs  : byte;
    i        : longint;

begin
  fn:= paramstr(1); tileofs:= strtointdef(paramstr(2), 0);
  if tileofs <> 0 then writeln('using tile offset:', tileofs);
  if fileexists(fn) then begin
    src    := tMemoryStream.create;
    dest   := tRLECompressor.create;
    try
      src.LoadFromFile(fn);

      if tileofs <> 0 then begin
        p:= pansichar(src.Memory);
        for i:= 0 to src.Size - 1 do begin
          if (p^ <> #0) then p^:= chr(ord(p^) + tileofs);
          inc(p);
        end;
      end;

      with dest do try
        Start;
        try Write(src.Memory^, src.Size);
        finally Stop; end;
      finally SaveToFile(changefileext(fn, '.rle')); end;
      
    finally
      freeandnil(src);
      freeandnil(dest);
    end;
  end else writeln('rlecompress.exe <file_to_compress>');
end.
