/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.VehiculoInha;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VehiculoInhaDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    VehiculoInha v=new VehiculoInha();
    
    public List listar() {
        ArrayList<VehiculoInha>list=new ArrayList<>();
        String sql="select * from vehiculos_inhabilitados";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                VehiculoInha vin=new VehiculoInha();
                vin.setId(rs.getInt("Id_Vehiculo"));
                vin.setPla(rs.getString("Placa"));
                vin.setApa(rs.getString("apartamento"));                
                vin.setDue(rs.getString("Dueño"));
                vin.setMar(rs.getString("Marca"));
                vin.setCol(rs.getString("Color"));
                vin.setPar(rs.getInt("Parqueadero"));
                vin.setEst(rs.getString("estado"));
                
                list.add(vin);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public boolean eliminar(int id) {
        String sql="delete from vehiculos_inhabilitados where Id_Vehiculo="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
