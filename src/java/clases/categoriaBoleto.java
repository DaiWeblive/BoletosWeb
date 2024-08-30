/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que representa una categoría de boleto.
 */
public class categoriaBoleto {
    private String id;
    private String nombre;
    private String descripcion;

    public categoriaBoleto() {
    }

    public categoriaBoleto(String id) {
        String cadenaSQL = "SELECT nombre, descripcion FROM categoriaBoleto WHERE id = " + id;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                nombre = resultado.getString("nombre");
                descripcion = resultado.getString("descripcion");
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar el id: " + ex.getMessage());
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
        String cadenaSQL = "INSERT INTO categoriaBoleto (nombre, descripcion) VALUES ('" + nombre + "', '" + descripcion + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "UPDATE categoriaBoleto SET nombre = '" + nombre + "', descripcion = '" + descripcion + "' WHERE id = " + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "DELETE FROM categoriaBoleto WHERE id = " + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.trim().isEmpty()) filtro = " WHERE " + filtro;
        else filtro = "";
        if (orden != null && !orden.trim().isEmpty()) orden = " ORDER BY " + orden;
        else orden = "";
        String cadenaSQL = "SELECT id, nombre, descripcion FROM categoriaBoleto" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<categoriaBoleto> getListaEnObjetos(String filtro, String orden) {
        List<categoriaBoleto> lista = new ArrayList<categoriaBoleto>();
        ResultSet datos = categoriaBoleto.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    categoriaBoleto categoriaB = new categoriaBoleto();
                    categoriaB.setId(datos.getString("id"));
                    categoriaB.setNombre(datos.getString("nombre"));
                    categoriaB.setDescripcion(datos.getString("descripcion"));
                    lista.add(categoriaB);
                }
            } catch (SQLException ex) {
                Logger.getLogger(categoriaBoleto.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

    public static String getListaEnOptions(String preseleccionado) {
        String lista = "";
        List<categoriaBoleto> datos = categoriaBoleto.getListaEnObjetos(null, "nombre");
        for (int i = 0; i < datos.size(); i++) {
            categoriaBoleto categoria = datos.get(i);
            String auxiliar = "";
            if (preseleccionado != null && preseleccionado.equals(categoria.getId())) {
                auxiliar = " selected";
            }
            lista += "<option value='" + categoria.getId() + "'" + auxiliar + ">" + categoria.getNombre() + "</option>";
        }
        return lista;
    }
}
