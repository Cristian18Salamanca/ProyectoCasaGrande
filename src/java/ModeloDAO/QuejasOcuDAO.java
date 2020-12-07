/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.QuejasOcu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QuejasOcuDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    QuejasOcu q=new QuejasOcu();
    
    public List listar() {
        ArrayList<QuejasOcu>list=new ArrayList<>();
        String sql="select * from quejas_ocultas";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                QuejasOcu qoc=new QuejasOcu();
                qoc.setId(rs.getInt("id_queja"));
                qoc.setCla(rs.getString("clasificacion"));                
                qoc.setCor(rs.getString("correo"));
                qoc.setArg(rs.getString("argumento"));
                
                list.add(qoc);
            }
        } catch (Exception e) {
        }
        return list;
    }
        
    public boolean eliminar(int id) {
        String sql="delete from quejas_ocultas where id_queja="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
