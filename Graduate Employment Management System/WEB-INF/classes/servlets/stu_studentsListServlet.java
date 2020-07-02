package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectMySql;

/**
 * Servlet implementation class stu_studentsListServlet
 */
@WebServlet("/stu_studentsListServlet")
public class stu_studentsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String sname, sex, sno, college, major, cno, phone, email, psch, jsch, ssch, university, train, practice,
			intention, money, honor, certif, evaluation;
	private int cetf, cets;
	private Date birth;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private Connection LoginServletConn;
	private beans.Student student;
	private boolean save;

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
			
			System.out.println(request.getParameter("save"));
			String temp_save = request.getParameter("save").toString();
			if(temp_save.equals("true")) save = true;
			else save = false;
			System.out.println("save = " + save);
			if (save) {
				sno = request.getParameter("sno");
				System.out.println("sno"+sno);
				sname = request.getParameter("sname");
				System.out.println("sname"+sname);
				sex = request.getParameter("sex");
				college = request.getParameter("college");
				major = request.getParameter("major");
				cno = request.getParameter("cno");
				phone = request.getParameter("phone");
				email = request.getParameter("email");
				psch = request.getParameter("psch");
				jsch = request.getParameter("jsch");
				ssch = request.getParameter("ssch");
				university = request.getParameter("university");
				train = request.getParameter("train");
				practice = request.getParameter("practice");
				intention = request.getParameter("intention");
				money = request.getParameter("money");
				honor = request.getParameter("honor");
				certif = request.getParameter("certif");
				evaluation = request.getParameter("evaluation");
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date birth = sdf.parse(request.getParameter("birth").toString());
				java.sql.Date sqlDate=new java.sql.Date(birth.getTime());
				
				cetf = Integer.valueOf(request.getParameter("cetf")).intValue();
				cets = Integer.valueOf(request.getParameter("cets")).intValue();
				System.out.println("-----0");
//				String sql = "UPDATE student SET sname=?, sex=?, college=?, major=?, cno=?, "
//						+ "phone=?, email=?, psch=?, jsch=?, ssch=?, university=?, train=?, practice=?, intention=?, money=?, honor=?, "
//						+ "certif=?, evaluation=?, birth=?, cetf=?, cets=? WHERE sno=?";
				PreparedStatement ps = LoginServletConn.prepareStatement("UPDATE student SET sname=?, sex=?, college=?, major=?, cno=?, "
						+ "phone=?, email=?, psch=?, jsch=?, ssch=?, university=?, train=?, practice=?, intention=?, money=?, honor=?, "
						+ "certif=?, evaluation=?, birth=?, cetf=?, cets=? WHERE sno=?");
				System.out.println("-----1");
				ps.setString(1,sname);
				ps.setString(2,sex);
				ps.setString(3,college);
				ps.setString(4,major);
				ps.setString(5,cno);
				ps.setString(6,phone);
				ps.setString(7,email);
				ps.setString(8,psch);
				ps.setString(9,jsch);
				ps.setString(10,ssch);
				ps.setString(11,university);
				ps.setString(12,train);
				ps.setString(13,practice);
				ps.setString(14,intention);
				ps.setString(15,money);
				ps.setString(16,honor);
				ps.setString(17,certif);
				ps.setString(18,evaluation);
				ps.setDate(19,sqlDate);
				ps.setInt(20,cetf);
				ps.setInt(21,cets);
				
				ps.setString(22,sno);
				System.out.println("-------------2");
				//rs = ps.executeQuery();
				System.out.println("更新了  " + ps.executeUpdate() + " 条记录");
				System.out.println("-------3");
			}


			sno = request.getParameter("sno");

			// 查询
			System.out.println(sno);
			pstmt = LoginServletConn.prepareStatement("select sname, sex, college, major, cno, "
					+ "phone, email, psch, jsch, ssch, university, train, practice, intention, money, honor, "
					+ "certif, evaluation, birth, cetf, cets from student where sno = ?");

			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();

			System.out.println(rs);
			if (rs.next()) {
				System.out.println("rs-sno:"+sno);
				request.getSession().setAttribute("zwt_sname", rs.getString(1));
				request.getSession().setAttribute("zwt_sex", rs.getString(2));
				request.getSession().setAttribute("zwt_college", rs.getString(3));
				request.getSession().setAttribute("zwt_major", rs.getString(4));
				request.getSession().setAttribute("zwt_cno", rs.getString(5));
				request.getSession().setAttribute("zwt_phone", rs.getString(6));
				request.getSession().setAttribute("zwt_email", rs.getString(7));
				request.getSession().setAttribute("zwt_psch", rs.getString(8));
				request.getSession().setAttribute("zwt_jsch", rs.getString(9));
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
				request.getSession().setAttribute("zwt_cetf", rs.getString(20));
				request.getSession().setAttribute("zwt_cets", rs.getString(21));

				request.getSession().setAttribute("zwt_sno", sno);

				System.out.println(request.getSession().getAttribute("zwt_sname"));

				String path = request.getServletContext().getContextPath();
				System.out.println("path : " + path);

				this.getServletContext().getRequestDispatcher("/stu_studentsList.jsp").forward(request, response);
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
