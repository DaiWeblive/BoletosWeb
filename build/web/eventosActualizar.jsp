<%-- 
    Document   : eventosActualizar
    Created on : 14/08/2024, 05:49:56 PM
    Author     : Sebastian
--%>

<%@page import="clases.Evento"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
boolean subioArchivo=false;
Map<String, String> variables= new HashMap<String, String>(); //aqui se almacenan los datos enviados por el formulario
boolean isMultipart =ServletFileUpload.isMultipartContent(request);
if(!isMultipart){
    //no se pasa por el formulario que corresponde a eliminar
    variables.put("accion", request.getParameter("accion"));
    variables.put("id", request.getParameter("id"));
}else{
    //configuraciones para subir el archivo 
    String rutaActual=getServletContext().getRealPath("/");
    out.print(rutaActual);
    File destino=new File(rutaActual+"/presentacion/eventos/");
    DiskFileItemFactory factory=new DiskFileItemFactory(1024*1024, destino);
    ServletFileUpload upload=new ServletFileUpload(factory);
    File archivo=null;
    
    ServletRequestContext origen = new ServletRequestContext(request);
    
    //para recorrer los elementos enviados por el formulario
    List elementosFormulario=upload.parseRequest(origen);
    Iterator iterador=elementosFormulario.iterator();
    while (iterador.hasNext()) {
            FileItem elemento = (FileItem) iterador.next();
            if(elemento.isFormField()){
                out.print(elemento.getFieldName()+" = "+elemento.getString()+"<br>");
                variables.put(elemento.getFieldName(),elemento.getString());
            }
            else {
                out.print(elemento.getFieldName()+" = "+elemento.getName()+"<br>");
                variables.put(elemento.getFieldName(), elemento.getName());
                if(!elemento.getName().equals("")){
                subioArchivo=true;
                //int ubicacionPunto=elemento.getName().lastIndexOf(".");
                //String extension =elemento.getName().substring(ubicacionPunto);
                //String nombreArchivo=variables.get("nombre")+"."+extension;
                elemento.write(new File(destino,elemento.getName()));
                variables.put(elemento.getFieldName(),elemento.getName());
                }
            }
        }
}
//obtenidos los datos ahora se hace el procesamiento acostumbrado para actualizar 
Evento evento=new Evento();
evento.setId(variables.get("id"));
evento.setNombre(variables.get("nombre"));
evento.setLugar(variables.get("lugar"));
evento.setTelefono(variables.get("telefono"));
evento.setFecha(variables.get("fecha"));
//evento.setHora(variables.get("hora"));
evento.setOrganizador(variables.get("organizador"));
evento.setBoletos(variables.get("boletos"));
evento.setFoto(variables.get("foto"));
evento.setDescripcion(variables.get("descripcion"));
evento.setIdCategoriaEvento(variables.get("idCategoriaEvento"));

switch(variables.get("accion")){
    case "Adicionar":
        evento.grabar();
        break;
    case "Modificar":
        if(!subioArchivo){
            Evento auxiliar=new Evento(variables.get("id"));
            evento.setFoto(auxiliar.getFoto());
        }
        evento.modificar();
        break;
    case "Eliminar":
        evento.eliminar();
        break;
}
%>
<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=eventos.jsp";
</script>


