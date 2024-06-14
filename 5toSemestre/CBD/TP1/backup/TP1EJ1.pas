program TP1EJ1;

type
	tArchMat = Text;

var
	arch : tArchMat;
	material : String;

BEGIN
	Assign (arch, 'materiales.txt');
	rewrite (arch);
	writeln ('MATERIALES'); 
	repeat 
		writeln();
		write ('Ingrese el nombre de un material: ');
		readln (material);
		writeln(arch, material);
	until(material='cemento');
	close(arch)
	
END.

