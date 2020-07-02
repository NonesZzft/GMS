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
 * Servlet implementation class DeleteStudentServlet
 */
@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
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
            
            Boolean result = cdi.delStudent(sno);
            		System.out.println("result:"+result);
            			if(result){
            				session.setAttribute("delmes","success");
            			}
            			else{
            				session.setAttribute("delmes","failure");
            			}
            
            rd.forward(request, response);
        }catch (Throwable te) {
            te.printStackTrace();
        }
    }

   
	

}
