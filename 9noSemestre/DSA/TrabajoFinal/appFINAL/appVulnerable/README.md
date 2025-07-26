# 🔓 CTF Vulnerable App - Jugadores de Fútbol

Una aplicación web vulnerable diseñada para CTF (Capture The Flag) con múltiples vulnerabilidades de seguridad. La aplicación gestiona una base de datos de los mejores jugadores de fútbol de la historia.

## 🚀 Instalación y Ejecución

### Configuración de la Flag

La aplicación utiliza variables de entorno para configurar la flag del CTF:

```bash
# Crear archivo de configuración
cp config/.env.example config/.env

# Editar la flag en config/.env
FLAG=Flag{TU_FLAG_PERSONALIZADA}
```

### Con Docker (Recomendado)

**Importante**: Docker cargará automáticamente la flag desde `config/.env`

```bash
# 1. Configurar la flag
cp config/.env.example config/.env
# Editar config/.env con tu flag personalizada

# 2. Construir y ejecutar
docker-compose up --build

# O en segundo plano
docker-compose up -d --build

# Ver logs para verificar la configuración
docker-compose logs ctf-app
```

La aplicación estará disponible en: http://localhost:5000

### Sin Docker

```bash
# Instalar dependencias
pip install -r requirements.txt

# Configurar variables de entorno
# En Windows PowerShell:
$env:FLAG="Flag{S0S_UN_J4J4H4CK3R}"

# En Linux/Mac:
export FLAG="Flag{S0S_UN_J4J4H4CK3R}"

# Ejecutar
python app.py
```

## 🎯 Vulnerabilidades Implementadas

### 1. 🔓 Broken Access Control
- **Ubicación**: `/profile/<user_id>`
- **Descripción**: Cualquier usuario puede ver el perfil de cualquier otro usuario
- **Explotación**: Cambiar el ID en la URL
  - Tu perfil: `/profile/2`
  - Usuario admin: `/profile/239`
  - Otros usuarios: `/profile/3`, `/profile/4`, etc.

### 2. 💥 Fuerza Bruta (Sin Rate Limiting)
- **Ubicación**: `/login`
- **Descripción**: No hay protección contra ataques de fuerza bruta
- **Usuarios predefinidos**:
  - `messi` / `teamomiguel` (admin)
  - `melina` / `hola123`
  - `user1` / `password123`
  - `ivo` / `dsa2025`
  - `mateo` / `milanesa`

### 3. 💉 SQL Injection
- **Ubicación**: `/admin/players` (solo admin)
- **Descripción**: Campo de búsqueda vulnerable a SQL injection
- **Explotación**: Usar payloads como:
  ```
  ' OR 1=1 --
  ' UNION SELECT * FROM players --
  ' UNION SELECT id, name, description, price, flag FROM players --
  ```

### 4. 🏴‍☠️ Flag Oculta
- **Ubicación**: Base de datos, tabla `players`
- **Descripción**: Flag codificada en MD5 en el campo `flag`
- **Flag**: `FLAG{SQL_INJECTION_MASTER_2025}`

## 🎮 Cómo Jugar

1. **Registra un usuario** o usa uno predefinido
2. **Explota Broken Access Control** para ver el perfil del admin
3. **Usa fuerza bruta** para obtener credenciales del admin
4. **Accede al panel de admin** y explota SQL injection
5. **Encuentra la flag** en la base de datos

## 🛠️ Estructura del Proyecto

```
appVulnerable/
├── app.py                 # Aplicación principal Flask
├── requirements.txt       # Dependencias Python
├── Dockerfile            # Configuración Docker
├── docker-compose.yml    # Orquestación Docker
├── entrypoint.sh         # Script de inicio
├── templates/            # Plantillas HTML
│   ├── base.html
│   ├── index.html
│   ├── login.html
│   ├── register.html
│   ├── profile.html
│   └── admin_players.html
└── data/                 # Base de datos SQLite (se crea automáticamente)
```

## ⚠️ Advertencia

Esta aplicación está diseñada específicamente para propósitos educativos y CTF. **NO** debe usarse en producción ya que contiene múltiples vulnerabilidades de seguridad intencionales.

## 🔧 Solución de Problemas

### Error de Base de Datos
Si encuentras errores de permisos con SQLite:
```bash
# Detener contenedores
docker-compose down

# Eliminar volumen de datos
rm -rf data/

# Reconstruir
docker-compose up --build
```

### Puerto Ocupado
Si el puerto 5000 está ocupado, cambia en `docker-compose.yml`:
```yaml
ports:
  - "8080:5000"  # Cambiar 5000 por 8080
``` 