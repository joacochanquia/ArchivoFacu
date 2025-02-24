--Cine = (codC, nombre, direccion)
--Sala = (codS, nombreS, descripción, capacidad, codC)
--Película = (codP, nombre, descripción, genero)
--Funcion = (codF, codS, codP, fecha, hora, ocupación) //ocupación indica # de espectadores de la función

--6. Reportar nombre, descripción y género de películas exhibidas en el Cine: ´Cinemark Hoyts´ pero
--que no tengan programadas funciones en dicho cine para el dia de hoy.


SELECT DISTINCT p.nombre, p.descripcion, p.genero
FROM Pelicula p
NATURAL JOIN Funcion f
INNER JOIN Sala s ON (f.codS = s.codS)
INNER JOIN Cine c ON (s.codC = c.codC)
WHERE (c.nombre LIKE 'Cinemart Hoyts')
AND p.codP NOT IN (
	SELECT f2.codP
	FROM Funcion f2
	NATURAL JOIN Sala s2
	WHERE ((f2.fecha = hoy) AND (s2.codC = c.codC))
)






