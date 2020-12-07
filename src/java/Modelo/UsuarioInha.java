/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

public class UsuarioInha {
    
    int id;
    String nom;
    String ape;
    String tel;
    String cor;
    String tip;
    String apa;
    String usu;
    String con;
    
    public UsuarioInha(){}
    

    public UsuarioInha(int id, String nom, String ape, String tel, String cor, String tip, String apa, String usu, String con) {
        this.id = id;
        this.nom = nom;
        this.ape = ape;
        this.tel = tel;
        this.cor = cor;
        this.tip = tip;
        this.apa = apa;
        this.usu = usu;
        this.con = con;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getApa() {
        return apa;
    }

    public void setApa(String apa) {
        this.apa = apa;
    }

    public String getUsu() {
        return usu;
    }

    public void setUsu(String usu) {
        this.usu = usu;
    }

    public String getCon() {
        return con;
    }

    public void setCon(String con) {
        this.con = con;
    }
    
}
