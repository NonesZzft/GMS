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

@WebServlet("/UpOfstaServlet")
public class UpOfstaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            int count = 0;
            int currentPage;
        try {
        	 HttpSession session = request.getSession(true);
        	 RequestDispatcher rd = request.getRequestDispatcher("/OfferServlet?currentPage=0");
        	 ComOffer cdi = new ComOffer();
        	 String offerstate = request.getParameter("state");
	         String offercomid = request.getParameter("comid");
	         String offerstumid = request.getParameter("stuid");
	         String offerposition = request.getParameter("compo");
	         Boolean result = cdi.updoffer(offerstate, offercomid, offerstumid, offerposition);
	         System.out.println("result:"+result);
	            if(result){
	                session.setAttribute("upoffer","success");
	            }
	            else{
	                session.setAttribute("upoffer","failure");
	            }
	            rd.forward(request, response);

        } catch (Throwable te) {
            te.printStackTrace();
        }
    }
}
