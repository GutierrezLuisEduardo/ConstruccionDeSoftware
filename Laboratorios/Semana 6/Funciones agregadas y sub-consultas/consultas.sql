-- 1
/*
La suma de las cantidades e importe total de todas las entregas realizadas durante el 97.
*/
SELECT 
    SUM(e.cantidad) AS total_cantidad,
    SUM(e.cantidad * (m.precio * (1 + m.impuesto))) AS importe_total
FROM Entregan e
JOIN Materiales m ON e.clave = m.clave
WHERE fecha LIKE '1997%';

--2
/*
Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas.
*/
SELECT
    p.razonsocial AS razon_social,
    COUNT(*) AS numero_entregas,
    SUM(e.cantidad * (m.precio * (1 + m.impuesto))) AS importe_total
FROM Entregan e
JOIN Proveedores p ON e.rfc = p.rfc
JOIN Materiales m ON e.clave = m.clave
GROUP BY p.razonsocial;

--3
/*
Por cada material obtener la clave y descripción del material, la cantidad total entregada, la mínima cantidad entregada, la máxima cantidad entregada, el importe total de las entregas de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400.
*/
SELECT
    m.clave AS clave_material,
    m.descripcion AS descripcion_material,
    SUM(e.cantidad) AS cantidad_total,
    MIN(e.cantidad) AS cantidad_minima,
    MAX(e.cantidad) AS cantidad_maxima,
    SUM(e.cantidad * (m.precio * (1 + m.impuesto))) AS importe_total
FROM Entregan e
JOIN Materiales m ON e.clave = m.clave
GROUP BY m.clave, m.descripcion
HAVING AVG(e.cantidad) > 400;

--4
/*
Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado, detallando la clave y descripción del material, excluyendo aquellos proveedores para los que la cantidad promedio sea menor a 500.
SQL
*/
SELECT
    p.razonsocial AS razon_social,
    m.clave AS clave_material,
    m.descripcion AS descripcion_material,
    AVG(e.cantidad) AS cantidad_promedio_material
FROM Entregan e
JOIN Proveedores p ON e.rfc = p.rfc
JOIN Materiales m ON e.clave = m.clave
GROUP BY p.razonsocial, m.clave, m.descripcion
HAVING AVG(e.cantidad) >= 500;

--5
/*
Mostrar en una sola consulta los mismos datos que en la consulta anterior pero para dos grupos de proveedores: aquellos para los que la cantidad promedio entregada es menor a 370 y aquellos para los que la cantidad promedio entregada sea mayor a 450.
*/
SELECT
    p.razonsocial AS razon_social,
    m.clave AS clave_material,
    m.descripcion AS descripcion_material,
    AVG(e.cantidad) AS cantidad_promedio,
    CASE
        WHEN AVG(e.cantidad) < 370 THEN 'Grupo Bajo (< 370)'
        WHEN AVG(e.cantidad) > 450 THEN 'Grupo Alto (> 450)'
        ELSE 'Fuera de grupos'
    END AS grupo
FROM Entregan e
JOIN Proveedores p ON e.rfc = p.rfc
JOIN Materiales m ON e.clave = m.clave
GROUP BY p.razonsocial, m.clave, m.descripcion
HAVING AVG(e.cantidad) < 370 OR AVG(e.cantidad) > 450;
