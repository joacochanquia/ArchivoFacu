program TP3EJ7;

type
  persona = record
       DNI : integer;
       nombre : string[50];
       apellido : string[50];
       sueldo : real;
  end;
  tArchivo = File of Persona

procedure crear(var arch : tArchivo; var info : TEXT);
var
  p : persona; linea : string;
begin
     rewrite(arch);
     reset(info);
     while (not eof(info)) do begin
          read(info,p.DNI);
          read(info,p.sueldo);
          read(info,linea);
          p.nombre := ExtractSubstr(linea,1,';');  
          p.apellido := ExtractSubstr(linea,2,';');
          write(arch,p);
     end;
     close(arch);
     reset(info);
end;

procedure agregar(var arch : tArchivo; p : persona);
var
  cab : persona;
  pos : integer;
begin
     reset(arch);
     read(arch,cab);
     if(cab.DNI = 0) then begin
          seek(arch,filesize(arch);
     end
     else begin
          pos
          seek(arch,cab.DNI);

     end;
end;

procedure eliminar(var arch : tArchivo; DNI : integer);

begin

end;

begin
end.

