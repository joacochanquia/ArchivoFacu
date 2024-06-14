program TP3EJ3;

uses
    strutils;

const
  VALORALTO = 30000;

type
  tipo = record
     cod : integer;
     nom : string[50];
     des : string[100];
     stock : longint;
  end;
  tArch = File of tipo;

procedure CrearBinario(var at : Text; var ab : tArch);
var
  linea : string[150];
  p : tipo;
begin
     reset(at);
     rewrite(ab);
     while (not eof(at)) do begin
         read(at,p.cod);
         read(at,p.stock);
         read(at,linea);
         p.nom := ExtractSubstr(linea,1,[';']);
         p.des := ExtractSubstr(linea,2,[';']);
         write(ab,p);
     end;
     close(at);
     close(ab);
end;

procedure BajaLogica(var a : tArch; cod : integer);
var
  p : tipo;
begin
     reset(a); p.cod := VALORALTO;
     while ((p.cod <> cod) and (not eof(a))) do
          read(a,p);
     if (p.cod = cod) then begin
          p.stock := -p.stock;
          seek(a,filepos(a)-1);
          write(a,p);
     end;
     close(a);
end;
procedure EliminarPorTeclado(var a : tArch);
var
  cod : integer;
begin
     writeln('Ingrese codigo a eliminar');
     readln(cod);
     while(cod <> -1) do begin
         BajaLogica(a,cod);
         writeln('Ingrese codigo a eliminar');
         readln(cod);
     end;
end;

procedure Compactar(a : tArch);
var
  p, aux : tipo; pos : integer;
begin
     reset(a);
     while(not eof(a)) do begin
          read(a,p);
          if (p.stock < 0) then begin
               pos := FilePos(a)-1;
               seek(a,filesize(a)-1);
               read(a,p);
               seek(a,pos);
               write(a,p);
               seek(a,filesize(a)-1);
               truncate(a);
               seek(a,pos);
          end;
     end;
     close(a);
end;
procedure agregar(a : tArch; p : tipo);
begin
     Compactar(a);
     reset(a);
     seek(a,filesize(a));
     write(a,p);
     close(a);
end;

procedure BajaListInv(a : tArch; cod : integer);
var
  cab, p : tipo; pos : integer;
begin
     reset(a);
     read(a,cab);
     p.cod := -1;
     while ((p.cod <> cod) and (not eof(a))) do
          read(a,p);
     if (p.cod = cod) then begin
          pos := filepos(a)-1;
          seek(a,pos);
          write(a,cab);
          seek(a,0);
          cab.stock := pos;
          write(a,cab);
     end
     else
         writeln('ese producto no existe');
     close(a);
end;

procedure AltaListInv(a : tArch; p : tipo);
var
  cab : tipo; pos : integer;
begin
     reset(a);
     if(eof(a)) then begin
          cab.stock := -1;
          write(a,cab);
     end
     else
         read(a,cab);
     pos := cab.stock;
     if(pos = -1)then begin
          seek(filesize(a));
     end
     else begin
          seek(a,pos);
          read(a,cab);
          seek(a,0);
          write(a,cab);
          seek(a,pos);
     end;
     write(a,p);
     close(a);
end;

procedure CrearBinarioConLista(at : Text; ab : tArch);
var
  linea : string[150];
  p : tipo;
begin
     reset(at);
     rewrite(ab);
     while (not eof(at)) do begin
         read(at,p.cod);
         read(at,p.stock);
         read(at,linea);
         p.nom := ExtractSubstr(linea,1,';');
         p.desc := ExtractSubstr(linea,2,';');
         AltaListInv(ab,p);
     end;
     close(at);
     close(ab);
end;

procedure programaprincipal();
begin
end.

