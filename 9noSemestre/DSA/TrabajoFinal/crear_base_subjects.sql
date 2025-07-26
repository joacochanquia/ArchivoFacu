CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(50) NOT NULL,
    weekly_hrs INT NOT NULL,
    annual_hrs INT NOT NULL,
    secret VARCHAR(1000) NOT NULL
);

INSERT INTO subjects (name, code, weekly_hrs, annual_hrs, secret) VALUES
('Matemática A', 'F0301', 12, 168, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
=XwpR
-----END PGP MESSAGE-----'),
('Programación I', 'I101', 8, 112, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
=XwpR
-----END PGP MESSAGE-----'),
('Química', 'U0902', 6, 84, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
=XwpR
-----END PGP MESSAGE-----'),
('Matemática B', 'F0302', 12, 168, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
=XwpR
-----END PGP MESSAGE-----'),
('Programación II', 'I102', 8, 112, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
=XwpR
-----END PGP MESSAGE-----'),
('Sistemas de Representación', 'M0670', 3, 42, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
=XwpR
-----END PGP MESSAGE-----'),
('Física I', 'F0316', 7, 98, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
=XwpR
-----END PGP MESSAGE-----'),
('Programación III', 'I103', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
=XwpR
-----END PGP MESSAGE-----'),
('Taller de Lenguajes I', 'I104', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
=XwpR
-----END PGP MESSAGE-----'),
('Conceptos de Arquitectura de Computadoras', 'I105', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
=XwpR
-----END PGP MESSAGE-----'),
('Matemática C', 'F0304', 9, 126, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
=XwpR
-----END PGP MESSAGE-----'),
('Física II', 'F0317', 7, 98, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
=XwpR
-----END PGP MESSAGE-----'),
('Conceptos de Sistemas Operativos', 'I106', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
=XwpR
-----END PGP MESSAGE-----'),
('Taller de Lenguajes II', 'I107', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
=XwpR
-----END PGP MESSAGE-----'),
('Probabilidades', 'F0312', 3, 42, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
=XwpR
-----END PGP MESSAGE-----'),
('Matemática D1', 'F0310', 6, 84, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
=XwpR
-----END PGP MESSAGE-----'),
('Electrotecnia y Electrónica', 'E0282', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
=XwpR
-----END PGP MESSAGE-----'),
('Conceptos de Bases de Datos', 'I108', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
=XwpR
-----END PGP MESSAGE-----'),
('Introducción al Diseño Lógico', 'E0301', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
=XwpR
-----END PGP MESSAGE-----'),
('Estadistica', 'F0307', 3, 42, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
=XwpR
-----END PGP MESSAGE-----'),
('Introducción al Procesamiento de Señales', 'E0302', 5, 80, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
=XwpR
-----END PGP MESSAGE-----'),
('Taller de Arquitectura', 'I109', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
=XwpR
-----END PGP MESSAGE-----'),
('Ingeniería de Software', 'I110', 9, 144, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
=XwpR
-----END PGP MESSAGE-----'),
('Redes de Datos 1', 'E0303', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
=XwpR
-----END PGP MESSAGE-----'),
('Concurrencia y Paralelismo', 'I111', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
=XwpR
-----END PGP MESSAGE-----'),
('Instrumentación y Control', 'E0304', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
=XwpR
-----END PGP MESSAGE-----'),
('Bases de Datos', 'I112', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
=XwpR
-----END PGP MESSAGE-----'),
('Circuitos Digitales y Microcontroladores', 'E0305', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
=XwpR
-----END PGP MESSAGE-----'),
('Economía y Emprendedorismo', 'I113', 3, 48, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
=XwpR
-----END PGP MESSAGE-----'),
('Redes de Datos II', 'I114', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
=XwpR
-----END PGP MESSAGE-----'),
('Sistemas de Tiempo Real', 'I115', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
=XwpR
-----END PGP MESSAGE-----'),
('Taller de Proyecto I', 'E0306', 4, 64, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
=XwpR
-----END PGP MESSAGE-----'),
('Sistemas Distribuidos y Paralelos', 'I116', 6, 96, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
=XwpR
-----END PGP MESSAGE-----'),
('Aspectos Legales de Ingeniería Informática', 'I117', 3, 48, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
=XwpR
-----END PGP MESSAGE-----'),
('Taller de Proyecto II', 'I118', 4, 64, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
=XwpR
-----END PGP MESSAGE-----'),
('Seminario de Redacción de Textos Profesionales', 'S0012', 3, 48, '-----BEGIN PGP MESSAGE-----
Version: Keybase OpenPGP v2.1.15
Comment: https://keybase.io/crypto

xg7Ipsp9id7olKNDznVlCc0lp4a3T4Y4H43WUwAfvD2tXU9jclFkK0CDbJfxCTuO
wYwDNcBLPd397YMBBACGkYHWsHi0Cd+Z1s0TYzuTvh2jM12V3wxNeLhyFc23LF3I
hT6ak+SXj7p9Y9ra2NI6J7R9lJPdA0RN9p4UJzY1SNkbpSiWulZDDbS5rpYV69JL
AfKwVr/Upol0kfoTkpu6IP5I4vWhchI1BV9Vp31omQqk1glZm5d5QjcmnXZaJ1LH
F54qbUAWw3Sx40ZGfljerPk8WAKt1zL8Q5ks
=XwpR
-----END PGP MESSAGE-----');