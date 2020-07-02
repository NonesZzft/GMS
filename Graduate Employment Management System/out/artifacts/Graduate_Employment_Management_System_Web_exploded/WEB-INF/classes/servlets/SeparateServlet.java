package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;
import java.util.*;

import beans.StuOffer;
import dao.ConnectMySql;

/** 分页 */
@SuppressWarnings("serial")
@WebServlet("/separateServlet")
public class SeparateServlet extends HttpServlet {

	private Connection separateServletConn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private ArrayList<beans.StuOffer> StudentList;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(this.getClass() + ".service() called...");
		StudentList = new ArrayList<beans.StuOffer>();// 用以保存查询结果集中的各条记录
		int count = 0;// student的总数
		int currentPage;// 当前页号
		try {
			String name = request.getSession().getAttribute("NameInSession").toString();
			if (name == null) {
				throw new Exception("用户尚未登录.");
			}
			System.out.println("NameInSession=" + name);

			currentPage = Integer.parseInt(request.getParameter("currentPage").toString());
			if (currentPage < 1) {
				currentPage = 1;
			}
			separateServletConn = ConnectMySql.getConn();

			/* sId是字符串型，把它当做数值来排，以避免10排在2前面 */
			System.out.println("NameInSession2=" + name);
			// 匹配信息
			stmt = separateServletConn
					.prepareStatement("select Offerstate,Offercomid,Offerstumid,Offerposition from offer,student where sname = ? and sno=Offerstumid");
			stmt.setString(1, name);
			System.out.println("NameInSession3=" + name);
			// stmt.setString(1,String.valueof(name));
			rs = stmt.executeQuery();
			System.out.println("NameInSession4=" + name);
			while (rs.next()) {
				beans.StuOffer bean = new beans.StuOffer();
				System.out.println("1");
				System.out.println(rs.getString("Offercomid"));
				bean.setOffercomid(rs.getString("Offercomid"));
				System.out.println("2");
				bean.setOfferstumid(rs.getString("Offerstumid"));
				System.out.println("3");
				bean.setOfferposition(rs.getString("Offerposition"));
				System.out.println("4");
				bean.setOfferstate(rs.getString("Offerstate"));
				System.out.println("5");
				StudentList.add(bean);
				System.out.println("6");
				count++;
			}
			rs.close();
			System.out.println("NameInSession5=" + name);
			request.removeAttribute("currentPage");
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("count", count);
			request.setAttribute("StudentList", StudentList);
			System.out.println(this.getClass() + "  currentPage=" + currentPage);
			request.getRequestDispatcher("stu_offer.jsp").forward(request, response);
		} catch (Exception e) {
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}
