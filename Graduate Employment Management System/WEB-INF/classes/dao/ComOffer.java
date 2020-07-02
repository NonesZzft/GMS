package dao;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import java.sql.*;
import beans.Offer;
import dao.ConnectMySql;
public class ComOffer {
	private Connection Offerconnection;
	private String OfferSQL,Offerstate,Offercomid;
	public ResultSet rs;
	public List<Offer> findOffer() {
		List<Offer> list = new ArrayList<Offer>();
        try {
			OfferSQL = "SELECT * FROM offer";
			Offerconnection = ConnectMySql.getConn(); 
			if (Offerconnection != null) {
                System.out.println("连接数据库成功！");
			PreparedStatement state =Offerconnection.prepareStatement(OfferSQL);
		    rs = state.executeQuery(OfferSQL);
		    while(rs.next()) {
                Offer offer = new Offer();
                offer.setComID(rs.getString("Offercomid"));
                offer.setStuID(rs.getString("Offerstumid"));
                offer.setComPo(rs.getString("Offerposition"));
                offer.setOfState(rs.getString("Offerstate"));
                list.add(offer);
		        }
            rs.close();
            return list;
			}
			return list;
		    }catch (Exception e) {
			 e.printStackTrace();
			 return list;
		}
	}

    public boolean updoffer(String offerstate,String offercomid,String offerstumid,String offerposition) {
    	Offer offer = new Offer();
    	 try {
 			OfferSQL = "update offer set Offerstate=? where Offercomid=? and Offerstumid=? and Offerposition=?";
 			Offerconnection = ConnectMySql.getConn(); 
 			if (Offerconnection != null) {
                System.out.println("连接数据库成功！");
	 			PreparedStatement state =Offerconnection.prepareStatement(OfferSQL);
	 			state.setString(1, offerstate);
	 			state.setString(2, offercomid);
	 			state.setString(3, offerstumid);
	 			state.setString(4, offerposition);
	 		    state.executeUpdate();
	            state.close();
	            return true;
 			}
 			return false;
 		    }catch (Exception e) {
 			 e.printStackTrace();
 			return false;
 		}
    }
}
