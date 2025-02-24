--Cine = (codC, nombre, direccion)
--Sala = (codS, nombreS, descripción, capacidad, codC)
--Película = (codP, nombre, descripción, genero)
--Funcion = (codF, codS, codP, fecha, hora, ocupación) //ocupación indica # de espectadores de la función

--9. Reportar para cada película, nombre y la cantidad de veces que fue exhibida durante 2020.

SELECT p.nombre, COUNT(*) as cantidad
FROM Pelicula p
NATURAL JOIN Funcion f
WHERE (Year(f.fecha) = 2020)
GROUP BY p.codP, p.nombre




