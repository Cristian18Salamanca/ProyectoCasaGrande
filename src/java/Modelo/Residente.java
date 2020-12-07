/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

public class Residente {
    
    int id;
    String apa;
    String ico;
    String fco;
    String tip;
    String arr;
    String veh;
    
    public Residente(){}

    public Residente(int id, String apa, String ico, String fco, String tip, String arr, String veh) {
        this.id = id;
        this.apa = apa;
        this.ico = ico;
        this.fco = fco;
        this.tip = tip;
        this.arr = arr;
        this.veh = veh;
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

    public String getIco() {
        return ico;
    }

    public void setIco(String ico) {
        this.ico = ico;
    }

    public String getFco() {
        return fco;
    }

    public void setFco(String fco) {
        this.fco = fco;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getArr() {
        return arr;
    }

    public void setArr(String arr) {
        this.arr = arr;
    }

    public String getVeh() {
        return veh;
    }

    public void setVeh(String veh) {
        this.veh = veh;
    }
    
}
