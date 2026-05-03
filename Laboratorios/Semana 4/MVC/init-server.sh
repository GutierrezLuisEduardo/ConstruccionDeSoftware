echo "Verificado de versión de npm y arrancando un nuevo proyecto dentro del directorio"
npm -V
npm init

echo "package JSON"
echo | cat package.json

echo "instalar express, body parser, ejs"
npm install --save express
npm install --save body-parser
npm install --save ejs

echo "package JSON tras instalar el paquete de express"
echo | cat package.json

echo "iniciar el servidor"
npm start
