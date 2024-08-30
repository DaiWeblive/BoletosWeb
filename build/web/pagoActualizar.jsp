<%-- 
    Document   : pagoActualizar
    Created on : 14/08/2024, 11:08:01 AM
    Author     : Sebastian
--%>

<%@page import="clases.mediosDePago"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String accion=request.getParameter("accion");
    String nombre=request.getParameter("nombre");
    String descripcion=request.getParameter("descripcion");
    mediosDePago pago = new mediosDePago();
    pago.setNombre(nombre);
    pago.setDescripcion(descripcion);
    switch(accion){
        case "Adicionar":
            pago.grabar();
            break;
        case "Modificar":
            pago.setId(request.getParameter("id"));
            pago.modificar();
            break;
        case "Eliminar":
            pago.setId(request.getParameter("id"));
            pago.eliminar();
            break;
    }
 //response.sendRedirect("principal.jsp?CONTENIDO=mediosDePago.jsp");
%>
<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=mediosDePago.jsp";
</script>
