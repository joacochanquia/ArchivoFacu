#!/usr/bin/env python3
# el_camel_solver_ready.py
# Versión robusta y simplificada que envía m0=0, m1=1 inmediatamente después de parsear p,q
# y responde automáticamente a cada c recibido.

import socket
import re
import sys
import time

HOST = "challenge.secso.cc"
PORT = 7001
TIMEOUT = 15  # timeout general para la conexión

def connect_and_makefile(host, port, timeout=TIMEOUT):
    s = socket.create_connection((host, port), timeout=timeout)
    f = s.makefile('rwb', buffering=0)  # lectura/escritura en bytes, sin buffering
    return s, f

def readline_text(f, timeout=10):
    # lee una línea (bytes) y la decodifica a text; devuelve None si EOF
    line = b""
    while True:
        ch = f.read(1)
        if not ch:
            if not line:
                return None
            break
        line += ch
        if ch == b'\n':
            break
    try:
        return line.decode(errors='ignore').rstrip('\n').rstrip('\r')
    except:
        return line.decode('latin-1', errors='ignore').rstrip('\n').rstrip('\r')

def send_line(s, text):
    if not text.endswith("\n"):
        text = text + "\n"
    s.sendall(text.encode())

def main():
    print(f"[*] Conectando a {HOST}:{PORT} ...")
    try:
        s, f = connect_and_makefile(HOST, PORT)
    except Exception as e:
        print("[-] Error al conectar:", e)
        return

    # leer banner y buscar p y q (dos enteros grandes)
    p = q = None
    bigints = []
    start = time.time()
    # leer hasta obtener al menos dos enteros grandes o hasta 8s
    while time.time() - start < 8:
        line = readline_text(f)
        if line is None:
            break
        if line.strip() == "":
            continue
        print("[<]", line)
        found = re.findall(r"\d{3,}", line)
        if found:
            for n in found:
                bigints.append(n)
        if len(bigints) >= 2:
            try:
                p = int(bigints[0])
                q = int(bigints[1])
                break
            except Exception:
                pass

    if p is None or q is None:
        # intentar leer un poco más por si los números vienen lento
        extra_start = time.time()
        while time.time() - extra_start < 4 and (p is None or q is None):
            line = readline_text(f)
            if line is None:
                break
            print("[<]", line)
            found = re.findall(r"\d{3,}", line)
            if found:
                for n in found:
                    bigints.append(n)
            if len(bigints) >= 2:
                try:
                    p = int(bigints[0])
                    q = int(bigints[1])
                    break
                except Exception:
                    pass

    if p is None or q is None:
        print("[-] No pude parsear p y q. Líneas capturadas:", bigints[:6])
        s.close()
        return

    print("[+] p =", p)
    print("[+] q =", q)

    # enviamos m0 y m1 inmediatamente para no quedarnos desfasados
    m0 = 0
    m1 = 1
    print(f"[*] Enviando m0={m0} y m1={m1} inmediatamente...")
    send_line(s, str(m0))
    # pequeño sleep para simular comportamiento humano y evitar coalescing raro
    time.sleep(0.05)
    send_line(s, str(m1))

    # ahora procesamos líneas: recibiremos números (c) y prompts; cuando vemos un entero lo procesamos
    rounds = 0
    try:
        while True:
            line = readline_text(f)
            if line is None:
                print("[*] EOF desde el servidor. Salimos.")
                break
            if line.strip() == "":
                continue
            print("[<]", line)

            # posible flag o mensaje final
            if "FLAG" in line.upper() or "flag{" in line or "ElCamel is impressed" in line or "Here is your prize" in line:
                print("[!] Mensaje final o flag detectado:")
                print(line)
                # leer resto y mostrar
                rest = b""
                try:
                    while True:
                        chunk = f.read(4096)
                        if not chunk:
                            break
                        rest += chunk
                except:
                    pass
                if rest:
                    try:
                        print(rest.decode(errors='ignore'))
                    except:
                        print(rest)
                break

            # si la línea es un entero -> es 'c'
            m = re.fullmatch(r"(\d+)", line.strip())
            if m:
                c = int(m.group(1))
                s0 = (c - m0) % p
                s1 = (c - m1) % p
                guess = None
                try:
                    if pow(s0, q, p) == 1:
                        guess = "H"
                    elif pow(s1, q, p) == 1:
                        guess = "T"
                    else:
                        # fallback: nunca debería ocurrir con m0=0,m1=1, pero por si acaso
                        # elegimos la que cumpla s != 0 (heurística)
                        guess = "H" if s0 != 0 else "T"
                except Exception as e:
                    print("[-] Error al comprobar pow(...):", e)
                    guess = "H"

                print("[>] Enviando guess:", guess)
                send_line(s, guess)
                rounds += 1
                # prevenir loop infinito
                if rounds >= 60:
                    print("[*] Ya respondimos 60 rondas, esperando resultado final...")
            else:
                # otras líneas (prompts, "The coin has been tossed...", "Heads or Tails! (H or T)>" etc.)
                # las mostramos y seguimos
                pass

    except KeyboardInterrupt:
        print("\n[!] Interrumpido por usuario.")
    except Exception as e:
        print("[-] Excepción inesperada:", e)
    finally:
        try:
            s.close()
        except:
            pass
        print("[*] Fin.")

if __name__ == "__main__":
    main()
#!/usr/bin/env python3
import socket
import re

HOST = "challenge.secso.cc"
PORT = 7001
TIMEOUT = 20

def connect_and_makefile(host, port):
    s = socket.create_connection((host, port), timeout=TIMEOUT)
    f = s.makefile("rwb", buffering=0)
    return s, f

def readline_text(f):
    line = f.readline()
    if not line:
        return None
    return line.decode(errors="ignore").rstrip("\n").rstrip("\r")

def send_line(s, text):
    if not text.endswith("\n"):
        text += "\n"
    s.sendall(text.encode())

def main():
    print(f"[*] Conectando a {HOST}:{PORT} ...")
    s, f = connect_and_makefile(HOST, PORT)

    p = q = None
    bigints = []

    # Fase inicial: leer hasta que tengamos p y q
    while p is None or q is None:
        line = readline_text(f)
        if line is None:
            break
        print("[<]", line)
        found = re.findall(r"\d{6,}", line)
        if found:
            bigints.extend(found)
            if len(bigints) >= 2:
                p = int(bigints[0])
                q = int(bigints[1])
                break

    if p is None or q is None:
        print("[-] No pude parsear p y q")
        return

    print("[+] p =", p)
    print("[+] q =", q)

    m0, m1 = 0, 1

    # Loop principal
    while True:
        line = readline_text(f)
        if line is None:
            print("[*] EOF")
            break
        print("[<]", line)

        if line.strip().startswith("How tall"):
            send_line(s, str(m0))
            print("[>] Enviado m0 =", m0)

        elif line.strip().startswith("How long"):
            send_line(s, str(m1))
            print("[>] Enviado m1 =", m1)

        else:
            # ¿es un número grande (c)?
            m = re.fullmatch(r"\d+", line.strip())
            if m:
                c = int(m.group(0))
                s0 = (c - m0) % p
                s1 = (c - m1) % p
                guess = None
                if pow(s0, q, p) == 1:
                    guess = "H"
                elif pow(s1, q, p) == 1:
                    guess = "T"
                else:
                    guess = "H"  # fallback
                print("[>] Respondiendo con", guess)
                send_line(s, guess)

        # chequeo de flag
        if "flag{" in line.lower():
            print("[!!!] FLAG ENCONTRADA:", line)
            break

if __name__ == "__main__":
    main()
