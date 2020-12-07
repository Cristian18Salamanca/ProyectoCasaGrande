<%-- 
    Document   : listarApartamento
    Created on : 21-sep-2020, 6:54:22
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Apartamento"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ApartamentoDAO"%>
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
            <h1>Apartamento</h1>
            <a class="btn btn-success" href="ControladorApartamento?accion=add">Agregar Nuevo</a>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">APARTAMENTO</th>
                        <th class="text-center">DUEÑO</th>
                        <th class="text-center">CANTIDAD DE PERSONAS</th>
                        <th class="text-center">CANTIDAD DE MASCOTAS</th>
                        <th class="text-center">TELEFONO</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    ApartamentoDAO dao=new ApartamentoDAO();
                    List<Apartamento>list=dao.listar();
                    Iterator<Apartamento>iter=list.iterator();
                    Apartamento apa=null;
                    while(iter.hasNext()){
                        apa=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= apa.getId()%></td>
                        <td class="text-center"><%= apa.getApa()%></td>
                        <td><%= apa.getDue()%></td>
                        <td><%= apa.getPer()%></td>
                        <td><%= apa.getMas()%></td>
                        <td><%= apa.getTel()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="ControladorApartamento?accion=editar&id=<%= apa.getId()%>">Editar</a>
                            <a class="btn btn-danger" href="ControladorApartamento?accion=eliminar&id=<%= apa.getId()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
