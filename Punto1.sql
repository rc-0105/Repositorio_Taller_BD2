CREATE OR REPLACE PROCEDURE sp_listar_pedidos_cliente ( 

    param_id_cliente IN NUMBER 

) IS 

BEGIN 

    FOR i IN ( 

        SELECT p.id_pedido, 

               p.fecha_pedido, 

               p.estado 

        FROM pedido p 

        WHERE p.id_cliente = param_id_cliente 

    ) LOOP 

        DBMS_OUTPUT.PUT_LINE( 

            'Pedido: ' || i.id_pedido || 

            ' | Fecha: ' || TO_CHAR(i.fecha_pedido, 'DD/MM/YYYY') || 

            ' | Estado: ' || i.estado 

        ); 

    END LOOP; 

END; 

/ 

BEGIN 

    Sp_listar_pedidos_cliente(1);  

END; 

/ 