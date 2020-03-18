{$APPTYPE CONSOLE}
uses  windows, classes, sysutils;

var   src, dest : tMemoryStream;
      fn        : ansistring;
      p, e      : pAnsiChar;
      tmp       : ansistring;
      i         : longint;

const crlf      : pansichar = #$0d#$0a;

begin
  fn:= paramstr(1);

  if fileexists(fn) then begin
    src  := tMemoryStream.create;
    dest := tMemoryStream.create;
    try
      src.LoadFromFile(fn);

      i:= 0;
      p:= pansichar(src.Memory); e:= p + src.Size;
      while p < e do begin
        tmp:= format('0x%.2x,', [byte(p^)]);
        dest.Write(tmp[1], length(tmp));
        inc(i); if (i = 16) then begin dest.Write(crlf^, 2); i:= 0; end;
        inc(p);
      end;

      dest.SaveToFile(changefileext(fn, '.txt'));
    finally
      freeandnil(src);
      freeandnil(dest);
    end;
  end else writeln('bin2txt.exe <binary file>');
end.
