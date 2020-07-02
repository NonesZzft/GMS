package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hwadee.pojo.ComPos;

import dao.composDaoImpl;

@WebServlet("/DelPositionServlet")
public class DelPositionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //PrintWriter pw=response.getWriter();
            HttpSession session = request.getSession(true);
            Object name = request.getSession().getAttribute("NameInSession");
            if (name == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

//            RequestDispatcher rd = request.getRequestDispatcher("/FindCompanyServ?currentPage=0");
            ComPos compos = new ComPos();
            composDaoImpl cdi = new composDaoImpl();
            String composition = request.getParameter("Composition");
            String pocomid = request.getParameter("PoComid");
            Boolean result = cdi.delPosition(composition,pocomid);
            System.out.println("result:"+result);
            if(result){
                session.setAttribute("delmes","success");
            }
            else{
                session.setAttribute("delmes","failure");
            }
//            rd.forward(request, response);
            response.sendRedirect("FindPositionServlet?currentPage=0");
        } catch (Throwable te) {
            te.printStackTrace();
        }
    }
}
