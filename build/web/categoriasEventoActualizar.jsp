<%-- 
    Document   : categoriasEventoActualizar
    Created on : 14/08/2024, 09:09:35 AM
    Author     : Sebastian
--%>

<%@page import="clases.categoriaEvento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String accion=request.getParameter("accion");
    String nombre=request.getParameter("nombre");
    String descripcion=request.getParameter("descripcion");
    categoriaEvento categoriaE= new categoriaEvento();
    categoriaE.setNombre(nombre);
    categoriaE.setDescripcion(descripcion);
    switch(accion){
        case "Adicionar":
            categoriaE.grabar();
            break;
        case "Modificar":
            categoriaE.setId(request.getParameter("id"));
            categoriaE.modificar();
            break;
        case "Eliminar":
            categoriaE.setId(request.getParameter("id"));
            categoriaE.eliminar();
            break;
    }
 //response.sendRedirect("principal.jsp?CONTENIDO=categorias.jsp");
%>
<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=categoriasEvento.jsp";
</script>