<%-- 
    Document   : listarMulta
    Created on : 20-sep-2020, 11:21:06
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Multa"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.MultasDAO"%>
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
            <h1>Multa</h1>
            <a class="btn btn-success" href="ControladorMulta?accion=add">Agregar Nuevo</a>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">PLACA MULTADA</th>
                        <th class="text-center">VEHICULO</th>
                        <th class="text-center">FECHA DE MULTA</th>
                        <th class="text-center">PAGOS</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    MultasDAO dao=new MultasDAO();
                    List<Multa>list=dao.listar();
                    Iterator<Multa>iter=list.iterator();
                    Multa mul=null;
                    while(iter.hasNext()){
                        mul=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= mul.getId()%></td>
                        <td class="text-center"><%= mul.getPla()%></td>
                        <td class="text-center"><%= mul.getVeh()%></td>
                        <td><%= mul.getFec()%></td>
                        <td><%= mul.getPag()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="ControladorMulta?accion=editar&id=<%= mul.getId()%>">Editar</a>
                            <a class="btn btn-danger" href="ControladorMulta?accion=eliminar&id=<%= mul.getId()%>">Remove</a>
                            <a class="btn btn-success" href="ControladorMulta?accion=cancelar&id=<%= mul.getId()%>">Cancelada</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
