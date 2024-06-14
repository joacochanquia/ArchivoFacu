program TP3EJ1;

type
  tipo = record
    cod : integer;
    nomv : string[50];
    nomc : string[50];
    alt : integer;
    desc : string[100];
    zona : string[50];
  end;
  tArch = File of tipo;

procedure BajaLogica(a : tArch; cod : integer);
var
   t, aux : tipo; pos : integer;
begin
     reset(a);
     while (not eof(a) and t.cod<>cod) do begin
          read(a,t);
     end;
     if (t.cod = cod) then begin
          t.nomv := '@';
          seek(a,filepos(a)-1);
          write(a,t);
     end;
     close(a)
end;

procedure BajaFisica(a : tArch; cod : integer);
var
   t, aux : tipo; pos : integer;
begin
     reset(a);
     while (not eof(a) and t.cod<>cod) do begin
          read(a,t);
     end;
     if (t.cod = cod) then begin
          pos := filepos(a)-1;
          seek(a,filesize(a)-1);
          read(a,aux);
          seek(a,pos);
          write(a,aux);  
          seek(a,filesize(a)-1);
          truncate(a);
     end;
     close(a)
end;

procedure Compactar(a : tArch);
begin
     reset(a);
     while (not eof(a)) do begin
          read(a,t);
          if (t.nomv = '@') then begin
               pos := filepos(a)-1;
               close(a);
               BajaFisica(a,pos);
               reset(a);
               seek(pos);//me pongo en el lugar que reemplace por si el registro que vino del final tmb se tenia que borrar
          end;
     end;
     close(a);
end;

begin
end.

