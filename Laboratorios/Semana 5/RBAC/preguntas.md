1. ¿En qué consiste el control de acceso basado en roles?
Consiste en asignar permisos a roles específicos y luego asignar esos roles a los usuarios, en lugar de otorgar permisos directamente a cada individuo. 

2. Investiguen y describan 2 sistemas, uno que aplique RBAC y uno que no. Realicen un análisis de las ventajas y desventajas de cada uno con respecto al control de acceso.
Un sistema que utiliza RBAC es Active Directory de Microsoft, donde los permisos se gestionan mediante roles. En contraste, un servidor web básico con autenticación directa por usuario y contraseña (sin roles centralizados) representa un modelo sin RBAC.

RBAC en Active Directory ofrece mayor escalabilidad y reduce la complejidad administrativa al asignar permisos por roles. Sin embargo, puede ser rígido para necesidades muy específicas o granulares; En cambio, sin RBAC en el servidor web básicos simple de implementar al inicio, pero genera altos costos de mantenimiento y mayor riesgo de errores conforme la organización crece (el aspecto de escalabilidad) y se deben asignar permisos individualmente.
