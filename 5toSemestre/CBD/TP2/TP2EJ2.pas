program TP2EJ2;

type
	tCD = record
		cod : integer;
		aut : string[40];
		nom : string[40];
		gen : string[40];
		cant : longint;
	end;
	tArchCD = File of tCD;

var
	cd, aux : tCD;
	opc : integer;
	aCD : tArchCD;
	totD, totG, totA : longint;
	
BEGIN
	assign(aCD,'archivoCD.dat');
	write ('mostrar archivo?: '); read(opc);
	if (opc = 1)then begin
		reset (aCD);
		if not eof(aCD) then begin
			repeat
				read(aCD, cd);
				write ('Codigo autor: ');
				writeln (cd.cod);
				write ('Autor: ');
				writeln (cd.aut);
				write ('Nombre del libro: ');
				writeln (cd.nom);
				write ('Genero: ');
				writeln (cd.gen);
				write ('Cantidad vendida: ');
				writeln (cd.cant);
				writeln ();
			until (eof(aCD));
		end;
		close(aCD);
		writeln();
	end;
	totA := 0;
	totG := 0;
	totD := 0;
	aux.cod := 0;
	aux.gen := '.';
	reset (aCD);
	while (not eof(aCD)) do begin
		read(aCD, cd);
		if (cd.cod <> aux.cod) then begin
			if (aux.cod <> 0) then begin
				writeln();
				write ('Total Genero: '); writeln(totG);
				write ('Total Autor: '); writeln(totA);
			end;
			writeln();
			writeln();
			write ('Autor: '); writeln(cd.aut);
			write ('Genero: '); writeln(cd.gen);
			writeln();
			aux.cod := cd.cod;
			aux.gen := cd.gen;
			totG := 0;
			totA := 0;
		end;
		if (cd.gen <> aux.gen) then begin
			writeln();
			write ('Total Genero: '); writeln(totG);
			write ('Genero: '); writeln(cd.gen);
			writeln();
			aux.gen := cd.gen;
			totG := 0;
		end;
		totG := totG + cd.cant;
		totA := totA + cd.cant;
		totD := totD + cd.cant;
		write('	');write(cd.nom);write(': ');writeln(cd.cant);
	end;
	writeln();
	write ('Total Genero: '); writeln(totG);
	write ('Total Autor: '); writeln(totA);
	write ('Total Discografica: '); writeln(totD);
	close (aCD);
END.
