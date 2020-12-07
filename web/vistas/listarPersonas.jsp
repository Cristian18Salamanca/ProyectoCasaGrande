<%-- 
    Document   : listarPersonas
    Created on : 28-oct-2020, 11:25:05
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Personas"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonasDAO"%>
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
            <h1>Personas</h1>
            <a class="btn btn-success" href="ControladorPersonas?accion=add">Agregar Nuevo</a>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Apartamento</th>
                        <th class="text-center">Nombres</th>
                        <th class="text-center">Apellidos</th>
                        <th class="text-center">Fecha de Nacimiento</th>
                        <th class="text-center">Edad</th>
                        <th class="text-center">Rango</th>
                        <th class="text-center">Telefono</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    PersonasDAO dao=new PersonasDAO();
                    List<Personas>list=dao.listar();
                    Iterator<Personas>iter=list.iterator();
                    Personas per=null;
                    while(iter.hasNext()){
                        per=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= per.getId()%></td>
                        <td class="text-center"><%= per.getApa()%></td>
                        <td><%= per.getNom()%></td>
                        <td><%= per.getApe()%></td>
                        <td><%= per.getNac()%></td>
                        <td><%= per.getEda()%></td>
                        <td><%= per.getRag()%></td>
                        <td><%= per.getTel()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="ControladorPersonas?accion=editar&id=<%= per.getId()%>">Editar</a>
                            <a class="btn btn-danger" href="ControladorPersonas?accion=eliminar&id=<%= per.getId()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
