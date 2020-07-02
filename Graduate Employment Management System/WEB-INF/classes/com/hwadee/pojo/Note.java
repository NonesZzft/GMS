package com.hwadee.pojo;

public class Note {
    private String Passagename;
    private String Passagecontext;
    private String Passagevariety;
    private String Passagenumber;

    public Note(){

    }

    public Note(String Passagename, String Passagecontext, String Passagevariety, String Passagenumber){
        this.Passagename = Passagename;
        this.Passagecontext = Passagecontext;
        this.Passagevariety = Passagevariety;
        this.Passagenumber = Passagenumber;
    }

    public String getPassagename() {
        return Passagename;
    }

    public void setPassagename(String passagename) {
        Passagename = passagename;
    }

    public String getPassagecontext() {
        return Passagecontext;
    }

    public void setPassagecontext(String passagecontext) {
    	Passagecontext = passagecontext;
    }

    public String getPassagevariety() {
        return Passagevariety;
    }

    public void setPassagevariety(String passagevariety) {
        Passagevariety = passagevariety;
    }

    public String getPassagenumber() {
        return Passagenumber;
    }

    public void setPassagenumber(String passagenumber) {
        Passagenumber = passagenumber;
    }
}
