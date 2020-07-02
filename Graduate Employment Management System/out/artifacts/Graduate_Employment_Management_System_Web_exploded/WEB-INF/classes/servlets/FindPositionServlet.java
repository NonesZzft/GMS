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

import com.hwadee.pojo.ComPos;

import dao.composDaoImpl;

@WebServlet("/FindPositionServlet")
public class FindPositionServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int count = 0;
        int currentPage;
        try {
            //PrintWriter pw=response.getWriter();
            HttpSession session = request.getSession(true);
            Object name = request.getSession().getAttribute("NameInSession");
            Object id = request.getSession().getAttribute("comidInSession");
            System.out.println(name);
            if (name == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            currentPage = Integer.parseInt(request.getParameter("currentPage")
                    .toString());
            if (currentPage < 1) {
                currentPage = 1;
            }

            /*RequestDispatcher rd = request.getRequestDispatcher("positionList.jsp");*/
            List<ComPos> list = new ArrayList<ComPos>();
            composDaoImpl cdi = new composDaoImpl();
            
           // String id = request.getParameter("Comid");
            list = cdi.findPosition((String) id);
            count = list.size();
            session.setAttribute("list",list);
            
            request.removeAttribute("currentPage");
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("count", count);
            request.setAttribute("list",list);
            System.out.println(this.getClass() + "  currentPage="
                    + currentPage);
            request.getRequestDispatcher("com_positionList.jsp").forward(request, response);
        } catch (Throwable te) {
            te.printStackTrace();
        }
    }

}