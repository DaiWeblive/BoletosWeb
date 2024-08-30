<%-- 
    Document   : categoriasBoletoFormulario
    Created on : 14/08/2024, 10:43:11 AM
    Author     : Sebastian
--%>

<%@page import="clases.categoriaBoleto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String accion=request.getParameter("accion");
    String id="generando";
    String nombre="";
    String descripcion="";
    if (accion.equals("Modificar")) {
            id=request.getParameter("id");
            categoriaBoleto categoriaB = new categoriaBoleto(id);
            nombre=categoriaB.getNombre();
            descripcion=categoriaB.getDescripcion();
        }
%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3><%=accion.toUpperCase() %> CATEGORIA</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=categoriasBoletoActualizar.jsp">
    <table id="ejemplo03" border="0">
        <tr><th>Id</th><td><%=id%></td></tr>
        <tr><th>Nombre</th><td><input type="text" name="nombre" value="<%=nombre%>" size="50" maxlength="50" required></td></tr>
        <tr><th>Descripcion</th><td><textarea name="descripcion" cols="50" rows="5"><%=descripcion%></textarea></td></tr>
</table>
<input type="hidden" name="id" value="<%=id%>">
<input id="addCatg" type="submit" name="accion" value="<%=accion%>">
<input id="regresar" type="button" value="Cancelar" onClick="window.history.back()">
</form>