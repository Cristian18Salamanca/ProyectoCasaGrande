<%-- 
    Document   : multainha
    Created on : 27-oct-2020, 18:05:29
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.MultaInha"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.MultaInhaDAO"%>
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
            <h1>Multas Inhabilitadas</h1>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">No</th>
                        <th class="text-center">Placa</th>
                        <th class="text-center">Vehiculo</th>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Pagos</th>
                        <th class="text-center">Accion</th>
                    </tr>
                </thead>
                <%
                    MultaInhaDAO dao=new MultaInhaDAO();
                    List<MultaInha>list=dao.listar();
                    Iterator<MultaInha>iter=list.iterator();
                    MultaInha min=null;
                    while(iter.hasNext()){
                        min=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= min.getId()%></td>
                        <td class="text-center"><%= min.getPla()%></td>
                        <td class="text-center"><%= min.getVeh()%></td>
                        <td><%= min.getFec()%></td>
                        <td><%= min.getPag()%></td>
                        <td class="text-center">
                            <a class="btn btn-success" href="ControladorMultaInha?accion=eliminar&id=<%= min.getId()%>">Recuperar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
