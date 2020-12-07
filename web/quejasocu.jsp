<%-- 
    Document   : quejasocu
    Created on : 27-oct-2020, 16:58:35
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.QuejasOcu"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.QuejasOcuDAO"%>
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
            <h1>Quejas Ocultas</h1>
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
                    QuejasOcuDAO dao=new QuejasOcuDAO();
                    List<QuejasOcu>list=dao.listar();
                    Iterator<QuejasOcu>iter=list.iterator();
                    QuejasOcu qoc=null;
                    while(iter.hasNext()){
                        qoc=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= qoc.getId()%></td>
                        <td class="text-center"><%= qoc.getCla()%></td>
                        <td class="text-center"><%= qoc.getCor()%></td>
                        <td><%= qoc.getArg()%></td>
                        <td class="text-center">
                            <a class="btn btn-success" href="ControladorQuejasOcu?accion=eliminar&id=<%= qoc.getId()%>">Recuperar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
