package com.hwadee.pojo;

public class Company {
    private String Comid;
    private String Comname;
    private String Comtelephone;
    private String Commail;
    private String Compassword;

    public Company(){

    }

    public Company(String Comid, String Comname, String Comtelephone, String Commail, String Password){
        this.Comid = Comid;
        this.Comname = Comname;
        this.Comtelephone = Comtelephone;
        this.Commail = Commail;
        this.Compassword = Password;
    }

    public String getComid() {
        return Comid;
    }

    public void setComid(String comid) {
        Comid = comid;
    }

    public String getComname() {
        return Comname;
    }

    public void setComname(String comname) {
        Comname = comname;
    }

    public String getComtelephone() {
        return Comtelephone;
    }

    public void setComtelephone(String comtelephone) {
        Comtelephone = comtelephone;
    }

    public String getCommail() {
        return Commail;
    }

    public void setCommail(String commail) {
        Commail = commail;
    }

    public String getCompassword() {
        return Compassword;
    }

    public void setCompassword(String compassword) {
        Compassword = compassword;
    }
}
