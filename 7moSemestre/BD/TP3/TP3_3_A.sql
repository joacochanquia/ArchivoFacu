--Cine = (codC, nombre, direccion)
--Sala = (codS, nombreS, descripción, capacidad, codC)
--Película = (codP, nombre, descripción, genero)
--Funcion = (codF, codS, codP, fecha, hora, ocupación) //ocupación indica # de espectadores de la función

--10. Listar las películas que no se hayan exhibido en 2020 en ningún cine de La Plata

SELECT p.nombre, p.descripcion, p.genero
FROM Pelicula 
WHERE p.codP NOT IN(
	SELECT f.codP
	FROM Funcion f
	NATURAL JOIN Sala s
	INNER JOIN Cine c ON (s.codC = c.codC)
	WHERE (c.direccion LIKE '%La Plata%')
)



