package servlets;

import dao.CompanyDaoImpl;
import dao.PositionDaoImpl;
import com.hwadee.pojo.Company;
import com.hwadee.pojo.Position;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Stu_FindPositionServ")
public class Stu_FindPositionServlet extends HttpServlet {
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

            String type = request.getParameter("type");
            String info = request.getParameter("info");
            System.out.println("!!!"+currentPage);
            System.out.println("!!!"+info);
            System.out.println("!!!"+type);
            if((info==null||info=="") &&currentPage<1){
                type = "企业";
                info = "nodata";
                session.setAttribute("info",info);
                session.setAttribute("type",type);
                currentPage = 1;
            }
            else if((info!=null||info!="")&&currentPage<1){
                session.setAttribute("info",info);
                session.setAttribute("type",type);
                currentPage = 1;
            }
//            闃叉璁块棶绗簩椤垫椂鐢变簬杈撳叆鏍忎负绌鸿�屽鑷存病鏈夋暟鎹�
            info = (String) session.getAttribute("info");
            type = (String) session.getAttribute("type");
            switch (type){
                case "企业":type = "Comname";
                            break;
                case "职位":type = "Composition";
                            break;
                case "技能":type = "Comcondition";
                            break;
                case "薪资":type = "Comsalary";
                            break;
            }

            RequestDispatcher rd = request.getRequestDispatcher("stu_comList.jsp");
            List<Position> list = new ArrayList<Position>();
            PositionDaoImpl pdi = new PositionDaoImpl();
            list = pdi.findPosition(type, info);
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
