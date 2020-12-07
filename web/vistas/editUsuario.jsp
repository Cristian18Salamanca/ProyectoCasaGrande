<%-- 
    Document   : editUsuario
    Created on : 19-sep-2020, 11:50:24
    Author     : crist
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Casa Grande - Conjunto Residencial</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
            <%
              UsuarioDAO dao=new UsuarioDAO();
              int id=Integer.parseInt((String)request.getAttribute("idusu"));
              Usuario u=(Usuario)dao.list(id);
            %>
            <h1>Modificar Usuario</h1>
            <form action="ControladorUsuario">
                               
                Nombres:<br>
                <input class="form-control" type="text" name="txtNom" value="<%= u.getNom()%>"><br>
                Apellidos: <br>
                <input class="form-control" type="text" name="txtApe" value="<%= u.getApe()%>"><br>                
                Telefono: <br>
                <input class="form-control" type="text" name="txtTel" value="<%= u.getTel()%>"><br>
                Correo Electronico: <br>
                <input class="form-control" type="email" name="txtCor" value="<%= u.getCor()%>"><br>
                Tipo de Usuario: <br>
                <input class="form-control" type="text" name="txtTip" value="<%= u.getTip()%>"><br>
                Apartamento:<br>
                <input class="form-control" type="text" name="txtApa" value="<%= u.getApa()%>"><br>
                Nombre de Usuario: <br>
                <input class="form-control" type="text" name="txtNus" value="<%= u.getNus()%>"><br>
                Contraseña: <br>
                <input class="form-control" type="password" name="txtCon" value="<%= u.getCon()%>"><br>
                
                <input type="hidden" name="txtid" value="<%= u.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorUsuario?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
