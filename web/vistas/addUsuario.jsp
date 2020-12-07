<%-- 
    Document   : addUsuario
    Created on : 19-sep-2020, 12:45:54
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
                <h1>Agregar Usuario</h1>
                <form action="ControladorUsuario" autocomplete="off">
                Nombres:<br>
                <input class="form-control" type="text" name="txtNom" required="required"><br>
                Apellidos: <br>
                <input class="form-control" type="text" name="txtApe" required="required"><br>                
                Telefono: <br>
                <input class="form-control" type="text" name="txtTel" required="required"><br>
                Correo Electronico: <br>
                <input class="form-control" type="email" name="txtCor" required="required"><br>
                Tipo de Usuario: <br>
                <select class="form-control" name="txtTip" required="required">
                          <option value="" >Elige un tipo de usuario</option>
                          <option value="Residente">Residente</option>
                          <option value="Vigilante">Vigilante</option>
                </select><br>
                Apartamento:<br>
                <input class="form-control" type="text" name="txtApa" required="required"><br>
                Nombre de Usuario: <br>
                <input class="form-control" type="text" name="txtNus" required="required"><br>
                Contraseña: <br>
                <input class="form-control" type="password" name="txtCon" required="required"><br>
                
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="ControladorUsuario?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
