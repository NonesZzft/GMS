package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.composDaoImpl;



@WebServlet("/AddPositionServlet")
public class AddPositionServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
      
            HttpSession session = request.getSession(true);
            Object name = request.getSession().getAttribute("NameInSession");
            if (name == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            composDaoImpl cdi = new composDaoImpl();
            String composition = request.getParameter("Composition");
            String comamount = request.getParameter("Comamount");
            String comsalary = request.getParameter("Comsalary");
            String comcondition = request.getParameter("Comcondition");
            String pocomid = request.getParameter("PoComid");

            Boolean result = cdi.addPosition(composition, comamount, comsalary,comcondition, pocomid);
            System.out.println("result:"+result);
            if(result){
                session.setAttribute("addmes","success");
            }
            else{
                session.setAttribute("addmes","failure");
            }
            response.sendRedirect("FindPositionServlet?currentPage=0");
        } catch (Throwable te) {
            te.printStackTrace();
        }
    }
}
