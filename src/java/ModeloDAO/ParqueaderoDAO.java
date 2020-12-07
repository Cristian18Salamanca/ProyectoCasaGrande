/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Parqueadero;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ParqueaderoDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Parqueadero p=new Parqueadero();

    public List listar() {
        ArrayList<Parqueadero>list=new ArrayList<>();
        String sql="select * from parqueadero";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Parqueadero par=new Parqueadero();
                par.setId(rs.getInt("id_parqueadero"));
                par.setNum(rs.getInt("numero"));
                par.setApa(rs.getString("apartamento"));
                par.setDue(rs.getString("dueño"));
                par.setDis(rs.getString("disponible"));                
                list.add(par);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Parqueadero list(int id) {
        String sql="select * from parqueadero where id_parqueadero="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                p.setId(rs.getInt("id_parqueadero"));
                p.setNum(rs.getInt("numero"));
                p.setApa(rs.getString("apartamento"));
                p.setDue(rs.getString("dueño"));
                p.setDis(rs.getString("disponible")); 
                
            }
        } catch (Exception e) {
        }
        return p;
    }

    public boolean add(Parqueadero par) {
       String sql="insert into parqueadero(numero, apartamento, dueño, disponible)values('"+par.getNum()+"','"+par.getApa()+"','"+par.getDue()+"' ,'"+par.getDis()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    public boolean edit(Parqueadero par) {
        String sql="update parqueadero set numero='"+par.getNum()+"',apartamento='"+par.getApa()+"', dueño='"+par.getDue()+"' where id_parqueadero="+par.getId()+"";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean mantenimiento(int id) {
        String sql="update parqueadero set disponible='Mantenimiento' where id_parqueadero="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean ocupado(int id) {
        String sql="update parqueadero set disponible='Ocupado' where id_parqueadero="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
}
