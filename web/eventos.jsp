<%-- 
    Document   : eventos
    Created on : 14/08/2024, 01:45:37 PM
    Author     : Sebastian
--%>

<%@page import="clases.categoriaEvento"%>
<%@page import="java.util.List"%>
<%@page import="clases.Evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String filtro="";   
String chkId=request.getParameter("chkId");
String idInicio="";
String idFin="";
if(chkId!=null){
    chkId="checked";
    idInicio=request.getParameter("idInicio");
    idFin=request.getParameter("idFin");
    filtro+="(evento.id between "+ idInicio +" and "+ idFin +")";   
}else chkId="";
 
 String chkNombre=request.getParameter("chkNombre");
String nombre="";
if(chkNombre!=null){
    chkNombre="checked";
    nombre=request.getParameter("nombre");
    if(!filtro.equals("")) filtro+=" and ";
    filtro+="evento.nombre like '%"+nombre+"%'";
}else chkNombre=""; 

String chkLugar=request.getParameter("chklugar");
String lugar="";
if(chkLugar!=null){
    chkLugar="checked";
    lugar=request.getParameter("lugar");
    if(!filtro.equals("")) filtro+=" and ";
    filtro+="evento.lugar like '%"+lugar+"%'";
}else chkLugar="";

String chkIdCategoriaE=request.getParameter("chkIdCategoriaE");
String idCategoriaE="";
if(chkIdCategoriaE!=null){
    chkIdCategoriaE="checked";
    idCategoriaE=request.getParameter("idCategoriaE");
    if(!filtro.equals("")) filtro+=" and ";
    filtro+="idCategoriaEvento="+idCategoriaE;
}else chkIdCategoriaE="";
    
String lista="";

List<Evento> datos= Evento.getListaEnObjetos(filtro,null);
for (int i = 0; i < datos.size(); i++) {
        Evento evento= datos.get(i);
        lista+="<tr>";
        lista+="<td align='right'>"+ evento.getId() + "</td>";
        lista+="<td>"+ evento.getNombre() +"</td>";
        lista+="<td>"+ evento.getLugar() +"</td>";
        lista+="<td>"+ evento.getTelefono() +"</td>";
        lista+="<td>"+ evento.getFecha() +"</td>";
        lista+="<td>"+ evento.getOrganizador() +"</td>";
        lista+="<td bgColor='"+ evento.getColorEstado() +"'>"+ evento.getBoletos()+"</td>";
        lista+="<td><img src='presentacion/eventos/"+ evento.getFoto() + "' width='130' heigth='135'></td>";
        lista+="<td>"+ evento.getDescripcion()+"</td>";
        lista+="<td>"+ evento.getCategoriaEvento()+"</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=eventosFormulario.jsp&accion=Modificar&id=" + evento.getId() +
                   " 'title='Modificar'><img src='iconos/modificar.png'></a>  "; 
        lista+="<img src='iconos/eliminar.png'  title='Eliminar' onClick='eliminar("+ evento.getId() +")'> ";
        lista+="</td>";
        lista+="</tr>";
    }


%>
<%=filtro%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3>LISTA DE EVENTOS</h3>

<form name="formulario" method="post">
    <table id="ejemplo03" >
        <tr>
            <td><input type="checkbox" name="chkId" <%=chkId%>>Id</td>
            <td>
                desde <input type="number" name="idInicio" value="<%=idInicio%>">
                hasta <input type="number" name="idFin"  value="<%=idFin%>">
            </td>
            <td><input type="checkbox" name="chkNombre" <%=chkNombre%>>Nombre </td>
            <td><input type="text" name="nombre" value="<%=nombre%>"</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="chkLugar" <%=chkLugar%>> Lugar</td>
            <td><input type="text" name="lugar" size="60" value="<%=lugar%>"></td>
            <td><input type="checkbox" name="chkIdCategoriaE" <%=chkIdCategoriaE%>> Categoria</td>
            <td><select name="idCategoriaE"><%=categoriaEvento.getListaEnOptions(idCategoriaE)%></select></td>
        </tr>
    </table><p> 
        <input id="addCatg" type="submit" name="buscar" value="Buscar">        
        
<table id="ejemplo02" border="1"> 
    <tr>
        <th>Id </th><th>Nombre </th><th>Lugar</th><th>Telefono</th><th>Fecha</th><th>Organizador</th>
        <th>Boletos</th><th>Foto</th><th>Descripcion</th><th>Categoria</th>
        <th><a href="principal.jsp?CONTENIDO=eventosFormulario.jsp&accion=Adicionar">
                <img src="iconos/agregar.png"></a></th>
    </tr>
    <%=lista%>
</table>
<p>DISPONIBILIDAD</p>
  <table>
      <tr><th bgColor="red">&nbsp;&nbsp;&nbsp;&nbsp;</th><td>Pocos boletos disponibles</td></tr>
      <tr><th bgColor="green">&nbsp;&nbsp;&nbsp;&nbsp;</th><td>Boletos disponibles</td></tr>
  </table>

</form>
         

 <script type="text/javascript">
    function eliminar(id){
        respuesta= confirm("Realmente desea eliminar el registro?")
        if (respuesta) {
            document.location="principal.jsp?CONTENIDO=eventosActualizar.jsp&accion=Eliminar&id="+id;
        }
    }
</script> 