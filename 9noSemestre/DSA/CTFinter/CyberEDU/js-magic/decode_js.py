# decode_flag_from_capture.py
# Ejecutar: python3 decode_flag_from_capture.py

encoded_flag = """mk{,=,3b0,\\,,fc1,Y\\,9>,bf4,`a,>,b92,\\Z_,9=,} ,1e4,^\a,:,4ca,\\a],,b78,]Z,"""

log_file = "logs_decodificacion.txt"
flag_file = "flag_decodificada.txt"

logs = []

# Limpiar la cadena: quitar comas y espacios
clean_flag = encoded_flag.replace(",", "").replace(" ", "")
logs.append(f"FLAG codificada limpia: {clean_flag}")

chars = list(clean_flag)
decoded_chars = []

# Decodificación cíclica enc1/enc2/enc3
for i, c in enumerate(chars):
    code = ord(c)
    if i % 3 == 0:       # enc1 sumaba 20 -> revertimos restando 20
        code -= 20
        logs.append(f"Char {c} (enc1) -> {chr(code)}")
    elif i % 3 == 1:     # enc2 restaba 20 -> revertimos sumando 20
        code += 20
        logs.append(f"Char {c} (enc2) -> {chr(code)}")
    else:                # enc3 -> invertir por bloques de 3, se hará al final
        logs.append(f"Char {c} (enc3) -> {c}")
    decoded_chars.append(chr(code))

# Aplicar enc3: invertir cada bloque de 3 caracteres
final_chars = []
for i in range(0, len(decoded_chars), 3):
    block = decoded_chars[i:i+3]
    block.reverse()
    final_chars.extend(block)

final_flag = ''.join(final_chars)

# Guardar resultados
with open(flag_file, "w", encoding="utf-8") as f:
    f.write(final_flag)

with open(log_file, "w", encoding="utf-8") as f:
    for line in logs:
        f.write(line + "\n")

print(f"FLAG decodificada guardada en {flag_file}")
print(f"Logs guardados en {log_file}")
