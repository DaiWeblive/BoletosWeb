<%-- 
    Document   : usuarios
    Created on : 14/08/2024, 11:15:00 AM
    Author     : Sebastian
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String lista="";
List<Persona> datos=Persona.getListaEnObjetos(null, null);
for (int i = 0; i < datos.size(); i++) {
        Persona usuario = datos.get(i);
        lista+="<tr>";
        lista+="<td>" + usuario.getIdentificacion() + "</td>";
        lista+="<td>" + usuario.getNombres()+ "</td>";
        lista+="<td>" + usuario.getApellidos() + "</td>";
        lista+="<td>" + usuario.getGeneroPersona()+ "</td>";
        lista+="<td>" + usuario.getTelefono() + "</td>";
        lista+="<td>" + usuario.getEmail()+ "</td>";
        lista+="<td>" + usuario.getDireccion()+ "</td>";
        lista+="<td>" + usuario.getTipoPersona()+ "</td>";
         lista+="<td>";
            lista+="<a href='principal.jsp?CONTENIDO=usuariosFormulario.jsp&accion=Modificar&identificacion=" + usuario.getIdentificacion()+
                " 'title='Modificar'><img src='iconos/modificar.png'></a>  "; 
            lista+="<img src='iconos/eliminar.png' title='Eliminar' onClick='eliminar("+ usuario.getIdentificacion()+")'> ";
            lista+="</td>";
            lista+="</tr>";
  }
%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3>LISTA DE USUARIOS</h3>
<table id="ejemplo02" border="1">
    <tr>
        <th>Identificacion</th><th>Nombres</th><th>Apellidos</th><th>Genero</th><th>telefono</th><th>Email</th><th>Direccion</th><th>Tipo</th>
                <th><a href="principal.jsp?CONTENIDO=usuariosFormulario.jsp&accion=Adicionar" title="Adicionar">
                        <img src="iconos/usuario.png">  </a></th>
    </tr>
    <%=lista%>
</table>
<script type="text/javascript">
    function eliminar(identificacion){
        resultado=confirm("Realmente desea eliminar el usuario con identificacion"+identificacion+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=usuariosActualizar.jsp&accion=Eliminar&identificacion="+identificacion;
         }
    }
</script>