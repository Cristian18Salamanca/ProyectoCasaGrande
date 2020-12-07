<%-- 
    Document   : addPersonas
    Created on : 28-oct-2020, 11:34:16
    Author     : crist
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Casa Grande - Conjunto Residencial</title>
    </head>
    <body oncopy="return false" onpaste="return false">
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar Personas</h1>
                <form action="ControladorPersonas" autocomplete="off">
                    
                    Apartamento:<br>
                    <input class="form-control" type="text" name="txtApa" required="required"><br>
                    Nombres: <br>
                    <input class="form-control" type="text" name="txtNom" required="required"><br>
                    Apellidos: <br>
                    <input class="form-control" type="text" name="txtApe" required="required"><br>
                    Fecha de Nacimiento: <br>
                    <input class="form-control" type="date" name="txtNac" required="required"><br>
                    Teléfono: <br>
                    <input class="form-control" type="number" name="txtTel" required="required"><br>
                
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorPersonas?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
