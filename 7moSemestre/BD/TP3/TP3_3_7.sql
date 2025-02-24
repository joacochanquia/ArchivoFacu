--Cine = (codC, nombre, direccion)
--Sala = (codS, nombreS, descripción, capacidad, codC)
--Película = (codP, nombre, descripción, genero)
--Funcion = (codF, codS, codP, fecha, hora, ocupación) //ocupación indica # de espectadores de la función

--7. Reportar para cada cine la cantidad de espectadores por película durante 2020. Indicar nombre del
--cine, nombre de la película y cantidad de espectadores. Ordenar por cine y luego por película.

SELECT c.nombre, p.nombre, SUM(f.ocupacion) as cantidad
FROM Cine c
NATURAL JOIN Sala s
NATURAL JOIN Funcion f
INNER JOIN ¨Pelicula p ON (p.codP = f.codP)
WHERE (Year(f.fecha) = 2020)
GROUP BY c.codC, c.nombre, p.codP, p.nombre
ORDER BY c.nombre, p.nombre





