<%-- 
    Document   : categoriasEvento
    Created on : 14/08/2024, 08:45:07 AM
    Author     : Sebastian
--%>

<%@page import="java.util.List"%>
<%@page import="clases.categoriaEvento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String lista=" ";
    List<categoriaEvento> datos=categoriaEvento.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
            categoriaEvento categoriaE = datos.get(i);
            lista+="<tr>";
            lista+="<td align='rigtht'>"+categoriaE.getId()+"</td>";
            lista+="<td>"+categoriaE.getNombre()+"</td>";
            lista+="<td>"+categoriaE.getDescripcion()+"</td>";
            lista+="<td>";
            lista+="<a href='principal.jsp?CONTENIDO=categoriasEventoFormulario.jsp&accion=Modificar&id=" + categoriaE.getId() +
                " 'title='Modificar'><img src='iconos/modificar.png'></a>  "; 
            lista+="<img src='iconos/eliminar.png' title='Eliminar' onClick='eliminar("+ categoriaE.getId()+")'> ";
            lista+="</td>";
            lista+="</tr>";
      }
%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3>LISTA DE CATEGORIAS EVENTOS</h3>
<table id="ejemplo02" border="1">
    <tr>
        <th>Id </th><th>Nombre </th><th>Descripcion</th>
        <th><a href="principal.jsp?CONTENIDO=categoriasEventoFormulario.jsp&accion=Adicionar">
                <img src="iconos/agregar.png"></a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(id){
        respuesta= confirm("Realmente desea eliminar el registro?")
        if (respuesta) {
            document.location="principal.jsp?CONTENIDO=categoriasEventoActualizar.jsp&accion=Eliminar&id="+id;
        }
    }
</script> 
