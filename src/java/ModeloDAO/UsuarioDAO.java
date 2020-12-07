/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public String driver, user, password, urlBd, bd;
    Usuario u=new Usuario();  
    public UsuarioDAO(){
        driver ="com.mysql.jdbc.Driver";
        user="root";
        password="";
        bd="proyecto_casagrande";
        urlBd="jdbc:mysql://localhost:3306/" + bd;
    }
    
    public List listar() {
        ArrayList<Usuario>list=new ArrayList<>();
        String sql="select * from usuario";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Usuario usu=new Usuario();
                usu.setId(rs.getInt("Id_Usuario"));
                usu.setNom(rs.getString("Nombre"));                
                usu.setApe(rs.getString("Apellido"));
                usu.setTel(rs.getString("Telefono"));
                usu.setCor(rs.getString("Correo"));
                usu.setTip(rs.getString("Tipo_Usuario"));
                usu.setApa(rs.getString("apartamento"));
                usu.setNus(rs.getString("Nombre_Usuario")); 
                usu.setCon(rs.getString("Contraseña"));
                list.add(usu);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List listarusu() {
        String usuario = null;
        ArrayList<Usuario>list=new ArrayList<>();
        String sql = "select * from usuario where Nombre_Usuario='"+ usuario +"'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Usuario usu=new Usuario();
                usu.setId(rs.getInt("Id_Usuario"));
                usu.setApa(rs.getString("apartamento"));
                list.add(usu);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Usuario list(int id) {
        String sql="select * from usuario where Id_Usuario="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                u.setId(rs.getInt("Id_Usuario"));
                u.setNom(rs.getString("Nombre"));                
                u.setApe(rs.getString("Apellido"));
                u.setTel(rs.getString("Telefono"));
                u.setCor(rs.getString("Correo"));
                u.setTip(rs.getString("Tipo_Usuario"));
                u.setApa(rs.getString("apartamento"));
                u.setNus(rs.getString("Nombre_Usuario")); 
                u.setCon(rs.getString("Contraseña"));
            }
        } catch (Exception e) {
        }
        return u;
    }
    
    public boolean add(Usuario usu) {
        String sql="insert into usuario(Nombre, Apellido, Telefono, Correo, Tipo_Usuario, apartamento, Nombre_Usuario, Contraseña)values('"+usu.getNom()+"','"+usu.getApe()+"','"+usu.getTel()+"','"+usu.getCor()+"','"+usu.getTip()+"','"+usu.getApa()+"','"+usu.getNus()+"','"+usu.getCon()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
    
    public boolean edit(Usuario usu) {
        String sql="update usuario set Nombre_Usuario='"+usu.getNus()+"', Nombre='"+usu.getNom()+"', Apellido='"+usu.getApe()+"', Telefono='"+usu.getTel()+"', Correo='"+usu.getCor()+"' where Id_Usuario="+usu.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean contra(Usuario usu) {
        String sql="update usuario set Contraseña='"+usu.getCon()+"' where Id_Usuario="+usu.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean eliminar(int id) {
        String sql="delete from usuario where Id_Usuario="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public int iniciarSesion(String usuario, String clave) {
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        int nivel=0;
        int apartamento=0;
        String sql = "select Tipo_Usuario,apartamento from usuario where Nombre_Usuario='" + usuario + "' and Contraseña='" + clave +"'";
        try {
            Class.forName(this.driver);
            conn = DriverManager.getConnection(this.urlBd, this.user, this.password);
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();          
            while (rs.next()) {
                nivel = rs.getInt(1);
                apartamento = rs.getInt(1);
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return nivel;
    }
   
}
