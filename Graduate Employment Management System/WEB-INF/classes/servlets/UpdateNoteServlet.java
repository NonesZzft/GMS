package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NoteDaoImpl;
import com.hwadee.pojo.Note;

@WebServlet("/UpdateNoteServ")
public class UpdateNoteServlet extends HttpServlet{
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

            NoteDaoImpl cdi = new NoteDaoImpl();
            String passagename = request.getParameter("Passagename");
            String passagecontext = request.getParameter("Passagecontext");
            String passagenumber = request.getParameter("Passagenumber");

            Boolean result = cdi.updNote(passagename, passagecontext, passagenumber);
            System.out.println("result:"+result);
            if(result){
                session.setAttribute("udpmes","success");
            }
            else{
                session.setAttribute("udpmes","failure");
            }
//            rd.forward(request, response);
                response.sendRedirect("FindNoteServ?currentPage=0");
        } catch (Throwable te) {
            te.printStackTrace();
        }
    }
}
