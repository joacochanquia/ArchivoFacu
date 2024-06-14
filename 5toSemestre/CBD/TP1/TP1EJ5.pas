program TP1EJ5;

type
	tRecordFlor = record
		 num : integer;
		 alt : integer;
		 nomc : string[40];
		 nomv : string[40];
		 col : string[15];
	end;
	tArchFlor = File of tRecordFlor;

var
	arch : tArchFlor;
	f : tRecordFlor;
	opc : integer;
	fText : Text;
	min, max, cant : integer;
	maxF, minF : string;

BEGIN
	Assign (arch, 'flores.dat');
	repeat
		writeln ('FLORES');
		writeln ('(0) Crear Archivo');
		writeln ('(1) Agregar Flores');//d
		writeln ('(2) Listar Archivo');//b
		writeln ('(3) Copiar a Archivo de Texto');//e
		writeln ('(4) Mostrar Informacion');//a
		writeln ('(5) Cambiar Victoria');//c
		writeln ('(6) Cerrar Aplicacion');
		writeln ();
		write ('Ingrese opcion: ');
		readln (opc);
		writeln ();
		case opc of
			0 : begin
				rewrite (arch);
				write ('Nombre Cientifico: ');
				readln (f.nomc);
				while (f.nomc <> 'zzz') do begin
					write ('Nombre Vulgar: ');
					readln (f.nomv);
					write ('Numero de Especie: ');
					readln (f.num);
					write ('Altura Maxima: ');
					readln (f.alt);
					write ('Color: ');
					readln (f.col);
					write (arch, f);
					writeln ();
					writeln ('Ingrese una nueva flor');
					write ('Nombre Cientifico: ');
					readln (f.nomc);
				end;
				close (arch);
			end;
			1 : begin
				reset (arch);
				seek (arch, filesize(arch));
				write ('Nombre Cientifico: ');
				readln (f.nomc);
				while (f.nomc <> 'zzz') do begin
					write ('Nombre Vulgar: ');
					readln (f.nomv);
					write ('Numero de Especie: ');
					readln (f.num);
					write ('Altura Maxima: ');
					readln (f.alt);
					write ('Color: ');
					readln (f.col);
					write (arch, f);
					writeln ();
					writeln ('Ingrese una nueva flor');
					write ('Nombre Cientifico: ');
					readln (f.nomc);
				end;
				close (arch);
			end;
			2 : begin
				reset (arch);
				repeat
					read(arch, f);
					write ('Nombre Cientifico: ');
					writeln (f.nomc);
					write ('Nombre Vulgar: ');
					writeln (f.nomv);
					write ('Numero de Especie: ');
					writeln (f.num);
					write ('Altura Maxima: ');
					writeln (f.alt);
					write ('Color: ');
					writeln (f.col);
					writeln ();
				until (eof(arch));
				close(arch);
			end;
			3 : begin
				assign (ftext, 'flores.txt');
				rewrite (ftext);
				reset (arch);
				repeat
					read(arch, f);
					write (ftext, 'Nombre Cientifico: ');
					writeln (ftext, f.nomc);
					write (ftext, 'Nombre Vulgar: ');
					writeln (ftext, f.nomv);
					write (ftext, 'Numero de Especie: ');
					writeln (ftext, f.num);
					write (ftext, 'Altura Maxima: ');
					writeln (ftext, f.alt);
					write (ftext, 'Color: ');
					writeln (ftext, f.col);
					writeln (ftext,'');
				until (eof(arch));
				close(arch);
				close(ftext)
			end;
			4 : begin
				reset (arch);
				cant := 0;
				max := -1;
				min := 32767;
				repeat
					read(arch, f);
					cant := cant + 1;
					if (f.alt < min) then begin
						min := f.alt;
						minF := f.nomv;
					end;
					if (f.alt > max) then begin
						max := f.alt;
						maxF := f.nomv;
					end;
				until (eof(arch));
				close(arch);
				write('La cantidad de especies es '); writeln(cant);
				write('La flor mas alta es '); writeln(maxF);
				write('La flor mas baja es '); writeln(minF);
				writeln();
			end;
			5 : begin
				reset (arch);
				repeat
					read(arch, f);
				until (eof(arch))or(f.nomc = 'Victoria amazonia');
				if (f.nomc = 'Victoria amazonia') then begin
					f.nomc := 'Victoria amazonica';
					seek (arch, filepos(arch)-1);
					write(arch, f);
					writeln();
				end; 
				close(arch);
			end;
		end;
	until (opc = 6);
	
END.
