program TP1EJ4;

type
	tArchInt = File of integer;

var
	arch : tArchInt;
	num : integer;
	nombreArchivo : string;
	
procedure crearArchText (var aInt : tArchInt);
var
	aText : Text;
begin
	Assign (aText, 'numerosText.txt');
	rewrite (aText);
	repeat
		read(aInt, num);
		writeln(aText, num);
	until (eof(aInt));
	writeln('archivo creado exitosamente');
	close (aText);
end;
	

BEGIN
	write ('Ingrese el nombre del archivo: ');
	readln (nombreArchivo);
	Assign (arch, nombreArchivo);
	reset (arch);
	crearArchText (arch);
	close(arch);
	
END.
