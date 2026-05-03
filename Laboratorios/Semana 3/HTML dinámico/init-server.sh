echo "Verificado de versión de npm y arrancando un nuevo proyecto dentro del directorio"
npm -V
npm init

echo "package JSON"
echo | cat package.json

echo "instalar express"
npm install express

echo "package JSON tras instalar el paquete de express"
echo | cat package.json

echo "paquete para facilitar manipulación de datos de petición"
npm install --save body-parser

echo "iniciar el servidor"
npm start
