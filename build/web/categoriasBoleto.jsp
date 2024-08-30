<%-- 
    Document   : categoriasBoleto
    Created on : 14/08/2024, 09:29:14 AM
    Author     : Sebastian
--%>

<%@page import="java.util.List"%>
<%@page import="clases.categoriaBoleto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String lista=" ";
    List<categoriaBoleto> datos=categoriaBoleto.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
            categoriaBoleto categoriaB = datos.get(i);
            lista+="<tr>";
            lista+="<td align='rigtht'>"+categoriaB.getId()+"</td>";
            lista+="<td>"+categoriaB.getNombre()+"</td>";
            lista+="<td>"+categoriaB.getDescripcion()+"</td>";
            lista+="<td>";
            lista+="<a href='principal.jsp?CONTENIDO=categoriasBoletoFormulario.jsp&accion=Modificar&id=" + categoriaB.getId() +
                " 'title='Modificar'><img src='iconos/modificar.png'></a>  "; 
            lista+="<img src='iconos/eliminar.png' title='Eliminar' onClick='eliminar("+ categoriaB.getId()+")'> ";
            lista+="</td>";
            lista+="</tr>";
      }
%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3>LISTA DE CATEGORIAS BOLETOS</h3>
<table id="ejemplo02" border="1">
    <tr>
        <th>Id </th><th>Nombre </th><th>Descripcion</th>
        <th><a href="principal.jsp?CONTENIDO=categoriasBoletoFormulario.jsp&accion=Adicionar">
                <img src="iconos/agregar.png"></a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(id){
        respuesta= confirm("Realmente desea eliminar el registro?")
        if (respuesta) {
            document.location="principal.jsp?CONTENIDO=categoriasBoletoActualizar.jsp&accion=Eliminar&id="+id;
        }
    }
</script> 