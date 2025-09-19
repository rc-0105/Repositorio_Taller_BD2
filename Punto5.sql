CREATE OR REPLACE FUNCTION fn_totalPedido( 

    param_idPedido IN NUMBER) 

     RETURN NUMBER IS 

    vn_total NUMBER := 0; 

BEGIN 

    SELECT NVL(SUM(cantidad * precio_unit), 0) 

    INTO vn_total 

    FROM DETALLE_PEDIDO 

    WHERE id_pedido = param_idPedido; 

 

    RETURN vn_total; 

EXCEPTION 

    WHEN NO_DATA_FOUND THEN 

        RETURN 0;  

    WHEN OTHERS THEN 

        DBMS_OUTPUT.PUT_LINE('Error al calcular total: ' || SQLERRM); 

        RETURN -1;  

END; 

/ 

SELECT * FROM DETALLE_PEDIDO WHERE id_pedido = 1001; 

SELECT fn_totalPedido(1001) AS total_pedido 
FROM dual; 