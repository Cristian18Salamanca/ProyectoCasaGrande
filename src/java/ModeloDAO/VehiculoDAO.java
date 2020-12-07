/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Vehiculo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VehiculoDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Vehiculo v=new Vehiculo();
    
    public List vlistar() {
        ArrayList<Vehiculo>list=new ArrayList<>();
        String sql="select * from vehiculo";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Vehiculo veh=new Vehiculo(); 
                veh.setId(rs.getInt("Id_Vehiculo"));
                veh.setPla(rs.getString("Placa"));  
                veh.setApa(rs.getString("apartamento"));
                veh.setDue(rs.getString("Dueño"));
                veh.setMar(rs.getString("Marca"));
                veh.setCol(rs.getString("Color"));
                veh.setPar(rs.getInt("Parqueadero"));
                veh.setEst(rs.getString("estado"));
                list.add(veh);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Vehiculo list(String id) {
        String sql="select * from vehiculo where Id_Vehiculo="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){   
                v.setId(rs.getInt("Id_Vehiculo"));
                v.setPla(rs.getString("Placa"));  
                v.setApa(rs.getString("apartamento"));
                v.setDue(rs.getString("Dueño"));
                v.setMar(rs.getString("Marca"));
                v.setCol(rs.getString("Color"));
                v.setPar(rs.getInt("Parqueadero"));
                v.setEst(rs.getString("estado")); 
                
            }
        } catch (Exception e) {
        }
        return v;
    }
    
    public boolean add(Vehiculo veh) {
       String sql="insert into vehiculo(Placa, apartamento, Dueño, Marca, Color, Parqueadero, estado)values('"+veh.getPla()+"','"+veh.getApa()+"','"+veh.getDue()+"','"+veh.getMar()+"','"+veh.getCol()+"','"+veh.getPar()+"', '-')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
    
    public boolean eliminar(int id) {
        String sql="delete from vehiculo where Id_Vehiculo="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean salio(int id) {
        String sql="UPDATE vehiculo INNER JOIN parqueadero SET vehiculo.estado = 'Salio', parqueadero.disponible = 'Disponible' WHERE vehiculo.Parqueadero = " + id + " and parqueadero.numero = "+id;
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean entro(int id) {
        String sql="update vehiculo set estado='Entro' where Id_Vehiculo="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
