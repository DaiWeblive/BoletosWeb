<%-- 
    Document   : boletosActualizar
    Created on : 15/08/2024, 12:56:47 AM
    Author     : Sebastian
--%>

<%@page import="clases.Boleto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String accion=request.getParameter("accion");
String numero=request.getParameter("numero");


Boleto boleto = new Boleto();

boleto.setNumero(request.getParameter("numero"));
boleto.setCantidad(request.getParameter("cantidad"));
boleto.setPrecio(request.getParameter("precio"));
boleto.setIdEvento(request.getParameter("idEvento"));
boleto.setIdMedioDePago(request.getParameter("idMedioDePago"));
boleto.setIdentificacionCliente(request.getParameter("identificacionCliente"));
boleto.setIdCategoriaBoleto(request.getParameter("idCategoriaBoleto"));


switch(accion){
    case "Adicionar":
        boleto.grabar();
        break;
    case "Modificar":
        boleto.modificar();
        break;
    case "Eliminar":
        boleto.eliminar();
        break;}
%>
<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=boletos.jsp"
</script>
