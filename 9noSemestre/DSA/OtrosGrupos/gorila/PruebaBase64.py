import base64
import json
import requests
import time
import urllib3

# ✅ Desactivar los warnings por certificados SSL no verificados
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# Configuración
url = 'https://gorila.dsa.linti.unlp.edu.ar/login'  # ⚠️ Cambiar por la URL real del reto
usuario_original = 'admin'          # ⚠️ Cambiar por el nombre de usuario objetivo
diccionario_path = 'rockyou.txt'    # Ruta al diccionario

# Codificamos el usuario en base64 como en la página (btoa)
usuario_codificado = base64.b64encode(usuario_original.encode()).decode()

print(f"Usuario: {usuario_original}")
print(f"Usuario64: {usuario_codificado}")


