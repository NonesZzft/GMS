package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.net.URLEncoder;

import com.hwadee.pojo.ComPos;
import dao.composDaoImpl;

@WebServlet("/FindSpecificPositionServlet")
public class FindSpecificPositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// PrintWriter pw=response.getWriter();
			HttpSession session = request.getSession(true);
			System.out.println("11111");
			Object name = request.getSession().getAttribute("NameInSession");
			if (name == null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			RequestDispatcher rd = request.getRequestDispatcher("com_pos_update.jsp");
			System.out.println("22222");
			ComPos compos = new ComPos();
			composDaoImpl cdi = new composDaoImpl();
			String id = request.getParameter("PoComid");
			System.out.println(id);
			String position = URLDecoder.decode(request.getParameter("Composition"), "UTF-8");
			System.out.println(position);
			compos = cdi.findSpecficPosition(position, id);

            System.out.println(compos.getComamount());
            System.out.println(compos.getComcondition());
            System.out.println(compos.getComposition());
            System.out.println(compos.getComsalary());
            System.out.println(compos.getPoComid());
			session.setAttribute("specific_position", compos);
			rd.forward(request, response);

		} catch (Throwable te) {
			te.printStackTrace();
		}
	}
}
