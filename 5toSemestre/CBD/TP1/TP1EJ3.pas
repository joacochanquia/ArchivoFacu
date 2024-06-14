program TP1EJ3;

type
	tArchMat = Text;

var
	arch : tArchMat;
	dino : String;

BEGIN
	Assign (arch, 'dinosaurios.txt');
	rewrite (arch);
	writeln ('DINOSAURIOS'); 
	write ('Ingrese informacion de un dinosaurio: ');
	readln (dino);
	while (dino <> 'zzz') do begin
		writeln();
		writeln(arch, dino);
		write ('Ingrese informacion de un dinosaurio: ');
		readln (dino);
	end;
	close(arch)
	
END.
