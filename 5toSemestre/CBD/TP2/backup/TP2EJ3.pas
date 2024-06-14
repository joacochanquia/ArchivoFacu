program TP2EJ3;

const
	VALORALTO = 30000;

type
	tZapMast = record
		cod : integer;
		num : integer;
		descrip : string[100];
		precio : integer;
		color : string[40];
		stock : longint;
                stockmin : longint;
	end;
	tArchMast = File of tZapMast;
	tZapDet = record
		cod : integer;
		num : integer;
		cant : longint;
	end;
        tArchDet = File of tZapDet;
	vecArchDec = array [1 .. 20] of tArchDet;
	vecZapDet = array [1 .. 20] of tZapDet;
var 
	zd : vecZapDet;
	zm : tZapMast;
	m : tArchMast;
	d : vecArchDec;
	i : integer;
        min : integer;
        sins : Text;
        ultcod : integer;
        ultnum : integer;

procedure Leer(var d:tArchDet; var zd:tZapDet);
begin
	if (not eof(d)) then begin
		read(d,zd);
        end
        else
		zd.cod := VALORALTO;
end;

function Fin(var zd : vecZapDet) : boolean;
begin
     Fin := true;
     for i:=1 to 20 do begin
         if (zd[i].cod <> VALORALTO) then
            Fin := false;
     end;
end;

function Minimo(zd : vecZapDet) : integer;
var
     mincod : integer;
     minnum : integer;
begin
     Minimo := VALORALTO;
     mincod := VALORALTO; 
     minnum := VALORALTO;
     for i:=1 to 20 do begin
         if (zd[i].cod < mincod) then begin
                 Minimo := i;
                 mincod := zd[i].cod;
         end
         else if ((zd[i].cod = mincod)and(zd[i].num < minnum)) then begin
                 Minimo := i;
                 minnum := zd[i].cod;
         end;
     end;
end;

BEGIN
	assign(m,'zapamaster.txt');
	assign(d[1], 'zapadet1.txt');	assign(d[2], 'zapadet2.txt');
	assign(d[3], 'zapadet3.txt');	assign(d[4], 'zapadet4.txt');
	assign(d[5], 'zapadet5.txt');	assign(d[6], 'zapadet6.txt');
	assign(d[7], 'zapadet7.txt');	assign(d[8], 'zapadet8.txt');
	assign(d[9], 'zapadet9.txt');	assign(d[10], 'zapadet10.txt');
	assign(d[11], 'zapadet11.txt');	assign(d[12], 'zapadet12.txt');
	assign(d[13], 'zapadet13.txt');	assign(d[14], 'zapadet14.txt');
	assign(d[15], 'zapadet15.txt');	assign(d[16], 'zapadet16.txt');
	assign(d[17], 'zapadet17.txt');	assign(d[18], 'zapadet18.txt');
	assign(d[19], 'zapadet19.txt');	assign(d[20], 'zapadet20.txt');
        assign(sins, 'calzadosinstock.txt');
        rewrite(sins);
	for i := 1 to 20 do begin
		reset(d[i]);
		Leer(d[i],zd[i]);
	end;
        reset(m);
        zm.cod := VALORALTO;
        ultcod := VALORALTO;
        ultnum := VALORALTO;
        while (not Fin(zd)) do begin
            min := Minimo(zd);
            while ((zm.cod<>zd[min].cod)and(zm.num<>zd[min].num)) do begin
                read (m,zm);
                if ((zm.cod <> zd[min].cod)and(zm.num<>zd[min].num)) then begin
                    write('El zapato con codigo ');
                    write(zm.cod);
                    write(' talle ');
                    write(zm.num);
                    writeln(' no tuvo ventas.');
                end;
            end;
            zm.stock := zm.stock - zd[min].cant; 
            write('pase por el: ');write(zm.cod);write(' ');writeln(zm.num);
            if (zm.stock < zm.stockmin) then begin
                if ((ultnum<>zm.num)or(ultcod<>zm.cod)) then begin    //xq solo los 38 se guardan
                  ultcod:=zm.cod;
                  ultnum:=zm.num;
                  write(sins,'El zapato con codigo ');
                  write(sins,zm.cod);
                  write(sins,' talle ');
                  write(sins,zm.num);
                  writeln(sins,' se quedo sin stock.');
                end;
            end;
            seek(m,FilePos(m)-1);
            write(m,zm);
            Leer(d[min],zd[min]);
        end;
        close(sins);
	close(m);



	readln();
END.

