--Cine = (codC, nombre, direccion)
--Sala = (codS, nombreS, descripción, capacidad, codC)
--Película = (codP, nombre, descripción, genero)
--Funcion = (codF, codS, codP, fecha, hora, ocupación) //ocupación indica # de espectadores de la función

--4. Modificar el nombre a: ‘Sala Darin’, de la sala con código 10.

UPDATE Sala
SET nombre = 'Sala Darin'
WHERE codS = 10





