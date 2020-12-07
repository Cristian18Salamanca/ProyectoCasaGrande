<%-- 
    Document   : usuarioinha
    Created on : 27-oct-2020, 17:26:21
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.UsuarioInha"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.UsuarioInhaDAO"%>
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
            <h1>Usuarios Inhabilitados</h1>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">No</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Apellido</th>
                        <th class="text-center">Telefono</th>
                        <th class="text-center">Correo</th>
                        <th class="text-center">Tipo_Usuario</th>
                        <th class="text-center">Apartamento</th>
                        <th class="text-center">Nombre de Usuario</th>
                        <th class="text-center">Contraseña</th>
                        <th class="text-center">Accion</th>
                    </tr>
                </thead>
                <%
                    UsuarioInhaDAO dao=new UsuarioInhaDAO();
                    List<UsuarioInha>list=dao.listar();
                    Iterator<UsuarioInha>iter=list.iterator();
                    UsuarioInha uin=null;
                    while(iter.hasNext()){
                        uin=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= uin.getId()%></td>
                        <td class="text-center"><%= uin.getNom()%></td>
                        <td><%= uin.getApe()%></td>
                        <td><%= uin.getTel()%></td>
                        <td><%= uin.getCor()%></td>
                        <td><%= uin.getTip()%></td>
                        <td><%= uin.getApa()%></td>
                        <td><%= uin.getUsu()%></td>
                        <td><%= uin.getCon()%></td>
                        <td class="text-center">
                            <a class="btn btn-success" href="ControladorUsuarioInha?accion=eliminar&id=<%= uin.getId()%>">Recuperar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
