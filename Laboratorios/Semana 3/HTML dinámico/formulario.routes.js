const express = require('express');
const fs = require('fs');
const path = require('path');
const router = express.Router();

// GET - Mostrar formulario
router.get('/form_method', (req, res) => {
    res.render('index', {
        contenido: null,     // No hay contenido al cargar por primera vez
        indice: null,
        imprimir: null
    });
});

// POST - Procesar formulario
router.post('/form_method', (req, res) => {
    const indice = Number(req.body.indice);
    const imprimir = req.body.imprimir || '';

    let contenido = "";

    for (let i = 1; i <= indice; i++) {
        contenido += imprimir + "\n";
    }

    // Guardar en archivo
    try {
        fs.writeFileSync("./archivo.txt", contenido.trim());
        console.log('Archivo guardado correctamente');
    } catch (err) {
        console.error('Error al guardar archivo:', err);
    }

    // Renderizar la misma vista pasando los datos
    res.render('index', {
        contenido: contenido.trim(),   // ← Esto es lo que mostraremos
               indice: indice,
               imprimir: imprimir
    });
});

module.exports = router;
