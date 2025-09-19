CREATE OR REPLACE FUNCTION fn_PrecioCategoria( 

    param_idCategoria IN NUMBER 

) RETURN NUMBER IS 

    vn_promedio NUMBER := 0; 

BEGIN 

    SELECT NVL(AVG(precio), 0) 

    INTO vn_promedio 

    FROM PRODUCTO 

    WHERE id_categoria = param_idCategoria; 

 

    RETURN vn_promedio; 

EXCEPTION 

    WHEN NO_DATA_FOUND THEN 

        RETURN 0; 

    WHEN OTHERS THEN 

        DBMS_OUTPUT.PUT_LINE('Error al calcular promedio: ' || SQLERRM); 

        RETURN -1; 

END; 

/ 

SELECT fn_PrecioCategoria(1) AS promedio_precio 
FROM dual; 
 
SELECT * FROM PRODUCTO; 