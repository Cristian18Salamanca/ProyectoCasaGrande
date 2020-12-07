/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author crist
 */
public class ApartamentoInha {
    
    int id;
    String apa;
    String due;
    int per;
    int mas;
    int tel;
    
    public ApartamentoInha() {
    }

    public ApartamentoInha(int id, String apa, String due, int per, int mas, int tel) {
        this.id = id;
        this.apa = apa;
        this.due = due;
        this.per = per;
        this.mas = mas;
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

    public String getDue() {
        return due;
    }

    public void setDue(String due) {
        this.due = due;
    }

    public int getPer() {
        return per;
    }

    public void setPer(int per) {
        this.per = per;
    }

    public int getMas() {
        return mas;
    }

    public void setMas(int mas) {
        this.mas = mas;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }
    
    
}
