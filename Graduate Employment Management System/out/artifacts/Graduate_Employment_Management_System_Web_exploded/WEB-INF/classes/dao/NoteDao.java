package dao;

import com.hwadee.pojo.Note;

import java.util.List;

public interface NoteDao {
    //public Boolean addCompany(String id, String password, String name, String tele, String email);
    
    public Boolean delNote(String passagenumber);
    public Boolean updNote(String passagename, String passagecontext, String passagenumber);
    public List findNote();
    public Note findSpecficNote(String passagenumber);
}
