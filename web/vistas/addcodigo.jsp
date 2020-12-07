<%-- 
    Document   : addcodigo
    Created on : 27-oct-2020, 19:41:09
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
                <h1>Agregar Codigo</h1>
                <form action="ControladorCodigo" autocomplete="off">
                    Codigo: <br>
                    <input class="form-control" type="text" name="txtCod" required="required"><br>
                
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorCodigo?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
