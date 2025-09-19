CREATE OR REPLACE PROCEDURE sp_registrar_pedido ( 

    param_id_cliente  IN NUMBER, 

    param_estado      IN VARCHAR2 DEFAULT 'PENDIENTE' 

) IS 

    vn_id_pedido NUMBER; 

    vn_precio    NUMBER; 

    vn_producto  NUMBER; 

    vn_cantidad  NUMBER; 

BEGIN 

 

    SELECT NVL(MAX(id_pedido), 0) + 1 

    INTO vn_id_pedido 

    FROM pedido; 

 

 

    INSERT INTO pedido (id_pedido, id_cliente, fecha_pedido, estado) 

    VALUES (vn_id_pedido, param_id_cliente, SYSDATE, param_estado); 

 

    SELECT id_producto 

    INTO vn_producto 

    FROM ( 

        SELECT id_producto FROM producto ORDER BY DBMS_RANDOM.VALUE 

    ) 

    WHERE ROWNUM = 1; 

 

    vn_cantidad := TRUNC(DBMS_RANDOM.VALUE(1, 5));  

 

    SELECT precio INTO vn_precio 

    FROM producto 

    WHERE id_producto = vn_producto; 

 

 

    INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unit) 

    VALUES (vn_id_pedido, vn_producto, vn_cantidad, vn_precio); 

 

    DBMS_OUTPUT.PUT_LINE('Pedido ' || vn_id_pedido || ' registrado para cliente ' || param_id_cliente); 

END; 

/ 

 

BEGIN 

    Sp_REGISTRAR_PEDIDO(1); 

END; 