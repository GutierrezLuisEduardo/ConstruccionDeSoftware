const http = require('http');
const path = require('path');
const fs = require('fs').promises;
const { obtenerCuadrado, promedioArreglo, escribirString } = require('./utils');

const PORT = 4141;

async function handler(req, res) {
    const url = req.url;
    if (url === '/' || url === '/index') {
        // Servir página HTML principal
        const file = await fs.readFile(path.join(__dirname, 'PaginaWeb', 'index.html'), 'utf8');
        res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
        return res.end(file);
    }

    if (url === '/promedio') {
        // Ejemplo: calcular promedio de un arreglo fijo y mostrar en consola y en respuesta
        const arr = [10, 20, 30, 40, 50];
        const prom = promedioArreglo(arr);
        console.log('Promedio de', arr, '=', prom);
        res.writeHead(200, { 'Content-Type': 'application/json; charset=utf-8' });
        return res.end(JSON.stringify({ arreglo: arr, promedio: prom }));
    }

    if (url === '/escribir') {
        // Escribe un archivo con contenido demo usando fs (async)
        const ruta = path.join(__dirname, 'Evidencia', 'archivo.txt');
        const contenido = `Este es un archivo creado por node\n`;
        try {
            await escribirString(ruta, contenido);
            console.log('Archivo escrito en', ruta);
            res.writeHead(200, { 'Content-Type': 'text/plain; charset=utf-8' });
            return res.end('Archivo escrito: archivo.txt\n');
        } catch (err) {
            console.error(err);
            res.writeHead(500);
            return res.end('Error al escribir el archivo\n');
        }
    }

    if (url === '/cuadrado') {
        // Usa el problema extra: contar palabras de un texto de ejemplo
        const n = 24;
        const cuadrado = obtenerCuadrado(n);
        console.log('El cuadrado de', n, 'es', cuadrado);
        res.writeHead(200, { 'Content-Type': 'application/json; charset=utf-8' });
        return res.end(JSON.stringify({ numero: n, cuadrado: cuadrado }));
    }

    // 404 por defecto
    res.writeHead(404);
    res.end('Ruta no encontrada. Rutas disponibles: /, /promedio, /escribir, /cuadrado\n');
}

function startServer() {
    const server = http.createServer((req, res) => {
        handler(req, res).catch(err => {
            console.error('Handler error:', err);
            if (!res.headersSent) {
                res.writeHead(500);
                res.end('Error interno del servidor\n');
            }
        });
    });

    server.listen(PORT, () => {   // ← Cambia aquí
        console.log(`http://localhost:${PORT}`);
    });
}


if (require.main === module) {
    startServer();
}

module.exports = { startServer };
