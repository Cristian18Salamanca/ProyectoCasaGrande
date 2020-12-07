/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

public class Visitante {
    
    int id;
    String nom;
    String veh;
    String pla;
    String apa;
    String fec;
    String hen;
    int par;
    String min;
    String hsa;
    String est;
    
    public Visitante() {
    }   

    public Visitante(int id, String nom, String veh, String pla, String apa, String fec, String hen, int par, String min, String hsa, String est) {
        this.id = id;
        this.nom = nom;
        this.veh = veh;
        this.pla = pla;
        this.apa = apa;
        this.fec = fec;
        this.hen = hen;
        this.par = par;
        this.min = min;
        this.hsa = hsa;
        this.est = est;
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

    public String getVeh() {
        return veh;
    }

    public void setVeh(String veh) {
        this.veh = veh;
    }

    public String getPla() {
        return pla;
    }

    public void setPla(String pla) {
        this.pla = pla;
    }

    public String getApa() {
        return apa;
    }

    public void setApa(String apa) {
        this.apa = apa;
    }

    public String getFec() {
        return fec;
    }

    public void setFec(String fec) {
        this.fec = fec;
    }

    public String getHen() {
        return hen;
    }

    public void setHen(String hen) {
        this.hen = hen;
    }

    public int getPar() {
        return par;
    }

    public void setPar(int par) {
        this.par = par;
    }

    public String getMin() {
        return min;
    }

    public void setMin(String min) {
        this.min = min;
    }

    public String getHsa() {
        return hsa;
    }

    public void setHsa(String hsa) {
        this.hsa = hsa;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }
   
}
