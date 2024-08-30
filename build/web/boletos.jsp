<%-- 
    Document   : boletos
    Created on : 14/08/2024, 10:36:06 PM
    Author     : Sebastian
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Boleto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String lista="";
List<Boleto> datos= Boleto.getListaEnObjetos(null , null);
for (int i = 0; i < datos.size(); i++) {
        Boleto boleto= datos.get(i);
        lista+="<tr>";
        lista+="<td align='right'>"+ boleto.getNumero()+ "</td>";
        lista+="<td>"+ boleto.getCantidad()+"</td>";
        lista+="<td>"+ boleto.getPrecio()+"</td>";
        lista+="<td>"+ (boleto.getCategoriaEvento() != null ? boleto.getCategoriaEvento().getNombre() : "Evento no encontrado") +"</td>";
        lista+="<td>"+ boleto.getMedioDepago()+"</td>";
        lista+="<td>"+ boleto.getCliente()+"</td>";
        lista+="<td>"+ boleto.getCategoriaBoleto()+"</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=boletosFormulario.jsp&accion=Modificar&id=" + boleto.getNumero()+
                   " 'title='Modificar'><img src='iconos/modificar.png'></a>  "; 
        lista+="<img src='iconos/eliminar.png'  title='Eliminar' onClick='eliminar("+ boleto.getNumero()+")'> ";
        lista+="</td>";
        lista+="</tr>";
    }
%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3>LISTA DE BOLETOS GENERADOS</h3>
<table id="ejemplo02" border="1">
    <tr>
        <th>Numero</th><th>Cantidad </th><th>Valor Unitario</th><th>Evento</th><th>Medio de Pago</th>
        <th>Cliente</th><th>Categoria Boleto</th>
        <th><a href="principal.jsp?CONTENIDO=boletosFormulario.jsp&accion=Adicionar">
                <img src="iconos/agregar.png"></a></th>
    </tr>
    <%=lista%>
</table>

 <script type="text/javascript">
    function eliminar(numero){
        respuesta= confirm("Realmente desea eliminar el registro?")
        if (respuesta) {
            document.location="principal.jsp?CONTENIDO=boletosActualizar.jsp&accion=Eliminar&numero="+numero;
        }
    }
</script> 