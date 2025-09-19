CREATE OR REPLACE PACKAGE pkg_productos AS 

    PROCEDURE fn_add_producto( 

        param_id_producto IN NUMBER, 

        param_nombre      IN VARCHAR2, 

        param_precio      IN NUMBER, 

        param_stock       IN NUMBER, 

        param_id_categoria IN NUMBER 

    ); 

 

    PROCEDURE fn_update_stock( 

        param_id_producto IN NUMBER, 

        param_nuevo_stock IN NUMBER 

    ); 

 

    PROCEDURE fn_delete_producto( 

        param_id_producto IN NUMBER 

    ); 

END pkg_productos; 

/ 

 

CREATE OR REPLACE PACKAGE BODY pkg_productos AS 

 

    PROCEDURE fn_add_producto( 

        param_id_producto IN NUMBER, 

        param_nombre      IN VARCHAR2, 

        param_precio      IN NUMBER, 

        param_stock       IN NUMBER, 

        param_id_categoria IN NUMBER 

    ) IS 

    BEGIN 

        INSERT INTO producto (id_producto, nombre, precio, stock, id_categoria) 

        VALUES (param_id_producto, param_nombre, param_precio, param_stock, param_id_categoria); 

    END fn_add_producto; 

 

    PROCEDURE fn_update_stock( 

        param_id_producto IN NUMBER, 

        param_nuevo_stock IN NUMBER 

    ) IS 

    BEGIN 

        UPDATE producto 

        SET stock = param_nuevo_stock 

        WHERE id_producto = param_id_producto; 

    END fn_update_stock; 

 

    PROCEDURE fn_delete_producto( 

        param_id_producto IN NUMBER 

    ) IS 

    BEGIN 

        DELETE FROM producto 

        WHERE id_producto = param_id_producto; 

    END fn_delete_producto; 

 

END pkg_productos; 

/ 

 

BEGIN    

    pkg_productos.fn_add_producto(1, 'Laptop', 1500, 10, 2); 

END; 

/ 

 

BEGIN    

    pkg_productos.fn_update_stock(1, 15); 

END; 

/ 

BEGIN    

    pkg_productos.fn_delete_producto(1); 

END; 

/ 