/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author watanga
 */
public class Pizza {
    String nompizzas;
    int cantidad;
    double precio;

    public Pizza(String nompizzas, int cantidad, double precio) {
        this.nompizzas = nompizzas;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public Pizza(String nompizzas, double precio) {
        this.nompizzas = nompizzas;
        this.precio = precio;
    }

    

    public String getNompizzas() {
        return nompizzas;
    }

    public void setNompizzas(String nompizzas) {
        this.nompizzas = nompizzas;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    
    
}
