program TP2EJ3aux;
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
var
	zd : tZapDet;
	zm : tZapMast;
	m : tArchMast;
	d : vecArchDec;
        i, j, k : integer;
begin
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
        rewrite(m);
        for i := 1 to 20 do begin
		rewrite(d[i]);
	end;
        zm.color:='verde';
        zm.descrip:='es una zapatilla';
        zm.precio:=6000;
        zm.stock:=100000;
        zm.stockmin:=2000;
        zd.cant:=3003;
        Randomize;
        for i:=11 to 20 do begin
                for j:=38 to 40 do begin
                        zm.cod:=i;
                        zm.num:=j;
                        write(m,zm);
                        zd.cod:=i;
                        zd.num:=j;
                        for k:=1 to 20 do begin
                            if (Random(5) = 1) then begin
                                  write(d[k],zd);
                            end;
                        end;
                end;
        end;
        close(m);
        for i := 1 to 20 do begin
		close(d[i]);
	end;
        writeln('Se crearon los archivos');
        readln();
end.

