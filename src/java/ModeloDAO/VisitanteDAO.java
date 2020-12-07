/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Visitante;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VisitanteDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Visitante v=new Visitante();
    
    public List listar() {
        ArrayList<Visitante>list=new ArrayList<>();
        String sql="select * from visitante";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Visitante vis=new Visitante();
                vis.setId(rs.getInt("Id_Visitante"));
                vis.setNom(rs.getString("Nombre"));
                vis.setVeh(rs.getString("Vehiculo"));                
                vis.setPla(rs.getString("Placa"));
                vis.setApa(rs.getString("Apartamento"));
                vis.setFec(rs.getString("Fecha"));
                vis.setHen(rs.getString("Hora_Entrada"));
                vis.setPar(rs.getInt("parqueadero"));
                vis.setMin(rs.getString("minutos"));
                vis.setHsa(rs.getString("Hora_Salida"));
                vis.setEst(rs.getString("estado"));
                list.add(vis);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Visitante list(int id) {
        String sql="select * from visitante where Id_Visitante="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                v.setId(rs.getInt("Id_Visitante"));
                v.setNom(rs.getString("Nombre"));
                v.setVeh(rs.getString("Vehiculo"));                
                v.setPla(rs.getString("Placa"));
                v.setApa(rs.getString("Apartamento"));
                v.setFec(rs.getString("Fecha"));
                v.setHen(rs.getString("Hora_Entrada"));
                v.setPar(rs.getInt("parqueadero"));
                v.setMin(rs.getString("minutos"));
                v.setHsa(rs.getString("Hora_Salida"));
                v.setEst(rs.getString("estado"));
            }
        } catch (Exception e) {
        }
        return v;
    }
    
    public boolean add(Visitante vis) {
       String sql="insert into visitante(Nombre, Vehiculo, Placa, Apartamento, Fecha, Hora_Entrada, Parqueadero, minutos, Hora_Salida, estado)"
               + "values('"+vis.getNom()+"','"+vis.getVeh()+"','"+vis.getPla()+"'"
               + ",'"+vis.getApa()+"','"+vis.getFec()+"','"+vis.getHen()+"','"+vis.getPar()+"','00:00:00','00:00 --','Activo')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
    
    public boolean edit(Visitante vis) {
        String sql="update visitante set Nombre='"+vis.getNom()+"',Vehiculo='"+vis.getVeh()+"',Placa='"+vis.getPla()+"',Apartamento='"+vis.getApa()+"',Fecha='"+vis.getFec()+"',Hora_Entrada='"+vis.getHen()+"',Hora_Salida='"+vis.getHsa()+"' where Id_Visitante="+vis.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean terminado(int par) {
        String sql="UPDATE visitante INNER JOIN parqueadero SET visitante.estado = 'Terminado', parqueadero.disponible = 'Disponible' WHERE visitante.parqueadero = " + par + " and parqueadero.numero = "+par;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean multado(int id) {
        String sql="update visitante set estado='Multado' where Id_Visitante="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
