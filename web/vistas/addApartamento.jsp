<%-- 
    Document   : addApartamento
    Created on : 20-sep-2020, 8:48:13
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
                <h1>Agregar Apartamento</h1>
                <form action="ControladorApartamento" autocomplete="off">
                    Apartamento:<br>
                    <input class="form-control" type="text" name="txtApa" required="required"><br>
                    Dueño: <br>
                    <input class="form-control" type="text" name="txtDue" required="required"><br>
                    Cantidad de Personas: <br>
                    <input class="form-control" type="number" name="txtPer" required="required"><br>
                    Cantidad de Mascotas: <br>
                    <input class="form-control" type="number" name="txtMas" required="required"><br>
                    Teléfono: <br>
                    <input class="form-control" type="number" name="txtTel" required="required"><br>
                
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorApartamento?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
