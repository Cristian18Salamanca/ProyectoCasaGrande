/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

public class QuejasOcu {
    
    int id;
    String cla;
    String cor;
    String arg;
    
    public QuejasOcu() {}

    public QuejasOcu(int id, String cla, String cor, String arg) {
        this.id = id;
        this.cla = cla;
        this.cor = cor;
        this.arg = arg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCla() {
        return cla;
    }

    public void setCla(String cla) {
        this.cla = cla;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getArg() {
        return arg;
    }

    public void setArg(String arg) {
        this.arg = arg;
    }
    
}
