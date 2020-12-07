<%-- 
    Document   : editVisitante
    Created on : 19-sep-2020, 17:04:37
    Author     : crist
--%>

<%@page import="Modelo.Visitante"%>
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
            <div class="col-lg-6">
            <%
              VisitanteDAO dao=new VisitanteDAO();
              int id=Integer.parseInt((String)request.getAttribute("idvis"));
              Visitante v=(Visitante)dao.list(id);
            %>
            <h1>Modificar Usuario</h1>
            <form action="ControladorVisitante">
                Nombres:<br>
                <input class="form-control" type="text" name="txtNom" value="<%= v.getNom()%>"><br>
                Vehículo: <br>
                <input class="form-control" type="text" name="txtVeh" value="<%= v.getVeh()%>"><br>                
                Placa: <br>
                <input class="form-control" type="text" name="txtPla" value="<%= v.getPla()%>"><br>
                Apartamento: <br>
                <input class="form-control" type="text" name="txtApa" value="<%= v.getApa()%>"><br>
                Fecha: <br>
                <input class="form-control" type="date" name="txtFec" value="<%= v.getFec()%>"><br>
                Hora de Entrada: <br>
                <input class="form-control" type="time" name="txtHen" value="<%= v.getHen()%>"><br>
                Hora de Salida: <br>
                <input class="form-control" type="time" name="txtHsa" value="<%= v.getHsa()%>"><br>
                Parqueadero: <br>
                <input class="form-control" type="number" name="txtPar" value="<%= v.getPar()%>"><br>
                
                <input type="hidden" name="txtid" value="<%= v.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorVisitante?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
