package dao;

import com.hwadee.pojo.Company;

import java.util.List;

public interface companyDao {
    public Boolean addCompany(String id, String password, String name, String tele, String email);
    public Boolean delCompany(String id);
    public Boolean updCompany(String id, String password, String name, String tele, String email);
    public List findCompany();
    public Company findSpecficCompany(String id);
}
