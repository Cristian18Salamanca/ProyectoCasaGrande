<%-- 
    Document   : addParqueadero
    Created on : 19-sep-2020, 15:42:12
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
                <h1>Agregar Parqueadero</h1>
                <form action="ControladorParqueadero" autocomplete="off">
                    Numero de Parqueadero:<br>
                    <input class="form-control" type="number" name="txtNum" required="required"><br>
                    Apartamento: <br>
                    <input class="form-control" type="text" name="txtApa" required="required"><br>
                    Dueño: <br>
                    <input class="form-control" type="text" name="txtDue" required="required"><br>
                    Disponibilidad: <br>
                    <input class="form-control" type="text" name="txtDis" required="required"><br>
                
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorParqueadero?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
