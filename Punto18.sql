CREATE OR REPLACE PROCEDURE sp_insertarCliente ( 

    param_idCliente IN NUMBER, 

    param_nombre     IN VARCHAR2, 

    param_email      IN VARCHAR2 

) IS 

BEGIN 

    INSERT INTO CLIENTE (id_cliente, nombre, email, fecha_registro) 

    VALUES ( param_idCliente, param_nombre, param_email, SYSDATE); 

 

    DBMS_OUTPUT.PUT_LINE('Cliente insertado correctamente.'); 

EXCEPTION 

    WHEN DUP_VAL_ON_INDEX THEN 

        DBMS_OUTPUT.PUT_LINE('Error: el correo ' || param_email || ' ya está registrado.'); 

    WHEN OTHERS THEN 

        DBMS_OUTPUT.PUT_LINE('Otro error: ' || SQLERRM); 

END; 

/ 

SET SERVEROUTPUT ON; 

 

EXEC sp_insertar_cliente(10, 'Laura Gómez', 'laura@unbosque.edu.co'); 

EXEC sp_insertar_cliente(11, 'Pedro Ruiz', 'laura@unbosque.edu.co'); 