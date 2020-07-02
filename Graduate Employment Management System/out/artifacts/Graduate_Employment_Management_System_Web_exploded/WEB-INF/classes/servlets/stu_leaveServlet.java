package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Cn2Spell;
import dao.ConnectMySql;

/**
 * Servlet implementation class stu_leaveServlet
 */
@WebServlet("/stu_leaveServlet")
public class stu_leaveServlet extends HttpServlet {
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

			String sno = request.getParameter("sno");
			
			pstmt = LoginServletConn
					.prepareStatement("select library, dormitory, information from student where sno=?");
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				request.getSession().setAttribute("library", rs.getString(1));
				request.getSession().setAttribute("dormitory", rs.getString(2));
				request.getSession().setAttribute("information", rs.getString(3));
			}
			rs.close();

			request.getRequestDispatcher("stu_leave.jsp").forward(request, response);
		} catch (Exception e) {
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}
}
