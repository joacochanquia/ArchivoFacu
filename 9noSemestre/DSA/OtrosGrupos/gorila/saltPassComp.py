import hashlib

# Configuración
salt = 'd2382d03c980d7d5ab8386e72bd640ae'
hash_objetivo = 'a06e5e3af075abad6738bb0611da2030dc0189ea738480a815602303a95e8ee0'
diccionario_path = 'rockyou.txt'

print("[*] Iniciando búsqueda...")

with open(diccionario_path, 'r', encoding='latin-1') as f:
    for i, password in enumerate(f):
        password = password.strip()

        # Concatenar salt + password
        combinado = password + salt

        # Calcular SHA256
        hash_calculado = hashlib.sha256(combinado.encode()).hexdigest()

        if hash_calculado == hash_objetivo:
            print(f"[+] ¡Contraseña encontrada!: {password}")
            print(f"[+] Hash: {hash_calculado}")
            break
        else:
            if i % 100 == 0:
                print(f"[-] Probadas {i} contraseñas...")

print("[*] Fin del script.")

