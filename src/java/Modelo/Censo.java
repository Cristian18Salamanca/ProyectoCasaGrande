/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

public class Censo {
    
    String mes;
    int año;
    int per;
    int niñ;
    int ado;
    int adu;
    int may;
    int mas;
    int veh;
    
    public Censo() {}

    public Censo(String mes, int año, int per, int niñ, int ado, int adu, int may, int mas, int veh) {
        this.mes = mes;
        this.año = año;
        this.per = per;
        this.niñ = niñ;
        this.ado = ado;
        this.adu = adu;
        this.may = may;
        this.mas = mas;
        this.veh = veh;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

    public int getPer() {
        return per;
    }

    public void setPer(int per) {
        this.per = per;
    }

    public int getNiñ() {
        return niñ;
    }

    public void setNiñ(int niñ) {
        this.niñ = niñ;
    }

    public int getAdo() {
        return ado;
    }

    public void setAdo(int ado) {
        this.ado = ado;
    }

    public int getAdu() {
        return adu;
    }

    public void setAdu(int adu) {
        this.adu = adu;
    }

    public int getMay() {
        return may;
    }

    public void setMay(int may) {
        this.may = may;
    }

    public int getMas() {
        return mas;
    }

    public void setMas(int mas) {
        this.mas = mas;
    }

    public int getVeh() {
        return veh;
    }

    public void setVeh(int veh) {
        this.veh = veh;
    }
    
}
