<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*"%>

<% 

Connection conex;
try {
    Class.forName("com.mysql.jdbc.Driver");
    conex=DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_casagrande","root",""); 
} catch (Exception e) {
    out.print("Error en la conexion" + e);
}
%>