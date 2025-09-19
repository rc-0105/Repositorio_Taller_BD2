-- Inserción de datos Clientes

DECLARE 

    vn_maxid NUMBER; 

BEGIN 

    SELECT NVL(MAX(id_cliente),0) INTO vn_maxid FROM CLIENTE; 

 

    FOR i IN vn_maxid+1 .. vn_maxid+52 LOOP 

        INSERT INTO CLIENTE VALUES ( 

            i, 

            'Cliente_' || i, 

            'cliente' || i || '@unbosque.edu.co', 

            SYSDATE - DBMS_RANDOM.VALUE(1, 365) 

        ); 

    END LOOP; 

 

    COMMIT; 

END; 

/

-- Inserción de datos Productos

DECLARE 

    vn_maxid NUMBER; 

BEGIN 

     

    SELECT NVL(MAX(id_producto), 100) INTO vn_maxid FROM PRODUCTO; 

 

    FOR i IN vn_maxid+1 .. vn_maxid+51 LOOP 

        INSERT INTO PRODUCTO VALUES ( 

            i, 

            'Producto_' || i,                             

            ROUND(DBMS_RANDOM.VALUE(10, 3000), 2),      

            ROUND(DBMS_RANDOM.VALUE(5, 100)),            

            MOD(i,5)+1                                  

        ); 

    END LOOP; 

 

    COMMIT; 

END; 

/

-- Inserción de datos pedidos

DECLARE 

    vn_maxid NUMBER; 

    vn_countClientes NUMBER; 

BEGIN 

    

    SELECT NVL(MAX(id_pedido), 1000) INTO vn_maxid FROM PEDIDO; 

     

    SELECT COUNT(*) INTO vn_countClientes FROM CLIENTE; 

 

    FOR i IN vn_maxid+1 .. vn_maxid+200 LOOP 

        INSERT INTO PEDIDO (id_pedido, id_cliente, fecha_pedido, estado) 

        VALUES ( 

            i, 

            (SELECT id_cliente  

             FROM (SELECT id_cliente FROM CLIENTE ORDER BY DBMS_RANDOM.VALUE) 

             WHERE ROWNUM = 1), 

            SYSDATE - ROUND(DBMS_RANDOM.VALUE(0, 60)), 

            CASE ROUND(DBMS_RANDOM.VALUE(1,3)) 

                WHEN 1 THEN 'ENVIADO' 

                WHEN 2 THEN 'PENDIENTE' 

                ELSE 'CANCELADO' 

            END 

        ); 

    END LOOP; 

 

    COMMIT; 

END; 

/ 