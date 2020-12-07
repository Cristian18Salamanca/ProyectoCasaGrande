<%-- 
    Document   : addqueja
    Created on : 27-oct-2020, 20:33:29
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
                <h1>Agregar Queja, Reclamo y Sugerencia</h1>
                <form action="ControladorQuejas" autocomplete="off">
                    <label for="exampleFormControlSelect1">Claificacion</label>
                    <select name="txtCla" class="form-control" id="exampleFormControlSelect1" required="">
                        <option value="">Escoge uno</option>
                        <option value="Queja">Queja</option>
                        <option value="Reclamo">Reclamo</option>
                        <option value="Felicitaciones">Felicitaciones</option>
                    </select><br>
                    Correo: <br>
                    <input class="form-control" type="text" name="txtCor" required="required"><br>
                    Argumentos: <br>
                    <input class="form-control" type="text" name="txtArg" required="required"><br>
                
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorQuejas?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
