<%-- 
    Document   : mediosDePago
    Created on : 14/08/2024, 10:59:10 AM
    Author     : Sebastian
--%>

<%@page import="java.util.List"%>
<%@page import="clases.mediosDePago"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 String  lista=" ";
 List<mediosDePago> datos= mediosDePago.getListaEnObjetos(null, null);
 for (int i = 0; i < datos.size(); i++) {
         mediosDePago pago = datos.get(i);
         lista+="<tr>";
         lista+="<td align='rigtht'>" + pago.getId() + "</td>";
         lista+="<td>" + pago.getNombre() + "</td>";
         lista+="<td>" + pago.getDescripcion() + "</td>";
         lista+="<td>";
            lista+="<a href='principal.jsp?CONTENIDO=pagoFormulario.jsp&accion=Modificar&id=" + pago.getId() +
                " 'title='Modificar'><img src='iconos/modificar.png'></a>  "; 
            lista+="<img src='iconos/eliminar.png' title='Eliminar' onClick='eliminar("+ pago.getId()+")'> ";
            lista+="</td>";
            lista+="</tr>";
     }
%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3>LISTA MEDIOS DE PAGO</h3>
<table id="ejemplo02" border="1">
    <tr>
        <th>Id</th><th>Nombre</th><th>Descripcion</th>
        <th><a href="principal.jsp?CONTENIDO=pagoFormulario.jsp&accion=Adicionar">
                <img src="iconos/agregar.png"></a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(id){
        respuesta= confirm("Realmente desea eliminar el registro?")
        if (respuesta) {
            document.location="principal.jsp?CONTENIDO=pagoActualizar.jsp&accion=Eliminar&id="+id;
        }
    }
</script> 