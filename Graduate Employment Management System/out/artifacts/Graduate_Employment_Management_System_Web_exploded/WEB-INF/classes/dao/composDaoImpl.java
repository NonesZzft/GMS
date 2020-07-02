package dao;

import dao.composDao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.hwadee.pojo.ComPos;

public class composDaoImpl implements composDao {
	public Connection con;
	public String mySql;
	public ResultSet rs;
	public Statement stmt;
	public PreparedStatement pst;

	@Override
	public Boolean addPosition(String Composition, String Comamount, String Comsalary, String Comcondition,
			String PoComid) {
		ComPos compos = new ComPos();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = ConnectMySql.getConn();
			if (con != null) {
				System.out.println("xxx");
				mySql = "insert into companyposition(Composition,Comamount,Comsalary,Comcondition,PoComid) values (?,?,?,?,?);";

				PreparedStatement ps = con.prepareStatement(mySql);
				ps.setString(1, Composition);
				ps.setString(2, Comamount);
				ps.setString(3, Comsalary);
				ps.setString(4, Comcondition);
				ps.setString(5, PoComid);
				System.out.println("Composition : " + Composition);
				System.out.println("Comamount : " + Comamount);
				System.out.println("Comsalary : " + Comsalary);
				System.out.println("Comcondition : " + Comcondition);
				System.out.println("Pocomid : " + PoComid);
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
	public Boolean delPosition(String Composition, String PoComid) {
		ComPos compos = new ComPos();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = ConnectMySql.getConn();
			if (con != null) {
				mySql = "delete from companyposition where Composition =? and PoComid=? ";
				PreparedStatement ps = con.prepareStatement(mySql);
				ps.setString(1, Composition);
				ps.setString(2, PoComid);
				System.out.println("mySql : " + mySql);
				System.out.println("Composition : " + Composition);
				System.out.println("PoComid : " + PoComid);
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
	public Boolean updPosition(String Composition, String Comamount, String Comsalary, String Comcondition,
			String PoComid) {
		ComPos compos = new ComPos();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = ConnectMySql.getConn();
			if (con != null) {
				mySql = "update companyposition set  Comamount = ?, Comsalary = ?, Comcondition=? where Composition = ?and PoComid =?";
				// 获取PreparedStatement
				PreparedStatement ps = con.prepareStatement(mySql);

				ps.setString(1, Comamount);
				ps.setString(2, Comsalary);
				ps.setString(3, Comcondition);
				ps.setString(4, Composition);
				ps.setString(5, PoComid);

				System.out.println("Comamount : " + Comamount);
				System.out.println("Comsalary : " + Comsalary);
				System.out.println("Comcondition : " + Comcondition);
				System.out.println("Composition : " + Composition);
				System.out.println("PoComid : " + PoComid);
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
	public List findPosition(String id) {
		List<ComPos> list = new ArrayList<ComPos>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = ConnectMySql.getConn();
			if (con != null) {
				mySql = "select * from companyposition where PoComid='" + id + "'";
				System.out.println("mySql : " + mySql);
				stmt = con.createStatement();
				rs = stmt.executeQuery(mySql);
				while (rs.next()) {
					ComPos compos = new ComPos();
					compos.setComposition(rs.getString("Composition"));
					compos.setComamount(rs.getString("Comamount"));
					compos.setComsalary(rs.getString("Comsalary"));
					compos.setComcondition(rs.getString("Comcondition"));
					compos.setPoComid(rs.getString("PoComid"));
					list.add(compos);
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
	public ComPos findSpecficPosition(String Composition, String PoComid) {
		// public ComPos findSpecficPosition(String Composition) {
		ComPos compos = new ComPos();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = ConnectMySql.getConn();
			if (con != null) {
//				mySql = "select * from companyposition where PoComid = '" + PoComid + "' and Composition='"
//						+ Composition + "'";
				mySql = "select * from companyposition where PoComid = '" + PoComid + "'";
				System.out.println("mySql : " + mySql);
				stmt = con.createStatement();
				rs = stmt.executeQuery(mySql);
				if (rs.next()) {
					System.out.println("im in");
					compos.setComposition(rs.getString("Composition"));
					compos.setComamount(rs.getString("Comamount"));
					compos.setComsalary(rs.getString("Comsalary"));
					compos.setComcondition(rs.getString("Comcondition"));
					compos.setPoComid(rs.getString("PoComid"));
					System.out.println(compos.getComamount());
					System.out.println(compos.getComcondition());
					System.out.println(compos.getComposition());
					System.out.println(compos.getComsalary());
					System.out.println(compos.getPoComid());
				}
				rs.close();
				return compos;
			}
			return compos;
		} catch (Throwable te) {
			te.printStackTrace();
			return compos;
		}
	}
}
