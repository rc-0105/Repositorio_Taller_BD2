CREATE OR REPLACE VIEW v_clientesPedidos AS 

SELECT c.id_cliente, 

       c.nombre      AS cliente, 

       COUNT(p.id_pedido) AS total_pedidos 

FROM   CLIENTE c 

LEFT JOIN PEDIDO p ON c.id_cliente = p.id_cliente 

GROUP BY c.id_cliente, c.nombre; 

SELECT * FROM v_clientesPedidos; 

 