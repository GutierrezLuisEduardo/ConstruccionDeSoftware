function escribirString(path, str) {
    const fs = require("fs");

    try {
        //Crear un archivo con la clase writeFileSync
        fs.writeFileSync(path, str);
    } catch {
        return -1;
    }

    return 1;
}

module.exports = {escribirString};
