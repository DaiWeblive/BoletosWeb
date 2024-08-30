<%-- 
    Document   : usuariosActualizar
    Created on : 14/08/2024, 11:32:52 AM
    Author     : Sebastian
--%>

<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String accion=request.getParameter("accion");
String identificacionAnterior=request.getParameter("identificacionAnterior");

Persona usuario = new Persona();

usuario.setIdentificacion(request.getParameter("identificacion"));
usuario.setNombres(request.getParameter("nombres"));
usuario.setApellidos(request.getParameter("apellidos"));
usuario.setGenero(request.getParameter("genero"));
usuario.setTelefono(request.getParameter("telefono"));
usuario.setEmail(request.getParameter("email"));
usuario.setDireccion(request.getParameter("direccion"));
usuario.setTipo(request.getParameter("tipo"));
usuario.setClave(request.getParameter("clave"));

switch(accion){
    case "Adicionar":
        usuario.grabar();
        break;
    case "Modificar":
        usuario.modificar(identificacionAnterior);
        break;
    case "Eliminar":
        usuario.eliminar();
        break;
}
%>

<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=usuarios.jsp"
</script>
