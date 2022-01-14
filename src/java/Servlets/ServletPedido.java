/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Modelo.Pizza;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author watanga
 */
public class ServletPedido extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext contexto=getServletContext();
        RequestDispatcher rd;
        
        String destacadas=request.getParameter("destacadas");
        int cantidadDestacadas= Integer.parseInt(request.getParameter("cantidadDestacadas"));
        String carne=request.getParameter("carne");
        int cantidadCarne= Integer.parseInt(request.getParameter("cantidadCarne"));
        String queseros=request.getParameter("queseros");
        int cantidadQueseros= Integer.parseInt(request.getParameter("cantidadQueseros"));
        String clasicos=request.getParameter("clasicos");
        int cantidadClasicos= Integer.parseInt(request.getParameter("cantidadClasicos"));
        String naturales=request.getParameter("naturales");
        int cantidadNaturales= Integer.parseInt(request.getParameter("cantidadNaturales"));
        String infantil=request.getParameter("infantil");
        int cantidadInfantil= Integer.parseInt(request.getParameter("cantidadInfantil"));
        
        ArrayList<Pizza> listaPedido=new ArrayList<Pizza>();
        Pizza pizza;
        
        if (cantidadDestacadas!=0) {
            //busco el precio
            double precio=dao.Db.buscaPrecio(destacadas);
            pizza=new Pizza(destacadas, cantidadDestacadas,precio);
            listaPedido.add(pizza);
            
        } 
        if (cantidadCarne!=0) {
            //busco el precio
            double precio=dao.Db.buscaPrecio(carne);
            pizza=new Pizza(carne, cantidadCarne,precio);
            listaPedido.add(pizza);
            
        } 
        if (cantidadQueseros!=0) {
            //busco el precio
            double precio=dao.Db.buscaPrecio(queseros);
            pizza=new Pizza(queseros, cantidadQueseros,precio);
            listaPedido.add(pizza);
            
        } 
        if (cantidadClasicos!=0) {
            //busco el precio
            double precio=dao.Db.buscaPrecio(clasicos);
            pizza=new Pizza(clasicos, cantidadClasicos,precio);
            listaPedido.add(pizza);
            
        } 
        if (cantidadNaturales!=0) {
            //busco el precio
            double precio=dao.Db.buscaPrecio(naturales);
            pizza=new Pizza(naturales, cantidadNaturales,precio);
            listaPedido.add(pizza);
            
        } 
        if (cantidadInfantil!=0) {
            //busco el precio
            double precio=dao.Db.buscaPrecio(infantil);
            pizza=new Pizza(infantil, cantidadInfantil,precio);
            listaPedido.add(pizza);
            
        } 
        if (cantidadDestacadas==0 && cantidadCarne==0 && cantidadQueseros==0 && cantidadClasicos==0 && cantidadNaturales==0 && cantidadInfantil==0) {
            String error="No ha seleccionado ninguna pizza para poder hacer el pedido";
            contexto.setAttribute("error", error);
            rd=contexto.getRequestDispatcher("/errorPedido.jsp");
            rd.forward(request, response);
        } else {
            HttpSession sesion=request.getSession();
            sesion.setAttribute("listaPedido", listaPedido);
            request.getRequestDispatcher("/Zona_localizacion.jsp").forward(request,response);

        }
        
    }

}
