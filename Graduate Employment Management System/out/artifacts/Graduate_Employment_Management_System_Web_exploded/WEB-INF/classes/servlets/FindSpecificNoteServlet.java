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

@WebServlet("/FindSpecificNoteServ")
public class FindSpecificNoteServlet extends HttpServlet{
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
            RequestDispatcher rd = request.getRequestDispatcher("sch_notelist_update.jsp");
            Note note = new Note();
            NoteDaoImpl cdi = new NoteDaoImpl();
            String passagenumber = request.getParameter("id");
            note = cdi.findSpecficNote(passagenumber);
            session.setAttribute("specific_note",note);

            rd.forward(request, response);

        } catch (Throwable te) {
            te.printStackTrace();
        }
    }
}

