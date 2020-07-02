package com.hwadee.pojo;

public class Position {
    private String Composition;
    private int Comamount;
    private double Comsalary;
    private String Comcondition;
    private String PoComid;
    private String PoComname;

    public Position(){

    }

    public Position(String composition, int comamount, double comsalary, String comcondition, String poComid, String poComname) {
        Composition = composition;
        Comamount = comamount;
        Comsalary = comsalary;
        Comcondition = comcondition;
        PoComid = poComid;
        PoComname = poComname;
    }

    public String getComposition() {
        return Composition;
    }

    public void setComposition(String composition) {
        Composition = composition;
    }

    public int getComamount() {
        return Comamount;
    }

    public void setComamount(int comamount) {
        Comamount = comamount;
    }

    public double getComsalary() {
        return Comsalary;
    }

    public void setComsalary(double comsalary) {
        Comsalary = comsalary;
    }

    public String getComcondition() {
        return Comcondition;
    }

    public void setComcondition(String comcondition) {
        Comcondition = comcondition;
    }

    public String getPoComid() {
        return PoComid;
    }

    public void setPoComid(String poComid) {
        PoComid = poComid;
    }

    public String getPoComname() {
        return PoComname;
    }

    public void setPoComname(String poComname) {
        PoComname = poComname;
    }
}
