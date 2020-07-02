package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.composDaoImpl;

@WebServlet("/UpdatePositionServlet")
public class UpdatePositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// PrintWriter pw=response.getWriter();
			HttpSession session = request.getSession(true);
			Object name = request.getSession().getAttribute("NameInSession");
			if (name == null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			// RequestDispatcher rd =
			// request.getRequestDispatcher("/FindCompanyServ?currentPage=0");
			composDaoImpl cdi = new composDaoImpl();
			String Composition = request.getParameter("Composition");
			String Comamount = request.getParameter("Comamount");
			String Comsalary = request.getParameter("Comsalary");
			String Comcondition = request.getParameter("Comcondition");
			String PoComid = request.getParameter("PoComid");

			Boolean result = cdi.updPosition(Composition, Comamount, Comsalary, Comcondition, PoComid);
			System.out.println("result:" + result);
			if (result) {
				session.setAttribute("udpmes", "success");
			} else {
				session.setAttribute("udpmes", "failure");
			}
			response.sendRedirect("FindPositionServlet?currentPage=0");
		} catch (Throwable te) {
			te.printStackTrace();
		}
	}
}
