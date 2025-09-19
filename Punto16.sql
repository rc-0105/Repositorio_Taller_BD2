CREATE OR REPLACE PROCEDURE sp_contarRegistros ( 

    param_tabla IN VARCHAR2 

) IS 

    vc_sql   VARCHAR2(1000); 

    vn_count NUMBER; 

BEGIN 

    vc_sql := 'SELECT COUNT(*) FROM ' ||param_tabla; 

 

    EXECUTE IMMEDIATE vc_sql INTO vn_count; 

 

    DBMS_OUTPUT.PUT_LINE('La tabla ' || param_tabla || ' tiene ' || vn_count || ' registros.'); 

EXCEPTION 

    WHEN OTHERS THEN 

        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM); 

END; 

/ 

SET SERVEROUTPUT ON; 

EXEC sp_contarRegistros('PRODUCTO'); 

EXEC sp_contarRegistros('CLIENTE'); 

EXEC sp_contarRegistros('PEDIDO'); 