#!/bin/bash


# Crear directorio data si no existe
mkdir -p /app/data

# Cambiar permisos
chmod 755 /app/data

python app.py 