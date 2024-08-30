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
public class Boleto {

    private String numero;
    private String cantidad;
    private String precio;
    private String idEvento;
    private String idMedioDePago;
    private String identificacionCliente;
    private String idCategoriaBoleto;

    private categoriaEvento categoriaEvento; // Nueva variable de instancia para almacenar el objeto categoriaEvento

    // Constructor vacío
    public Boleto() {
    }

    // Constructor que inicializa Boleto a partir de su número
    public Boleto(String numero) {
        String cadenaSQL = "SELECT cantidad, precio, idEvento, idMedioDePago, identificacionCliente, idCategoriaBoleto " +
                           "FROM Boleto WHERE numero = " + numero;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.numero = numero;
                this.cantidad = resultado.getString("cantidad");
                this.precio = resultado.getString("precio");
                this.idEvento = resultado.getString("idEvento");
                this.idMedioDePago = resultado.getString("idMedioDePago");
                this.identificacionCliente = resultado.getString("identificacionCliente");
                this.idCategoriaBoleto = resultado.getString("idCategoriaBoleto");
                this.categoriaEvento = new categoriaEvento(idEvento); // Inicializa la categoría de evento
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar el boleto: " + ex.getMessage());
        }
    }

    // Getters y setters
    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getIdEvento() {
        return (idEvento != null) ? idEvento : "";
    }

    public categoriaEvento getCategoriaEvento() {
        if (categoriaEvento == null && idEvento != null) {
            categoriaEvento = new categoriaEvento(idEvento);
        }
        return categoriaEvento;
    }

    public void setIdEvento(String idEvento) {
        this.idEvento = idEvento;
        this.categoriaEvento = new categoriaEvento(idEvento); // Actualiza la categoría de evento
    }

    public String getIdMedioDePago() {
        return (idMedioDePago != null) ? idMedioDePago : "";
    }

    public mediosDePago getMedioDepago() {
        return new mediosDePago(idMedioDePago);
    }

    public void setIdMedioDePago(String idMedioDePago) {
        this.idMedioDePago = idMedioDePago;
    }

    public String getIdentificacionCliente() {
        return (identificacionCliente != null) ? identificacionCliente : "";
    }

    public Persona getCliente() {
        return new Persona(identificacionCliente);
    }

    public void setIdentificacionCliente(String identificacionCliente) {
        this.identificacionCliente = identificacionCliente;
    }

    public String getIdCategoriaBoleto() {
        return (idCategoriaBoleto != null) ? idCategoriaBoleto : "";
    }

    public categoriaBoleto getCategoriaBoleto() {
        return new categoriaBoleto(idCategoriaBoleto);
    }

    public void setIdCategoriaBoleto(String idCategoriaBoleto) {
        this.idCategoriaBoleto = idCategoriaBoleto;
    }

    @Override
    public String toString() {
        return numero;
    }

    // Método para grabar un nuevo boleto
    public boolean grabar() {
        String cadenaSQL = "INSERT INTO Boleto (cantidad, precio, idEvento, idMedioDePago, identificacionCliente, idCategoriaBoleto) " +
                           "VALUES ('" + cantidad + "', '" + precio + "', '" + idEvento + "', '" + idMedioDePago + "', '" + identificacionCliente + "', '" + idCategoriaBoleto + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    // Método para modificar un boleto existente
    public boolean modificar() {
        String cadenaSQL = "UPDATE Boleto SET cantidad='" + cantidad + "', " +
                           "precio='" + precio + "', idEvento='" + idEvento + "', " +
                           "idMedioDePago='" + idMedioDePago + "', identificacionCliente='" + identificacionCliente + "', " +
                           "idCategoriaBoleto='" + idCategoriaBoleto + "' WHERE numero=" + numero;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    // Método para eliminar un boleto existente
    public boolean eliminar() {
        String cadenaSQL = "DELETE FROM Boleto WHERE numero=" + numero;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    // Método para obtener la lista de boletos con filtro y orden
    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.trim().isEmpty()) filtro = " WHERE " + filtro;
        else filtro = "";
        if (orden != null && !orden.trim().isEmpty()) orden = " ORDER BY " + orden;
        else orden = "";
        
        String cadenaSQL = "SELECT numero, cantidad, precio, idEvento, idMedioDePago, identificacionCliente, idCategoriaBoleto " +
                           "FROM boleto " +
                           "LEFT JOIN evento ON evento.id = idEvento " +
                           "LEFT JOIN medioDePago ON medioDePago.id = idMedioDePago " +
                           "LEFT JOIN persona ON persona.identificacion = identificacionCliente " +
                           "LEFT JOIN categoriaBoleto ON categoriaBoleto.id = idCategoriaBoleto" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    // Método para obtener la lista de boletos en objetos
    public static List<Boleto> getListaEnObjetos(String filtro, String orden) {
        List<Boleto> lista = new ArrayList<>();
        ResultSet datos = getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    Boleto boleto = new Boleto();
                    boleto.setNumero(datos.getString("numero"));
                    boleto.setCantidad(datos.getString("cantidad"));
                    boleto.setPrecio(datos.getString("precio"));
                    boleto.setIdEvento(datos.getString("idEvento"));
                    boleto.setIdMedioDePago(datos.getString("idMedioDePago"));
                    boleto.setIdentificacionCliente(datos.getString("identificacionCliente"));
                    boleto.setIdCategoriaBoleto(datos.getString("idCategoriaBoleto"));
                    lista.add(boleto);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Boleto.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }
}
