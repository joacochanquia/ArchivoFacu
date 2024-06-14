program TP2EJ6;

uses sysutils;

const
     VALORALTO = 30000;

type
  tipo = record
    cod : integer;
    monto : longint;
  end;
  tArch = File of tipo;

procedure Leer(var d:tArch; var p:tipo);
begin
	if (not eof(d)) then begin
		read(d,p);
        end
        else begin
		p.cod := VALORALTO;
        end;

end;

var
  arch, nuevo : tArch;
  m, b : tipo;

begin
     assign(arch, 'mozos.dat');
     reset(arch);    
     assign(nuevo,'mozosBuenos.dat');
     rewrite(nuevo);
     b.cod := VALORALTO;
     b.monto:= VALORALTO;
     while (not eof(arch)) do begin 
           Leer(arch,m);
           if(m.cod = b.cod) then begin
                    b.monto := b.monto+m.monto;
           end
           else begin
               if (b.cod <> VALORALTO) then write(nuevo,b);
               b := m;
           end;
     end;
     write(nuevo,b);
     close(arch);
     close(nuevo);
     reset(nuevo);
     while(not eof(nuevo)) do begin
           Leer(nuevo,b);
           writeln('Mozo: ',b.cod);
           writeln('Monto total: ',b.monto);
           writeln();
     end;
     close(nuevo);
     readln();

end.

