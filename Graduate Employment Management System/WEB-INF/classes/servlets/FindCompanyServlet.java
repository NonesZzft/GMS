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

@WebServlet("/FindCompanyServ")
public class FindCompanyServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int count = 0;// student鐨勬�绘暟
        int currentPage;// 褰撳墠椤靛彿
        try {
            //PrintWriter pw=response.getWriter();
            HttpSession session = request.getSession(true);
            Object name = request.getSession().getAttribute("NameInSession");
            if (name == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            currentPage = Integer.parseInt(request.getParameter("currentPage")
                    .toString());
            if (currentPage < 1) {
                currentPage = 1;
            }

            RequestDispatcher rd = request.getRequestDispatcher("comList.jsp");
            List<Company> list = new ArrayList<Company>();
            CompanyDaoImpl cdi = new CompanyDaoImpl();
            list = cdi.findCompany();
            count = list.size();
            session.setAttribute("list",list);

//            鍒嗛〉浠ｇ爜
            request.removeAttribute("currentPage");
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("count", count);
            System.out.println(this.getClass() + "  currentPage="
                    + currentPage);
            rd.forward(request, response);

        } catch (Throwable te) {
            te.printStackTrace();
        }
    }
}
