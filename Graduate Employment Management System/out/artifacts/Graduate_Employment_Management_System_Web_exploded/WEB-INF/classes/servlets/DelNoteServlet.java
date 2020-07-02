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

@WebServlet("/DelNoteServ")
public class DelNoteServlet extends HttpServlet {
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

            Note note = new Note();
            NoteDaoImpl cdi = new NoteDaoImpl();
            String passagenumber = request.getParameter("id");
            Boolean result = cdi.delNote(passagenumber);
            if(result){
                session.setAttribute("delmes","success");
            }
            else{
                session.setAttribute("delmes","failure");
            }
//            rd.forward(request, response);
            response.sendRedirect("FindNoteServ?currentPage=0");
        } catch (Throwable te) {
            te.printStackTrace();
        }
    }
}
