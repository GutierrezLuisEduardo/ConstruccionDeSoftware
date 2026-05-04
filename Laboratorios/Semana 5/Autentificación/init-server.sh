echo "Verificado de versión de npm y arrancando un nuevo proyecto dentro del directorio"
npm -V
npm init

echo "package JSON"
echo | cat package.json

echo "instalar express, body parser, ejs"
npm install --save express
npm install --save body-parser
npm install --save ejs
npm install --save dotenv
npm install --save bcrypt
npm install --save helmet
npm install --save express-session
npm install --save cookie-parser
npm install @supabase/supabase-js @supabase/ssr
npm install pg


echo "package JSON tras instalar el paquete de express"
echo | cat package.json

echo "iniciar el servidor"
npm start
