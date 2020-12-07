/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Multa;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MultasDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Multa m=new Multa();
    
    public List listar() {
        ArrayList<Multa>list=new ArrayList<>();
        String sql="select * from multa";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Multa min=new Multa();
                min.setId(rs.getInt("Id_Multa"));
                min.setPla(rs.getString("Placa"));                
                min.setVeh(rs.getString("vehiculo"));
                min.setFec(rs.getString("Fecha"));
                min.setPag(rs.getString("Pagos"));
                
                list.add(min);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Multa list(int id) {
        String sql="select * from multa where Id_Multa="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                m.setId(rs.getInt("Id_Multa"));
                m.setPla(rs.getString("Placa"));                
                m.setVeh(rs.getString("vehiculo"));
                m.setFec(rs.getString("Fecha"));
                m.setPag(rs.getString("Pagos")); 
                
            }
        } catch (Exception e) {
        }
        return m;
    }
    
    public boolean add(Multa mul) {
        String sql="insert into multa (Placa, vehiculo, Fecha, Pagos) values ('"+ mul.getPla()+"', '"+ mul.getVeh()+"', '"+ mul.getFec()+"', 'Activa')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean edit(Multa mul) {
        String sql="update multa set Placa='"+ mul.getPla()+"', vehiculo='"+ mul.getVeh()+"', Fecha='"+ mul.getFec()+"' where Id_Multa="+mul.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean eliminar(int id) {
        String sql="delete from multa where Id_Multa="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    } 
    
    public boolean cancelar(int id) {
        String sql="update multa set Pagos='Cancelada' where Id_Multa="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
