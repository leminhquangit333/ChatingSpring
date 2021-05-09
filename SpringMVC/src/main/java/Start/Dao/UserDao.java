package Start.Dao;


import Start.Model.Users;
 
public interface UserDao {
 public Users findByUserName(String username);
public boolean SignUp(Users us);
public boolean sendCode(int code, String userName);
public String getListFriend(String nickName);
public String LoadMess(String username, String friend);
public boolean SendMess(String username, String friend, String content);
public String FindFriend(String name);
public boolean addFriend(String username, String name);
public void Unfriend(String username, String name);

}
