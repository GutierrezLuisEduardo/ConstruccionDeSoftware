const log = console.log;

let usuarios = [
    {
        id: 1,
        nombre: "Samuel",
        active: true
    },
    {
        id: 2,
        nombre: "Lisa",
        active: true
    },
    {
        id: 3,
        nombre: "Bob",
        active: false
    },
    {
        id: 4,
        nombre: "Alicia",
        active: true
    }
];

// FUNCIONES

exports.ObtenerUsuarios = function(correo, contrasena) {
    log("Obtener Usuarios");
    return [...usuarios]; // Retornamos una copia para evitar modificaciones accidentales
};

exports.ObtenerUsuariosActivos = function(correo, contrasena) {
    log("Obtener Usuarios Activos");
    return usuarios.filter(user => user.active);
};

exports.AgregarUsuario = function(nombre) {
    log("Agregando nuevo usuario: " + nombre);

    if (!nombre || nombre.trim() === "") {
        return { success: false, message: "Nombre inválido" };
    }

    const nuevoUsuario = {
        id: usuarios.length + 1,
        nombre: nombre.trim(),
        active: true
    };

    usuarios.push(nuevoUsuario);

    console.log("Usuario agregado:", nuevoUsuario);
    return {
        success: true,
        usuario: nuevoUsuario,
        totalUsuarios: usuarios.length
    };
};

exports.EliminarUsuario = function(id) {
    const index = usuarios.findIndex(u => u.id === parseInt(id));
    if (index !== -1) {
        const eliminado = usuarios.splice(index, 1)[0];
        log(`Usuario eliminado: ${eliminado.nombre}`);
        return { success: true, message: "Usuario eliminado", id: id, usuario: eliminado };
    }
    return { success: false, message: "Usuario no encontrado", id: id };
};
