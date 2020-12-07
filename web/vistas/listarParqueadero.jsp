<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Parqueadero"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ParqueaderoDAO"%>
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
            <h1>Parqueadero</h1>
            <a class="btn btn-success" href="ControladorParqueadero?accion=add">Agregar Nuevo</a>
            <a class="btn btn-primary" href="index.jsp">Inicio</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">NUMERO DE PARQUEADERO</th>
                        <th class="text-center">APARTAMENTO</th>
                        <th class="text-center">DUEÑO</th>
                        <th class="text-center">DISPONIBILIDAD</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    ParqueaderoDAO dao=new ParqueaderoDAO();
                    List<Parqueadero>list=dao.listar();
                    Iterator<Parqueadero>iter=list.iterator();
                    Parqueadero par=null;
                    while(iter.hasNext()){
                        par=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= par.getId()%></td>
                        <td class="text-center"><%= par.getNum()%></td>
                        <td class="text-center"><%= par.getApa()%></td>
                        <td class="text-center"><%= par.getDue()%></td>
                        <td><%= par.getDis()%></td>
                        <td class="text-center">
                            <a class="btn btn-success" href="ControladorParqueadero?accion=editar&id=<%= par.getId()%>">Editar</a>
                            <a class="btn btn-warning" href="ControladorParqueadero?accion=mantenimiento&id=<%= par.getId()%>">Mantenimiento</a>
                            <a class="btn btn-danger" href="ControladorParqueadero?accion=ocupado&id=<%= par.getId()%>">Ocupado</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
