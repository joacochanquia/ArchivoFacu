program TP2EJ7aux;

uses sysutils;

const
  FILES = 10;
  MAX_COD = 10;

type
  tipo = record
    cod : integer;
    cant : longint;
  end;
  tArch = File of tipo;
  vecArch = array [1 .. 10] of tArch;

var
  d: vecArch;
  p : tipo;
  i, j, k: integer;

begin
  Randomize;

  // Generar los 10 archivos
  for i := 1 to FILES do begin
       Assign(d[i], 'producdet' + IntToStr(i) + '.dat');
       rewrite(d[i])
  end;
  for i := 1 to FILES do begin
       for j := 1 to MAX_COD do begin
            p.cod := j;
            if (Random(2) = 0) then begin
                 p.cant := Random(90) + 10;
                 write(d[i],p);
            end;
       end;

  end;
  for i := 1 to FILES do begin
       close(d[i])
  end;
end.

