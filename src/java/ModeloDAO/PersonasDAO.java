/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Personas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonasDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Personas p=new Personas();
    
    public List listar() {
        ArrayList<Personas>list=new ArrayList<>();
        String sql="select * from personas_rango";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Personas per=new Personas();
                per.setId(rs.getInt("id_persona"));
                per.setApa(rs.getString("apartamento"));                
                per.setNom(rs.getString("nombres"));
                per.setApe(rs.getString("apellidos"));
                per.setNac(rs.getString("nacimiento"));
                per.setEda(rs.getInt("edad"));
                per.setRag(rs.getString("rango"));
                per.setTel(rs.getString("telefono"));
                
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Personas list(int id) {
        String sql="select * from persona where id_persona="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                p.setId(rs.getInt("id_persona"));
                p.setApa(rs.getString("apartamento"));                
                p.setNom(rs.getString("nombres"));
                p.setApe(rs.getString("apellidos"));
                p.setNac(rs.getString("nacimiento"));
                p.setTel(rs.getString("telefono"));
                
            }
        } catch (Exception e) {
        }
        return p;
    }
    
    public boolean add(Personas per) {
        String sql="INSERT INTO `persona` (`id_persona`, `fecha`, `apartamento`, `nombres`, `apellidos`, `nacimiento`, `edad`, `rango`, `telefono`) VALUES (NULL, current_timestamp(), '"+per.getApa()+"', '"+per.getNom()+"', '"+per.getApe()+"', '"+per.getNac()+"', '0', '0', '"+per.getTel()+"');";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
    
    public boolean edit(Personas per) {
        String sql="update persona set nombres='"+per.getNom()+"', apellidos='"+per.getApe()+"', nacimiento='"+per.getNac()+"', telefono='"+per.getTel()+"' where id_persona="+per.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean eliminar(int id) {
        String sql="delete from persona where id_persona="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
