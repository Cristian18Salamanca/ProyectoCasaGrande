/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

public class ResidenteInha {
    
    int id;
    String apa;
    String Icon;
    String fcon;
    String tip;
    String arre;
    String veh;
    
    public ResidenteInha() {
    }

    public ResidenteInha(int id, String apa, String Icon, String fcon, String tip, String arre, String veh) {
        this.id = id;
        this.apa = apa;
        this.Icon = Icon;
        this.fcon = fcon;
        this.tip = tip;
        this.arre = arre;
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

    public String getIcon() {
        return Icon;
    }

    public void setIcon(String Icon) {
        this.Icon = Icon;
    }

    public String getFcon() {
        return fcon;
    }

    public void setFcon(String fcon) {
        this.fcon = fcon;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getArre() {
        return arre;
    }

    public void setArre(String arre) {
        this.arre = arre;
    }

    public String getVeh() {
        return veh;
    }

    public void setVeh(String veh) {
        this.veh = veh;
    }
    
}
