<%-- 
    Document   : addVisitante
    Created on : 19-sep-2020, 16:57:36
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
                <h1>Agregar Visitante</h1>
                <form action="ControladorVisitante" autocomplete="off">
                Nombres:<br>
                <input class="form-control" type="text" name="txtNom" required="required"><br>
                Vehículo: <br>
                <input class="form-control" type="text" name="txtVeh" required="required"><br>                
                Placa: <br>
                <input class="form-control" type="text" name="txtPla" required="required"><br>
                Apartamento: <br>
                <input class="form-control" type="text" name="txtApa" required="required"><br>
                Fecha: <br>
                <input class="form-control" type="date" name="txtFec" required="required"><br>
                Hora de Entrada: <br>
                <input class="form-control" type="text" name="txtHen" required="required"><br>
                Parqueadero: <br>
                <input class="form-control" type="text" name="txtPar" required="required"><br>
                
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorVisitante?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
