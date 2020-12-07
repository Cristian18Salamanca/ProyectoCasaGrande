<%-- 
    Document   : addVehiculo
    Created on : 20-sep-2020, 10:24:44
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
                <h1>Agregar Vehículo</h1>
                <form action="ControladorVehiculo" autocomplete="off">
                    Placa:<br>
                    <input class="form-control" type="text" name="txtPla" required="required"><br>
                    Apartamento:<br>
                    <input class="form-control" type="text" name="txtApa" required="required"><br>
                    Dueño: <br>
                    <input class="form-control" type="text" name="txtDue" required="required"><br>
                    Marca: <br>
                    <input class="form-control" type="text" name="txtMar" required="required"><br>
                    Color: <br>
                    <input class="form-control" type="text" name="txtCol" required="required"><br>
                    Parqueadero: <br>
                    <input class="form-control" type="number" name="txtPar" required="required"><br>
                    Estado:<br>
                    <input class="form-control" type="text" name="txtEst" required="required"><br>
                
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorVehiculo?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
