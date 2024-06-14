program TP2EJ9;

const
  VALORALTO = 30000;
  FILES = 5;

type
  tipo = record
     DNI : integer;
     ape : string[50];
     nom : string[50];
     km : longint;
     carr : integer;
  end;
  tArch = File of tipo;
  vecArch = array [1..FILES] of tArch;
  vecTipo = array [1..FILES] of tipo;

function Leer (var d : tArch; var p : tipo);
begin
     if (not eof(d)) then begin
        read(d,p);
     end
     else
         p.cod := VALORALTO;
end;
function Minimo (v : vecTipo) : integer;   
var
  i : integer;
  min : integer;
begin
     Minimo := VALORALTO;
     min := VALORALTO;
     for i:=1 to FILES do begin
         if (v[i].DNI < min) then begin
            min := v[i].DNI;
            Minimo := i;
         end;
     end;
end;
function Fin (v : vecTipo) : integer;
var
  i : integer;
begin
     Fin := true;
     for i:=1 to FILES do begin
         if (v[i].DNI <> VALORALTO) then
            Fin := false;
     end;
end;

procedure CrearMaestro(m : tArch; d : vecArch);
var
  p : vecTipo;
  min, i : integer;
  pm : tipo;
begin
     for i:=1 to FILES do begin
          Leer(d[i],p[i]);
     end;
     pm.DNI := VALORALTO;
     while (not Fin(p)) do begin
          min := Minimo(p);
          if (p[min].DNI = pm.DNI) then begin
               pm.km += p[min].km;
               pm.carr += p[min].carr;
          end
          else begin
               if (pm.DNI <> VALORALTO) then
                  write(m,pm);
               pm := p[min];
          end;
          Leer(d[min],p[min])
     end;
     write(m,pm);
end.

