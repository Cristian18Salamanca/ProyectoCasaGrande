/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

public class Personas {
    
    int id;
    String apa;
    String nom;
    String ape;
    String nac;
    int eda;
    String rag;
    String tel;
    
    public Personas(){}

    public Personas(int id, String apa, String nom, String ape, String nac, int eda, String rag, String tel) {
        this.id = id;
        this.apa = apa;
        this.nom = nom;
        this.ape = ape;
        this.nac = nac;
        this.eda = eda;
        this.rag = rag;
        this.tel = tel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getApa() {
        return apa;
    }

    public void setApa(String apa) {
        this.apa = apa;
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

    public String getNac() {
        return nac;
    }

    public void setNac(String nac) {
        this.nac = nac;
    }

    public int getEda() {
        return eda;
    }

    public void setEda(int eda) {
        this.eda = eda;
    }

    public String getRag() {
        return rag;
    }

    public void setRag(String rag) {
        this.rag = rag;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}