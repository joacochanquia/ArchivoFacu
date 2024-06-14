program GENERICO;

const
     VALORALTO = 30000;

type
  tipo = record
    cod : integer;
    nom : string[50];
    gen : string[50];
    fech : integer;
    cant : longint;
  end;
  tArch = File of tipo;
  vecArch = array [1 .. 20] of tArch;
  vecTipo = array [1 .. 20] of tipo;

procedure Leer(var d:tArch; var p:tipo);
begin
	if (not eof(d)) then begin
		read(d,p);
        end
        else
		p.cod := VALORALTO;
end;

function Fin(var p : vecTipo) : boolean;
var
     i : integer;
begin
     Fin := true;
     for i:=1 to 20 do begin
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
     for i:=1 to 20 do begin
         if (p[i].cod < mincod) then begin
                 Minimo := i;
                 mincod := p[i].cod;
         end
     end;
end;

begin
end.

