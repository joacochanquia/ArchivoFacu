--Cine = (codC, nombre, direccion)
--Sala = (codS, nombreS, descripción, capacidad, codC)
--Película = (codP, nombre, descripción, genero)
--Funcion = (codF, codS, codP, fecha, hora, ocupación) //ocupación indica # de espectadores de la función

--8. Borrar el cine con nombre ‘Cine China Zorrilla’.

DELETE FROM Funcion f
WHERE f.codF IN(
	SELECT f2.codF
	FROM Sala s
	NATURAL JOIN Cine c
	NATURAL JOIN Funcion f2
	WHERE (c.nombre = 'Cine China Zorilla')
)
DELETE FROM Sala s
WHERE s.codS IN(
	SELECT s.codS
	FROM Sala s
	NATURAL JOIN Cine c
	WHERE (c.nombre = 'Cine China Zorilla')
)
DELETE FROM cine
WHERE (nombre = 'Cine China Zorilla')




