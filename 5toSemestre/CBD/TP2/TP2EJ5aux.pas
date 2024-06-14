program TP2EJ5aux;

uses sysutils;

type
  tipo = record
    par : string[50];
    loc : string[50];
    bar : integer;
    cantN : longint;
    cantA : longint;
  end;
  tArch = File of tipo;

var
  archivo : tArch;
  i, j : integer;
  t : tipo;
  par, loc : string[50];
  cantN, cantA : longint;

begin
  Randomize;

  // Create and open the file for writing
  Assign(archivo, 'poblacionVulnerable.dat');
  Rewrite(archivo);

  // Generate random data and write to the file
  for i := 1 to 5 do
  begin
    // Generate random value for par
    par := 'Partido' + IntToStr(i);

    // Generate 2-4 random loc values for each par value
    for j := 1 to Random(3) + 2 do
    begin
      loc := 'Localidad' + IntToStr(Random(5) + 1); // e.g. Location1, Location2, ...
      cantN := Random(1000) + 1; // random number between 1 and 1000
      cantA := Random(1000) + 1; // random number between 1 and 1000

      // Write the data to the file
      t.par := par;
      t.loc := loc;
      t.bar := j;
      t.cantN := cantN;
      t.cantA := cantA;
      Write(archivo, t);
    end;
  end;

  // Close the file
  Close(archivo);
end.

