program TP3EJ2;

uses
    sysutils, strutils;

Type
  tVehiculo= Record
    codigoVehiculo:integer;
    patente: String[50];
    motor:String[50];
    cantidadPuertas: integer;
    precio:real;
    descripcion:String[50];
  end;
  tArchivo = File of tVehiculo;

Procedure agregar (var a: tArchivo; p: tVehiculo);
var
   cab : tVehiculo;
   pos : integer;
begin
     reset(a);
     if(eof(a)) then begin
          cab.descripcion := IntToStr(-1);
          write(a,cab);
     end
     else
         read(a,cab);
     pos := StrToInt(cab.descripcion);
     if (pos = -1) then
        seek(a,filesize(a));
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

Procedure eliminar (var a: tArchivo; cod: integer);
var 
   cab, act : tVehiculo;
   pos : integer;
begin
     reset(a);
     read(a,cab);
     act.codigoVehiculo := -1;
     while ((act.codigoVehiculo <> cod) and (not eof(a))) do
           read(a,act);
     if (act.codigoVehiculo = cod) then begin
        pos := FilePos(a)-1;
        seek(a,pos);
        write(a,cab);
        seek(a,0);
        cab.descripcion := IntToStr(pos);
        write(a,cab);
     end
     else
         writeln('No existe el vehiculo');
     close(a);
end;

begin

end.

