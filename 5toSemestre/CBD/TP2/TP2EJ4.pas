program TP2EJ4;

Uses sysutils;

const
     VALORALTO = 30000;

type
  tPeli = record
    cod : integer;
    nom : string[50];
    gen : string[50];
    dir : string[50];
    fech : integer;
    cant : longint;
  end;
  tArch = File of tPeli;
  vecArch = array [1 .. 20] of tArch;
  vecPeli = array [1 .. 20] of tPeli;

procedure Leer(var d:tArch; var p:tPeli);
begin
	if (not eof(d)) then begin
		read(d,p);
        end
        else
		p.cod := VALORALTO;
end;

function Fin(var p : vecPeli) : boolean;
var
     i : integer;
begin
     Fin := true;
     for i:=1 to 20 do begin
         if (p[i].cod <> VALORALTO) then
            Fin := false;
     end;
end;

function Minimo(p : vecPeli) : integer;
var
     mincod, i : integer;
begin
     Minimo := VALORALTO;
     mincod := VALORALTO;
     for i:=1 to 20 do begin
         if (p[i].cod < mincod) then begin
                 Minimo := i;
                 mincod := p[i].cod;
         end
     end;
end;

procedure CrearMaestro(d : vecArch; ruta : string);
var
     m : tArch; min, i : integer; p : vecPeli; pm : tPeli;
begin
     assign(m,concat(ruta,'pelimaster.dat'));
     rewrite(m);
     for i:=1 to 20 do begin
         seek(d[i],0);
         Leer(d[i],p[i]);
     end;
     pm.cod := VALORALTO;
     while (not Fin(p)) do begin
         min := Minimo(p);
         if (pm.cod <> p[min].cod) then begin
            if(pm.cod <> VALORALTO)then write (m,pm);
            pm := p[min];
            pm.cant := 0;
         end;
         pm.cant := pm.cant + p[min].cant;
         Leer(d[min],p[min]);
     end;
     write (m,pm);
     close (m);
end;

var
     d : vecArch;
     i : integer;
     m : tArch;
     p : tPeli;

begin
     for i := 1 to 20 do begin
         assign(d[i], concat('pelidet',IntToStr(i),'.dat'));
	 reset(d[i]);
     end;
     CrearMaestro(d,'');
     for i := 1 to 20 do begin
	 close(d[i]);
     end;
     assign(m,'pelimaster.dat');
     reset(m);
     while (not eof(m)) do begin
        read(m, p);
        writeLn('Codigo: ', p.cod);
        writeLn('Nombre: ', p.nom);
        writeLn('Genero: ', p.gen);
        writeLn('Director: ', p.dir);
        writeLn('Fecha de estreno: ', p.fech);
        writeLn('Cantidad asistentes: ', p.cant);
        writeLn;
     end;
     close(m);
     readln();
end.

