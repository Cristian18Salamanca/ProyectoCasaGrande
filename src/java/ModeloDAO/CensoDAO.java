/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Censo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CensoDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Censo c=new Censo();
    
    public List listar() {
        ArrayList<Censo>list=new ArrayList<>();
        String sql="select * from censo";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Censo cen=new Censo();
                cen.setMes(rs.getString("mes"));
                cen.setAño(rs.getInt("Año"));
                cen.setPer(rs.getInt("Personas"));
                cen.setNiñ(rs.getInt("Niños"));
                cen.setAdo(rs.getInt("Adolecente"));
                cen.setAdu(rs.getInt("Adultos"));
                cen.setMay(rs.getInt("AdultoMayor"));
                cen.setMas(rs.getInt("Mascotas"));
                cen.setVeh(rs.getInt("vehiculo"));
                
                list.add(cen);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
}
