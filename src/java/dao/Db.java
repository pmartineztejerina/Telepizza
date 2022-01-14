/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Modelo.Pizza;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author watanga
 */
public class Db {
    
    public static String usuario = "root";
    public static String password = "";
    public static String servidor = "localhost:3306";
    public static String basedatos = "telepizza";

    public static Connection CrearConexion() {
        Connection cnn = null;
        try {
            System.out.println("*****************************");
            Class.forName("com.mysql.jdbc.Driver"); //invocamos al driver
            String url = "jdbc:mysql://" + servidor + "/" + basedatos;
            cnn = (Connection) DriverManager.getConnection(url, usuario, password); //nos conectamos a la BD
        } catch (ClassNotFoundException c) {
            System.out.println("Controlador JDBC no encontrado" + c.toString());
        } catch (SQLException ex) {
            System.out.println("Fallo en la conexion" + ex.toString());
        }
        return cnn;
    }
    
    public static String consultaUsuario(String user) {
        Connection cnn = null;
        String passwordUser = "";
        String sql = "SELECT User_password FROM usuarios WHERE User_name='" + user + "'";
        try {
            cnn = CrearConexion();
            PreparedStatement pst = cnn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                passwordUser = rs.getString(1);
            } else {
                passwordUser = "X";
            }
            if (cnn != null) {
                cnn.close();
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado" + ex.toString());
        }
        return passwordUser;
    }
        
    public static ArrayList<Pizza> listaDestacadas(){
        ArrayList<Pizza> listaDestacadas=new ArrayList<Pizza>();
        Pizza pizza;
        Connection cnn=null;
        String sql="SELECT nompizzas,precio FROM pizzas WHERE idpizza='1'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
             ResultSet rs=pst.executeQuery();
            while (rs.next()) { 
                String nompizzas=rs.getString(1);
                double precio=rs.getDouble(2);
                
                pizza=new Pizza(nompizzas,precio);
                listaDestacadas.add(pizza);
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado"+ex.toString());
        }
 
        return listaDestacadas;
    }
    
    public static ArrayList<Pizza> listaAmantesCarne(){
        ArrayList<Pizza> listaAmantesCarne=new ArrayList<Pizza>();
        Pizza pizza;
        Connection cnn=null;
        String sql="SELECT nompizzas,precio FROM pizzas WHERE idpizza='2'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
             ResultSet rs=pst.executeQuery();
            while (rs.next()) { 
                String nompizzas=rs.getString(1);
                double precio=rs.getDouble(2);
                
                pizza=new Pizza(nompizzas,precio);
                listaAmantesCarne.add(pizza);
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado"+ex.toString());
        }
 
        return listaAmantesCarne;
    }
    
    public static ArrayList<Pizza> listaQueseros(){
        ArrayList<Pizza> listaQueseros=new ArrayList<Pizza>();
        Pizza pizza;
        Connection cnn=null;
        String sql="SELECT nompizzas,precio FROM pizzas WHERE idpizza='3'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            while (rs.next()) { 
                String nompizzas=rs.getString(1);
                double precio=rs.getDouble(2);
                
                pizza=new Pizza(nompizzas,precio);
                listaQueseros.add(pizza);
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado"+ex.toString());
        }
 
        return listaQueseros;
    }
    
    public static ArrayList<Pizza> listaClasicos(){
        ArrayList<Pizza> listaClasicos=new ArrayList<Pizza>();
        Pizza pizza;
        Connection cnn=null;
        String sql="SELECT nompizzas,precio FROM pizzas WHERE idpizza='4'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            while (rs.next()) { 
                String nompizzas=rs.getString(1);
                double precio=rs.getDouble(2);
                
                pizza=new Pizza(nompizzas,precio);
                listaClasicos.add(pizza);
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado"+ex.toString());
        }
 
        return listaClasicos;
    }
    
    public static ArrayList<Pizza> listaNaturales(){
        ArrayList<Pizza> listaNaturales=new ArrayList<Pizza>();
        Pizza pizza;
        Connection cnn=null;
        String sql="SELECT nompizzas,precio FROM pizzas WHERE idpizza='5'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            while (rs.next()) { 
                String nompizzas=rs.getString(1);
                double precio=rs.getDouble(2);
                
                pizza=new Pizza(nompizzas,precio);
                listaNaturales.add(pizza);
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado"+ex.toString());
        }
 
        return listaNaturales;
    }
    
    public static ArrayList<Pizza> listaInfantil(){
        ArrayList<Pizza> listaInfantil=new ArrayList<Pizza>();
        Pizza pizza;
        Connection cnn=null;
        String sql="SELECT nompizzas,precio FROM pizzas WHERE idpizza='6'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            while (rs.next()) { 
                String nompizzas=rs.getString(1);
                double precio=rs.getDouble(2);
                
                pizza=new Pizza(nompizzas,precio);
                listaInfantil.add(pizza);
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado"+ex.toString());
        }
 
        return listaInfantil;
    }

    public static double buscaPrecio(String pizza) {
        Connection cnn=null;
        String sql="SELECT precio FROM pizzas WHERE nompizzas='"+pizza+"'";
        double precio = 0;
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            while (rs.next()) { 
                precio=rs.getDouble(1);
            }
            
        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado"+ex.toString());
        }
        return precio;
    }

    public static String buscarTelefono(String usuario) {
        Connection cnn=null;
        String telefono = "";
        
        String sql="SELECT User_phone FROM usuarios WHERE User_name LIKE '"+usuario+"'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            while (rs.next()) { 
                telefono=rs.getString(1);
            }
        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado"+ex.toString());
        }    
        return telefono; 
    }
    
    public static void nuevoUsuario (String nombre, String password, String direccion, String email, String telefono) {
        
        Connection cnn=null;
        
        String sql="INSERT INTO usuarios(User_name, User_password, User_address, User_email, User_phone) VALUES (?,?,?,?,?)";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            
            
            pst.setString(1, nombre);
            pst.setString(2, password);
            pst.setString(3, direccion);
            pst.setString(4, email);
            pst.setString(5, telefono);
            
            pst.executeUpdate();
            pst = null;

            if (cnn != null) {
                cnn.close();
            }
            
        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado"+ex.toString());
        }    
    }
    
}
