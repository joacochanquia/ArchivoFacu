program TP1EJ2;

type
	tArch = File of integer;

var
	arch : tArch;
	num, max, min : integer;
	nombreArchivo : string;

BEGIN
	write ('Ingrese el nombre del archivo: ');
	readln (nombreArchivo);
	Assign (arch, nombreArchivo);
	reset (arch);
	max := -1;
	min := 32767;
	repeat
		read(arch, num);
		writeln(num);
		if (num < min) then
			min := num;
		if (num > max) then
			max := num;
	until (eof(arch));
	close(arch);
	write('El numero maximo de habitantes es '); writeln(max);
	write('El numero minimo de habitantes es '); writeln(min);
	
END.
