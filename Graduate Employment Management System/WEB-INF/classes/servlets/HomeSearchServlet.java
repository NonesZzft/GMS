package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectMySql;

@WebServlet("/HomeSearchServlet")
public class HomeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String jspKeyWord,sql,variety; 
	private int cPage;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private Connection HomeSearchServletConn;
	ArrayList<String> PName = new ArrayList<String>();
	ArrayList<String> PWriter = new ArrayList<String>();
	ArrayList<String> PContext = new ArrayList<String>();
	ArrayList<String> PUpdata = new ArrayList<String>();
	ArrayList<String> PVariety = new ArrayList<String>();
	ArrayList<String> PID = new ArrayList<String>();
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(this.getClass() + ".service() called ...");
		PName.clear();
		PWriter.clear();
		PContext.clear();
		PUpdata.clear();
		PVariety.clear();
		PID.clear();
		int count=0;
		try {
			
			if(!(request.getParameter("currentPage").equals(null))) {
			cPage = Integer.parseInt(request.getParameter("currentPage").toString());
			
			if (cPage < 1) {
				cPage = 1;
			}
			System.out.println(cPage);
			}
			
			
			HomeSearchServletConn = ConnectMySql.getConn();
			if (ConnectMySql.getConn() == null) {
				System.out.println(" 数据库连接失败 ");
			} else {
				System.out.println(" 数据库连接成功 ");
			}
			
			if(request.getParameter("cols")!=null) {
				variety=request.getParameter("cols");
				System.out.println("分类："+variety);
				
				sql = "select * from passage where Passagevariety='"+variety+"'" ;
				System.out.println(sql);
				pstmt = HomeSearchServletConn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				System.out.println(" 跳转中 ");
			}
			
			else 
			{
				if(request.getParameter("showkeycode")!=null) {
			jspKeyWord =request.getParameter("showkeycode");
			
			System.out.println("非空："+jspKeyWord);
			 request.getSession().setAttribute("searchkey", jspKeyWord); 
			}
			else {
			 jspKeyWord =(String)request.getSession().getAttribute("searchkey");
			 System.out.println("空："+jspKeyWord);
			}
			
			sql = "select * from passage where Passagename like '%"+jspKeyWord+"%' or Passagecontext like '%"+jspKeyWord+"%' or Passageoperatorid like '%"+jspKeyWord+"%' or Passagevariety like'%" +jspKeyWord+"%'";
			System.out.println(sql);
			pstmt = HomeSearchServletConn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(" 查询中 ");
			}
			while(rs.next()) {
				PName.add( rs.getString(1));
				PWriter.add( rs.getString(2));
				PContext.add( rs.getString(3));
				PUpdata.add( rs.getString(4));
				PVariety.add( rs.getString(5));
				PID.add( rs.getString(6));
				count++;
			}
			
			System.out.println(" 查询结果： "+count+"条");
			request.getSession().removeAttribute("PNameInSession");
			request.getSession().removeAttribute("PWriterInSession");
			request.getSession().removeAttribute("PContextInSession");
			request.getSession().removeAttribute("PUpdataInSession");
			request.getSession().removeAttribute("PVarietyInSession");
			request.getSession().removeAttribute("PIDInSession");
			request.getSession().removeAttribute("ResultsCountInSession");
			System.out.println(request.getSession().getAttribute("PNameInSession"));
			
			request.setAttribute("currentPage", cPage);
			request.getSession().setAttribute("PNameInSession", PName);
			request.getSession().setAttribute("PWriterInSession", PWriter);
			request.getSession().setAttribute("PContextInSession", PContext);
			request.getSession().setAttribute("PUpdataInSession", PUpdata);
			request.getSession().setAttribute("PVarietyInSession", PVariety);
			request.getSession().setAttribute("PIDInSession", PID);
			request.getSession().setAttribute("ResultsCountInSession", count);
			System.out.println(request.getSession().getAttribute("PNameInSession"));
			this.getServletContext().getRequestDispatcher("/newsList.jsp").forward(request,
					response);
		
		} catch (Exception e) {
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}
}
