/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.PersonaInha;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonaInhaDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    PersonaInha p=new PersonaInha();
    
    public List listar() {
        ArrayList<PersonaInha>list=new ArrayList<>();
        String sql="select * from personas_inhabilitadas";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                PersonaInha pin=new PersonaInha();
                pin.setId(rs.getInt("id_persona"));
                pin.setApa(rs.getString("apartamento"));                
                pin.setNom(rs.getString("nombres"));
                pin.setApe(rs.getString("apellidos"));
                pin.setNac(rs.getString("nacimiento"));
                pin.setTel(rs.getInt("telefono"));
                
                list.add(pin);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean eliminar(int id) {
        String sql="delete from personas_inhabilitadas where id_persona="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    } 
    
}
