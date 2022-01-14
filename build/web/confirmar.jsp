<%-- 
    Document   : confirmar.jsp
    Created on : 13 dic. 2021, 12:56:23
    Author     : watanga
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Pizza"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">

        <title>TELEPIZZA</title>
        <%
            HttpSession sesion = request.getSession();
            String usuario = (String) sesion.getAttribute("usuario");
            if (sesion.getAttribute("usuario") == null) {
                //lo envio al inicio
                response.sendRedirect("index.html");
            } else {
        %>
    </head>

    <body>
        <div class="container-fluid" style="background-color: #ff0506;">
            <div class="row">
                <div class="col">
                    <img src="Telepizza Logo.jpg" height="80" class="img-responsive">
                </div>
            </div>
        </div>
                        <% 
                     
                        long fecha;
                        fecha = session.getLastAccessedTime();
                        Date fechaC=new Date(fecha);
                        SimpleDateFormat formatoHora=new SimpleDateFormat("HH:mm:ss");
                        SimpleDateFormat formatoFecha=new SimpleDateFormat("dd/MM/yyyy");
                        String fechaHora=formatoHora.format(fechaC);
                        String fechaDia=formatoFecha.format(fechaC);  
                        %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-6">
                    <h5 style="text-align: right;">Gracias</h5>
                    <h5><%=usuario%>, tu pedido ha sido tramitado a las <%=fechaHora %> del <%=fechaDia %></h5>
                    <div class="mb-5"></div>
                    <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th>Cantidad</th>
                            <th>Descripción</th>
                            <th>Precio Unidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            //cojo los parametros que he mandado por sesion
                            ArrayList<Pizza> listaPedido=(ArrayList<Pizza>) sesion.getAttribute("listaPedido");
                            String localizacion=request.getParameter("localizacion");
                            double total=0;
                            for (Pizza pizza : listaPedido) {
                            %>
                            <tr>
                                <td><%=pizza.getCantidad() %></td>
                                <td><%=pizza.getNompizzas() %></td>
                                <td><%=pizza.getPrecio() %></td>
                                <% total += pizza.getCantidad() * pizza.getPrecio(); %>
                            </tr>
                                    
                                <%}
                            %>
                    </tbody>
                    </table>                  
                    <h3 style="text-align: right;">TOTAL PEDIDO: <%=total%> €</h3>
                    <div class="mb-5"></div>
                    <%
                        if (localizacion.equals("domicilio")) {
                               %>
                               <h5 style="text-align: right;">aproximadamente en 30 minutos será recibido el pedido en su domicilio</h5>
                               <%
                            }
                        if (localizacion.equals("tienda")) {
                               %>
                               <h5 style="text-align: right;">aproximadamente en 30 minutos podrá recoger su pedido en el local</h5>
                               <%  
                            }
                        %>                  
                </div>
                    <div class="col-6 ">
                    <img src="Telepizza Pedido.jpg" class="img-responsive" />
                </div>
            </div>
        </div>

        <div class="mb-5"></div>
        <div class="container-fluid" style="background-color: #ac261d;">
            <div class="row">
                <div class="col">
                    <img src="Telepizza Footer.jpg" height="64" class="img-responsive">
                </div>
            </div>
        </div>
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
    </body>
</html>
<% }%>