// decode_flag.js
// Ejecutar: node decode_flag.js
// Debe estar en la misma carpeta que chall_clean.js

const fs = require('fs');

// Archivos de salida
const logFile = 'logs_decodificacion.txt';
const flagFile = 'flag_decodificada.txt';
let logs = [];

try {
    const jsContent = fs.readFileSync('chall_clean.js', 'utf-8');
    logs.push("Leído chall_clean.js");

    // Extraer array _11 dentro del eval
    const arrayMatch = jsContent.match(/'([^\']+)'(?:\s*,\s*)?/g);
    if (!arrayMatch) throw new Error("No se pudo extraer el array _11");

    const _11 = arrayMatch.map(s => s.replace(/'/g, '').trim());
    logs.push(`Extraído array _11 con ${_11.length} elementos`);

    // Extraer contenido de FLAG en el JS (buscamos var FLAG=[...])
    const flagMatch = jsContent.match(/var FLAG=\[([^\]]+)\]/s);
    if (!flagMatch) throw new Error("No se pudo encontrar la variable FLAG");
    const flagContent = flagMatch[1];
    logs.push(`Extraído contenido FLAG: ${flagContent.slice(0, 100)}...`);

    // Función que simula _0('0x...') del JS
    function _0(hex) {
        const idx = parseInt(hex, 16);
        return _11[idx];
    }

    // Reconstruir la FLAG codificada
    const parts = [...flagContent.matchAll(/_0\('0x([0-9a-f]+)'\)|'([^']+)'/g)];
    const reconstructed = [];
    for (const p of parts) {
        if (p[1]) {
            const val = _0(p[1]);
            logs.push(`_0('0x${p[1]}') -> ${val}`);
            reconstructed.push(val);
        } else if (p[2]) {
            logs.push(`Literal -> ${p[2]}`);
            reconstructed.push(p[2]);
        }
    }

    const encodedFlag = reconstructed.join('');
    logs.push(`FLAG codificada: ${encodedFlag}`);

    // Limpiar la cadena (quitar comas y espacios)
    const clean = encodedFlag.replace(/[, \n\r]+/g, '');
    logs.push(`FLAG codificada limpia: ${clean}`);

    // Decodificación enc1/enc2/enc3
    const chars = clean.split('');
    const decodedChars = [];

    for (let i = 0; i < chars.length; i++) {
        let code = chars[i].charCodeAt(0);
        if (i % 3 === 0) {        // enc1 sumaba 20 -> restamos
            code -= 20;
            logs.push(`Char ${chars[i]} (enc1) -> ${String.fromCharCode(code)}`);
        } else if (i % 3 === 1) { // enc2 restaba 20 -> sumamos
            code += 20;
            logs.push(`Char ${chars[i]} (enc2) -> ${String.fromCharCode(code)}`);
        } else {                  // enc3 -> invertir bloques de 3 al final
            logs.push(`Char ${chars[i]} (enc3) -> ${chars[i]}`);
        }
        decodedChars.push(String.fromCharCode(code));
    }

    // Aplicar enc3: invertir cada bloque de 3 caracteres
    const finalChars = [];
    for (let i = 0; i < decodedChars.length; i += 3) {
        const block = decodedChars.slice(i, i + 3).reverse();
        finalChars.push(...block);
    }

    const finalFlag = finalChars.join('');
    logs.push(`FLAG final decodificada: ${finalFlag}`);

    // Guardar resultados
    fs.writeFileSync(flagFile, finalFlag);
    fs.writeFileSync(logFile, logs.join('\n'));

    console.log(`FLAG final guardada en ${flagFile}`);
    console.log(`Logs detallados guardados en ${logFile}`);

} catch (err) {
    console.error("Error:", err.message);
}
