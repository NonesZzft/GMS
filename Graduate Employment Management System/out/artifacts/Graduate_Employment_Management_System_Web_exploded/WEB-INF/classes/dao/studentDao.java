package dao;

import com.hwadee.pojo.Student;

import java.util.Date;
import java.util.List;

public interface studentDao {
    public Boolean saveStudent(Student student);
    public Boolean delStudent(String sno);
    public Boolean updStudent(String sno,String sname,String sex,Date birth,String phone,String college,
    				String major,String cno,String email,String extra,String psch,String jsch,String ssch,
    				String university,String train,String practice,Integer cetf,Integer cets,String evaluation,
    				String intention,String money,String honor,String certif,String letter,String attach,String selfreco);
    public List findStudent();
    public List ackStudent();
	
}
