{$APPTYPE CONSOLE}
uses  windows, classes, sysutils;

const mask_flags      : byte = $c0;
      mask_counter    : byte = $3f;
      last_byte_token : byte = $c1; // 0xc1, <byte> means 1 repeat of byte

var src, dest     : tMemoryStream;
    fn            : ansistring;
    p, e          : pansichar;
    b, c          : byte;
    i             : longint;
begin
  fn:= paramstr(1);
  if fileexists(fn) then begin
    src    := tMemoryStream.create;
    dest   := tMemoryStream.create;
    try
      src.LoadFromFile(fn);

      p:= pansichar(src.Memory);
      e:= p + src.Size;
      while (p < e) do try
        b:= byte(p^);
        if (b and mask_flags <> 0) then begin
          if (b and mask_counter <> 0) then begin
            inc(p); c:= byte(p^);
            for i:= 0 to (b and mask_counter) - 1 do dest.Write(c, 1);
          end else dest.Write(b, 1);
        end else dest.Write(b, 1);
      finally inc(p); end;
      dest.SaveToFile(changefileext(fn, '.decompressed'));
    finally
      freeandnil(src);
      freeandnil(dest);
    end;
  end else writeln('rlecompress.exe <file_to_compress>');
end.
