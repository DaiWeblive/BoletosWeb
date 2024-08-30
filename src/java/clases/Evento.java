/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sebastian
 */
public class Evento {
    private String id;
    private String nombre;
    private String lugar;
    private String telefono;
    private String fecha;
    //private String hora;
    private String organizador;
    private String boletos;
    private String foto;
    private String descripcion;
    private String idCategoriaEvento;

    public Evento() {
    }

    public Evento(String id) {
       String cadenaSQL="select nombre, lugar, telefono, fecha,organizador,"
                + "boletos,foto,descripcion,idCategoriaEvento from Evento where id="+id;
        ResultSet  resultado= ConectorBD.consultar(cadenaSQL);
        try {
            if(resultado.next()){
                this.id=id;
                nombre=resultado.getString("nombre");
                lugar=resultado.getString("lugar");
                telefono=resultado.getString("telefono");
                fecha=resultado.getString("fecha");
               // hora=resultado.getString("resultado");
                organizador=resultado.getString("organizador");
                boletos=resultado.getString("boletos");
                foto=resultado.getString("foto");
                descripcion=resultado.getString("descripcion");
               idCategoriaEvento=resultado.getString("idCategoriaEvento");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Producto.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al consultar el id"+ex.getMessage());
        }
    }
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        String resultado=nombre;
        if(nombre==null) resultado="";
        return resultado;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLugar() {
        String resultado=lugar;
        if(lugar==null) resultado="";
        return resultado;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getTelefono() {
        String resultado=telefono;
        if(telefono==null) resultado="";
        return resultado;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFecha() {
        String resultado=fecha;
        if(fecha==null) resultado="";
        return resultado;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getOrganizador() {
        String resultado=organizador;
        if(organizador==null) resultado="";
        return resultado;
    }

    public void setOrganizador(String organizador) {
        this.organizador = organizador;
    }

    public String getBoletos() {
        String resultado=boletos;
        if(boletos==null) resultado="";
        return resultado;
    }

    public void setBoletos(String boletos) {
        this.boletos = boletos;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getDescripcion() {
        String resultado=descripcion;
        if(descripcion==null) resultado="";
        return resultado; 
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getIdCategoriaEvento() {
         if(idCategoriaEvento==null) return "";
        return idCategoriaEvento;
    }
    
    public categoriaEvento getCategoriaEvento(){
        return new categoriaEvento(idCategoriaEvento);
    }

    public void setIdCategoriaEvento(String idCategoriaEvento) {
        this.idCategoriaEvento = idCategoriaEvento;
    }

    public String getColorEstado(){
        String color="";
        int x=15;
        if(Integer.parseInt(boletos)<=x) color="red";
        else if (Integer.parseInt(boletos)>x) color="green";
        return color;
    }
  
    @Override
    public String toString() {
        return nombre;
    }
    
    
    
    public boolean grabar(){
        String cadenaSQL="insert into Evento (nombre, lugar, telefono, fecha,organizador,"
                + " boletos,foto,descripcion,idCategoriaEvento)"
                + " values ('"+nombre+"', '"+lugar+"', '"+telefono+"', '"+fecha+"',"
                + " '"+organizador+"', '"+boletos+"','"+foto+"', '"+descripcion+"', '"+idCategoriaEvento+"')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
       public boolean modificar(){
        String cadenaSQL = "update Evento set  nombre='"+nombre+"', "
                + " lugar='"+lugar+"', telefono='"+telefono+"', "
                + " fecha='"+fecha+"',organizador='"+organizador+"', boletos='"+boletos+"',"
                + " foto='"+foto+"', descripcion='"+descripcion+"', idCategoriaEvento='"+idCategoriaEvento+"' where id= "+id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
       
     public boolean eliminar(){
        String cadenaSQL="delete from evento where id="+id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
     
    public static ResultSet getLista(String filtro, String orden){
        if(filtro!=null && filtro !="") filtro= " where " + filtro;
        else filtro=" ";
        if(orden!=null && orden!="") orden=" order by  "+ orden;
        else orden=" ";
        String cadenaSQL= "select evento.id, evento.nombre, lugar, telefono, fecha,organizador,"
                + "boletos, foto, evento.descripcion, idCategoriaEvento "
                + "from evento "
                + "left join categoriaEvento "
                + "on  categoriaEvento.id=idCategoriaEvento"+ filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
        
   }
    
   public static List<Evento> getListaEnObjetos(String filtro, String orden){
        List<Evento> lista= new ArrayList<>();
        ResultSet datos = Evento.getLista(filtro, orden);
        if(datos!=null){
            try {
                while(datos.next()){
                Evento evento = new Evento();
                evento.setId(datos.getString("id"));
                evento.setNombre(datos.getString("nombre"));
                evento.setLugar(datos.getString("lugar"));
                evento.setTelefono(datos.getString("telefono"));
                evento.setFecha(datos.getString("fecha"));
                //evento.setHora(datos.getString("hora"));
                evento.setOrganizador(datos.getString("organizador"));
                evento.setBoletos(datos.getString("boletos"));
                evento.setFoto(datos.getString("foto"));
                evento.setDescripcion(datos.getString("descripcion"));
                evento.setIdCategoriaEvento(datos.getString("idCategoriaEvento"));
                lista.add(evento);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Evento.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }
   
    public static String getListaEnOptions(String preseleccionado){
        String lista="";
        List<Evento> datos= Evento.getListaEnObjetos(null, "nombre");
        for (int i = 0; i < datos.size(); i++) {
            Evento evento = datos.get(i);
            String auxiliar="";
            if(preseleccionado.equals(evento.getId())) auxiliar=" selected";
            lista+="<option value='" +evento.getId()+"' "+auxiliar+">"+evento.getNombre()+"</option>";
        }
     return lista;
    }
}       
  
