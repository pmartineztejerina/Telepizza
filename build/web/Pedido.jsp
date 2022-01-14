<%-- 
    Document   : Pedido
    Created on : 10 dic. 2021, 9:42:06
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
        <title>Hello, world!</title>
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
                        ServletContext contexto = getServletContext();
                        RequestDispatcher rd;
                        String error;
                        HttpSession sesion=request.getSession();
                        String usuario = (String) sesion.getAttribute("usuario");
                        if (sesion.getAttribute("usuario") == null) {
                            //lo envio al inicio
                            response.sendRedirect("index.html");
                        } else {
                            long fecha;
                            fecha = session.getCreationTime();
                            Date fechaC=new Date(fecha);
                            SimpleDateFormat formatoHora=new SimpleDateFormat("HH:mm:ss");
                            SimpleDateFormat formatoFecha=new SimpleDateFormat("dd/MM/yyyy");
                            String fechaHora=formatoHora.format(fechaC);
                            String fechaDia=formatoFecha.format(fechaC);     
                    %>
                <div class="container-fluid">
            <div class="row">
                <h3 style="text-align: right; color:red;">Bienvenido <%=usuario %></h3>
                    <h3 style="text-align: right; color:red;">Usted ha accedido a nuestra area de pedidos a las <%=fechaHora %> del <%=fechaDia %></h3>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-6">
                    <div class="m-5"></div>            
                    <div class="mb-5"></div>
                    <form action="ServletPedido" method="POST">
                        <table class="table-borderless">
                            <tr>
                                <td>
                                    <h3 style="color:red">Las destacadas</h3>
                                </td>
                                <td>
                                    <select name="destacadas">
                                        <%
                                            ArrayList<Pizza> listaDestacadas=dao.Db.listaDestacadas();
                                            for (Pizza pizzaDestacadas : listaDestacadas) {
                                            %>
                                            <option value="<%=pizzaDestacadas.getNompizzas() %>" required><%=pizzaDestacadas.getNompizzas() %> </option>
                                            <%        
                                                }
                                            %>
                                    </select>
                                </td>
                                <td>
                                    <select name="cantidadDestacadas">
                                        <%
                                            for (int x = 0; x < 10; x++) {
                                                  %>
                                                  <option value="<%=x %>"><%=x %></option>
                                                  <%
                                                }
                                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h3 style="color:red">Amantes de la carne</h3>
                                </td>
                                <td>
                                    <select name="carne">
                                        <%
                                            ArrayList<Pizza> listaAmantesCarne=dao.Db.listaAmantesCarne();
                                            for (Pizza pizzaCarne : listaAmantesCarne) {
                                            %>
                                            <option value="<%=pizzaCarne.getNompizzas() %>"><%=pizzaCarne.getNompizzas() %> </option>
                                            <%        
                                                }
                                            %>
                                    </select>
                                </td>
                                <td>
                                    <select name="cantidadCarne">
                                        <%
                                            for (int x = 0; x < 10; x++) {
                                                  %>
                                                  <option value="<%=x %>"><%=x %></option>
                                                  <%
                                                }
                                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h3 style="color:red">Los mas queseros</h3>
                                </td>
                                <td>
                                    <select name="queseros">
                                        <%
                                            ArrayList<Pizza> listaQueseros=dao.Db.listaQueseros();
                                            for (Pizza pizzaQueseros : listaQueseros) {
                                            %>
                                            <option value="<%=pizzaQueseros.getNompizzas() %>"><%=pizzaQueseros.getNompizzas() %> </option>
                                            <%        
                                                }
                                            %>
                                    </select>
                                </td>
                                <td>
                                    <select name="cantidadQueseros">
                                        <%
                                            for (int x = 0; x < 10; x++) {
                                                  %>
                                                  <option value="<%=x %>"><%=x %></option>
                                                  <%
                                                }
                                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h3 style="color:red">Los clasicos</h3>
                                </td>
                                <td>
                                    <select name="clasicos">
                                        <%
                                            ArrayList<Pizza> listaClasicos=dao.Db.listaClasicos();
                                            for (Pizza pizzaClasicos : listaClasicos) {
                                            %>
                                            <option value="<%=pizzaClasicos.getNompizzas() %>"><%=pizzaClasicos.getNompizzas() %> </option>
                                            <%        
                                                }
                                            %>
                                    </select>
                                </td>
                                <td>
                                    <select name="cantidadClasicos">
                                        <%
                                            for (int x = 0; x < 10; x++) {
                                                  %>
                                                  <option value="<%=x %>"><%=x %></option>
                                                  <%
                                                }
                                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h3 style="color:red">Los mas naturales</h3>
                                </td>
                                <td>
                                    <select name="naturales">
                                        <%
                                            ArrayList<Pizza> listaNaturales=dao.Db.listaNaturales();
                                            for (Pizza pizzaNaturales : listaNaturales) {
                                            %>
                                            <option value="<%=pizzaNaturales.getNompizzas() %>"><%=pizzaNaturales.getNompizzas() %> </option>
                                            <%        
                                                }
                                            %>
                                    </select>
                                </td>
                                <td>
                                    <select name="cantidadNaturales">
                                        <%
                                            for (int x = 0; x < 10; x++) {
                                                  %>
                                                  <option value="<%=x %>"><%=x %></option>
                                                  <%
                                                }
                                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h3 style="color:red">Infantil</h3>
                                </td>
                                <td>
                                    <select name="infantil">
                                        <%
                                            ArrayList<Pizza> listaInfantil=dao.Db.listaInfantil();
                                            for (Pizza pizzaInfantil : listaInfantil) {
                                            %>
                                            <option value="<%=pizzaInfantil.getNompizzas() %>"><%=pizzaInfantil.getNompizzas() %> </option>
                                            <%        
                                                }
                                            %>
                                    </select>
                                </td>
                                <td>
                                    <select name="cantidadInfantil">
                                        <%
                                            for (int x = 0; x < 10; x++) {
                                                  %>
                                                  <option value="<%=x %>"><%=x %></option>
                                                  <%
                                                }
                                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr></tr>
                            <tr>
                                <td style="align: center">
                                    <input type="submit" value="Confirmar pedido" class="btn btn-danger"/>
                                </td>
                            </tr>
                            <tr></tr>
                        </table>
                    </form>
                </div>
                <div class="col-6 ">
                    <img src="imgPizzas.jpg" width="900" class="img-responsive" />
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
<% } %>
