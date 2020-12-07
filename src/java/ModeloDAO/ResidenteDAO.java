/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Residente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ResidenteDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Residente r=new Residente();
    
    public List clistar() {
        ArrayList<Residente>list=new ArrayList<>();
        String sql="select * from residente";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Residente res=new Residente();
                res.setId(rs.getInt("id_residente"));
                res.setApa(rs.getString("apartamento"));                
                res.setIco(rs.getString("inicio_contra"));
                res.setFco(rs.getString("fin_contra"));
                res.setTip(rs.getString("tipo"));
                res.setArr(rs.getString("arrendado"));
                res.setVeh(rs.getString("vehiculo"));
                
                list.add(res);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Residente list(int id) {
        String sql="select * from residente where id_residente="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                r.setId(rs.getInt("id_residente"));
                r.setApa(rs.getString("apartamento"));                
                r.setIco(rs.getString("inicio_contra"));
                r.setFco(rs.getString("fin_contra"));
                r.setTip(rs.getString("tipo"));
                r.setArr(rs.getString("arrendado"));
                r.setVeh(rs.getString("vehiculo"));
                
            }
        } catch (Exception e) {
        }
        return r;
    }
    
    public boolean add(Residente res) {
       String sql="insert into residente(apartamento, inicio_contra, fin_contra, tipo, arrendado, vehiculo)values('"+res.getApa()+"','"+res.getIco()+"','"+res.getFco()+"','"+res.getTip()+"','"+res.getArr()+"','"+res.getVeh()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
    
    public boolean edit(Residente res) {
        String sql="update residente set apartamento='"+res.getApa()+"', inicio_contra='"+res.getIco()+"', fin_contra='"+res.getFco()+"', tipo='"+res.getTip()+"', arrendado='"+res.getArr()+"', vehiculo='"+res.getVeh()+"' where id_residente="+res.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean eliminar(int id) {
        String sql="delete from residente where id_residente="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
