<%-- 
    Document   : pagoFormulario
    Created on : 14/08/2024, 11:05:37 AM
    Author     : Sebastian
--%>

<%@page import="clases.mediosDePago"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String accion=request.getParameter("accion");
    String id="generando";
    String nombre="";
    String descripcion="";
    if (accion.equals("Modificar")) {
           id=request.getParameter("id");
           mediosDePago pago = new mediosDePago(id);
           nombre=pago.getNombre();
           descripcion=pago.getDescripcion();
       }
%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3><%=accion.toUpperCase() %> MEDIO DE PAGO</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=pagoActualizar.jsp">
    <table id="ejemplo02" border="0">
        <tr><th>Id</th><td><%=id%></td></tr>
        <tr><th>Nombre</th><td><input type="text" name="nombre" value="<%=nombre%>" size="50" maxlength="50" required></td></tr>
        <tr><th>Descripcion</th><td><textarea name="descripcion" cols="50" rows="5"><%=descripcion%></textarea></td></tr>
</table>
<input type="hidden" name="id" value="<%=id%>">
<input id="addCatg" type="submit" name="accion" value="<%=accion%>">
<input id="regresar" type="button" value="Cancelar" onClick="window.history.back()">
</form>