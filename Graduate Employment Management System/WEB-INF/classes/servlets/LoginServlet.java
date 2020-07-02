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
				System.out.println(" ���ݿ�����ʧ�� ");
			} else {
				System.out.println(" ���ݿ����ӳɹ� ");
			}

			jspUserName = request.getParameter("name");
			jspUserPassword = request.getParameter("password");
			jspidentifier = request.getParameter("optionsRadios");

			// ��ѯ
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
				// ��session�����¼�ɹ����û����û�����
				request.getSession().setAttribute("NameInSession", rs.getString(1));
				request.getSession().setAttribute("IdentifierInSession", jspidentifier);
				// �ض��򵽵�¼�ɹ�ҳ�棺

				String path = request.getServletContext().getContextPath();
				System.out.println("path : " + path);
				// �������˿ڵ���ת��ע��·����
				if (jspidentifier.equals("student")) {
					request.getSession().setAttribute("Sno", jspUserName);
					System.out.println("�û�����" + rs.getString(1) + ",���룺" + rs.getString(2));
					this.getServletContext().getRequestDispatcher("/stuIndex.jsp").forward(request, response);
					return;
				} else if (jspidentifier.equals("admin")) {
					System.out.println("�û�����" + rs.getString(1) + ",���룺" + rs.getString(2));
					this.getServletContext().getRequestDispatcher("/schIndex.jsp").forward(request, response);
					return;
				} else {
					request.getSession().setAttribute("comidInSession", rs.getString(3));
					System.out.println(jspUserName);
					System.out.println("�û�����" + rs.getString(1) + ",���룺" + rs.getString(2));
					this.getServletContext().getRequestDispatcher("/comIndex.jsp").forward(request, response);
					return;
				}
			} else {
				System.out.println("rs.next()=0");
			}
			System.err.println("�û������������");
			request.getSession().setAttribute("loginError", "�û������������");// ���rs.next()��ֵΪfalse����û�з��������ļ�¼
			this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);// ������request������Ӧ��response�����ݸ�index.jsp
			// ������ת��index.jsp
		} catch (Exception e) {
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}
}
