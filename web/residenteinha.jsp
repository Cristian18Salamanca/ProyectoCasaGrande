<%-- 
    Document   : residenteinha
    Created on : 27-oct-2020, 12:37:24
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.ResidenteInha"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ResidenteInhaDAO"%>
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
            <h1>Residentes Inhabilitados</h1>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        
                        <th class="text-center">Apartamento</th>
                        <th class="text-center">Inicio de Contrato</th>
                        <th class="text-center">Fin del Contrato</th>
                        <th class="text-center">Tipo de Residente</th>
                        <th class="text-center">Arrendado A</th>
                        <th class="text-center">Vehiculo</th>
                        <th class="text-center">Accion</th>
                    </tr>
                </thead>
                <%
                    ResidenteInhaDAO dao=new ResidenteInhaDAO();
                    List<ResidenteInha>list=dao.listar();
                    Iterator<ResidenteInha>iter=list.iterator();
                    ResidenteInha rin=null;
                    while(iter.hasNext()){
                        rin=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= rin.getApa()%></td>
                        <td><%= rin.getIcon()%></td>
                        <td><%= rin.getFcon()%></td>
                        <td><%= rin.getTip()%></td>
                        <td><%= rin.getArre()%></td>
                        <td><%= rin.getVeh()%></td>
                        <td class="text-center">
                            <a class="btn btn-success" href="ControladorResidenteInha?accion=eliminar&id=<%= rin.getId()%>">Recuperar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
