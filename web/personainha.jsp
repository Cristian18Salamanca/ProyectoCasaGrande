<%-- 
    Document   : personainha
    Created on : 27-oct-2020, 14:47:50
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.PersonaInha"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonaInhaDAO"%>
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
            <h1>Personas Inhabilitadas</h1>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">No</th>
                        <th class="text-center">Apartamento</th>
                        <th class="text-center">Nombres</th>
                        <th class="text-center">Apellidos</th>
                        <th class="text-center">Fecha Nacimiento</th>
                        <th class="text-center">Telefono</th>
                        <th class="text-center">Accion</th>
                    </tr>
                </thead>
                <%
                    PersonaInhaDAO dao=new PersonaInhaDAO();
                    List<PersonaInha>list=dao.listar();
                    Iterator<PersonaInha>iter=list.iterator();
                    PersonaInha pin=null;
                    while(iter.hasNext()){
                        pin=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= pin.getId()%></td>
                        <td class="text-center"><%= pin.getApa()%></td>
                        <td><%= pin.getNom()%></td>
                        <td><%= pin.getApe()%></td>
                        <td><%= pin.getNac()%></td>
                        <td><%= pin.getTel()%></td>
                        <td class="text-center">
                            <a class="btn btn-success" href="ControladorPersonaInha?accion=eliminar&id=<%= pin.getId()%>">Recuperar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
