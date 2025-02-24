--Cine = (codC, nombre, direccion)
--Sala = (codS, nombreS, descripción, capacidad, codC)
--Película = (codP, nombre, descripción, genero)
--Funcion = (codF, codS, codP, fecha, hora, ocupación) //ocupación indica # de espectadores de la función

--2. Reportar todas las películas que fueron exhibidas en funciones con menos de 30 espectadores.
--Ordenar por nombre de película

SELECT p.nombre, p.descripcion, p.genero
FROM Pelicula p
NATURAL JOIN Funcion f
WHERE (f.ocupacion < 30)
ORDER BY p.nombre




