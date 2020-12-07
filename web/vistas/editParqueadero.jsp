<%@page import="Modelo.Parqueadero"%>
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
            <div class="col-lg-6">
              <%
              ParqueaderoDAO dao=new ParqueaderoDAO();
              int id=Integer.parseInt((String)request.getAttribute("idpar"));
              Parqueadero p=(Parqueadero)dao.list(id);
          %>
            <h1>Modificar Parqueadero</h1>
            <form action="ControladorParqueadero">
                Numero de Parqueadero:<br>
                <input class="form-control" type="number" name="txtNum" value="<%= p.getNum()%>"><br>
                Apartamento: <br>
                <input class="form-control" type="text" name="txtApa" value="<%= p.getApa()%>"><br>
                Dueño: <br>
                <input class="form-control" type="text" name="txtDue" value="<%= p.getDue()%>"><br>
                Disponibilidad: <br>
                <input class="form-control" type="text" name="txtDis" value="<%= p.getDis()%>"><br>
                
                <input type="hidden" name="txtid" value="<%= p.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorParqueadero?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
