/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.ResidenteInha;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ResidenteInhaDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ResidenteInha r=new ResidenteInha();
    
    public List listar() {
        ArrayList<ResidenteInha>list=new ArrayList<>();
        String sql="select * from residente_inhabilitado";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                ResidenteInha rin=new ResidenteInha();
                rin.setId(rs.getInt("id_residente"));
                rin.setApa(rs.getString("apartamento"));                
                rin.setIcon(rs.getString("inicio_contra"));
                rin.setFcon(rs.getString("fin_contra"));
                rin.setTip(rs.getString("tipo"));
                rin.setArre(rs.getString("arrendado"));
                rin.setVeh(rs.getString("vehiculo"));
                
                list.add(rin);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean eliminar(int id) {
        String sql="delete from residente_inhabilitado where id_residente="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }    
}
