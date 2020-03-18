{$APPTYPE CONSOLE}
uses  windows, classes, sysutils;

const mask_flags      : byte = $c0;
      mask_counter    : byte = $3f;
      last_byte_token : byte = $c1; // 0xc1, <byte> means 1 repeat of byte

function lookahead(ch: ansichar; pt: pansichar; size: longint): byte;
begin
  result:= 0;
  while (size > 0) and (pt[result] = ch) and (result < mask_counter - 1) do begin
    inc(result);
    dec(size);
  end;
end;

var src, dest     : tMemoryStream;
    fn            : ansistring;
    p, e          : pansichar;
    b, cnt, token : byte;
    tileofs       : byte;
    i             : longint;
begin
  fn:= paramstr(1); tileofs:= strtointdef(paramstr(2), 0);
  if tileofs <> 0 then writeln('using tile offset:', tileofs);
  if fileexists(fn) then begin
    src    := tMemoryStream.create;
    dest   := tMemoryStream.create;
    try
      src.LoadFromFile(fn);
      if tileofs <> 0 then begin
        p:= pansichar(src.Memory);
        for i:= 0 to src.Size - 1 do begin
          if (p^ <> #0) then p^:= chr(ord(p^) + tileofs);
          inc(p);
        end;
      end;

      p:= pansichar(src.Memory);
      e:= p + src.Size;
      while (p < e) do try
        b:= byte(p^);
        if (b and mask_flags = mask_flags) then begin
          if (b and mask_counter <> 0) then begin
            if (e - p > 1) then begin
              cnt:= lookahead(ansichar(b), p + 1, e - p - 1);
              token:= mask_flags or (cnt + 1);
              dest.Write(token, 1);
              dest.Write(b, 1);
              inc(p, cnt);
            end else begin
              dest.Write(last_byte_token, 1);
              dest.Write(b, 1)
            end;
          end else dest.Write(b, 1); // just write 0xc0 byte - not a valid compression sequence
        end else begin
          if (e - p > 1) then begin
            cnt:= lookahead(ansichar(b), p + 1, e - p - 1);
            if (cnt > 0) then begin
              token:= mask_flags or (cnt + 1);
              dest.Write(token, 1);
              dest.Write(b, 1);
              inc(p, cnt);
            end else begin
              dest.write(b, 1);
            end
          end else begin
            dest.write(b, 1);
          end;
        end;
      finally inc(p); end;
      dest.SaveToFile(changefileext(fn, '.rle'));
    finally
      freeandnil(src);
      freeandnil(dest);
    end;
  end else writeln('rlecompress.exe <file_to_compress>');
end.
