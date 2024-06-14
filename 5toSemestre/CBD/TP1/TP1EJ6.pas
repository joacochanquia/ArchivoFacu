program TP1EJ6;

type
	tLibro = record
		ISBN : longint;
		tit : string[40];
		gen : string[15];
		edit : string[15];
		anEdi : integer;
	end;
	tArchLib = File of tLibro;

var
	aLib : tArchLib;
	l : tLibro;
	aText : Text;
	ISBN : longint;
	opc : integer;
	encontrado : boolean;
	
procedure cargarLibro(var l : TLibro);
begin
	write ('ISBN: '); readln (l.ISBN);
	write ('tit: '); readln (l.tit);
	write ('gen: '); readln (l.gen);
	write ('edit: '); readln (l.edit);
	write ('anEdi: '); readln (l.anEdi);
end;

procedure imprimir(var aLib : tArchLib);
begin
	while (not eof(aLib)) do begin
		read(aLib, l);
		write ('ISBN: '); writeln (l.ISBN);
		write ('tit: '); writeln (l.tit);
		write ('gen: '); writeln (l.gen);
		write ('edit: '); writeln (l.edit);
		write ('anEdi: '); writeln (l.anEdi);
		writeln();
	end;
end;

BEGIN
	write('Crear archivo? (1=SI): ');
	readln(opc);
	Assign (aLib, 'libros.dat');
	Assign (aText, 'libros.txt');
	if (opc=1) then begin
		reset (aText);
		rewrite (aLib);
		writeln ('LIBROS');
		repeat
			readln(aText, l.ISBN);
			write ('ISBN '); writeln (l.ISBN);
			readln(aText, l.tit);
			write ('tit '); writeln (l.tit);
			readln(aText, l.gen);
			write ('gen '); writeln (l.gen);
			readln(aText, l.edit);
			write ('edit '); writeln (l.edit);
			readln(aText, l.anEdi);
			write ('anEdi '); writeln (l.anEdi);
			writeln;
			write(aLib,l);
		until (eof(aText));
		writeln('archivo creado exitosamente');
		close (aText);
		close(aLib);
		writeln();
	end;
	reset(aLib);
	imprimir(aLib);
	close(aLib);
	write ('modificar el archivo: '); readln(ISBN);
	while ( ISBN <> -1 ) do begin
		reset (aLib);
		encontrado := false;
		repeat
			read(aLib, l);
			write(l.ISBN); writeln('.'); write(ISBN);writeln('.'); 
			if (l.ISBN = ISBN) then begin
				encontrado := true;
				cargarLibro(l);
				seek (aLib, filepos(aLib)-1);
				write(aLib, l);
				writeln();
			end;
		until (eof(aLib))or(encontrado);
		if (not encontrado) then begin
			writeln('Ese Libro no esta en el archivo, agregarlo? (1=SI)');
			readln(opc);
			if (opc = 1) then begin
				cargarLibro(l);
				write(aLib,l);
			end;
		end;
		close (aLib);
		writeln();
		reset(aLib);
		imprimir(aLib);
		close(aLib);
		write ('modificar el archivo: '); readln(ISBN);
	end
	
END.
