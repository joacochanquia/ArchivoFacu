--Cine = (codC, nombre, direccion)
--Sala = (codS, nombreS, descripción, capacidad, codC)
--Película = (codP, nombre, descripción, genero)
--Funcion = (codF, codS, codP, fecha, hora, ocupación) //ocupación indica # de espectadores de la función

--5. Listar nombre y dirección de cines donde se exhiba la película: ‘007 Bond: Sin tiempo para morir’ o
--que tengan funciones con ocupación durante 2020.

SELECT c.nombre, c.direccion
FROM Cine c
NATURAL JOIN Sala s
NATURAL JOIN Funcion f
INNER JOIN Pelicula p ON (p.codP = f.codP)
WHERE ((p.nombre = '007 Bond: Sin tiempo para morir') OR ((Year(f.fecha) = 2020) AND (f.ocupacion > 0))




