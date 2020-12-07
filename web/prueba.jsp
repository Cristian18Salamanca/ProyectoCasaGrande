<%-- 
    Document   : prueba
    Created on : 10-nov-2020, 18:26:17
    Author     : crist
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="conexion.jsp"%>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Menu</h1>
        <a href="conexion.jsp">Conexion</a>
        <br>
        <br>
        <br>
        <% 
        Connection con = 
        DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande", 
                                "root", "");
        Statement sql = con.createStatement();
        String qry="select apartamento from usuario";
        ResultSet data = sql.executeQuery(qry);
        while(data.next()){
        %>
        
        <h1><% out.print(data.getString(1));%></h1>
        
        <% } %>
    </body>
</html>
