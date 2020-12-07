/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.ApartamentoInha;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ApartamentoInhaDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ApartamentoInha a=new ApartamentoInha();
    
    public List listar() {
        ArrayList<ApartamentoInha>list=new ArrayList<>();
        String sql="select * from apartamento_inhabilitado";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                ApartamentoInha ain=new ApartamentoInha();
                ain.setId(rs.getInt("Id_Apartamento"));
                ain.setApa(rs.getString("Apartamento"));                
                ain.setDue(rs.getString("Dueño"));
                ain.setPer(rs.getInt("Personas"));
                ain.setMas(rs.getInt("Mascotas"));
                ain.setTel(rs.getInt("Telefono"));
                
                list.add(ain);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public boolean eliminar(int id) {
        String sql="delete from apartamento_inhabilitado where Id_Apartamento="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
