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
    verbose       : boolean;
begin
  fn:= paramstr(1);
  verbose:= (AnsiCompareText(paramstr(2), '-debug') = 0);
  if fileexists(fn) then begin
    src    := tMemoryStream.create;
    dest   := tMemoryStream.create;
    try
      src.LoadFromFile(fn);

      p:= pansichar(src.Memory);
      e:= p + src.Size;
      while (p < e) do try
        b:= byte(p^);
        if (b and mask_flags = mask_flags) then begin
          if (b and mask_counter <> 0) then begin
            inc(p); c:= byte(p^);
            if verbose then write(inttohex(b, 2), ' ', inttohex(c, 2), ' --> ');
            for i:= 0 to (b and mask_counter) - 1 do begin dest.Write(c, 1); if verbose then write(inttohex(c, 2), ' '); end;
            if verbose then writeln;
          end else begin dest.Write(b, 1); if verbose then writeln(inttohex(b, 2)); end;
        end else begin dest.Write(b, 1); if verbose then writeln(inttohex(b, 2)); end;
      finally inc(p); end;
      dest.SaveToFile(changefileext(fn, '.decompressed'));
    finally
      freeandnil(src);
      freeandnil(dest);
    end;
  end else writeln('rlecompress.exe <file_to_decompress> [-debug]');
end.
