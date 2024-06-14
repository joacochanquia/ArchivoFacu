program TP3EJ5;

uses strutils, sysutils;

type
  tipo = record
    cod : integer;
    des : string[50];
    col : string[50];
    tal : integer;
    stock : integer;
    pre : integer;
  end;
  tArch = File of tipo;

procedure BajaLogYGuar(ab : tArch; at : Text; cod : integer);
var
   linea : string;
   p : tipo;
begin
     reset(ab);
     append(at);
     while((p.cod < cod)and(not eof(ab)) do begin
          read(ab,p);
     end;
     if (p.cod = cod) then begin
          linea := IntToStr(p.cod);
          linea := concat(linea,' ',IntToStr(p.tal));
          linea := concat(linea,' ',IntToStr(p.stock));
          linea := concat(linea,' ',IntToStr(p.pre));
          linea := concat(linea,' ',p.des);
          linea := concat(linea,';',p.col);
          write(at,linea);
          seek(ab,filepos(ab)-1);
          p.stock := -1;
          write(ab,p);
     end;
     close(ab);
     close(at);
end;

procedure CompactarEnNuevo(var a : tArch);
var
   p : tipo;
   n : tArch;
   nom : string;
begin
     reset(a);
     assign(n,'NOMBRETEMPORAL.dat')
     rewrite(n);
     while(not eof(a)) do begin
          read(a,p);
          if(p.stock <> -1) then begin
               write(n,p);
          end;
     end;
     //getName(a);
     erase(a);
     rename(n,'deportMaster.dat');
     close(a);
     close(n);
     a := n;
end;

end.

