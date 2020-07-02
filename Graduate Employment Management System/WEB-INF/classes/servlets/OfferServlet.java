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

import beans.Offer;
import dao.ComOffer;

@WebServlet("/OfferServlet")
public class OfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            int count = 0;
            int currentPage;
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

            List<Offer> list = new ArrayList<Offer>();
            ComOffer cdi = new ComOffer();
            list = cdi.findOffer();
            count = list.size();
            request.removeAttribute("currentPage");
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("count", count);
            request.setAttribute("list",list);
            System.out.println(this.getClass() + "  currentPage=" + currentPage);
            request.getRequestDispatcher("com_offer.jsp").forward(request, response);

        } catch (Throwable te) {
            te.printStackTrace();
        }
    }

}
