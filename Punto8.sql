CREATE OR REPLACE TRIGGER trg_precioMinimo 
BEFORE INSERT ON PRODUCTO 
FOR EACH ROW 

BEGIN 

    IF :NEW.precio < 10 THEN 

        RAISE_APPLICATION_ERROR(-20020, 'El precio no puede ser menor a 10.'); 

    END IF; 

END; 

/ 

INSERT INTO PRODUCTO (id_producto, nombre, precio, stock, id_categoria) 
VALUES (106, 'Lapicero', 5, 100, 2); 