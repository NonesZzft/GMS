package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Cn2Spell;
import beans.Student;
import dao.ConnectMySql;

/**
 * Servlet implementation class com_studentsListSeparateServlet
 */
@WebServlet("/com_studentsListSeparateServlet")
public class com_studentsListSeparateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String sname, sex, sno, college, major, cno, phone, email, psch, jsch, ssch, university, train, practice,
			intention, money, honor, certif, evaluation;
	private String type, info, spell_info, spell_sname, spell_major, spell_university, spell_practice, spell_certif,
			spell_intention;
	private Date birth;
	private Integer cetf, cets;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private Connection LoginServletConn;
	private beans.Cn2Spell cn2Spell = new Cn2Spell();
	private ArrayList<beans.Student> StudentList;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentList = new ArrayList<beans.Student>();// 用以保存查询结果集中的各条记录
		int count = 0;// student的总数
		int currentPage;// 当前页号
		try {
			System.out.println(this.getClass() + ".service() called ...");
			LoginServletConn = ConnectMySql.getConn();

			if (ConnectMySql.getConn() == null) {
				System.out.println(" 数据库连接失败 ");
			} else {
				System.out.println(" 数据库连接成功 ");
			}
			currentPage = Integer.parseInt(request.getParameter("currentPage").toString());
			if (currentPage < 1) {
				currentPage = 1;
			}
			System.out.println("currentPage" + currentPage);

			type = request.getParameter("type");
			info = request.getParameter("info");

			pstmt = LoginServletConn
					.prepareStatement("select sname, major, university, practice,sno, " + "certif, intention from student");
			rs = pstmt.executeQuery();

			System.out.println("222");
			while (rs.next()) {
				beans.Student bean = new beans.Student();
				bean.setSname(rs.getString("sname"));
				bean.setMajor(rs.getString("major"));
				bean.setUniversity(rs.getString("university"));
				bean.setPractice(rs.getString("practice"));
				bean.setCertif(rs.getString("certif"));
				bean.setIntention(rs.getString("intention"));
				bean.setSno(rs.getString("sno"));
				
				System.out.println("type1" + type);
				System.out.println("info" + info);
				if (type != null)
					System.out.println(cn2Spell.getSpelling(info));

				sname = rs.getString("sname");
				major = rs.getString("major");
				university = rs.getString("university");
				practice = rs.getString("practice");
				certif = rs.getString("certif");
				intention = rs.getString("intention");
				if (type != null)
					spell_info = cn2Spell.getSpelling(info);
				Integer priority = 0;
				System.out.println("type2" + type);
				if (type == null) {
					priority = 4;
					System.out.println("type3" + type);
				} else if (type.equals("姓名")) {
					spell_sname = cn2Spell.getSpelling(sname);
					if (sname.equals(info))
						priority = 5;
					else if (sname.contains(info))
						priority = 4;
					else if (spell_sname.equals(spell_info))
						priority = 3;
					else if (spell_sname.contains(spell_info) && spell_sname.length() >= spell_info.length()/2)
						priority = 2;
					else if (spell_sname.contains(spell_info))
						priority = 1;
					else
						priority = 0;
				} else if (type.equals("专业")) {
					spell_major = cn2Spell.getSpelling(major);
					if (major.equals(info))
						priority = 4;
					else if (major.contains(info))
						priority = 3;
					else if (spell_major.contains(spell_info) && spell_major.length() >= spell_info.length() / 2)
						priority = 2;
					else if (spell_major.contains(spell_info))
						priority = 1;
					else
						priority = 0;
				} else if (type.equals("教育")) {
					spell_university = cn2Spell.getSpelling(university);
					if (university.equals(info))
						priority = 4;
					else if (university.contains(info))
						priority = 3;
					else if (spell_university.contains(spell_info) && spell_university.length() >= spell_info.length() / 2)
						priority = 2;
					else if (spell_university.contains(spell_info))
						priority = 1;
					else
						priority = 0;
				} else if (type.equals("工作")) {
					spell_practice = cn2Spell.getSpelling(practice);
					if (practice.equals(info))
						priority = 4;
					else if (practice.contains(info))
						priority = 3;
					else if (spell_practice.contains(spell_info) && spell_practice.length() >= spell_info.length() / 2)
						priority = 2;
					else if (spell_practice.contains(spell_info))
						priority = 1;
					else
						priority = 0;
				} else if (type.equals("奖项")) {
					spell_certif = cn2Spell.getSpelling(certif);
					if (certif.equals(info))
						priority = 4;
					else if (certif.contains(info))
						priority = 3;
					else if (spell_certif.contains(spell_info) && spell_certif.length() >= spell_info.length() / 2)
						priority = 2;
					else if (spell_certif.contains(spell_info))
						priority = 1;
					else
						priority = 0;
				} else if (type.equals("意向")) {
					spell_intention = cn2Spell.getSpelling(intention);
					if (intention.equals(info))
						priority = 4;
					else if (intention.contains(info))
						priority = 3;
					else if (spell_intention.contains(spell_info) && spell_intention.length() >= spell_info.length() / 2)
						priority = 2;
					else if (spell_intention.contains(spell_info))
						priority = 1;
					else
						priority = 0;
				}

				bean.setPriority(priority);

				if (priority > 0) {
					StudentList.add(bean);
					count++;
				}
			}
			rs.close();

			Collections.sort(StudentList, new SortByPriority());

			request.removeAttribute("zwt_currentPage");
			request.setAttribute("zwt_currentPage", currentPage);
			request.setAttribute("zwt_count", count);
			request.setAttribute("zwt_StudentList", StudentList);
			request.getRequestDispatcher("com_studentsList.jsp").forward(request, response);
		} catch (Exception e) {
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}
}

class SortByPriority implements Comparator {
	public int compare(Object o1, Object o2) {
		Student s1 = (Student) o1;
		Student s2 = (Student) o2;
		if (s1.getPriority() < s2.getPriority())
			return 1;
		return -1;
	}
}
