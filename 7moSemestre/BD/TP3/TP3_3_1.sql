--Cine = (codC, nombre, direccion)
--Sala = (codS, nombreS, descripción, capacidad, codC)
--Película = (codP, nombre, descripción, genero)
--Funcion = (codF, codS, codP, fecha, hora, ocupación) //ocupación indica # de espectadores de la función

--1. Reportar información de películas exhibidas en cines de ‘Avellanada’ y que posean funciones en
--cines de ‘La Plata’.

SELECT p.nombre, p.descripcion, p.genero
FROM Pelicula p
NATURAL JOIN Funcion f
INNER JOIN Sala s ON (f.codS = s.codS)
INNER JOIN Cine c ON (s.codC = c.codC)
WHERE (c.direccion LIKE '%Avellaneda%')
AND EXISTS 
	(SELECT f2.codF
	FROM Funcion f2
	INNER JOIN Sala s2 ON (f2.codS = s2.codS)
	INNER JOIN Cine c2 ON (s2.codC = c2.codC)
	WHERE (c2.direccion LIKE '%La Plata%')AND(p.codP = f2.codP))




