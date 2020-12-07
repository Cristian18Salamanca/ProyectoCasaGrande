<%-- 
    Document   : censo
    Created on : 27-oct-2020, 18:46:59
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Censo"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.CensoDAO"%>
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
            <h1>Censo</h1>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Mes</th>
                        <th class="text-center">Año</th>
                        <th class="text-center">Cant Personas</th>
                        <th class="text-center">Cant Niños</th>
                        <th class="text-center">Cant Adolecentes</th>
                        <th class="text-center">Cant Adultos</th>
                        <th class="text-center">Cant Adultos Mayores</th>
                        <th class="text-center">Cant Mascotas</th>
                        <th class="text-center">Cant Vehiculos</th>
                    </tr>
                </thead>
                <%
                    CensoDAO dao=new CensoDAO();
                    List<Censo>list=dao.listar();
                    Iterator<Censo>iter=list.iterator();
                    Censo cen=null;
                    while(iter.hasNext()){
                        cen=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= cen.getMes()%></td>
                        <td class="text-center"><%= cen.getAño()%></td>
                        <td><%= cen.getPer()%></td>
                        <td><%= cen.getNiñ()%></td>
                        <td><%= cen.getAdo()%></td>
                        <td><%= cen.getAdu()%></td>
                        <td><%= cen.getMay()%></td>
                        <td><%= cen.getMas()%></td>
                        <td><%= cen.getVeh()%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
