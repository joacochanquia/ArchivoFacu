# decode_js_magic_v2.py
# Ejecutar: python3 decode_js_magic_v2.py
# Debe estar en la misma carpeta que chall_clean.js

import re

def main():
    js_file = 'chall_clean.js'
    flag_file = 'flag_decodificada.txt'
    log_file = 'logs_decodificacion.txt'
    logs = []

    # Leer archivo JS
    with open(js_file, 'r', encoding='utf-8') as f:
        js_content = f.read()
    logs.append("Leído chall_clean.js")

    # Extraer array que está dentro de eval(function(...){...}('ARRAY', ...))
    eval_array_match = re.search(r"eval\(function\(p,a,c,k,e,d\)\{.*?\}\('(.+?)',\d+,\d+,'(.*?)'\.split", js_content, re.DOTALL)
    if not eval_array_match:
        raise ValueError("No se pudo extraer el array dentro del eval.")
    
    raw_array = eval_array_match.group(2)
    _11 = raw_array.split('|')
    logs.append(f"Extraído _11: {len(_11)} elementos")

    # Extraer FLAG de la forma var FLAG=[_0('0x1'), ... , '}'];
    flag_match = re.search(r"var FLAG=\[(.*?)\];", js_content, re.DOTALL)
    if not flag_match:
        raise ValueError("No se pudo encontrar FLAG en JS.")
    flag_content = flag_match.group(1)
    logs.append(f"Extraído contenido FLAG: {flag_content[:100]}... (truncado)")

    # Función _0 simula _0('0x..') en JS
    def _0(index_hex):
        idx = int(index_hex, 16)
        return _11[idx]

    # Reconstruir FLAG codificada
    flag_parts = re.findall(r"_0\('0x([0-9a-f]+)'\)|'([^']+)'", flag_content)
    reconstructed_flag = []
    for hex_idx, literal in flag_parts:
        if hex_idx:
            val = _0(hex_idx)
            logs.append(f"_0('0x{hex_idx}') -> {val}")
            reconstructed_flag.append(val)
        elif literal:
            logs.append(f"Literal -> {literal}")
            reconstructed_flag.append(literal)

    encoded_flag = ''.join(reconstructed_flag)
    logs.append(f"FLAG codificada: {encoded_flag}")

    # Decodificación exacta como en JS
    # enc1: +20, enc2: -20, enc3: reverse
    clean_encoded = re.sub(r'[\s,]+', '', encoded_flag)
    chars = list(clean_encoded)
    decoded_chars = []

    for i, c in enumerate(chars):
        code = ord(c)
        if i % 3 == 0:   # enc1 sumaba 20 -> restamos 20
            code -= 20
            logs.append(f"Char {c} (enc1) -> {chr(code)}")
        elif i % 3 == 1: # enc2 restaba 20 -> sumamos 20
            code += 20
            logs.append(f"Char {c} (enc2) -> {chr(code)}")
        else:            # enc3 -> se aplica reverse por bloques de 3, simulamos invirtiendo cada tripleta
            pass
        decoded_chars.append(chr(code))

    # Aplicar enc3: invertir cada bloque de 3 caracteres
    final_chars = []
    for i in range(0, len(decoded_chars), 3):
        block = decoded_chars[i:i+3]
        block.reverse()
        final_chars.extend(block)

    final_flag = ''.join(final_chars)
    logs.append(f"FLAG final decodificada: {final_flag}")

    # Guardar archivos
    with open(flag_file, 'w', encoding='utf-8') as f:
        f.write(final_flag)
    with open(log_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(logs))

    print(f"FLAG final guardada en {flag_file}")
    print(f"Logs detallados guardados en {log_file}")

if __name__ == "__main__":
    main()
