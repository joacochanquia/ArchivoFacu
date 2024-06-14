program TP2EJ5;

uses sysutils;

const
     VALORALTO = 'zzz';

type
  tipo = record
    par : string[50];
    loc : string[50];
    bar : integer;
    cantN : longint;
    cantA : longint;
  end;
  tArch = File of tipo;

procedure Leer(var d:tArch; var p:tipo);
begin
	if (not eof(d)) then begin
		read(d,p);
        end
        else begin
		p.par := VALORALTO;
                p.loc := VALORALTO;
        end;

end;

var
   arch : tArch;
   tnp, tap, tnl, tal : integer;
   par, loc : string[50];
   p : tipo;

begin
     assign(arch, 'poblacionVulnerable.dat');
     reset(arch);
     Leer(arch,p);
     while (not eof(arch)) do begin
           par := p.par;
           writeln(concat('Partido: ',par));
           tnp := 0;
           tap := 0;
           while (par = p.par) do begin
                 loc := p.loc;
                 writeln(concat('Localidad ',loc,':'));
                 tnl := 0;
                 tal := 0;
                 while (loc = p.loc) do begin
                       writeln(concat('Cantidad ninios: ',IntToStr(p.cantN),'      Cantidad adultos: ',IntToStr(p.cantA)));
                       tnl := tnl + p.cantN;
                       tal := tal + p.cantA;
                       tnp := tnp + p.cantN;
                       tap := tap + p.cantA;
                       Leer(arch,p);
                 end;
                 writeln(concat('Total ninios localidad ',loc,': ',IntToStr(tnl),'      Total adultos localidad ',loc,': ',IntToStr(tal)));
           end;
           writeln(concat('TOTAL NINIOS PARTIDO: ',IntToStr(tnp),'      TOTAL ADULTOS PARTIDO: ',IntToStr(tap)));
           writeln();
     end;
     close(arch);
     readln();
end.

