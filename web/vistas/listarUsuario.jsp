<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.List"%>
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
            <h1>Usuario</h1>
            <a class="btn btn-success" href="ControladorUsuario?accion=add">Agregar Nuevo</a>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">NOMBRES</th>
                        <th class="text-center">APELLIDOS</th>
                        <th class="text-center">TELEFONO</th>
                        <th class="text-center">CORREO</th>
                        <th class="text-center">TIPO USUARIO</th>
                        <th class="text-center">APARTAMENTO</th>
                        <th class="text-center">NOMBRE USUARIO</th>
                        <th class="text-center">CONTRASEÑA</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    UsuarioDAO dao=new UsuarioDAO();
                    List<Usuario>list=dao.listar();
                    Iterator<Usuario>iter=list.iterator();
                    Usuario usu=null;
                    while(iter.hasNext()){
                        usu=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= usu.getId()%></td>
                        <td class="text-center"><%= usu.getNom()%></td>
                        <td class="text-center"><%= usu.getApe()%></td>
                        <td class="text-center"><%= usu.getTel()%></td>
                        <td class="text-center"><%= usu.getCor()%></td>
                        <td><%= usu.getTip()%></td>
                        <td><%= usu.getApa()%></td>
                        <td><%= usu.getNus()%></td>
                        <td><%= usu.getCon()%></td>
                        
                        <td class="text-center">
                            <a class="btn btn-warning" href="ControladorUsuario?accion=editar&id=<%= usu.getId()%>">Editar</a>
                            <a class="btn btn-danger" href="ControladorUsuario?accion=eliminar&id=<%= usu.getId()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
