/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Sebastian
 */
public class tipoPersona {
    private String codigo;

    public tipoPersona(String codigo) {
        this.codigo = codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
    public String getNombre(){
        String nombre=null;
        switch(codigo){
            case "A": nombre="Administrador"; break;
            case "C": nombre="Cliente"; break;
            default: nombre="Desconocido"; break;
        }
        return nombre;
    }

    @Override
    public String toString() {
        return getNombre();
    }
    
    public String getMenu(){
        String menu="<ul>";
        menu+="<li><a href='principal.jsp?CONTENIDO=inicio.jsp'>Inicio</a></li>";
        switch(this.codigo){
            case "A":
                    menu+="<li><a href='principal.jsp?CONTENIDO=categoriasEvento.jsp'>Categorias Evento</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=categoriasBoleto.jsp'>Categorias Boleto</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=mediosDePago.jsp'>Medios de Pago</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=usuarios.jsp'>Usuarios</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=eventos.jsp'>Eventos</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=boletos.jsp'>Boletos</a></li>";
                    menu+="<li>Reportes";
                    menu+="<ul>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=reportes/eventosMasBoletos.jsp'>Eventos con mas boletos</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=reportes/eventosMenosBoletos.jsp'>Eventos con menos boletos</a></li>";
                    menu+="</ul>";
                    menu+="<li>Indicadores";
                    menu+="<ul>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=indicadores/eventos.jsp'>Eventos</a></li>";
                    menu+="</ul>";
                    
                    break;
                    
            case "C":
                    menu+="<li><a href='principal.jsp?CONTENIDO=eventos.jsp'>Eventos</a></li>";
                    menu+="<li><a href='principal.jsp?CONTENIDO=boletos.jsp'>Boletos</a></li>";
                    break;
        }
         menu+="<li> <a href='index.jsp'>Salir</a></li>";
         menu+="</ul>";
         return menu;
        }
    
    public String getListaEnOptions(){
        String lista="";
        if(codigo==null) codigo="";
        switch(codigo){
            case "A":
                lista="<option value='A' selected>Administrador </option><option value='C'>Cliente</option>";
                break;
            case "C":
                lista="<option value='A'>Administrador </option><option value='C' selected>Cliente</option>";
                break;
            default:
                lista="<option value='A' selected>Administrador </option><option value='C'>Cliente</option>";
                break;
        }
        return lista;
    }
        
    public String getListaEnOptionsClientes(){
        String lista="";
        if(codigo==null) codigo="";
        switch(codigo){
            case "C":
                lista="<option value='C'selected>Cliente</option>";
                break;
            default:
                lista="<option value='C'selected>Cliente</option>";
                break;
        }
        return lista;
    }
}
