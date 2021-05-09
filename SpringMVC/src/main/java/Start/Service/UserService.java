package Start.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Start.Dao.UserDao;
import Start.Dao.UserDaolmpl;
import Start.Model.Users;
@Service("userService")
public class UserService {
    private UserDao userDao = new UserDaolmpl();

    public boolean isUsers(String username, String password) {
    	System.out.println("1");
        Users user = userDao.findByUserName(username);
        if (user != null && user.getPassword().equals(password)) {
            return true;
        }
        return false;
    }
 
    public UserDao getUserDao() {
        return userDao;
    }
 
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

	public boolean SignUp(Users us) {
		return userDao.SignUp(us);
	}

	public boolean isUsers(String userName) {
		Users user = userDao.findByUserName(userName);
		 if (user != null) {
	            return true;
	        }
		return false;
	}

	public boolean sendCode(int code, String userName) {
		return userDao.sendCode(code,userName);
		
	}

	public String getNickName(String userName) {
		Users user = userDao.findByUserName(userName);
        if (user != null ) {
            return user.getNickname();
        }
		return null;
	}

	public String getListFriend(String nickName) {
		// TODO Auto-generated method stub
		return userDao.getListFriend(nickName);
	}

	public String LoadMess(String username, String friend) {
		// TODO Auto-generated method stub
		return userDao.LoadMess(username,friend);
	}

	public boolean SendMess(String username, String friend, String content) {
		// TODO Auto-generated method stub
		return userDao.SendMess(username,friend,content);
	}

	public String FindFriend(String name) {
		// TODO Auto-generated method stub
		return userDao.FindFriend(name);
	}

	public boolean addFriend(String username, String name) {
		// TODO Auto-generated method stub
		return userDao.addFriend(username,name);
	}

	public void Unfriend(String username, String name) {
		userDao.Unfriend(username,name);
		
	}


}
