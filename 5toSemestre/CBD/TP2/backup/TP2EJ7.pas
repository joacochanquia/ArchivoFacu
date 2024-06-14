program TP2EJ7;

uses
  sysutils, StrUtils;

const
     VALORALTO = 30000;

type
  tipoMas = record
    cod : integer;
    nom : string[50];
    des : string[100];
    pre : integer;
    stock : longint;
    min : longint;
  end;
  tArchMas = File of tipoMas;
  tipo = record
    cod : integer;
    cant : longint;
  end;
  tArch = File of tipo;
  vecArch = array [1 .. 10] of tArch;
  vecTipo = array [1 .. 10] of tipo;

procedure Leer(var d:tArch; var p:tipo);
begin
	if (not eof(d)) then begin
		read(d,p);
        end
        else
		p.cod := VALORALTO;
end;

function Fin(p : vecTipo) : boolean;
var
     i : integer;
begin
     Fin := true;
     for i:=1 to 10 do begin
         if (p[i].cod <> VALORALTO) then
            Fin := false;
     end;
end;

function Minimo(p : vecTipo) : integer;
var
     mincod, i : integer;
begin
     Minimo := VALORALTO;
     mincod := VALORALTO;
     for i:=1 to 10 do begin
         if (p[i].cod < mincod) then begin
                 Minimo := i;
                 mincod := p[i].cod;
         end
     end;
end;

procedure CrearMaestro(var m : tArchMas);
var
     p : Text;
     linea : string;
     a : tipoMas;
begin
     assign (p, 'productos.txt');
     reset (p);
     while (not eof(p)) do begin
           read(p,a.cod);
           read(p,a.pre);
           read(p,a.stock);
           read(p,a.min);
           read(p,linea);
           a.nom := ExtractDelimited(1, linea, [';']);
           a.des := ExtractDelimited(2, linea, [';']);
           write(m,a);
     end;
     close(p);
end;

procedure ActualizarMaestro(var m : tArchMas; var d : vecArch);
var
     i, min, cod : integer;
     p : vecTipo;
     pm : tipoMas;
begin
     for i:=1 to 10 do begin
          Leer(d[i],p[i]);
     end;
     seek(m,0);
     pm.cod := VALORALTO;
     while (not Fin(p)) do begin
          min := Minimo(p);
          while (pm.cod <> p[min].cod) do begin
              read(m,pm)
          end;
          writeln(pm.cod,': Stock antes = ',pm.stock);
          pm.stock := pm.stock - p[min].cant;
          writeln(pm.cod,': Stock despues = ',pm.stock);
          seek(m,FilePos(m)-1);
          write(m,pm);
          Leer(d[min],p[min]);
     end;
end;

var
     m : tArchMas;
     pm : tipoMas;
     d : vecArch;
     i : integer;
begin
     assign(m,'producMaster.dat');
     {rewrite(m);
     CrearMaestro(m);
     close(m);}
     reset(m);
     for i:=1 to 10 do begin
         assign(d[i],concat('producdet',IntToStr(i),'.dat'));
         reset(d[i]);
     end;
     ActualizarMaestro(m,d);
     for i:=1 to 10 do begin
         close(d[i]);
     end;

     seek(m,0);
     while (not eof(m)) do begin
         read(m,pm);
         writeln('Codigo: ', pm.cod);
         writeln('Nombre: ', pm.nom);
         writeln('Descripcion: ', pm.des);
         writeln('Precio: ', pm.pre);
         writeln('Stock: ', pm.stock);
         writeln('Minimo: ', pm.min);
         writeln();
     end;
     close(m);

     readln();
End.
