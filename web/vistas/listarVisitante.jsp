<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Visitante"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.VisitanteDAO"%>
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
            <h1>Visitante</h1>
            <a class="btn btn-success" href="ControladorVisitante?accion=add">Agregar Nuevo</a>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">NOMBRE</th>
                        <th class="text-center">VEHICULO</th>
                        <th class="text-center">PLACA</th>
                        <th class="text-center">APARTAMENTO</th>
                        <th class="text-center">FECHA</th>
                        <th class="text-center">HORA ENTRADA</th>
                        <th class="text-center">PARQUEADERO</th>
                        <th class="text-center">MINUTOS</th>
                        <th class="text-center">HORA SALIDA</th>
                        <th class="text-center">ESTADO</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    VisitanteDAO dao=new VisitanteDAO();
                    List<Visitante>list=dao.listar();
                    Iterator<Visitante>iter=list.iterator();
                    Visitante vis=null;
                    while(iter.hasNext()){
                        vis=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= vis.getId()%></td>
                        <td class="text-center"><%= vis.getNom()%></td>
                        <td class="text-center"><%= vis.getVeh()%></td>
                        <td class="text-center"><%= vis.getPla()%></td>
                        <td class="text-center"><%= vis.getApa()%></td>
                        <td class="text-center"><%= vis.getFec()%></td>
                        <td><%= vis.getHen()%></td>
                        <td class="text-center"><%= vis.getPar()%></td>
                        <td class="text-center"><%= vis.getMin()%></td>
                        <td><%= vis.getHsa()%></td>
                        <td class="text-center"><%= vis.getEst()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="ControladorVisitante?accion=editar&id=<%= vis.getId()%>">Editar</a>
                            <a class="btn btn-success" href="ControladorVisitante?accion=terminado&id=<%= vis.getId()%>">Fin</a>
                            <a class="btn btn-danger" href="ControladorVisitante?accion=multado&id=<%= vis.getId()%>">Mul</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
