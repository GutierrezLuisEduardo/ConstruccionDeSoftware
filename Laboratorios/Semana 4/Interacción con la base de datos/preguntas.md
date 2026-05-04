1. ¿Qué ventajas tiene escribir el código SQL únicamente en la capa del modelo?

No está accesible por el cliente y mejora la encapsulación y mantenimiento.

2. ¿Qué es SQL injection y cómo se puede prevenir?

La explotación de vulnerabilidad en entradas a mediante las cuales puede enviarse código, malicioso o no, a una base de datos; puede prevenirse administrando los grados de privilegio/acceso sobre la BD o validando entradas, por ejemplo.

3. ¿Por qué en la práctica las credenciales de Supabase viven en un archivo .env y no directamente en database.js? Menciona al menos dos consecuencias concretas (no teóricas) de haberlas escrito en el código y haber hecho commit.

Porque suele utilizarse como directorio para las variables y configuración del entorno de desarrollo, mismo que es ignorado, p.ej por git, para la subida al repositorio.

Si estuviera en database.js, incluso GitHub pediría que se elimine toda trazabilidad de esas credenciales pues, al ser accesibles (peor estando en database.js), alguien puede concretar el acceso con esas credenciales a lo que sea que correspondieran (y leer/modificar datos o consumir recursos sin permiso).

Entonces esos son problemas reales de seguridad e incluso de practicidad y eficiencia, pues remover trazabilidad de este tipo de descuidos, desperdicia tiempo y esfuerzo.

4. ¿Qué problema resuelve usar un pool de conexiones en lugar de abrir y cerrar una conexión nueva en cada request?

Optimiza el uso de recursos del lado del servidor y también el tiempo de respuesta.

5. En la práctica usaste pool.query(sql, [valor1, valor2]) con placeholders $1, $2 en lugar de armar el query concatenando strings. Muestra un ejemplo corto de un query inseguro y su versión parametrizada, y explica en 2–3 líneas por qué el segundo bloquea una inyección como ' OR 1=1 --.

Es inseguro precisamente porque involucra concatenación, que permite que hayan inyecciones. En cambio parametrizar, trata a los parámetros como datos y los envía por separado al servidor, quedando encerrados como string y de esta forma no es posible forzar condiciones adicionales a través de la estructura del query.

Concatenación:
```js
const sql = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";
pool.query(sql, (err, res) => { ... });
```

Parametrizado:
```js
const sql = "SELECT * FROM users WHERE username = $1 AND password = $2";
pool.query(sql, [username, password], (err, res) => { ... });
```
