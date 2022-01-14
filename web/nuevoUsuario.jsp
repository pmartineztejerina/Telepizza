<%-- 
    Document   : nuevoUsuario
    Created on : 13 dic. 2021, 18:10:51
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
                    <div class="row align-items-center">
                        <div class="col">
                            <h4 class="text-center m-3">ALTA USUARIO:</h4>
                            <form action="ServletAlta" method="POST">
                                <div class="w-50 p-2 mx-auto">
                                    <label for="nombre" class="form-label">Nombre usuario: </label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" pattern="[A-Za-z0-9]{8}+" required>
                                </div>
                                <div class="w-50 p-2 mx-auto">
                                    <label for="pass" class="form-label">Contraseña: </label>
                                    <input type="text" class="form-control" id="password" name="password" required>
                                </div>
                                <div class="w-50 p-2 mx-auto">
                                    <label for="direccion" class="form-label">Dirección: </label>
                                    <input type="text" class="form-control" id="direccion" name="direccion" required>
                                </div>
                                <div class="w-50 p-2 mx-auto">
                                    <label for="mail" class="form-label">Email: </label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="w-50 p-2 mx-auto">
                                    <label for="telefono" class="form-label">Telefono: </label>
                                    <input type="tel" class="form-control" id="telefono" name="telefono" pattern="[0-9]{9}" required>
                                </div>  
                                <div class="w-50 p-2 mx-auto">
                                    <button type="submit" class="btn btn-danger">Alta usuario</button>
                                </div>
                            </form>
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
