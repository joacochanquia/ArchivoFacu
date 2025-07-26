FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar archivos de la aplicación
COPY . .

# Crear directorio de configuración si no existe
RUN mkdir -p /app/config

# Hacer el script ejecutable
RUN chmod +x entrypoint.sh

# Crear directorio data
RUN mkdir -p /app/data && chmod 755 /app/data

EXPOSE 5000

CMD ["./entrypoint.sh"] 