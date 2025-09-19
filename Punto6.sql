CREATE OR REPLACE FUNCTION fn_numPedidosCliente( 

    param_idCliente IN NUMBER 

) RETURN NUMBER IS 

    vn_total NUMBER := 0; 

BEGIN 

    SELECT COUNT(*) 

    INTO vn_total 

    FROM PEDIDO 

    WHERE id_cliente = param_idCliente; 

 

    RETURN vn_total; 

EXCEPTION 

    WHEN NO_DATA_FOUND THEN 

        RETURN 0; 

    WHEN OTHERS THEN 

        DBMS_OUTPUT.PUT_LINE('Error al contar pedidos: ' || SQLERRM); 

        RETURN -1;  

END; 

/ 

SELECT fn_numPedidosCliente(1) AS num_pedidos 
FROM dual; 

SELECT * from PEDIDO;