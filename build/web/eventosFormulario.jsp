<%-- 
    Document   : eventosFormulario
    Created on : 14/08/2024, 04:46:15 PM
    Author     : Sebastian
--%>

<%@page import="clases.categoriaEvento"%>
<%@page import="clases.Evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
String accion=request.getParameter("accion");
String id=request.getParameter("id");
Evento evento=new Evento();
evento.setId("Sin generar");
if(accion.equals("Modificar")){
    evento=new Evento(id);
}

%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3><%=accion.toUpperCase() %> EVENTO</h3>
<table id="ejemplo03" border="0"><tr><td><!-- para la tabla que se creó para la imagen-->
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=eventosActualizar.jsp" enctype="multipart/form-data">
    <table id="ejemplo03" border="0">
        <tr><th>Id</th><td><%=evento.getId()%></td></tr>
        <tr>
            <th>Nombre</th>
            <td><input type="text" name="nombre" value="<%=evento.getNombre()%>" maxlength="50" size="50" required</td>
        </tr>
        <tr>
            <th>Lugar</th>
            <td>
                <input type="text" name="lugar" value="<%=evento.getLugar()%>"  required>
            </td>
        </tr>
        <tr>
            <th>telefono</th>
            <td>
                <input type="tel" name="telefono" value="<%=evento.getTelefono()%>"  required>
            </td>
        </tr>
        <tr>
            <th>fecha</th>
            <td><input type="text" name="fecha" value="<%=evento.getFecha()%>"</td>
        </tr>
         <tr>
            <th>Organizador</th>
            <td><input type="text" name="organizador" value="<%=evento.getOrganizador()%>"</td>
        </tr>   
         <tr>
            <th>boletos</th>
            <td><input type="number" name="boletos" value="<%=evento.getBoletos() %>"</td>
        </tr> 
         <tr>
            <th>Foto</th>
            <td>
                <input type="file" name="foto" accept="image/*" onchange="mostrarFoto();">
            </td>
         </tr>
          <tr>
            <th>Descripcion</th>
            <td><textarea name="descripcion" rows="4" cols="40"><%=evento.getDescripcion()%></textarea></td>
        </tr>
        <tr>
            <th>Categoria</th>
            <td><select name="idCategoriaEvento"><%=categoriaEvento.getListaEnOptions(evento.getIdCategoriaEvento())%> </select></td>
        </tr>
    </table> 
    <p>
    <input type="hidden" name="id" value="<%=evento.getId()%>">
    <input id="addCatg" type="submit" name="accion" value="<%=accion%>">
    <input id="regresar" type="button" value="Cancelar" onClick="window.history.back()">
   
</form>
</td><td><img src="presentacion/eventos/<%=evento.getFoto()%>" id="foto" width="250" height="350"></td></tr></table>

<script type="text/javascript">
    
     
    function mostrarFoto(){
        var lector=new FileReader();
        lector.readAsDataURL(document.formulario.foto.files[0]);
        lector.onloadend= function(){
            document.getElementById("foto").src=lector.result;
        }
    }
</script>    