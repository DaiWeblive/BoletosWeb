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
public class categoriaEvento {

    private String id;
    private String nombre;
    private String descripcion;

    public categoriaEvento() {
    }

    public categoriaEvento(String id) {
        String cadenaSQL = "SELECT nombre, descripcion FROM categoriaEvento WHERE id=" + id;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                nombre = resultado.getString("nombre");
                descripcion = resultado.getString("descripcion");
            } else {
                System.out.println("No se encontró la categoría con ID: " + id);
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar el id " + ex.getMessage());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return nombre;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into categoriaEvento (nombre, descripcion) values ('" + nombre + "','" + descripcion + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update categoriaEvento set nombre='" + nombre + "', descripcion='" + descripcion + "' where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from categoriaEvento where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && filtro != " ") {
            filtro = " where " + filtro;
        } else {
            filtro = " ";
        }
        if (orden != null && orden != " ") {
            orden = " order by  " + orden;
        } else {
            orden = " ";
        }
        String cadenaSQL = "select id, nombre, descripcion from categoriaEvento " + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<categoriaEvento> getListaEnObjetos(String filtro, String orden) {
        List<categoriaEvento> lista = new ArrayList<>();//inicializacion de esta coleccion de datos
        ResultSet datos = categoriaEvento.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    categoriaEvento categoriaE = new categoriaEvento();
                    categoriaE.setId(datos.getString("id"));
                    categoriaE.setNombre(datos.getString("nombre"));
                    categoriaE.setDescripcion(datos.getString("descripcion"));
                    lista.add(categoriaE);
                }
            } catch (SQLException ex) {
                Logger.getLogger(categoriaEvento.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

    public static String getListaEnOptions(String preseleccionado) {
        String lista = "";
        List<categoriaEvento> datos = categoriaEvento.getListaEnObjetos(null, "nombre");
        for (int i = 0; i < datos.size(); i++) {
            categoriaEvento categoria = datos.get(i);
            String auxiliar = "";
            if (preseleccionado.equals(categoria.getId())) {
                auxiliar = " selected";
            }
            lista += "<option value='" + categoria.getId() + "' " + auxiliar + ">" + categoria.getNombre() + "</option>";
        }
        return lista;
    }
}
