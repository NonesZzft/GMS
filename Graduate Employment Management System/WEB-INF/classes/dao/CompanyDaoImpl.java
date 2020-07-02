package dao;

import dao.companyDao;
import com.hwadee.pojo.Company;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompanyDaoImpl implements companyDao {
    public Connection con;
    public String mySql;// 要执行的SQL语句
    public ResultSet rs;
    public Statement stmt;// 封装要执行的SQL语句
    public PreparedStatement pst;

    @Override
    public Boolean addCompany(String id, String password, String name, String tele, String email) {
        Company company = new Company();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = ConnectMySql.getConn();
            if (con != null) {
                mySql = "insert into companyinformation(Comid, Compassword, Comtelephone, Commail, Comname) values (?,?,?,?,?);";
                // 获取PreparedStatement
                PreparedStatement ps = con.prepareStatement(mySql);
                ps.setString(1, id);
                ps.setString(2, password);
                ps.setString(3, tele);
                ps.setString(4, email);
                ps.setString(5, name);
                System.out.println("password : " + password);
                System.out.println("name : " + name);
                System.out.println("email : " + email);
                System.out.println("tele : " + tele);
                System.out.println("mySql : " + mySql);
                ps.executeUpdate();

                ps.close();
                return true;
            }
            return false;
        } catch (Throwable te) {
            te.printStackTrace();
            return false;
        }
    }

    @Override
    public Boolean delCompany(String id) {
        Company company = new Company();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = ConnectMySql.getConn();
            if (con != null) {
                mySql = "delete from companyinformation where Comid =?";
                PreparedStatement ps = con.prepareStatement(mySql);
                ps.setString(1,id);
                System.out.println("mySql : " + mySql);
                System.out.println("id : " + id);
                ps.executeUpdate();

                ps.close();
                return true;
            }
            return false;
        } catch (Throwable te) {
            te.printStackTrace();
            return false;
        }
    }

    @Override
    public Boolean updCompany(String id, String password, String name, String tele, String email) {
        Company company = new Company();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = ConnectMySql.getConn();
            if (con != null) {
                mySql = "update companyinformation set Compassword = ?, Comname = ?, Commail = ?, Comtelephone=? where Comid =?";
                PreparedStatement ps = con.prepareStatement(mySql);
                ps.setString(1,password);
                ps.setString(2, name);
                ps.setString(3, email);
                ps.setString(4,tele);
                ps.setString(5,id);
                System.out.println("password : " + password);
                System.out.println("name : " + name);
                System.out.println("email : " + email);
                System.out.println("tele : " + tele);
                System.out.println("mySql : " + mySql);
                ps.executeUpdate();

                ps.close();
                return true;
            }
            return false;
        } catch (Throwable te) {
            te.printStackTrace();
            return false;
        }
    }

    @Override
    public List findCompany() {
        List<Company> list = new ArrayList<Company>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = ConnectMySql.getConn();
            if (con != null) {
                mySql = "select * from companyinformation";
                System.out.println("mySql : " + mySql);
                stmt = con.createStatement();
                rs = stmt.executeQuery(mySql);
                while (rs.next()) {
                    Company company = new Company();
                    company.setComid(rs.getString("Comid"));
                    company.setComtelephone(rs.getString("Comtelephone"));
                    company.setCommail(rs.getString("Commail"));
                    company.setComname(rs.getString("Comname"));
                    list.add(company);
                }
                rs.close();
                return list;
            }
            return list;
        } catch (Throwable te) {
            te.printStackTrace();
            return list;
        }
    }

    @Override
    public Company findSpecficCompany(String id) {
        Company company = new Company();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = ConnectMySql.getConn();
            if (con != null) {
                mySql = "select * from companyinformation where Comid = '"+id+"'";
                System.out.println("mySql : " + mySql);
                stmt = con.createStatement();
                rs = stmt.executeQuery(mySql);
                if (rs.next()) {
                    company.setComid(rs.getString("Comid"));
                    company.setComtelephone(rs.getString("Comtelephone"));
                    company.setCommail(rs.getString("Commail"));
                    company.setComname(rs.getString("Comname"));
                    company.setCompassword(rs.getString("Compassword"));
                }
                rs.close();
                return company;
            }
            return company;
        } catch (Throwable te) {
            te.printStackTrace();
            return company;
        }
    }
}
