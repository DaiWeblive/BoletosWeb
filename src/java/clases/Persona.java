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
public class Persona {
    private String identificacion;
    private String nombres;
    private String apellidos;
    private String genero;
    private String telefono;
    private String email;
    private String direccion;
    private String tipo;
    private String clave;

    public Persona() {
    }

    public Persona(String identificacion) {
       String cadenaSQL="select nombres, apellidos, genero, telefono, "
                + "email, direccion, tipo, clave from Persona where identificacion="+identificacion;
        ResultSet resultado= ConectorBD.consultar(cadenaSQL);
        try {
            if(resultado.next()){
                this.identificacion=identificacion;
                nombres=resultado.getString("nombres");
                apellidos=resultado.getString("apellidos");
                genero=resultado.getString("genero");
                telefono=resultado.getString("telefono");
                email=resultado.getString("email");
                direccion=resultado.getString("direccion");
                tipo=resultado.getString("tipo");
                clave=resultado.getString("clave");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al consultar la identificacion"+ex.getMessage());
        }
    }

    public String getIdentificacion() {
        String resultado=identificacion;
        if(identificacion==null) resultado="";
        return resultado;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getNombres() {
        String resultado=nombres;
        if(nombres==null) resultado="";
        return resultado;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        String resultado=apellidos;
        if(apellidos==null) resultado="";
        return resultado;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /*public String getGenero() {
        return genero;
    }*/
    
    public generoPersona getGeneroPersona(){
        return new generoPersona(genero);
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTelefono() {
        String resultado=telefono;
        if(telefono==null) resultado="";
        return resultado;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        String resultado=email;
        if(email==null) resultado="";
        return resultado;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        String resultado=direccion;
        if(direccion==null) resultado="";
        return resultado;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTipo() {
        return tipo;
    }
    
    public tipoPersona getTipoPersona(){
        return new tipoPersona(tipo);
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getClave() {
        String resultado=clave;
        if(clave==null) resultado="";
        return resultado;
    }

    public void setClave(String clave) {
        if (clave==null || clave.trim().length()==0) clave=identificacion;
        if (clave.length()<32) {
            this.clave="md5 ('"+clave+"')";
        } else {
            this.clave=" '"+clave+"' ";
        }
    }

    @Override
    public String toString() {
        String datos="";
        if(identificacion!=null){
            datos=identificacion+" - "+nombres+" "+apellidos;
        }
        return datos;
    }
    
     public boolean grabar(){
        String cadenaSQL = "insert into Persona(identificacion, nombres, apellidos, genero, telefono, email,direccion, tipo, clave) "
                + "values ('"+identificacion+"', '"+nombres+"', '"+apellidos+"', '"+genero+"', '"+telefono+"', "
                + " '"+email+"','"+ direccion+"', '"+tipo+"',  "+clave+"  )";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
      public boolean modificar(String identificacionAnterior){
        String cadenaSQL = "update Persona set identificacion='"+identificacion+"' , nombres='"+nombres+"', apellidos='"+apellidos+"', genero='"+genero+"', telefono='"+telefono+"',"
                + "email='"+email+"', direccion='"+ direccion+"',tipo='"+tipo+"', clave="+clave+"  where identificacion="+identificacionAnterior;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
      
    public boolean eliminar(){
        String cadenaSQL ="delete from Persona where identificacion="+identificacion;
        System.out.println("cadenaSQL "+cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public static ResultSet getLista(String filtro, String orden){
        if(filtro!=null && filtro !="") filtro= " where " + filtro;
        else filtro=" ";
        if(orden!=null && orden!="") orden=" order by  "+ orden;
        else orden=" ";
        String cadenaSQL="select identificacion, nombres, apellidos, genero, "
                + "telefono, email, direccion, tipo, clave from persona "+ filtro + orden;
          //System.out.println(cadenaSQL); prueba para revisar como esta iniciando en sesion 
        return ConectorBD.consultar(cadenaSQL);
    }
    
      public static List<Persona> getListaEnObjetos(String filtro, String orden){
        List<Persona> lista= new ArrayList<>();
        ResultSet datos = Persona.getLista(filtro, orden);
        if(datos!=null){
            try {
                while(datos.next()){
                Persona persona = new Persona();
                persona.setIdentificacion(datos.getString("identificacion"));
                persona.setNombres(datos.getString("nombres"));
                persona.setApellidos(datos.getString("apellidos"));
                persona.setGenero(datos.getString("genero"));
                persona.setTelefono(datos.getString("telefono"));
                persona.setEmail(datos.getString("email"));
                persona.setDireccion(datos.getString("direccion"));
                persona.setTipo(datos.getString("tipo"));
                persona.setClave(datos.getString("clave"));
                lista.add(persona);
                }
             } catch (SQLException ex) {
                Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }
      
   public static String getListaEnArregloJS(String filtro, String orden){
       String lista="[";
       List<Persona> datos=Persona.getListaEnObjetos(filtro, orden);
       for (int i = 0; i < datos.size(); i++) {
           Persona persona = datos.get(i);
           if (i>0) lista+=", ";
           lista+="'"+ persona +"'";
       }
       lista+="];";
   return lista;
   } 
      
    public static Persona validar(String identificacion, String clave){
        Persona persona= null;
        List<Persona>  lista= Persona.getListaEnObjetos(" identificacion='"+identificacion+
                "' and clave=md5('"+clave+"')", null);
        if(lista.size()>0){
            persona=lista.get(0); // get devuelve el primer elemento de la lista
        }
       return persona;
    }  
    
    public static String getListaEnOptions(String preseleccionado){
        String lista="";
        List<Persona> datos= Persona.getListaEnObjetos(null, "nombre");
        for (int i = 0; i < datos.size(); i++) {
            Persona persona = datos.get(i);
            String auxiliar="";
            if(preseleccionado.equals(persona.getIdentificacion())) auxiliar=" selected";
            lista+="<option value='" +persona.getIdentificacion()+"' "+auxiliar+">"+persona.getNombres()+"</option>";
        }
     return lista;
    }
}
