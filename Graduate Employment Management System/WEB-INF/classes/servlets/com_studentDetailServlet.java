package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectMySql;

/**
 * Servlet implementation class com_studentDetailServlet
 */
@WebServlet("/com_studentDetailServlet")
public class com_studentDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String sname, sex, sno, college, major, cno, phone, email, psch, jsch, ssch, university, train, practice,
			intention, money, honor, certif, evaluation;
	private Date birth;
	private Integer cetf, cets;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private Connection LoginServletConn;
	private beans.Student student;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println(this.getClass() + ".service() called ...");
			LoginServletConn = ConnectMySql.getConn();
			if (ConnectMySql.getConn() == null) {
				System.out.println(" 数据库连接失败 ");
			} else {
				System.out.println(" 数据库连接成功 ");
			}

			sno = request.getParameter("sno");

			// 查询
			System.out.println(sno);
			pstmt = LoginServletConn.prepareStatement("select sname, sex, college, major, cno, "
					+ "phone, email, psch, jsch, ssch, university, " + "train, practice, intention, money, honor, "
					+ "certif, evaluation, birth, cetf, cets from student where sno = ?");

			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();

			System.out.println(rs);
			if (rs.next()) {
				System.out.println(sno);
				request.getSession().setAttribute("zwt_sname", rs.getString(1));
				request.getSession().setAttribute("zwt_sex", rs.getString(2));
				request.getSession().setAttribute("zwt_college", rs.getString(3));
				request.getSession().setAttribute("zwt_major", rs.getString(4));
				request.getSession().setAttribute("zwt_cno", rs.getString(5));
				request.getSession().setAttribute("zwt_phone", rs.getString(6));
				request.getSession().setAttribute("zwt_email", rs.getString(7));
				request.getSession().setAttribute("zwt_psch", rs.getString(8));
				request.getSession().setAttribute("zwt_psch", rs.getString(9));
				request.getSession().setAttribute("zwt_ssch", rs.getString(10));
				request.getSession().setAttribute("zwt_university", rs.getString(11));
				request.getSession().setAttribute("zwt_train", rs.getString(12));
				request.getSession().setAttribute("zwt_practice", rs.getString(13));
				request.getSession().setAttribute("zwt_intention", rs.getString(14));
				request.getSession().setAttribute("zwt_money", rs.getString(15));
				request.getSession().setAttribute("zwt_honor", rs.getString(16));
				request.getSession().setAttribute("zwt_certif", rs.getString(17));
				request.getSession().setAttribute("zwt_evaluation", rs.getString(18));
				request.getSession().setAttribute("zwt_birth", rs.getDate(19));
				request.getSession().setAttribute("zwt_cetf", rs.getInt(20));
				request.getSession().setAttribute("zwt_cets", rs.getInt(21));

				request.getSession().setAttribute("zwt_sno", sno);

				System.out.println(request.getSession().getAttribute("zwt_sname"));

				String path = request.getServletContext().getContextPath();
				System.out.println("path : " + path);

				this.getServletContext().getRequestDispatcher("/com_studentDetail.jsp").forward(request, response);
				;
				return;
			}
			System.err.println("网页间学号传输错误");
			this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		} catch (Exception e) {
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}
}
