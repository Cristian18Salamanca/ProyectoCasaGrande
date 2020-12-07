<%-- 
    Document   : editPersonas
    Created on : 28-oct-2020, 11:45:18
    Author     : crist
--%>
<%@page import="Modelo.Personas"%>
<%@page import="ModeloDAO.PersonasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <title>Casa Grande - Conjunto Residencial</title>
        <script>
          $(document).ready(function()
         {
            $("#mostrarmodal").modal("show");
         });
       </script>
    </head>
    <body>
        <div class="container">
<div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <%
              PersonasDAO dao=new PersonasDAO();
              int id=Integer.parseInt((String)request.getAttribute("idper"));
              Personas p=(Personas)dao.list(id);
            %>
            <h3>Modificar Persona</h3>
        </div>
            <div class="modal-body">
            <form action="ControladorPersonas">
                    Nombres: <br>
                    <input class="form-control" type="text" name="txtNom" value="<%= p.getNom()%>" ><br>
                    Apellidos: <br>
                    <input class="form-control" type="text" name="txtApe" value="<%= p.getApe()%>" ><br>
                    Fecha de Nacimiento: <br>
                    <input class="form-control" type="date" name="txtNac" value="<%= p.getNac()%>" ><br>
                    Teléfono: <br>
                    <input class="form-control" type="number" name="txtTel" value="<%= p.getTel()%>" ><br>
                
                <input type="hidden" name="txtid" value="<%= p.getId()%>">
                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> 
                <a href="ControladorPersonas?accion=listar">Regresar</a>
            </form>
           </div>
          <div class="modal-footer">
          <a href="ControladorPersonas?accion=listar" class="btn btn-danger">Cerrar</a>
           </div>
      </div>
   </div>
</div>
        </div>
    </body>
</html>

