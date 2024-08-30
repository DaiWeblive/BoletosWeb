<%-- 
    Document   : UsuariosFormulario
    Created on : 14/08/2024, 11:26:33 AM
    Author     : Sebastian
--%>

<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String accion=request.getParameter("accion");
String identificacion=request.getParameter("identificacion");
Persona usuario=new Persona();
if (accion.equals("Modificar")) {
        usuario=new Persona(identificacion);
    }
%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3><%=accion.toUpperCase() %> USUARIO</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=usuariosActualizar.jsp">
    <table id="ejemplo02" border="0">
        <tr>
            <th>Identificacion</th>
            <td><input type="text" name="identificacion" maxlength="12" value="<%=usuario.getIdentificacion()%>" required></td>
        </tr>
        <tr>
            <th>Nombres</th>
            <td><input type="text" name="nombres" value="<%=usuario.getNombres()%>" size="50" maxlength="50"></td>
        </tr>
        <tr>
            <th>Apellidos</th>
            <td><input type="text" name="apellidos" value="<%=usuario.getApellidos()%>" size="50" maxlength="50"></td>
        </tr>
        <tr><th>Genero</th><td><%=usuario.getGeneroPersona().getRadioButtons() %></td>   </tr>
        <tr><th>Telefono</th><td><input type="tel" name="telefono" value="<%=usuario.getTelefono()%>" maxlength="12"></td></tr>
        <tr>
            <th>Correo Electronico</th>
            <td><input type="email" name="email" value="<%=usuario.getEmail() %>" maxlength="80" required></td>
        </tr>
        <tr>
            <th>Direccion</th>
            <td><input type="text" name="direccion" value="<%=usuario.getDireccion()%>" maxlength="70" required></td>
        </tr>
        <tr><th>Rol</th><td><select name="tipo"><%=usuario.getTipoPersona().getListaEnOptions()%></select></td></tr>
        <tr><th>Contraseña</th><td><input type="password" name="clave" value="<%=usuario.getClave() %>"></td></tr>
    </table>
        <input type="hidden" name="identificacionAnterior" value="<%=identificacion%>"><p>
            <input id="addCatg"  type="submit" name="accion" value="<%=accion%>">
            <input id="regresar"  type="button" value="Cancelar" onClick="window.history.back()">
</form>