program TP2EJ8;

uses
  sysutils, StrUtils;

const
     VALORALTO = 30000;
     FILES = 15;

type
  tipoMas = record
    cod : integer;
    nom : string[50];
    cant : longint;
  end;
  tArchMas = File of tipoMas;
  tipo = record
    cod : integer;
    nom : string[50];
    desc : string[100];
    fecha : string[8];
    cant : longint;
  end;
  tArch = File of tipo;
  vecArch = array [1 .. FILES] of tArch;
  vecTipo = array [1 .. FILES] of tipo;

procedure Leer(var d : tArch; var v : tipo);
begin
   if (not eof(d)) then begin
      read(d,v);
   end
   else
      v.cod := VALORALTO;
end;

function Fin(v : vecTipo): boolean;
var
  i : integer;
begin
  Fin := true;
  for i:=1 to FILES do begin
      if (v[i].cod <> VALORALTO) then
         Fin := false;
  end;
end;

function Minimo(v : vecTipo) : integer;
var
  mincod, i : integer;
begin
  Minimo := VALORALTO;
  mincod := VALORALTO;
  for i:=1 to FILES do begin
      if (v[i].cod < mincod) then begin
         Minimo := i;
         mincod := v[i].cod;
      end;
  end;
end;

procedure CrearMaestro(var m : tArchMas; var d : vecArch);
var
  p : vecTipo;
  min, i : integer;
  pm : tipoMas;
begin
     for i:=1 to FILES do begin
         Leer(d[i],p[i]);
     end;
     seek(m,0);
     pm.cod := VALORALTO;
     while (not Fin(p)) do begin
          min := Minimo(p);
          if (pm.cod = p[min].cod) then begin
               pm.cant += p[min].cant;
          end
          else begin
               if (pm.cod <> VALORALTO) then
                  write(m,pm);
               pm.cod := p[min].cod;
               pm.cant := p[min].cant;
          end;
          Leer(d[min],p[min]);
     end;
     write(m,pm);
end;

var
  i : integer;
  m : tArchMas;
  d : vecArch;
begin
     assign(m,'acueductMaster.dat');
     rewrite(m);
     for i:=1 to FILES do begin
         assign(d[i],concat('acueduct',IntToStr(i),'.dat'));
         reset(d[i]);
     end;
end.

