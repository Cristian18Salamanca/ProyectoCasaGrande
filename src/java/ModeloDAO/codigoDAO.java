/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.codigo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class codigoDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    codigo c=new codigo();
    
    public List listar() {
        ArrayList<codigo>list=new ArrayList<>();
        String sql="select * from codigo";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                codigo cod=new codigo();
                cod.setId(rs.getInt("id_cod"));
                cod.setCod(rs.getString("codigo"));    
                list.add(cod);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public boolean add(codigo cod) {
        String sql="insert into codigo(codigo)values('"+cod.getCod()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }
    
    public boolean eliminar(int id) {
        String sql="delete from codigo where id_cod="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
