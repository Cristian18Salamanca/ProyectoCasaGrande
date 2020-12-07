<%-- 
    Document   : listarResidente
    Created on : 28-oct-2020, 10:21:23
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Residente"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ResidenteDAO"%>
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
            <h1>Residentes</h1>
            <a class="btn btn-success" href="ControladorResidente?accion=add">Agregar Nuevo</a>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Apartamento</th>
                        <th class="text-center">Inicio de Contrato</th>
                        <th class="text-center">Final del Contrato</th>
                        <th class="text-center">Tipo de Residente</th>
                        <th class="text-center">Arrendado a</th>
                        <th class="text-center">Vehiculo</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    ResidenteDAO dao=new ResidenteDAO();
                    List<Residente>list=dao.clistar();
                    Iterator<Residente>iter=list.iterator();
                    Residente res=null;
                    while(iter.hasNext()){
                        res=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= res.getId()%></td>
                        <td class="text-center"><%= res.getApa()%></td>
                        <td><%= res.getIco()%></td>
                        <td><%= res.getFco()%></td>
                        <td><%= res.getTip()%></td>
                        <td><%= res.getArr()%></td>
                        <td><%= res.getVeh()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="ControladorResidente?accion=editar&id=<%= res.getId()%>">Editar</a>
                            <a class="btn btn-danger" href="ControladorResidente?accion=eliminar&id=<%= res.getId()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
