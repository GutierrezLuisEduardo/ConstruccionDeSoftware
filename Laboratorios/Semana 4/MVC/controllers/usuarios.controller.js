const express = require('express');
const path = require('path');
const fs = require('fs');
const router = express.Router();
const modelUsuarios = require('../models/usuarios.model');
const modelAlertas = require('../models/alertas.model');

module.exports.getAllUsers = async(req, res) => {
    let correo = "";
    let contrasena = "";

    let usuarios = modelUsuarios.ObtenerUsuariosActivos(correo, contrasena);
    let alertas = modelAlertas.ObtenerAlertas();

    /*res.setHeader("Content-Type", "application/json");
    res.status(200)
        .json({ status: "success",
                message:"Get all users",
                data: activeUsers
            });
    res.end();*/

    res.render("./usuarios/obtener_usuarios",{
        title: "Obtener Usuarios",
        usuarios: usuarios,
        alertas: alertas
    });
}

module.exports.getAllUsersActivos = async(req, res) => {
    res.status(200).json({ status: "success",});
}

module.exports.addUserView = async(req, res) => {
    res.render("./usuarios/agregar_usuario", {
        title: "Agregar Nuevo Usuario"
    });
};

module.exports.addUserForm = async(req, res) => {
    const { nombre } = req.body;

    if (!nombre || nombre.trim() === "") {
        return res.status(400).json({
            status: "error",
            message: "El nombre es obligatorio"
        });
    }

    const resultado = modelUsuarios.AgregarUsuario(nombre.trim());

    // Renderizar vista de éxito o redirigir
    res.render("./usuarios/agregar_usuario", {
        title: "Usuario Agregado Exitosamente",
        success: true,
        usuario: resultado.usuario,
        mensaje: `Usuario "${resultado.usuario.nombre}" agregado con ID ${resultado.usuario.id}`
    });
}

module.exports.editUserView = async(req, res) => {
    res.status(200).json({ status: "success",});
}

module.exports.editUserForm = async(req, res) => {
    res.status(200).json({ status: "success",});
}

module.exports.deleteUserView = async(req, res) => {
    res.render("./usuarios/eliminar_usuario", {
        title: "Eliminar Usuario"
    });
}

module.exports.deleteUserForm = async(req, res) => {
    const { id } = req.body;

    if (!id || id.trim() === "") {
        return res.status(400).json({
            status: "error",
            message: "La ID es obligatoria"
        });
    }

    const resultado = modelUsuarios.EliminarUsuario(id.trim());

    // Renderizar vista de éxito o redirigir
    res.render("./usuarios/eliminar_usuario", {
        title: "Usuario Eliminado Exitosamente",
        success: true,
        usuario: resultado.usuario,
        mensaje: `"${resultado.message}" con ID ${resultado.id}`
    });
}
