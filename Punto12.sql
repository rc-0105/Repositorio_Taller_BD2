CREATE OR REPLACE VIEW v_inventarioBajo AS 

SELECT p.id_producto, 

       p.nombre, 

       p.stock, 

       p.id_categoria 

FROM   PRODUCTO p 

WHERE  p.stock < 10; 

 

SELECT * FROM v_inventarioBajo; 