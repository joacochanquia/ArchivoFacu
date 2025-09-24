// unpack_and_run.js
// Ejecuta chall_clean.js en una sandbox controlada y captura console.log
// Requiere: Node.js (v12+)

const fs = require('fs');
const vm = require('vm');
const path = require('path');

const challPath = path.join(__dirname, 'chall_clean.js');
const code = fs.readFileSync(challPath, 'utf8');

// Preparar sandbox controlada
let consoleOutput = [];
const sandbox = {
  console: {
    log: (...args) => { consoleOutput.push(args.join(' ')); },
    error: (...args) => { consoleOutput.push('[ERR] ' + args.join(' ')); },
    warn: (...args) => { consoleOutput.push('[WARN] ' + args.join(' ')); }
  },
  // Stub de window para evitar popups; devuelve un objeto con la API mínima
  window: {
    open: function(...args) {
      consoleOutput.push('[window.open called] ' + args.join(' '));
      return { closed: true };
    },
    // algunos scripts esperan properties como top/left/width/height
    top: {},
    location: {}
  },
  // setTimeout / clearTimeout por si las usa el script
  setTimeout: (fn, t) => { /* no ejecutar demorado; llamar inmediatamente si t==0 */ if (t===0) try{ fn(); }catch(e){ consoleOutput.push('[timeout err] '+e); } },
  clearTimeout: () => {},
  // stubs de objetos del navegador o funciones que puedan usarse
  navigator: {},
  // un objeto global para capturar variables definidas como var FLAG = ...
  globalThis: {}
};

try {
  // Ejecutar en VM (esto hará que el código empaquetado se desempaquete y ejecute dentro de la sandbox)
  vm.runInNewContext(code, sandbox, { filename: 'chall_clean.js', timeout: 5000 });
} catch (e) {
  consoleOutput.push('[VM error] ' + e.toString());
}

// Resultado posible: algunos scripts imprimen la FLAG con console.log, otros ponen la FLAG en una variable global.
// Intentamos rescatarla de varios sitios:
if (sandbox.FLAG) {
  consoleOutput.push('[FLAG var] ' + String(sandbox.FLAG));
}
if (sandbox.globalThis && sandbox.globalThis.FLAG) {
  consoleOutput.push('[FLAG globalThis] ' + String(sandbox.globalThis.FLAG));
}

// Mostrar todo lo capturado
console.log('--- CAPTURADO ---');
consoleOutput.forEach(line => console.log(line));
console.log('--- FIN ---');
