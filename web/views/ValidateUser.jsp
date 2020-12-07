<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@ page import ="java.sql.*" %>
         <%@ page import ="java.sql.SQLException" %>
         <%@ page import ="java.sql.Connection" %>
         <%@ page import ="java.sql.DriverManager" %>
<%

    String codigo = request.getParameter("codigo");
    String driver, user, password, bd, urlBd;
    Connection conexion;
    
        driver ="com.mysql.jdbc.Driver";
        user="root";
        password="";
        bd="proyecto_casagrande";
        urlBd="jdbc:mysql://localhost:3306/" + bd;
        
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(urlBd,user,password);
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from codigo where codigo='" + codigo + "'");
    if (rs.next()) {
        session.setAttribute("codigo", codigo);
        response.sendRedirect("../registrarUsuario.jsp");
    } else {
        request.setAttribute("mensajeError", "Codigo Incorrecto");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
    </body>
</html>
