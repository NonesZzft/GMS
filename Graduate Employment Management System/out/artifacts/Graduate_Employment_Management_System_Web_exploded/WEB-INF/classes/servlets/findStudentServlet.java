package servlets;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.studentDaoImpl;
import com.hwadee.pojo.Student;


/**
 * Servlet implementation class findStudentServlet
 */
@WebServlet("/findStudentServlet")
public class findStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	 protected void service(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        int count = 0;// student������
	        int currentPage;// ��ǰҳ��
	        try {
	            //PrintWriter pw=response.getWriter();
	            HttpSession session = request.getSession(true);
	            /*Object name = request.getSession().getAttribute("NameInSession");
	            if (name == null) {
	                request.getRequestDispatcher("login.jsp").forward(request, response);
	            }*/
	            currentPage = Integer.parseInt(request.getParameter("currentPage")
	                    .toString());
	            if (currentPage < 1) {
	                currentPage = 1;
	            }

	            RequestDispatcher rd = request.getRequestDispatcher("studentsList.jsp");
	            List<Student> list = new ArrayList<Student>();
	            studentDaoImpl cdi = new studentDaoImpl();
	            list = cdi.findStudent();
	            count = list.size();
	            session.setAttribute("list",list);

	            request.removeAttribute("currentPage");
	            request.setAttribute("currentPage", currentPage);
	            request.setAttribute("count", count);
	            System.out.println(this.getClass() + "  currentPage="
	                    + currentPage + "count="+count);
	            rd.forward(request, response);

	        } catch (Throwable te) {
	            te.printStackTrace();
	        }
	    }
       
   
}
