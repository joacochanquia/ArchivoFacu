CREATE TABLE cine (
  codC SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(150)
);

CREATE TABLE sala (
  codS SERIAL PRIMARY KEY,
  nombreS VARCHAR(100),
  descripcion VARCHAR(100),
  capacidad INTEGER,
  codC SERIAL references cine(codC)
);

CREATE TABLE pelicula (
  codP SERIAL PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
  genero VARCHAR(100)
);

CREATE TABLE funcion (
  funcion_id SERIAL PRIMARY KEY,
  fecha DATE,
  hora TIME,
  ocupacion INTEGER,
  codS SERIAL references sala(codS),
  codP SERIAL references pelicula(codP)
);

-- Insert data cine
INSERT INTO cine (nombre, direccion) VALUES
  ('San Martin', 'Av. 7 Galería San Martín 923, La Plata'),
  ('Paradiso', 'Calle 46 nro. 780 entre 10 y 11, La Plata'),
  ('Rocha', 'Calle 49 nro. 615 entre 7 y 8, La Plata'),
  ('City', 'Calle 50 nro. 723 entre 9 y 10, La Plata'),
  ('Ocho', 'Calle 8 nro. 981 entre 51 y 53, La Plata'),
  ('Cinemark Hoyts', 'Gral. Güemes 897, Avellaneda'),
  ('Cinépolis', 'Parque Comercial, Avellaneda'),
  ('Cine China Zorrilla', 'Gral. Güemes 450, Avellaneda'),
  ('Ocean', '83-350, Necochea'),
  ('Toledo', 'Av. 75 y av.58, Necochea'),
  ('Paris', '61-2908, Necochea');

-- Insert data pelicula
INSERT INTO pelicula (nombre, genero) VALUES
 ('El planeta de los simios', 'Ficcion'),
 ('Luz negra', 'Ficcion'),
 ('Oppenheimer', 'Suspenso'),
 ('Gato con botas', 'Aventura'),
 ('Wish', 'Aventura'),
 ('Avatar', 'Aventura'),
 ('007 Bond: Sin tiempo para morir', 'Aventura'),
 ('Titanic', 'Romantica'),
 ('Dos corazones', 'Romantica'),
 ('Slender Man', 'Terror'),
 ('La abuela', 'Terror'),
 ('Evil dead', 'Terror'),
 ('Elijo creer', 'Documental'),
 ('Muchachos', 'Documental'),
 ('El robo del siglo', 'Crimen'),
 ('El secreto de sus ojos', 'Crimen'),
 ('Nueve reinas', 'Crimen');

-- Insert data sala
INSERT INTO sala (nombreS, capacidad, codC) VALUES
 ('Sala 1', 150, 1),
 ('Sala 2', 190, 1),
 ('Sala 3', 200, 1),
 ('Sala 1', 185, 2),
 ('Sala 2', 145, 2),
 ('Sala 3', 195, 2),
 ('Sala 1', 150, 3),
 ('Sala 2', 130, 3),
 ('Sala 1', 150, 4),
 ('Sala 1', 230, 5),
 ('Sala 2', 260, 5),
 ('Sala 1', 185, 6),
 ('Sala 2', 285, 6),
 ('Sala 3', 310, 6),
 ('Sala 1', 120, 7),
 ('Sala 1', 180, 8),
 ('Sala 2', 150, 8),
 ('Sala 1', 195, 9),
 ('Sala 2', 250, 9),
 ('Sala 1', 280, 10),
 ('Sala 2', 225, 10),
 ('Sala 1', 230, 11),
 ('Sala 1', 185, 11),
 ('Sala 1', 295, 11);

-- Insert data funcion
INSERT INTO funcion (fecha, hora, ocupacion, codS, codP) VALUES
 ('2024/03/13', '17:00:00', 25, 1, 1),
 (CURRENT_DATE, '20:00:00', 45, 2, 2),
 ('2024/03/13', '15:00:00', 55, 3, 3),
 ('2024/03/13', '17:10:00', 75, 22, 1),
 (CURRENT_DATE, '20:15:00', 20, 22, 1),
 ('2024/03/13', '23:00:00', 20, 22, 2),
 (CURRENT_DATE, '22:15:00', 22, 22, 2),
 ('2024/03/13', '22:10:00', 121, 22, 3),
 ('2024/03/13', '22:10:00', 121, 23, 3),
 (CURRENT_DATE, '22:10:00', 121, 23, 4),
 ('2024/03/13', '22:10:00', 121, 23, 5),
 ('2024/03/13', '22:10:00', 121, 23, 6),
 (CURRENT_DATE, '18:10:00', 121, 24, 8),
 ('2024/03/13', '22:10:00', 121, 24, 8),
  -- BEGIN cine_id=9 --> Ocean (sala_id=18|19), exhibe todas las peliculas 
 ('2024/02/13', '15:00:00', 90, 18, 1),
 ('2024/02/13', '17:00:00', 110, 18, 2),
 ('2024/02/13', '18:00:00', 75, 18, 3),
 ('2024/02/14', '19:00:00', 80, 18, 4),
 ('2024/02/14', '20:00:00', 120, 18, 5),
 ('2024/03/02', '20:00:00', 160, 18, 6),
 ('2024/03/02', '17:00:00', 121, 18, 7),
 ('2024/03/03', '15:00:00', 80, 18, 8),
 ('2024/03/03', '21:00:00', 100, 18, 9),
 ('2024/03/04', '18:00:00', 140, 18, 10),
 ('2024/03/04', '19:00:00', 130, 18, 11),
 ('2024/03/04', '19:00:00', 130, 18, 12),
 ('2024/03/04', '19:00:00', 130, 18, 13),
 (CURRENT_DATE, '19:00:00', 130, 18, 14),
 ('2024/03/04', '19:00:00', 130, 19, 15),
 (CURRENT_DATE, '19:00:00', 130, 19, 16),
 (CURRENT_DATE, '19:00:00', 130, 19, 17),
  -- END cine_id=9
  -- BEGIN pelicula_id=7 nombre='007 Bond: Sin tiempo para morir'
 ('2024/03/18', '19:00:00', 75, 8, 7),
 ('2024/03/18', '21:30:00', 35, 8, 7),
 ('2024/03/18', '19:00:00', 55, 12, 7),
 ('2024/03/19', '21:15:00', 100, 12, 7),
 ('2024/03/19', '20:00:00', 115, 20, 7),
 ('2024/03/20', '22:00:00', 110, 20, 7),
  -- END pelicula_id=7
  -- BEGIN Peliculas de 2020
 ('2020/07/12', '20:00:00', 75, 18, 15),
 ('2020/08/13', '20:00:00', 75, 18, 15),
 ('2020/08/13', '20:00:00', 75, 18, 16),
 ('2020/08/13', '20:00:00', 75, 18, 16),
 ('2020/08/14', '20:00:00', 95, 18, 16),
 ('2020/02/15', '20:00:00', 85, 18, 16),
 ('2020/02/15', '20:00:00', 85, 18, 17),
 ('2020/02/15', '20:00:00', 85, 18, 17),
  -- END Peliculas de 2020
  -- BEGIN 'Cinemark Hoyts'
 ('2024/03/05', '21:00:00', 120, 12, 1),
 ('2024/03/08', '18:00:00', 150, 12, 1),
 ('2024/03/12', '17:00:00', 130, 12, 2),
 ('2024/03/17', '16:30:00', 125, 12, 2),
 ('2024/03/18', '16:30:00', 125, 13, 2),
 ('2024/03/21', '20:00:00', 90, 13, 13),
 ('2024/04/13', '20:00:00', 125, 14, 13),
 ('2024/04/13', '20:00:00', 100, 14, 14),
 (CURRENT_DATE, '20:00:00', 112, 14, 3);
 -- END 'Cinemark Hoyts'

