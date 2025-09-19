CREATE OR REPLACE PROCEDURE sp_ProductosCategoria ( 

    param_categoria IN VARCHAR2 

) IS 

    vc_productos   VARCHAR2(1000); 

    v_nombre PRODUCTO.nombre%TYPE; 

    v_precio PRODUCTO.precio%TYPE; 

    v_stock  PRODUCTO.stock%TYPE; 

 

    CURSOR cur_prod IS 

        SELECT p.nombre AS nombre_producto,  

               p.precio,  

               p.stock 

        FROM PRODUCTO p 

        JOIN CATEGORIA c ON p.id_categoria = c.id_categoria 

        WHERE c.nombre = param_categoria; 

BEGIN 

    DBMS_OUTPUT.PUT_LINE('Productos de la categoría: ' || param_categoria); 

 

    FOR r IN cur_prod LOOP 

        DBMS_OUTPUT.PUT_LINE(' - ' || r.nombre_producto ||  

                             ' | Precio: ' || r.precio ||  

                             ' | Stock: ' || r.stock); 

    END LOOP; 

END; 

/ 