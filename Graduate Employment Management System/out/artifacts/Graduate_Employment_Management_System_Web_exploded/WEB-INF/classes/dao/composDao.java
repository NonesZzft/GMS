package dao;

import java.util.List;

import com.hwadee.pojo.ComPos;


public interface composDao {
    public Boolean addPosition(String Composition,String Comamount,String Comsalary,String Comcondition,String PoComid);
    public Boolean delPosition(String Composition,String PoComid);
    public Boolean updPosition(String Composition,String Comamount,String Comsalary,String Comcondition,String PoComid);
    public List findPosition(String id);
    public ComPos findSpecficPosition(String Composition,String PoComid);
    //public ComPos findSpecficPosition(String Composition);
    

}
