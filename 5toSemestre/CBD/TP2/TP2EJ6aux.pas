program TP2EJ6aux;

type
  tipo = record
    cod : integer;
    monto : longint;
  end;
  tArch = File of tipo;

var
  arch: tArch;
  m: tipo;
  i, j, cant: integer;

begin
  assign(arch, 'mozos.dat');
  rewrite(arch);

  for i:=1 to 10 do begin
      m.cod := i;
      cant := Random(19);
      for j:=0 to cant do begin
          m.monto := Random(9000)+1000;
          write(arch,m);
      end;
  end;

  close(arch);
end.
