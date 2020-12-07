<%-- 
    Document   : addMulta
    Created on : 20-sep-2020, 11:31:23
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
                <h1>Agregar Multa</h1>
                <form action="ControladorMulta" autocomplete="off">
                Placa Multada:<br>
                <input class="form-control" type="text" name="txtPla" placeholder="Placa" required="required"><br>
                Vehiculo:<br>
                <input class="form-control" type="text" name="txtVeh" placeholder="Placa" required="required"><br>
                Fecha de Multa: <br>
                <input class="form-control" type="date" name="txtFec" required="required"><br>
                
                
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorMulta?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
