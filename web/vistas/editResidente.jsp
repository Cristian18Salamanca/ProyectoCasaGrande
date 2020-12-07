<%-- 
    Document   : editResidente
    Created on : 28-oct-2020, 10:42:02
    Author     : crist
--%>

<%@page import="Modelo.Residente"%>
<%@page import="ModeloDAO.ResidenteDAO"%>
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
              ResidenteDAO dao=new ResidenteDAO();
              int id=Integer.parseInt((String)request.getAttribute("idres"));
              Residente r=(Residente)dao.list(id);
          %>
            <h1>Modificar Residente</h1>
            <form action="ControladorResidente">
                Apartamento:<br>
                    <input class="form-control" type="text" name="txtApa" value="<%= r.getApa()%>" required="required"><br>
                    Inicio de Contrato: <br>
                    <input class="form-control" type="date" name="txtIco" value="<%= r.getIco()%>" required="required"><br>
                    Fin Contrato: <br>
                    <input class="form-control" type="date" name="txtFco" value="<%= r.getFco()%>" required="required"><br>
                    Tipo de Residente: <br>
                    <input class="form-control" type="text" name="txtTip" value="<%= r.getTip()%>" required="required"><br>
                    Arrendado a: <br>
                    <input class="form-control" type="text" name="txtArr" value="<%= r.getArr()%>" required="required"><br>
                    Vehiculo: <br>
                    <input class="form-control" type="text" name="txtVeh" value="<%= r.getVeh()%>" required="required"><br>
                
                <input type="hidden" name="txtid" value="<%= r.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorResidente?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
