package Servlets;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Modelo.Usuario;
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
public class ServletInicioSession extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext contexto=getServletContext();
        RequestDispatcher rd;
        
        String error;
        String usuario=request.getParameter("usuario");
        String password=request.getParameter("password");
        
        int sizeUser=usuario.length();
        int sizePassw=password.length();
        
        if (sizeUser!=0) {
            if (sizePassw!=0) {
                String passDB = dao.Db.consultaUsuario(usuario);
                HttpSession sesion=request.getSession(); //creo la sesion
                if(passDB.equals(password) && sesion.getAttribute("usuario")==null){              
                                    
                        sesion.setAttribute("usuario", usuario);
                        sesion.setMaxInactiveInterval(90);
                        rd=contexto.getRequestDispatcher("/Pedido.jsp");
                        rd.forward(request, response);
  
                  
                } else {
                        error="Datos introducidos erroneos o usuario no registrado";
                        sesion.invalidate();
                        contexto.setAttribute("error", error);
                        rd=contexto.getRequestDispatcher("/error.jsp");
                        rd.forward(request, response);
                    }
   
            } else {
                error="Contrase??a es un campo obligatorio";
                contexto.setAttribute("error", error);
                rd=contexto.getRequestDispatcher("/error.jsp");
                rd.forward(request, response);
            }
            
        } else {
            error="Usuario es un campo obligatorio";
            contexto.setAttribute("error", error);
            rd=contexto.getRequestDispatcher("/error.jsp");
            rd.forward(request, response);
        }
        
    }

}
