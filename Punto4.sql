CREATE OR REPLACE PROCEDURE sp_cancelarPedido( 

    param_idPedido IN NUMBER 

) IS 

BEGIN 

    FOR recorrido IN ( 

        SELECT id_producto, cantidad 

        FROM DETALLE_PEDIDO 

        WHERE id_pedido = param_idPedido 

    ) LOOP 

        UPDATE PRODUCTO 

        SET stock = stock + recorrido.cantidad 

        WHERE id_producto = recorrido.id_producto; 

    END LOOP; 

    UPDATE PEDIDO 

    SET estado = 'CANCELADO' 

    WHERE id_pedido = param_idPedido; 

    COMMIT; 

EXCEPTION 

    WHEN NO_DATA_FOUND THEN 

        DBMS_OUTPUT.PUT_LINE('El pedido '||param_idPedido||' no existe.'); 

        ROLLBACK; 

    WHEN OTHERS THEN 

        DBMS_OUTPUT.PUT_LINE('Error al cancelar pedido: '||SQLERRM); 

        ROLLBACK; 

END; 

/ 

SELECT id_pedido, estado 
FROM PEDIDO 
WHERE id_pedido = 1002; 

SELECT p.id_producto, p.nombre, p.stock, d.cantidad 
FROM PRODUCTO p 
JOIN DETALLE_PEDIDO d ON p.id_producto = d.id_producto 
WHERE d.id_pedido = 1002; 