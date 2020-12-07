<%-- 
    Document   : vehiculoinha
    Created on : 27-oct-2020, 16:34:23
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.VehiculoInha"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.VehiculoInhaDAO"%>
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
            <h1>Vehiculos Inhabilitados</h1>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">No</th>
                        <th class="text-center">Placa</th>
                        <th class="text-center">Apartamento</th>
                        <th class="text-center">Dueño</th>
                        <th class="text-center">Marca</th>
                        <th class="text-center">Color</th>
                        <th class="text-center">Parqueadero</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Accion</th>
                    </tr>
                </thead>
                <%
                    VehiculoInhaDAO dao=new VehiculoInhaDAO();
                    List<VehiculoInha>list=dao.listar();
                    Iterator<VehiculoInha>iter=list.iterator();
                    VehiculoInha vin=null;
                    while(iter.hasNext()){
                        vin=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= vin.getId()%></td>
                        <td class="text-center"><%= vin.getPla()%></td>
                        <td class="text-center"><%= vin.getApa()%></td>
                        <td><%= vin.getDue()%></td>
                        <td><%= vin.getMar()%></td>
                        <td><%= vin.getCol()%></td>
                        <td><%= vin.getPar()%></td>
                        <td><%= vin.getEst()%></td>
                        <td class="text-center">
                            <a class="btn btn-success" href="ControladorVehiculoInha?accion=eliminar&id=<%= vin.getId()%>">Recuperar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
