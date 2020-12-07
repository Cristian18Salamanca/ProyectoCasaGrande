<%-- 
    Document   : listarqueja
    Created on : 27-oct-2020, 20:29:26
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Quejas"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.QuejasDAO"%>
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
            <h1>Quejas</h1>
            <a class="btn btn-success" href="ControladorQuejas?accion=add">Agregar Nuevo</a>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">No</th>
                        <th class="text-center">Clasificacion</th>
                        <th class="text-center">Correo</th>
                        <th class="text-center">Argumento</th>
                        <th class="text-center">Accion</th>
                    </tr>
                </thead>
                <%
                    QuejasDAO dao=new QuejasDAO();
                    List<Quejas>list=dao.listar();
                    Iterator<Quejas>iter=list.iterator();
                    Quejas que=null;
                    while(iter.hasNext()){
                        que=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= que.getId()%></td>
                        <td class="text-center"><%= que.getCla()%></td>
                        <td class="text-center"><%= que.getCor()%></td>
                        <td><%= que.getArg()%></td>
                        
                        <td class="text-center">
                            <a class="btn btn-danger" href="ControladorQuejas?accion=eliminar&id=<%= que.getId()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
