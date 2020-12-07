<%-- 
    Document   : listarVehiculo
    Created on : 20-sep-2020, 10:07:42
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Vehiculo"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.VehiculoDAO"%>
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
            <h1>Vehiculo</h1>
            <a class="btn btn-success" href="ControladorVehiculo?accion=add">Agregar Nuevo</a>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">PLACA</th>
                        <th class="text-center">APARTAMENTO</th>
                        <th class="text-center">DUEÑO</th>
                        <th class="text-center">MARCA</th>
                        <th class="text-center">COLOR</th>
                        <th class="text-center">PARQUEADERO</th>
                        <th class="text-center">ESTADO</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    VehiculoDAO dao=new VehiculoDAO();
                    List<Vehiculo>list=dao.listar();
                    Iterator<Vehiculo>iter=list.iterator();
                    Vehiculo veh=null;
                    while(iter.hasNext()){
                        veh=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= veh.getId()%></td>
                        <td class="text-center"><%= veh.getPla()%></td>
                        <td class="text-center"><%= veh.getApa()%></td>
                        <td class="text-center"><%= veh.getDue()%></td>
                        <td><%= veh.getMar()%></td>
                        <td><%= veh.getCol()%></td>
                        <td><%= veh.getPar()%></td>
                        <td><%= veh.getEst()%></td>
                        <td class="text-center">
                            <a class="btn btn-danger" href="ControladorVehiculo?accion=eliminar&id=<%= veh.getId()%>">Remove</a>
                            <a class="btn btn-success" href="ControladorVehiculo?accion=salio&id=<%= veh.getId()%>">Salio</a>
                            <a class="btn btn-warning" href="ControladorVehiculo?accion=entro&id=<%= veh.getId()%>">Entro</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
