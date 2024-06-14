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
	bool, bCod, bGen: boolean;
	aCD : tArchCD;
	
BEGIN
	assign(aCD,'archivoCD.dat');
	write ('crear archivo binario?: '); read(opc);
	if (opc = 1)then begin
		rewrite(aCD);
		write ('codigo: ');readln(cd.cod);
		while (cd.cod <> -1) do begin
			write ('autor: ');readln(cd.aut);
			write ('nombre: ');readln(cd.nom);
			write ('genero: ');readln(cd.gen);
			write ('cantidad vendida: ');readln(cd.cant);
			bool := false;
			bCod := false;
			bGen := false;
			if (not eof(aCD)) then begin
				repeat
					read(aCD, aux);
					if (cd.cod <= aux.cod) then begin
						bCod := true;
						if(cd.gen <= aux.gen) then begin
							bGen := true;
							if(cd.nom <= aux.gen) then begin
								bool := true;
							end;
						end
						else if (bGen) then begin
							bool := true;
						end;
					end 
					else if (bCod) then begin
						bool := true;
					end;
				until (eof(aCD) or bool);
				if (not eof(aCD)) then begin
					repeat
						read (aCD, aux);
						seek(aCD,filepos(aCD)-1);
						write (aCD, cd);
						cd := aux;
					until (eof(aCD));
					write (aCD, cd);
				end 
				else begin
					write(aCD,cd);
				end;
			end
			else begin //si el archivo esta vacio se agrega aca
				write(aCD,cd);
			end;
			writeln();
			write ('codigo: ');readln(cd.cod);
		end;
		close(aCD);
	end;
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
	end;
END.

{
			if (cd.cod <= aux.cod) then begin
						bCod := true;
						if(cd.gen <= aux.gen) then begin
							bGen := true;
							if(cd.nom <= aux.gen) then begin
								bool := true;
								repeat
									seek(aCD,filepos(aCD)-1);
									write (aCD, cd);
									cd := aux;
									read (aCD, aux);
								until (eof(aCD));
							end;
						end;
					end
					else begin
						if (bCod and (cd.cod>aux.cod)) then begin
							
						end;
					end;
			else begin //si el archivo esta vacio se agrega aca
				write(aCD,cd);
				bool := true;
			end;
			if ((not bool) and eof(aCD)) then begin //si llego al final y todavia no se agrego
				write(aCD,cd);
				bool := true;
			end;
}
