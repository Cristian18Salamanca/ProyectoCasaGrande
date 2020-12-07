/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.UsuarioInha;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioInhaDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    UsuarioInha u=new UsuarioInha();
    
    public List listar() {
        ArrayList<UsuarioInha>list=new ArrayList<>();
        String sql="select * from usuarios_inhabilitados";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                UsuarioInha uin=new UsuarioInha();
                uin.setId(rs.getInt("Id_Usuario"));
                uin.setNom(rs.getString("Nombre"));
                uin.setApe(rs.getString("Apellido"));                
                uin.setTel(rs.getString("Telefono"));
                uin.setCor(rs.getString("Correo"));
                uin.setTip(rs.getString("Tipo_Usuario"));
                uin.setApa(rs.getString("apartamento"));
                uin.setUsu(rs.getString("Nombre_Usuario"));
                uin.setCon(rs.getString("Contraseña"));
                
                
                list.add(uin);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public boolean eliminar(int id) {
        String sql="delete from usuarios_inhabilitados where Id_Usuario="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
