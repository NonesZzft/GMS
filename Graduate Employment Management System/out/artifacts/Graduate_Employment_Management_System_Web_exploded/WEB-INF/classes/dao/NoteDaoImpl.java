package dao;

import dao.NoteDao;
import com.hwadee.pojo.Note;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoteDaoImpl implements NoteDao {
    public Connection con;
    public String mySql;
    public ResultSet rs;
    public Statement stmt;
    public PreparedStatement pst;

    public NoteDaoImpl(){

    }
    

    @Override
    public Boolean delNote(String passagenumber) {
        Note note = new Note();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = ConnectMySql.getConn();
            if (con != null) {
                System.out.println("���ݿ����ӳɹ���");
                mySql = "delete from passage where Passagenumber=?";

                PreparedStatement ps = con.prepareStatement(mySql);
                ps.setString(1,passagenumber);
                System.out.println("mySql : " + mySql);
                System.out.println("passagenumber : " + passagenumber);
                ps.executeUpdate();

                ps.close();
                return true;
            }
            return false;
        } catch (Throwable te) {
            te.printStackTrace();
            return false;
        }
    }

    @Override
    // �޸�ʱ��������number�������ύʱΪnull���޷������޸�����
    public Boolean updNote(String passagename, String passagecontext, String passagenumber) {
    	Note note = new Note();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = ConnectMySql.getConn();
            if (con != null) {
                System.out.println("���ݿ����ӳɹ���");
                mySql = "update passage set Passagename = ?, Passagecontext = ? where Passagenumber =?";

                PreparedStatement ps = con.prepareStatement(mySql);
                ps.setString(1,passagename);
                ps.setString(2,passagecontext);
                ps.setString(3,passagenumber);

                System.out.println("passagename : " + passagename);
                System.out.println("passagecontext : " + passagecontext);
                System.out.println("passagenumber : " + passagenumber);
                System.out.println("mySql : " + mySql);
                ps.executeUpdate();

                ps.close();
                return true;
            }
            return false;
        } catch (Throwable te) {
            te.printStackTrace();
            return false;
        }
    }

    @Override
    public List findNote() {
        List<Note> list = new ArrayList<Note>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = ConnectMySql.getConn();
            if (con != null) {
                System.out.println("���ݿ����ӳɹ���");
                mySql = "select * from passage";
                System.out.println("mySql : " + mySql);
                stmt = con.createStatement();
                rs = stmt.executeQuery(mySql);
                while (rs.next()) {
                    System.out.println("����:��");
                    Note note = new Note();
                    note.setPassagename(rs.getString("Passagename"));
                    note.setPassagecontext(rs.getString("Passagecontext"));
                    note.setPassagevariety(rs.getString("Passagevariety"));
                    note.setPassagenumber(rs.getString("Passagenumber"));
                    list.add(note);
                }
                rs.close();
                return list;
            }
            return list;
        } catch (Throwable te) {
            te.printStackTrace();
            return list;
        }
    }

    @Override
    public Note findSpecficNote(String passagenumber) {
    	Note note = new Note();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = ConnectMySql.getConn();
            if (con != null) {
                System.out.println("���ݿ����ӳɹ���");
                mySql = "select * from passage where Passagenumber = '"+passagenumber+"'";
                System.out.println("mySql : " + mySql);
                stmt = con.createStatement();
                rs = stmt.executeQuery(mySql);
                if (rs.next()) {
                	note.setPassagename(rs.getString("Passagename"));
                    note.setPassagecontext(rs.getString("Passagecontext"));
                    note.setPassagevariety(rs.getString("Passagevariety"));
                    note.setPassagenumber(rs.getString("Passagenumber"));
                }
                rs.close();
                return note;
            }
            return note;
        } catch (Throwable te) {
            te.printStackTrace();
            return note;
        }
    }

}
