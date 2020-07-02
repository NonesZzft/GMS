package dao;

//该引入的接口和类要引用完整
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConnectMySql {

	/**
	 * 获得数据库连接
	 * 
	 * @return 返回值是连接或空
	 */
	public static Connection getConn() throws Exception {
		Connection conn;
		String connectionUrl;

		// 连接数据库操作代码写在此处,注意用Try catch语句块捕获各种异常！。
		try {
			// password要设成用户的登录密码
			connectionUrl = "jdbc:mysql://127.0.0.1:3306/gms?useUnicode=true&characterEncoding=utf-8&user=root&password=";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(connectionUrl);
			System.out.println("success");
			return conn;
		} catch (Exception e) {
			System.out.println("发生异常：" + e.getLocalizedMessage());
			if (e.getLocalizedMessage().contains("Communications link failure")) {
				e = new Exception("数据库服务器连接失败。");
				throw e;
			} else {
				throw e;
			}
		}
	}

	/**
	 * 单元测试
	 * 
	 */
	public static void main(String[] args) {
		Connection loginConn;
		PreparedStatement pstmt;
		ResultSet rs;

		try {
			loginConn = ConnectMySql.getConn();
			if (loginConn != null) {
				System.out.println("连接数据库成功.");
			} else {
				return;
			}

			// 查询
			pstmt = loginConn
					.prepareStatement("select name,password from login where name= ? and password = ?");
			pstmt.setString(1, "张四川");
			pstmt.setString(2, "123456");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("查询到记录:" + rs.getString(1) + ","
						+ rs.getString(2));
				return;// return用于结束方法的执行，由于本方法没有返回值（void），所以，return后面不写表达式。
			}
			System.err.println("用户名或密码错误");

		} catch (Exception e) {
			System.err.println("ERROR!");
		}
	}
}
