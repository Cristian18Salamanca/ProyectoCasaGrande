<%-- 
    Document   : addResidente
    Created on : 28-oct-2020, 10:33:07
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
                <h1>Agregar Residente</h1>
                <form action="ControladorResidente" autocomplete="off">
                    Apartamento:<br>
                    <input class="form-control" type="text" name="txtApa" required="required"><br>
                    Inicio de Contrato: <br>
                    <input class="form-control" type="date" name="txtIco" required="required"><br>
                    Fin Contrato: <br>
                    <input class="form-control" type="date" name="txtFco" required="required"><br>
                    Tipo de Residente: <br>
                    <input class="form-control" type="text" name="txtTip" required="required"><br>
                    Arrendado a: <br>
                    <input class="form-control" type="text" name="txtArr" required="required"><br>
                    Vehiculo: <br>
                    <input class="form-control" type="text" name="txtVeh" required="required"><br>
                
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorResidente?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
