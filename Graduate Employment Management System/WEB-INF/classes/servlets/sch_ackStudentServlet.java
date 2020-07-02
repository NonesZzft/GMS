package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hwadee.pojo.Student;

import dao.ComOffer;
import dao.ConnectMySql;
import dao.studentDaoImpl;

/**
 * Servlet implementation class sch_ackStudentServlet
 */
@WebServlet("/sch_ackStudentServlet")
public class sch_ackStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println(this.getClass() + ".service() called ...");
			Connection LoginServletConn = ConnectMySql.getConn();

			if (ConnectMySql.getConn() == null) {
				System.out.println(" 数据库连接失败 ");
			} else {
				System.out.println(" 数据库连接成功 ");
			}

			String str = request.getParameter("i");
			int i = Integer.parseInt(str);
			String library = request.getParameter("library");
			String dormitory = request.getParameter("dormitory");
			String information = request.getParameter("information");
			// String sname = request.getParameter("sname");
			// String sex = request.getParameter("sex");
			String sno = request.getParameter("sno");
			// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// java.util.Date birth = sdf.parse(request.getParameter("birth").toString());
			// java.sql.Date sqlDate=new java.sql.Date(birth.getTime());
			// String college = request.getParameter("college");
			// String major = request.getParameter("major");
			// String cetf = request.getParameter("cetf");
			// String cets = request.getParameter("cets");
			// String cno = request.getParameter("cno");
			// String phone = request.getParameter("phone");
			// String extra = request.getParameter("extra");
			// String psch = request.getParameter("psch");
			// String jsch = request.getParameter("jsch");
			// String ssch = request.getParameter("ssch");
			// String university = request.getParameter("university");
			// String train = request.getParameter("train");
			// String practice = request.getParameter("practice");
			// String intention = request.getParameter("intention");
			// String money = request.getParameter("money");
			// String honor = request.getParameter("honor");
			// String certif = request.getParameter("certif");

			HttpSession session = request.getSession(true);
			RequestDispatcher rd = request.getRequestDispatcher("sch_studetails.jsp?i=" + i);
			List<Student> list = new ArrayList<Student>();
			studentDaoImpl cdi = new studentDaoImpl();
			list = cdi.findStudent();
			session.setAttribute("list", list);

			System.out.println("library=" + library);
			System.out.println("dormitory=" + dormitory);
			System.out.println("information=" + information);

			String branch;
			PreparedStatement pstmt;
			if (library!=null && library.equals("1")) {
				branch = "library";
				list.get(i).setLibrary("1");
				pstmt = LoginServletConn.prepareStatement("update student set library=? where sno=?");
			} else if (dormitory!=null && dormitory.equals("1")) {
				branch = "dormitory";
				list.get(i).setDormitory("1");
				pstmt = LoginServletConn.prepareStatement("UPDATE student SET dormitory=? WHERE sno=?");
			} else if (information!=null && information.equals("1")) {
				branch = "information";
				list.get(i).setInformation("1");
				pstmt = LoginServletConn.prepareStatement("update student set information=? where sno=?");
			} else {
				branch = "else";
				pstmt = LoginServletConn.prepareStatement("update student set information=? where sno=?");
			}
			pstmt.setString(1, "1");
			pstmt.setString(2, sno);
			System.out.println("branch="+branch);
			System.out.println("sno="+sno);
			System.out.println("更新了  " + pstmt.executeUpdate() + " 条记录");
			rd.forward(request, response);

		} catch (Throwable te) {
			te.printStackTrace();
		}
	}
}
