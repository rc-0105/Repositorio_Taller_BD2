CREATE OR REPLACE TRIGGER trg_historicoPrecios 

AFTER UPDATE OF precio ON PRODUCTO 

FOR EACH ROW 

BEGIN 

    INSERT INTO HISTORICO_PRECIOS (id_producto, precio_anterior, precio_nuevo, fecha_cambio) 

    VALUES (:OLD.id_producto, :OLD.precio, :NEW.precio, SYSDATE); 

END; 

/ 

SELECT id_producto, nombre, precio  
FROM PRODUCTO  
WHERE id_producto = 103;


UPDATE PRODUCTO 
SET precio = 90 
WHERE id_producto = 103; 
COMMIT; 
SELECT *  
FROM HISTORICO_PRECIOS 
WHERE id_producto = 103; 