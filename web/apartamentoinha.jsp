<%-- 
    Document   : apartamentoinha
    Created on : 27-oct-2020, 15:52:22
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.ApartamentoInha"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ApartamentoInhaDAO"%>
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
            <h1>Apartamentos Inhabilitados</h1>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">No</th>
                        <th class="text-center">Apartamento</th>
                        <th class="text-center">Dueño</th>
                        <th class="text-center">Cant Personas</th>
                        <th class="text-center">Cant Mascotas</th>
                        <th class="text-center">Telefono</th>
                        <th class="text-center">Accion</th>
                    </tr>
                </thead>
                <%
                    ApartamentoInhaDAO dao=new ApartamentoInhaDAO();
                    List<ApartamentoInha>list=dao.listar();
                    Iterator<ApartamentoInha>iter=list.iterator();
                    ApartamentoInha ain=null;
                    while(iter.hasNext()){
                        ain=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= ain.getId()%></td>
                        <td class="text-center"><%= ain.getApa()%></td>
                        <td class="text-center"><%= ain.getDue()%></td>
                        <td><%= ain.getPer()%></td>
                        <td><%= ain.getMas()%></td>
                        <td><%= ain.getTel()%></td>
                        <td class="text-center">
                            <a class="btn btn-success" href="ControladorApartamentoInha?accion=eliminar&id=<%= ain.getId()%>">Recuperar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
