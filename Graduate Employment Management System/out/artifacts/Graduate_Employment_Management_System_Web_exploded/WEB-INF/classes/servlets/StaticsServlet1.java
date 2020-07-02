package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import beans.Product;
import dao.ConnectMySql;

@WebServlet("/StaticsServlet1")
public class StaticsServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String temp1,sql; 
	private int temp2;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private Connection TestServletConn;
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        List<Product> list = new ArrayList<Product>();
        try {
        	TestServletConn = ConnectMySql.getConn();
			if (ConnectMySql.getConn() == null) {
				System.out.println(" 数据库连接失败 ");
			} else {
				System.out.println(" 数据库连接成功 ");
			}
			sql="SELECT companyposition.Composition,companyposition.Comamount FROM companyposition";
			pstmt = TestServletConn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(" 查询中 ");
			
        //这里把“类别名称”和“销量”作为两个属性封装在一个Product类里，每个Product类的对象都可以看作是一个类别（X轴坐标值）与销量（Y轴坐标值）的集合
			while(rs.next()) {
        list.add(new Product(rs.getString(1), rs.getInt(2)));
			}
        ObjectMapper mapper = new ObjectMapper();    //提供java-json相互转换功能的类
        
        String json = mapper.writeValueAsString(list);    //将list中的对象转换为Json格式的数组
        
//System.out.println(json);
        System.out.println(" _________");
        //将json数据返回给客户端
        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(json);    
        }catch (Exception e) {
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
    }
    }