CREATE DATABASE IF NOT EXISTS nemeziz;
USE nemeziz;

CREATE TABLE IF NOT EXISTS accounts (
  username varchar(100) NOT NULL,
  password varchar(600) NOT NULL,
  id int(100) NOT NULL PRIMARY KEY
);

INSERT IGNORE INTO accounts VALUES 
('admin', '7616fdb9b9363fbf58ebb4bd1169ecf1', 1),  
('pedro', '9df7a7314e3884b26222e2ccd834aa24', 2);

CREATE TABLE IF NOT EXISTS sucursal (
  id int(50) NOT NULL PRIMARY KEY,
  nombre varchar(100) NOT NULL,
  direccion varchar(200) NOT NULL,
  telefono varchar(20) NOT NULL,
  horario varchar(50) NOT NULL
);

INSERT IGNORE INTO sucursal VALUES
(1, 'NEMEZIZ Buenos Aires', 'Av. Corrientes 1234', '11-1234-5678', '9.00 - 17:00'),
(2, 'NEMEZIZ Cordoba', 'Av. Colin 567', '351-987-6543', '8.00 - 17:00'),
(3, 'NEMEZIZ Rosario', 'Pellegrini 876', '341-456-7890', '9.00 - 18:00'),
(4, 'NEMEZIZ Mendoza', 'San Martin 432', '261-765-4321', '9.00 - 17:00'),
(5, 'NEMEZIZ La Plata', 'Calle 7 1234', '221-123-4567', '8.00 - 16:00'),
(6, 'NEMEZIZ Mar del Plata', 'Av. Luro 2345', '223-876-5432', '9.00 - 18:00'),
(7, '-', 'Av Republica 752', '341-456-7700', 'flag{N3m3z1z_w4s_here}');
