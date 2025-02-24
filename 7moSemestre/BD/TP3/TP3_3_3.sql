--Cine = (codC, nombre, direccion)
--Sala = (codS, nombreS, descripción, capacidad, codC)
--Película = (codP, nombre, descripción, genero)
--Funcion = (codF, codS, codP, fecha, hora, ocupación) //ocupación indica # de espectadores de la función

--3. Listar nombre y dirección de los cines que exhiban todas las películas.


SELECT c.nombre, c.direccion
FROM Cine c
WHERE NOT EXISTS ( --que no existan peliculas no dadas en el cine
	--me quedo con las peliculas que no se dieron en el cine
	SELECT p.codP
	FROM Pelicula p
	EXCEPT ( 
		-- seleciono las peliculas dadas en el cine
		SELECT f.codP
		FROM Funcion f
		NATURAL JOIN Sala s
		WHERE (s.codC = c.codC)
	)
)



