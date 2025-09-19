CREATE OR REPLACE PROCEDURE actualizar_stock ( 

    param_id_producto IN NUMBER, 

    param_nuevo_stock IN NUMBER 

) IS 

    ex_stock_negativo EXCEPTION; 

BEGIN 

 

    IF param_nuevo_stock < 0 THEN 

        RAISE ex_stock_negativo; 

    ELSE 

        UPDATE producto 

        SET stock = param_nuevo_stock 

        WHERE id_producto = param_id_producto; 

 

        DBMS_OUTPUT.PUT_LINE('Stock actualizado para producto ' || param_id_producto || 

                             ': ' || param_nuevo_stock); 

    END IF; 

 

EXCEPTION 

    WHEN ex_stock_negativo THEN 

        DBMS_OUTPUT.PUT_LINE('Error: No se permite asignar stock negativo al producto ' || param_id_producto); 

    WHEN NO_DATA_FOUND THEN 

        DBMS_OUTPUT.PUT_LINE('Error: No existe el producto con ID ' || param_id_producto); 

    WHEN OTHERS THEN 

        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM); 

END; 

/ 

 

BEGIN 

    actualizar_stock(1, 50);  

    actualizar_stock(2, -10); 

    actualizar_stock(3, -98);  

END; 