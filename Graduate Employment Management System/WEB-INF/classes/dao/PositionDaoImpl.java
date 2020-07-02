package dao;

import dao.positionDao;
import com.hwadee.pojo.Company;
import com.hwadee.pojo.Position;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PositionDaoImpl implements positionDao {
    public Connection con;
    public String mySql;// 要执行的SQL语句
    public ResultSet rs;
    public Statement stmt;// 封装要执行的SQL语句
    public PreparedStatement pst;

    @Override
    public List findPosition(String type, String info) {
        List<Position> list = new ArrayList<Position>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = ConnectMySql.getConn();
            if (con != null) {
                if (!type.equals("Comsalary")) {
                    mySql = "select * from companyposition,companyinformation where companyposition.PoComid = companyinformation.Comid and " +
                            type + " like " + "'%" + info + "%'";
                } else {
                    mySql = "select * from companyposition,companyinformation where companyposition.PoComid = companyinformation.Comid and " +
                            type + " > " + info;
                }
                System.out.println("mySql : " + mySql);
                stmt = con.createStatement();
                rs = stmt.executeQuery(mySql);
                while (rs.next()) {
                    Position position = new Position();
                    position.setComposition(rs.getString("Composition"));
                    position.setComamount(rs.getInt("Comamount"));
                    position.setComcondition(rs.getString("Comcondition"));
                    position.setComsalary(rs.getDouble("Comsalary"));
                    position.setPoComid(rs.getString("PoComid"));
                    position.setPoComname(rs.getString("Comname"));
                    list.add(position);
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
}
