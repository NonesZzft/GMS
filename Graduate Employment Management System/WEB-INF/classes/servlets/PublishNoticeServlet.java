package servlets;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectMySql;

@WebServlet("/PublishNoticeServlet")
public class PublishNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection Noticeconnection;
	private String Passagename,Passageoperatorid,Passagecontext,Passagevariety,SQL;
	private Timestamp Passagaedate;
	private long passagenumber;
	private int Passagenumber;
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			Passagename = request.getParameter("Passagename");
			Passagecontext = request.getParameter("Passagecontext");
			request.getSession().setAttribute("NameInSession", "root");
			Passageoperatorid =request.getSession().getAttribute("NameInSession").toString();
			Passagevariety =request.getParameter("Passagevariety");
			Passagaedate = new Timestamp(System.currentTimeMillis()); 
			passagenumber = System.currentTimeMillis()/1000;
			Passagenumber = new Long(passagenumber).intValue();
			SQL = "insert into passage(Passagename,Passageoperatorid,Passagecontext,Passagaedate,Passagevariety,Passagenumber) values('"+Passagename+"','"+Passageoperatorid+"','"+Passagecontext+"','"+Passagaedate+"','"+Passagevariety+"','"+Passagenumber+"')";
		    Noticeconnection = ConnectMySql.getConn(); 
			Statement state =Noticeconnection.createStatement();
		    int flag = state.executeUpdate(SQL);
		    if(flag != 0)
		    {
		    	 System.out.println("发布成功！");
		    }
		    else
		    {
		    	 System.out.println("发布失败！");
		    }
		    state.close();
		    this.getServletContext().getRequestDispatcher("/sch_grids.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
