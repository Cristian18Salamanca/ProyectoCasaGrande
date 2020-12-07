<%-- 
    Document   : editMulta
    Created on : 20-sep-2020, 11:28:22
    Author     : crist
--%>

<%@page import="Modelo.Multa"%>
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
            <div class="col-lg-6">
            <%
              MultasDAO dao=new MultasDAO();
              int id=Integer.parseInt((String)request.getAttribute("idmul"));
              Multa m=(Multa)dao.list(id);
            %> 
            <h1>Modificar Multas</h1>
            <form action="ControladorMulta">
                Placa Multada:<br>
                <input class="form-control" type="text" name="txtPla" value="<%= m.getPla()%>"><br>
                Vehiculo:<br>
                <input class="form-control" type="text" name="txtVeh" value="<%= m.getVeh()%>"><br>
                Fecha de Multa: <br>
                <input class="form-control" type="date" name="txtFec" value="<%= m.getFec()%>"><br>
                                
                <input type="hidden" name="txtid" value="<%= m.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorMulta?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
