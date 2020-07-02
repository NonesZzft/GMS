package dao;

import dao.studentDao;
import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.hwadee.pojo.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class studentDaoImpl implements studentDao {

	public Connection con;
	public String mySql;// 要执锟叫碉拷SQL锟斤拷锟�
	public ResultSet rs;
	public Statement stmt;// 锟斤拷装要执锟叫碉拷SQL锟斤拷锟�
	public PreparedStatement pst;

	@Override
	public Boolean saveStudent(Student student) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean delStudent(String sno) {
		// TODO Auto-generated method stub
		Student student = new Student();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = ConnectMySql.getConn();
			if (con != null) {
				mySql = "delete from student where sno=?";
				pst = con.prepareStatement(mySql);

				pst.setString(1, sno);
				pst.executeUpdate();
				pst.close();
				return true;
			}
			return false;
		} catch (Throwable te) {
			te.printStackTrace();
			return false;
		}

	}

	@Override
	public Boolean updStudent(String sno, String sname, String sex, Date birth, String phone, String college,
			String major, String cno, String email, String extra, String psch, String jsch, String ssch,
			String university, String train, String practice, Integer cetf, Integer cets, String evaluation,
			String intention, String money, String honor, String certif, String letter, String attach,
			String selfreco) {
		// TODO Auto-generated method stub
		Student student = new Student();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = ConnectMySql.getConn();
			if (con != null) {
				mySql = "update student set " + "sname=?, " + "sex=?, " + "birth=?, " + "phone=?, " + "college=?, "
						+ "major=?, " + "cno=?, " + "email=?, " + "extra=?, " + "psch=?, " + "jsch=?, " + "ssch=?, "
						+ "university=?, " + "train=?, " + "practice=?, " + "cetf=?, " + "cets=?, " + "evaluation=?, "
						+ "intention=?," + "money= ?," + "honor=?, " + "certif=?, " + "letter=?, " + "attach=?, "
						+ "selfreco=? " + "where sno=? ";
				System.out.println("mySql : " + mySql);
				pst = con.prepareStatement(mySql);

				pst.setString(26, sno);
				pst.setString(1, sname);
				pst.setString(2, sex);
				Timestamp b = new Timestamp(birth.getTime());
				pst.setTimestamp(3, b);
				pst.setString(4, phone);
				pst.setString(5, college);
				pst.setString(6, major);
				pst.setString(7, cno);
				pst.setString(8, email);
				pst.setString(9, extra);
				pst.setString(10, psch);
				pst.setString(11, jsch);
				pst.setString(12, ssch);
				pst.setString(13, university);
				pst.setString(14, train);
				pst.setString(15, practice);
				pst.setInt(16, cetf);
				pst.setInt(17, cets);
				pst.setString(18, evaluation);
				pst.setString(19, intention);
				pst.setString(20, money);
				pst.setString(21, honor);
				pst.setString(22, certif);
				pst.setString(23, letter);
				pst.setString(24, attach);
				pst.setString(25, selfreco);

				pst.executeUpdate();
				pst.close();
				return true;
			}
			return false;
		} catch (Throwable te) {
			te.printStackTrace();
			return false;
		}

	}

	@Override
	public List findStudent() {
		List<Student> list = new ArrayList<Student>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = ConnectMySql.getConn();
			if (con != null) {
				System.out.println("进入findSudent");
				mySql = "select * from student";
				System.out.println("mySql : " + mySql);
				stmt = con.createStatement();
				rs = stmt.executeQuery(mySql);
				while (rs.next()) {
					Student student = new Student();
					student.setSno(rs.getString("sno"));
					student.setSname(rs.getString("sname"));
					student.setSex(rs.getString("sex"));
					student.setBirth(rs.getDate("birth"));
					student.setPhone(rs.getString("phone"));
					student.setCollege(rs.getString("college"));
					student.setMajor(rs.getString("major"));
					student.setCno(rs.getString("cno"));
					student.setEmail(rs.getString("email"));
					student.setExtra(rs.getString("extra"));
					student.setPsch(rs.getString("psch"));
					student.setJsch(rs.getString("jsch"));
					student.setSsch(rs.getString("ssch"));
					student.setUniversity(rs.getString("university"));
					student.setTrain(rs.getString("train"));
					student.setPractice(rs.getString("practice"));
					student.setCetf(rs.getInt("cetf"));
					student.setCets(rs.getInt("cets"));
					student.setEvaluation(rs.getString("evaluation"));
					student.setIntention(rs.getString("intention"));
					student.setMoney(rs.getString("money"));
					student.setHonor(rs.getString("honor"));
					student.setCertif(rs.getString("certif"));
					student.setLetter(rs.getString("letter"));
					student.setAttach(rs.getString("attach"));
					student.setSelfreco(rs.getString("selfreco"));
					student.setLibrary(rs.getString("library"));
					student.setDormitory(rs.getString("dormitory"));
					student.setInformation(rs.getString("information"));

					list.add(student);
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
	public List ackStudent() {
		List<Student> list = new ArrayList<Student>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = ConnectMySql.getConn();
			if (con != null) {
				System.out.println("进入findSudent");
				mySql = "select * from student";
				System.out.println("mySql : " + mySql);
				stmt = con.createStatement();
				rs = stmt.executeQuery(mySql);
				while (rs.next()) {
					Student student = new Student();
					student.setSno(rs.getString("sno"));
					student.setSname(rs.getString("sname"));
					student.setSex(rs.getString("sex"));
					student.setBirth(rs.getDate("birth"));
					student.setPhone(rs.getString("phone"));
					student.setCollege(rs.getString("college"));
					student.setMajor(rs.getString("major"));
					student.setCno(rs.getString("cno"));
					student.setEmail(rs.getString("email"));
					student.setExtra(rs.getString("extra"));
					student.setPsch(rs.getString("psch"));
					student.setJsch(rs.getString("jsch"));
					student.setSsch(rs.getString("ssch"));
					student.setUniversity(rs.getString("university"));
					student.setTrain(rs.getString("train"));
					student.setPractice(rs.getString("practice"));
					student.setCetf(rs.getInt("cetf"));
					student.setCets(rs.getInt("cets"));
					student.setEvaluation(rs.getString("evaluation"));
					student.setIntention(rs.getString("intention"));
					student.setMoney(rs.getString("money"));
					student.setHonor(rs.getString("honor"));
					student.setCertif(rs.getString("certif"));
					student.setLetter(rs.getString("letter"));
					student.setAttach(rs.getString("attach"));
					student.setSelfreco(rs.getString("selfreco"));

					list.add(student);
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
