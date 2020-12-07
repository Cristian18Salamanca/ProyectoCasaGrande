/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Apartamento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ApartamentoDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Apartamento a=new Apartamento();
    
    public List alistar() {
        ArrayList<Apartamento>alist=new ArrayList<>();
        String sql="select * from apartamentos";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Apartamento apa=new Apartamento();
                apa.setId(rs.getInt("Id_Apartamento"));
                apa.setApa(rs.getString("Apartamento"));                
                apa.setDue(rs.getString("Dueño"));
                apa.setPer(rs.getInt("Personas"));
                apa.setMas(rs.getInt("Mascotas"));
                apa.setTel(rs.getInt("Telefono"));
                
                alist.add(apa);
            }
        } catch (Exception e) {
        }
        return alist;
    }
    
    public Apartamento list(int id) {
        String sql="select * from apartamentos where Id_Apartamento="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                a.setId(rs.getInt("Id_Apartamento"));                
                a.setApa(rs.getString("Apartamento"));
                a.setDue(rs.getString("Dueño"));
                a.setPer(rs.getInt("Personas"));
                a.setMas(rs.getInt("Mascotas"));
                a.setTel(rs.getInt("Telefono"));
                
            }
        } catch (Exception e) {
        }
        return a;
    }
    
    public boolean add(Apartamento apa) {
       String sql="insert into apartamentos(Apartamento, Dueño, Personas, Mascotas, Telefono)values('"+apa.getApa()+"','"+apa.getDue()+"','"+apa.getPer()+"','"+apa.getMas()+"','"+apa.getTel()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
    
    public boolean edit(Apartamento apa) {
        String sql="update apartamentos set Apartamento='"+apa.getApa()+"', Dueño='"+apa.getDue()+"', Personas='"+apa.getPer()+"', Mascotas='"+apa.getMas()+"', Telefono='"+apa.getTel()+"' where Id_Apartamento="+apa.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean eliminar(int id) {
        String sql="delete from apartamentos where Id_Apartamento="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
