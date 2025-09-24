// decode_flag.js
// Decodifica la FLAG del reto js-magic

// Pega aquí la salida capturada (la línea que contiene mk{,...})
const encoded = `mk{,=,3b0,\\,,fc1,Y\\,9>,bf4,\`a,>,b92,\\Z_,9=,} ,1e4,^\\a,:,4ca,\\a],,b78,]Z,`;

function decodeFlag(enc) {
    // La línea tiene comas, barras y espacios extra, los limpiamos
    const clean = enc.replace(/[\s,]+/g, ''); // quitar comas y espacios
    let chars = clean.split('');              // separar en caracteres
    let decoded = [];

    // Se aplicaron 3 funciones cíclicas: enc1 (+20), enc2 (-20), enc3 (reverse)
    for (let i = 0; i < chars.length; i++) {
        let c = chars[i].charCodeAt(0);
        switch (i % 3) {
            case 0: // enc1 -> sumar 20, ahora restamos
                c -= 20; break;
            case 1: // enc2 -> restar 20, ahora sumamos
                c += 20; break;
            case 2: // enc3 -> invertir, se hará al final
                break;
        }
        decoded.push(String.fromCharCode(c));
    }

    // enc3 se aplica a cada tercer carácter, para simplificar invertimos todo
    decoded = decoded.reverse();

    return decoded.join('');
}

const FLAG = decodeFlag(encoded);
console.log('FLAG decodificada: ', FLAG);
