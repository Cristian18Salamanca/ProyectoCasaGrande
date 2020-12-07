/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

public class Multa {
    
    int id;
    String pla;
    String veh;
    String fec;
    String pag; 
    
    public Multa() {
    }

    public Multa(int id, String pla, String veh, String fec, String pag) {
        this.id = id;
        this.pla = pla;
        this.veh = veh;
        this.fec = fec;
        this.pag = pag;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPla() {
        return pla;
    }

    public void setPla(String pla) {
        this.pla = pla;
    }

    public String getVeh() {
        return veh;
    }

    public void setVeh(String veh) {
        this.veh = veh;
    }

    public String getFec() {
        return fec;
    }

    public void setFec(String fec) {
        this.fec = fec;
    }

    public String getPag() {
        return pag;
    }

    public void setPag(String pag) {
        this.pag = pag;
    }   
    
}
