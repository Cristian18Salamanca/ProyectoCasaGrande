<%-- 
    Document   : listarcodigo
    Created on : 27-oct-2020, 19:35:22
    Author     : crist
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.codigo"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.codigoDAO"%>
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
            <h1>Codigo</h1>
            <a class="btn btn-success" href="ControladorCodigo?accion=add">Agregar Nuevo</a>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    codigoDAO dao=new codigoDAO();
                    List<codigo>list=dao.listar();
                    Iterator<codigo>iter=list.iterator();
                    codigo cod=null;
                    while(iter.hasNext()){
                        cod=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= cod.getId()%></td>
                        <td class="text-center"><%= cod.getCod()%></td>
                        
                        <td class="text-center">
                            <a class="btn btn-danger" href="ControladorCodigo?accion=eliminar&id=<%= cod.getId()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
