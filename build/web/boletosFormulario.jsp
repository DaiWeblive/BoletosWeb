<%-- 
    Document   : boletosFormulario
    Created on : 14/08/2024, 11:39:01 PM
    Author     : Sebastian
--%>

<%@page import="clases.Persona"%>
<%@page import="clases.mediosDePago"%>
<%@page import="clases.Evento"%>
<%@page import="clases.categoriaBoleto"%>
<%@page import="clases.Boleto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
String accion=request.getParameter("accion");
String numero=request.getParameter("numero");
Boleto boleto=new Boleto();
boleto.setNumero("sin asignar");
if(accion.equals("Modificar")){
    boleto=new Boleto(numero);
}

%>
<link rel="stylesheet" href="presentacion/EstiloTablas.css">
<h3><%=accion.toUpperCase() %> BOLETO</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=boletosActualizar.jsp">
    <table id="ejemplo03" border="0">
        <tr>
            <th>Numero</th><td><%=boleto.getNumero()%></td>
        </tr>
        <tr>
            <th>Cantidad</th>
            <td><input type="number" name="cantidad" value="<%=boleto.getCantidad()%>"></td>
        </tr>
        <tr>
            <th>Valor Boleto</th>
            <td><input type="number" name="precio" value="<%=boleto.getPrecio()%>"></td>
        </tr>
        <tr>
            <th>Evento</th>
            <td><select name="idEvento"><%=Evento.getListaEnOptions(boleto.getIdMedioDePago()) %> </select></td>
        </tr>
        <tr>
            <th>Medio de Pago</th>
            <td><select name="idMedioDePago"><%=mediosDePago.getListaEnOptions(boleto.getIdMedioDePago()) %> </select></td>
        </tr>
        <tr>
            <th>Cliente</th>
            <td><input type="text" name="identificacionCliente" id="cliente" value="<%=boleto.getCliente()%>"></td>
        </tr>
        <tr>
            <th>Categoria Boleto</th>
            <td><select name="idCategoriaBoleto"><%=categoriaBoleto.getListaEnOptions(boleto.getIdCategoriaBoleto()) %> </select></td>
        </tr>
        
    </table>
    <input type="hidden" name="numero" value="<%=numero%>"><p>
    <input  type="submit" name="accion" value="<%=accion%>">
    <input  type="button" value="Cancelar" onClick="window.history.back()">
</form>

    <script type="text/javascript">
    
    
    $(document).ready(function() {
    var personas = <%=Persona.getListaEnArregloJS("tipo='C'", null)%>;
    $("#cliente").autocomplete({
        source: personas
    });
});

    </script>