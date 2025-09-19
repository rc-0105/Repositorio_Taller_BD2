CREATE OR REPLACE PROCEDURE sp_registrarDetalle( 

    param_idPedido   IN NUMBER, 

    param_idProducto IN NUMBER, 

    param_cantidad   IN NUMBER 

) IS 

    v_precio PRODUCTO.precio%TYPE; 

    v_stock  PRODUCTO.stock%TYPE; 

BEGIN 

    SELECT precio, stock 

    INTO v_precio, v_stock 

    FROM PRODUCTO 

    WHERE id_producto = param_idProducto; 

 

    INSERT INTO DETALLE_PEDIDO(id_pedido, id_producto, cantidad, precio_unit) 

    VALUES (param_idPedido, param_idProducto, param_cantidad, v_precio); 

 

    UPDATE PRODUCTO 

    SET stock = stock - param_cantidad 

    WHERE id_producto = param_idProducto; 

 

    COMMIT; 

    DBMS_OUTPUT.PUT_LINE('Detalle registrado y stock actualizado correctamente.'); 

EXCEPTION 

    WHEN NO_DATA_FOUND THEN 

        DBMS_OUTPUT.PUT_LINE('Error: Producto ' || param_idProducto || ' no existe.'); 

        ROLLBACK; 

    WHEN DUP_VAL_ON_INDEX THEN 

        DBMS_OUTPUT.PUT_LINE('Error: Ya existe ese producto en el pedido ' || param_idPedido); 

        ROLLBACK; 

    WHEN OTHERS THEN 

        DBMS_OUTPUT.PUT_LINE('Error al registrar detalle: ' || SQLERRM); 

        ROLLBACK; 

END; 

/ 

SELECT * FROM DETALLE_PEDIDO WHERE id_pedido = 1002; 
SELECT id_producto, stock FROM PRODUCTO WHERE id_producto = 103;