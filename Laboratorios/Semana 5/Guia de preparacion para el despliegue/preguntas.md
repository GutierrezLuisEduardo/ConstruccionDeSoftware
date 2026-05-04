Cómo solicitó el profesor Alejandro, sólo se contestaron las preguntas de este laboratorio para la entrega del mismo.

1. ¿Que elementos hay que configurar para un entorno de produccion?
Es necesario configurar servidores escalables y redundantes, monitoreo continuo, seguridad reforzada (firewalls, WAF, SSL), backups automáticos, variables de entorno seguras y optimizaciones de rendimiento.

2. ¿Que variables de entorno tienes que crear en tu proyecto?
Credenciales de base de datos, URLs de producción, claves de cifrado (quizá) y banderas de entorno.

3. Investiga los tipos de DNS y explícalos
Los pcpales. tipos de registros DNS son A (dirección IPv4), AAAA (IPv6), CNAME (alias a otro dominio), MX (servidores de correo), NS (servidores de nombres), TXT (información textual como SPF), SOA (autoridad de zona).

4. ¿Qué significa para un dominio cambiar el registro NS a diferencia de los demás?
Que delegas la autoridad DNS completa a otros servidores de nombres.

5. Investiga los pros y contras de los certificados SSL gratuitos contra los de pago ¿Qué ventajas y desventajas otorgan? ¿Para cuando se recomendaría usar uno de pago hoy en día?
Los certificados SSL gratuitos ofrecen cifrado básico gratuito y fácil automatización pero tienen validez corta, validación solo de dominio (DV) y menos confianza; en camio, los de pago aportan validación de organización, mayor duración, soporte, garantías financieras y mayor credibilidad visual, y deben usarse para la myor confianza profesional.
