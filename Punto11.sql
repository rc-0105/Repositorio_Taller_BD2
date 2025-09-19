CREATE OR REPLACE VIEW v_pedidosTotales AS 

SELECT c.nombre       AS cliente, 

       p.id_pedido, 

       p.fecha_pedido, 

       NVL(SUM(d.cantidad * d.precio_unit), 0) AS total_pedido 

FROM   CLIENTE c 

JOIN   PEDIDO p ON c.id_cliente = p.id_cliente 

LEFT JOIN DETALLE_PEDIDO d ON p.id_pedido = d.id_pedido 

GROUP BY c.nombre, p.id_pedido, p.fecha_pedido; 

 

SELECT * FROM v_pedidosTotales;