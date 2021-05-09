package Start.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Start.Config.MailConfig;
import Start.Model.Users;
import Start.Service.DatabaseService;
 
public class UserDaolmpl implements UserDao { 
	
	DatabaseService DataService= new DatabaseService();
	
    public Users findByUserName(String username) {
    	Users us;
    	Connection conn = DataService.OpenConnection();
    	String SQL = "Select * from Users where Email=?";
        PreparedStatement pstm;
        try {
			pstm = conn.prepareStatement(SQL);
		       pstm.setString(1,username);
		        ResultSet rs = pstm.executeQuery();
		        if(rs.next()){
		        		us= new Users(rs.getString(1),rs.getString(2),rs.getString(3));
		                rs.close();
		                pstm.close();
		                conn.close();
		            return us;
		        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 
        return null;
    }

	public boolean SignUp(Users us) {
		try {
		Connection conn = DataService.OpenConnection();
    	String SQL = "Insert into Users values(?,?,?)";
        PreparedStatement pstm;
        pstm = conn.prepareStatement(SQL);
        pstm.setString(1,us.getUsername());
        pstm.setString(2,us.getPassword());
        pstm.setString(3,us.getNickname());
        pstm.executeUpdate();
        pstm.close();
        conn.close();            
        return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean sendCode(int code, String userName) {
        try {
        	Connection conn = DataService.OpenConnection();
            String SQL = "Update Users set MatKhau=? where Email=?";
            PreparedStatement pstm;
            pstm = conn.prepareStatement(SQL);
            pstm.setString(1,String.valueOf(code));
            pstm.setString(2,userName);
            pstm.executeUpdate();
            pstm.close();
            conn.close();
		 //GuiEmail
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", MailConfig.HOST_NAME);
        props.put("mail.smtp.socketFactory.port", MailConfig.SSL_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", MailConfig.SSL_PORT);

// get Session
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MailConfig.APP_EMAIL, MailConfig.APP_PASSWORD);
            }
        });
// compose message

            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userName));
            message.setSubject("Mat Khau Khoi Phuc Tai Khoan");
            String msg = "Mat Khau Khoi Phuc Tai Khoan:"+code;
            System.out.println(code);
            message.setText(msg);

            // send message
            Transport.send(message);
            return true;
        } catch (Exception e) {
            return false;
        }
	}

	public String getListFriend(String nickName) {
		String list = "";
		try {
			Connection conn = DataService.OpenConnection();
	        String SQL = "Select * from MaKeFriend where User1=?";
	        PreparedStatement pstm;
	        pstm = conn.prepareStatement(SQL);
	        pstm.setString(1,nickName);
	        ResultSet rs = pstm.executeQuery();
	        while(rs.next()){
	           list =list+rs.getString(2)+"///";     
	        }
	        rs.close();
	        pstm.close();
	        conn.close();            
	            return list;
	        }
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return null;
	}

	@Override
	public String LoadMess(String username, String friend) {
		  try {
			  	String kq ="";
			  	Connection conn = DataService.OpenConnection();
	            String SQL = "Select * from Messages where ((UserSend=? AND UserReceive=?) OR (UserReceive=? AND UserSend=?))";
	            PreparedStatement pstm;
	            pstm = conn.prepareStatement(SQL);
	            pstm.setString(1,username);
	            pstm.setString(2,friend);
	            pstm.setString(3,username);
	            pstm.setString(4,friend);
	            ResultSet rs = pstm.executeQuery();
	            while(rs.next()){
	                //qua client tach chuoi theo @@
	                	kq=kq+"@@"+rs.getString(2)+"///"+rs.getString(4);
	            }
	            rs.close();
	            pstm.close();
	            conn.close();
	                return kq;
	        } catch (Exception ex) {
	            return null;
	        }
	}

	@Override
	public boolean SendMess(String username, String friend, String content) {
		try {
			Connection conn = DataService.OpenConnection();
            String SQL = "Insert into Messages values(?,?,?)";
            PreparedStatement pstm;
            pstm = conn.prepareStatement(SQL);
            pstm.setString(1,username);
            pstm.setString(2,friend);
            pstm.setString(3,content);
            pstm.executeUpdate();
            pstm.close();
            conn.close();
            return true;
 
        } catch (Exception ex) {
            return false;
        }
	}

	@Override
	public String FindFriend(String name) {
		String kq ="";
		 try {
				Connection conn = DataService.OpenConnection();
	            String SQL = "select * from Fn_findFriend(?)";
	            PreparedStatement pstm;
	            pstm = conn.prepareStatement(SQL);
	            pstm.setString(1,name);
	            ResultSet rs = pstm.executeQuery();
	            while(rs.next()){
	                //qua client tach chuoi theo @@
	            	  kq = kq+"///"+rs.getString(1);   
	            }
	            rs.close();
	            pstm.close();
	            conn.close();
	            return kq;
	        } catch (Exception ex) {
	            return kq;
	        } 
	}

	@Override
	public boolean addFriend(String username, String name) {
		try {
			Connection conn = DataService.OpenConnection();
            String SQL = "Insert into MakeFriend values(?,?)";
            PreparedStatement pstm;
            pstm = conn.prepareStatement(SQL);
            pstm.setString(1,username);
            pstm.setString(2,name);
            pstm.executeUpdate();
            conn.close();
			//lan 2 de add ban be nguoc lai
            conn = DataService.OpenConnection();
            pstm = conn.prepareStatement(SQL);
            pstm.setString(1,name);
            pstm.setString(2,username);
            pstm.executeUpdate();
            pstm.close();
            conn.close();
            return true;
 
        } catch (Exception ex) {
            return false;
        }        
	}

	@Override
	public void Unfriend(String username, String name) {
		try {
			Connection conn = DataService.OpenConnection();
            String SQL = "DELETE FROM MakeFriend WHERE User1=? and User2=?";
            PreparedStatement pstm;
            pstm = conn.prepareStatement(SQL);
            pstm.setString(1,username);
            pstm.setString(2,name);
            pstm.executeUpdate();
            conn.close();
			//lan 2 de add ban be nguoc lai
            conn = DataService.OpenConnection();
            pstm = conn.prepareStatement(SQL);
            pstm.setString(1,name);
            pstm.setString(2,username);
            pstm.executeUpdate();
            pstm.close();
            conn.close(); 
        } catch (Exception ex) {
        }        
		
	}

}