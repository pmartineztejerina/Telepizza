/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
public class ServletTelefono extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext contexto = getServletContext();
        RequestDispatcher rd;
        
        String telefono=request.getParameter("telefono");
        HttpSession sesion=request.getSession();
        String usuario = (String) sesion.getAttribute("usuario");
        
        //compruebo el telefono
        String tlfUsuario=dao.Db.buscarTelefono(usuario);
        if(telefono.equals(tlfUsuario)){
                sesion.setAttribute("telefono", telefono);
                rd = request.getRequestDispatcher("/confirmar.jsp");
                rd.forward(request, response);
            }else{
                String error="El telefono introducido no corresponde con el existente en su perfil";
                rd = request.getRequestDispatcher("/errorTelefono.html");
                rd.forward(request, response);
            }

    }
}
