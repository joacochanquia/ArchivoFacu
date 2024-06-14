program TP2EJ4aux;

uses
  sysutils;

const
  VALORALTO = 30000;
  MAX_MOVIES = 50;
  MAX_FILES = 20;

type
  tPeli = record
    cod: integer;
    nom: string[50];
    gen: string[50];
    dir: string[50];
    fech: integer;
    cant: longint;
  end;

  tArch = file of tPeli;

  vecArch = array[1..MAX_FILES] of tArch;

  vecPelicula = array[1..MAX_MOVIES] of tPeli;



function getRandomCant: longint;
begin
  getRandomCant := Random(999)+1;
end;

function PeliculaDefault: tPeli;
begin
  Result.cod := 0;
  Result.nom := '';
  Result.gen := '';
  Result.dir := '';
  Result.fech := 0;
  Result.cant := 0;
end;


procedure ordenarVector(var v: array of tPeli; cant: integer);
var
  i, j: integer;
  aux: tPeli;
begin
  for i := 1 to cant - 1 do
    for j := i + 1 to cant do
      if v[j].cod < v[i].cod then
      begin
        aux := v[i];
        v[i] := v[j];
        v[j] := aux;
      end;
end;

procedure generarPeliculas(var vecPeli: array of tPeli; var cant: integer);
var
  i: integer;
begin
  for i := 1 to MAX_MOVIES do
  begin
    vecPeli[i] := PeliculaDefault;
  end;
  for i := 1 to cant do
  begin
    vecPeli[i].cod := (Random(299)+1);
    vecPeli[i].nom := 'Peli' + IntToStr(vecPeli[i].cod);
    vecPeli[i].gen := 'Genero' + IntToStr(Random(10));
    vecPeli[i].dir := 'Director' + IntToStr(Random(10));
    vecPeli[i].fech := Random(1000);
    vecPeli[i].cant := getRandomCant;
  end;

  ordenarVector(vecPeli, cant);
end;

procedure escribirArchivos(var vecArchivos: vecArch; var vecPeli: vecPelicula; numPelis: integer; numArchivos: integer);
var
  i, j: integer;
begin
  for i := 1 to numArchivos do
  begin
    Assign(vecArchivos[i], 'pelidet' + IntToStr(i) + '.dat');
    Rewrite(vecArchivos[i]);
  end;
  i := 1;
  while i <= numPelis do
  begin
    for j := 1 to numArchivos do
    begin
      Write(vecArchivos[j], vecPeli[i]);
      while (i < numPelis) and (vecPeli[i].cod = vecPeli[i + 1].cod) do
      begin
        Write(vecArchivos[j], vecPeli[i + 1]);
        i := i + 1;
      end;
    end;
    i := i + 1;
  end;

  for i := 1 to numArchivos do
    Close(vecArchivos[i]);
end;


var
  vecPeli: vecPelicula;
  vecArchivos: vecArch;
  numArchivos, numPelis: integer;
  d : tArch;
  p : tPeli;

begin
  Randomize;

  numArchivos := MAX_FILES;
  numPelis := MAX_MOVIES;

  generarPeliculas(vecPeli, numPelis);
  escribirArchivos(vecArchivos, vecPeli, numPelis, numArchivos);

  WriteLn('Se generaron los archivos pelidet1.dat hasta pelidet', numArchivos, '.dat');
  assign (d,'pelidet1.dat');
  reset(d);
  read(d, p);
  close(d);
  writeln('Codigo de la primer peli: ', p.cod);
  WriteLn('Presione ENTER para terminar.');
  ReadLn;
end.
