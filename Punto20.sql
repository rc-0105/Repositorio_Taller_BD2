CREATE OR REPLACE PACKAGE pkg_pedidos AS 

    FUNCTION fn_totalPedido(param_id_pedido IN NUMBER) RETURN NUMBER; 

    FUNCTION fn_numPedidosCliente(param_id_cliente IN NUMBER) RETURN NUMBER; 

END pkg_pedidos; 

/ 