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

import dao.CompanyDaoImpl;
import com.hwadee.pojo.Company;

@WebServlet("/UpdateComServ")
public class UpdateCompanyServlet extends HttpServlet{
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
            CompanyDaoImpl cdi = new CompanyDaoImpl();
            String id = request.getParameter("Comid");
            String cname = request.getParameter("Comname");
            String tele = request.getParameter("Comtelephone");
            String mail = request.getParameter("Commail");
            String pasword = request.getParameter("Compassword");

            Boolean result = cdi.updCompany(id, pasword, cname,tele, mail);
            System.out.println("result:"+result);
            if(result){
                session.setAttribute("udpmes","success");
            }
            else{
                session.setAttribute("udpmes","failure");
            }
//            rd.forward(request, response);
                response.sendRedirect("FindCompanyServ?currentPage=0");
        } catch (Throwable te) {
            te.printStackTrace();
        }
    }
}
