package dao;

//������Ľӿں���Ҫ��������
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConnectMySql {

	/**
	 * ������ݿ�����
	 * 
	 * @return ����ֵ�����ӻ��
	 */
	public static Connection getConn() throws Exception {
		Connection conn;
		String connectionUrl;

		// �������ݿ��������д�ڴ˴�,ע����Try catch���鲶������쳣����
		try {
			// passwordҪ����û��ĵ�¼����
			connectionUrl = "jdbc:mysql://127.0.0.1:3306/gms?useUnicode=true&characterEncoding=utf-8&user=root&password=";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(connectionUrl);
			System.out.println("success");
			return conn;
		} catch (Exception e) {
			System.out.println("�����쳣��" + e.getLocalizedMessage());
			if (e.getLocalizedMessage().contains("Communications link failure")) {
				e = new Exception("���ݿ����������ʧ�ܡ�");
				throw e;
			} else {
				throw e;
			}
		}
	}

	/**
	 * ��Ԫ����
	 * 
	 */
	public static void main(String[] args) {
		Connection loginConn;
		PreparedStatement pstmt;
		ResultSet rs;

		try {
			loginConn = ConnectMySql.getConn();
			if (loginConn != null) {
				System.out.println("�������ݿ�ɹ�.");
			} else {
				return;
			}

			// ��ѯ
			pstmt = loginConn
					.prepareStatement("select name,password from login where name= ? and password = ?");
			pstmt.setString(1, "���Ĵ�");
			pstmt.setString(2, "123456");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("��ѯ����¼:" + rs.getString(1) + ","
						+ rs.getString(2));
				return;// return���ڽ���������ִ�У����ڱ�����û�з���ֵ��void�������ԣ�return���治д���ʽ��
			}
			System.err.println("�û������������");

		} catch (Exception e) {
			System.err.println("ERROR!");
		}
	}
}
