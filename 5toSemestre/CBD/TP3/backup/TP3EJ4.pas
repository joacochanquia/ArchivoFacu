program TP3EJ4;

type
  tipo = record
    cod : integer;
    nom : string[50];
    alb : string[50];
    gen : string[50};
    art : string[50];
    des : string[50];
    anio : integer;
    cant : integer;
  end;
  tArch = File of tipo;

procedure Obsoletizar(a : tArch; cod : integer);
var cd : tipo;
begin
     reset(a);
     cd.cod := -1;
     while((cd.cod <> cod)and(not eof(a))) do begin
          read(a,cd);
     end;
     if(cd.cod = cod) then begin
          cd.cant := 0;
          seek(filepos(a)-1);
          write(a,cd);
     end;
end;

procedure Compactar(a: tArch);
var
  cd : tipo;
  pos : integer;
begin
     reset(a);
     while(not eof(a)) do begin
          read(a,cd);
          if (cd.cant = 0) then begin
               pos := filepos(a)-1;
               seek(filesize(a)-1);
               read(a,cd);
               seek(a,pos);
               write(a,cd);
               seek(filesize(a)-1);
               truncate(a);
               seek(pos);
          end;
     end;
end;

begin
end.

