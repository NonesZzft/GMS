package servlets;

import javax.servlet.RequestDispatcher;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import dao.studentDaoImpl;
import com.hwadee.pojo.Student;
import java.util.Date;

/**
 * Servlet implementation class UpdatestudetailsServlet
 */
@WebServlet("/UpdatestudetailsServlet")
public class UpdatestudetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void service(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	            //PrintWriter pw=response.getWriter();
	            HttpSession session = request.getSession(true);
	            /*Object name = request.getSession().getAttribute("NameInSession");
	            if (name == null) {
	                request.getRequestDispatcher("login.jsp").forward(request, response);
	            }*/
	            RequestDispatcher rd = request.getRequestDispatcher("/findStudentServlet?currentPage=0");
	            studentDaoImpl cdi = new studentDaoImpl();
	            String sno = request.getParameter("Sno");
	            String sname = request.getParameter("Sname");
	            String sex = request.getParameter("Sex");
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            Date birth = sdf.parse(request.getParameter("Birth"));
	          
	            String phone = request.getParameter("Phone");
	            String college = request.getParameter("College");
	            String major = request.getParameter("Major");
	            String cno = request.getParameter("Cno");
	            String email = request.getParameter("Email");
	            String extra = request.getParameter("Extra");
	            String psch = request.getParameter("Psch");
	            String jsch = request.getParameter("Jsch");
	            String ssch = request.getParameter("Ssch");
	            String university = request.getParameter("University");
	            String train = request.getParameter("Train");
	            String practice = request.getParameter("Practice");
	            Integer cetf =Integer.parseInt(request.getParameter("Cetf"));
	            Integer cets =Integer.parseInt(request.getParameter("Cets"));
	            String evaluation = request.getParameter("Evaluation");
	            String intention = request.getParameter("Intention");
	            String money = request.getParameter("Money");
	            String honor = request.getParameter("Honor");
	            String certif = request.getParameter("Certif");
	            String letter = request.getParameter("Letter");
	            String attach = request.getParameter("Attach");
	            String selfreco = request.getParameter("Selfreco");

	            Boolean result = cdi.updStudent(sno,sname,sex,birth,phone,college,major,cno,
	            								email,extra,psch,jsch,ssch,university,train,
	            								practice,cetf,cets,evaluation,intention,money,honor,
	            								certif,letter,attach,selfreco);
	            System.out.println("result:"+result);
	            if(result){
	                session.setAttribute("udpmes","success");
	            }
	            else{
	                session.setAttribute("udpmes","failure");
	            }
	            rd.forward(request, response);

	        } catch (Throwable te) {
	            te.printStackTrace();
	        }
	    }
    /**
     * @see HttpServlet#HttpServlet()
     */
   
}
