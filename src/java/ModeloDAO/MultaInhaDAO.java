/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.MultaInha;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MultaInhaDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    MultaInha m=new MultaInha();
    
    public List listar() {
        ArrayList<MultaInha>list=new ArrayList<>();
        String sql="select * from multas_eliminadas";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                MultaInha min=new MultaInha();
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

    public boolean eliminar(int id) {
        String sql="delete from multas_eliminadas where Id_Multa="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    } 
    
}
