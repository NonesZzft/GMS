package com.hwadee.pojo;

public class ComPos {
	private String Composition;
	private String Comamount;
	private String Comsalary;
	private String Comcondition;
	private String PoComid;
	
	public ComPos(){

	    }
    public ComPos(String Composition, String Comamount, String Comsalary, String Comcondition, String PoComid){
	        this.Composition = Composition;
	        this.Comamount = Comamount;
	        this.Comsalary = Comsalary;
	        this.Comcondition = Comcondition;
	        this.PoComid = PoComid;
	    }

	public String getComposition() {
		return Composition;
	}
	public void setComposition(String composition) {
		Composition = composition;
	}
	public String getComamount() {
		return Comamount;
	}
	public void setComamount(String comamount) {
		Comamount = comamount;
	}
	public String getComsalary() {
		return Comsalary;
	}
	public void setComsalary(String comsalary) {
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
	public void setPoComid(String pocomid) {
		PoComid = pocomid;
	}
	
}
