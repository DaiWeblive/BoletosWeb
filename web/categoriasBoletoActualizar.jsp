<%-- 
    Document   : categoriasBoletoActualizar
    Created on : 14/08/2024, 10:45:16 AM
    Author     : Sebastian
--%>

<%@page import="clases.categoriaBoleto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String accion=request.getParameter("accion");
    String nombre=request.getParameter("nombre");
    String descripcion=request.getParameter("descripcion");
    categoriaBoleto categoriaB= new categoriaBoleto();
    categoriaB.setNombre(nombre);
    categoriaB.setDescripcion(descripcion);
    switch(accion){
        case "Adicionar":
            categoriaB.grabar();
            break;
        case "Modificar":
            categoriaB.setId(request.getParameter("id"));
            categoriaB.modificar();
            break;
        case "Eliminar":
            categoriaB.setId(request.getParameter("id"));
            categoriaB.eliminar();
            break;
    }
 //response.sendRedirect("principal.jsp?CONTENIDO=categorias.jsp");
%>
<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=categoriasBoleto.jsp";
</script>
