const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

// Servir archivos estáticos desde el directorio actual
app.use(express.static(__dirname));
app.use(express.json());

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.post('/seleccion', (req, res) => {
    // Aquí imprimimos en la terminal lo que se selecciona
    if (req.body.tipo === 'dibujo') {
        console.log('\x1b[35m%s\x1b[0m', `Figura seleccionada: ${req.body.figura}`);  // En color fucsia
    } else {
        console.log('\x1b[35m%s\x1b[0m', `Juego iniciado: ${req.body.inicia === 'jugador' ? 'Tú inicias' : 'Robot inicia'}`);  // En color fucsia
    }
    res.send('OK');
});

app.listen(port, () => {
    console.log('\x1b[35m%s\x1b[0m', `¡Servidor iniciado! Abre http://localhost:${port} en tu navegador`);  // En color fucsia
}); 