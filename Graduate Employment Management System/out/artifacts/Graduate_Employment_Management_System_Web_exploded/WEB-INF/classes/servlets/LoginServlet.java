package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectMySql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {

	private String jspUserName, jspUserPassword, jspidentifier;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private Connection LoginServletConn;

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

			jspUserName = request.getParameter("name");
			jspUserPassword = request.getParameter("password");
			jspidentifier = request.getParameter("optionsRadios");

			// 查询
			if (jspidentifier.equals("student")) {
				System.out.println(jspidentifier);
				pstmt = LoginServletConn
						.prepareStatement("select sname,password from student where sno= ? and password = ?");
			} else if (jspidentifier.equals("admin")) {
				System.out.println(jspidentifier);
				pstmt = LoginServletConn.prepareStatement(
						"select Managerid,Managerpassword from schoolmanager where Managerid= ? and Managerpassword = ?");
			} else {
				System.out.println(jspidentifier);
				pstmt = LoginServletConn.prepareStatement(
						"select Comname,Compassword,Comid from companyinformation where Comid= ? and Compassword = ?");
			}

			pstmt.setString(1, jspUserName);
			pstmt.setString(2, jspUserPassword);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 向session加入登录成功的用户的用户名。
				request.getSession().setAttribute("NameInSession", rs.getString(1));
				request.getSession().setAttribute("IdentifierInSession", jspidentifier);
				// 重定向到登录成功页面：

				String path = request.getServletContext().getContextPath();
				System.out.println("path : " + path);
				// 改三个端口的跳转（注意路径）
				if (jspidentifier.equals("student")) {
					request.getSession().setAttribute("Sno", jspUserName);
					System.out.println("用户名：" + rs.getString(1) + ",密码：" + rs.getString(2));
					this.getServletContext().getRequestDispatcher("/stuIndex.jsp").forward(request, response);
					return;
				} else if (jspidentifier.equals("admin")) {
					System.out.println("用户名：" + rs.getString(1) + ",密码：" + rs.getString(2));
					this.getServletContext().getRequestDispatcher("/schIndex.jsp").forward(request, response);
					return;
				} else {
					request.getSession().setAttribute("comidInSession", rs.getString(3));
					System.out.println(jspUserName);
					System.out.println("用户名：" + rs.getString(1) + ",密码：" + rs.getString(2));
					this.getServletContext().getRequestDispatcher("/comIndex.jsp").forward(request, response);
					return;
				}
			} else {
				System.out.println("rs.next()=0");
			}
			System.err.println("用户名或密码错误");
			request.getSession().setAttribute("loginError", "用户名或密码错误");// 如果rs.next()的值为false，则没有符合条件的记录
			this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);// 将请求（request）和响应（response）传递给index.jsp
			// ，并跳转到index.jsp
		} catch (Exception e) {
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}
}
