<%-- 
    Document   : editApartamento
    Created on : 20-sep-2020, 8:51:07
    Author     : crist
--%>

<%@page import="Modelo.Apartamento"%>
<%@page import="ModeloDAO.ApartamentoDAO"%>
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
              ApartamentoDAO dao=new ApartamentoDAO();
              int id=Integer.parseInt((String)request.getAttribute("idapa"));
              Apartamento a=(Apartamento)dao.list(id);
          %>
            <h1>Modificar Persona</h1>
            <form action="ControladorApartamento">
                Apartamento:<br>
                <input class="form-control" type="text" name="txtApa" value="<%= a.getApa()%>"><br>
                Dueño: <br>
                <input class="form-control" type="text" name="txtDue" value="<%= a.getDue()%>"><br>
                Cantidad de Personas: <br>
                <input class="form-control" type="number" name="txtPer" value="<%= a.getPer()%>"><br>
                Cantidad de Mascotas: <br>
                <input class="form-control" type="number" name="txtMas" value="<%= a.getMas()%>"><br>
                Teléfono: <br>
                <input class="form-control" type="number" name="txtTel" value="<%= a.getTel()%>"><br>
                
                <input type="hidden" name="txtid" value="<%= a.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorApartamento?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
