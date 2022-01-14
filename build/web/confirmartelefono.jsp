<%-- 
    Document   : confirmartelefono
    Created on : 12 dic. 2021, 11:45:37
    Author     : watanga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">

        <title>TELEPIZZA</title>
        <%
            HttpSession sesion=request.getSession();
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
        <div class="container">
            <div class="row align-items-center">
                <div class="col">
                    <% 
                        //recoger el valor de localizacion
                        String localizacion = request.getParameter("localizacion");
                        sesion.setAttribute("localizacion", localizacion);
                        
                        %>
                    <h3 style="color:red;"><%=usuario%> usted debe indicar su teléfono para confirmar el pedido</h3>
                </div>
            </div>
            <form action="ServletTelefono" method="POST">
            <div class="row align-items-center">
                <div class="col">
                    <input type="text" id="telefono" name="telefono" size="20" pattern="\d{9}" title="El numero de telefono debe contener 9 digitos sin guiones" required>
                </div>
            </div>
            <div class="row align-items-center">
                <div class="col">    
                    <input type="submit" value="Tramitar pedido" class="btn btn-danger"/>   
                </div>
            </div>
                </form>
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
