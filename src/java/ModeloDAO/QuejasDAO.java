/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Quejas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QuejasDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Quejas q=new Quejas();
    
    public List listar() {
        ArrayList<Quejas>list=new ArrayList<>();
        String sql="select * from quejas";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Quejas que=new Quejas();
                que.setId(rs.getInt("id_queja"));
                que.setCla(rs.getString("clasificacion"));                
                que.setCor(rs.getString("correo"));
                que.setArg(rs.getString("argumento"));
                
                list.add(que);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public boolean add(Quejas que) {
        String sql="insert into quejas(clasificacion, correo, argumento)values('"+que.getCla()+"', '"+que.getCor()+"', '"+que.getArg()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
        
    public boolean eliminar(int id) {
        String sql="delete from quejas where id_queja="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
