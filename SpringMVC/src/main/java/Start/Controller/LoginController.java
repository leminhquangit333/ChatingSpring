package Start.Controller;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Start.Model.Login;
import Start.Service.UserService;
 
@Controller
public class LoginController {
	@Autowired
    @RequestMapping(value = {"/","/login"}, method = RequestMethod.GET)
    public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("aloo");
        ModelAndView view = new ModelAndView("Login/login");
        Login loginBean = new Login();
        view.addObject("loginBean", loginBean);
        return view;
    }

    UserService userService = new UserService();
    ArrayList<String> us = new ArrayList<String>();
    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
    public String executeLogin(HttpServletRequest request, HttpServletResponse response,
            @ModelAttribute("loginBean") Login loginBean) {
    		if(loginBean!=null) {
	    		String userName=loginBean.getUsername();
	    		String pass=loginBean.getPassword();
	        	System.out.println(userName+"   "+ pass);
	        	if(userService.isUsers(userName, pass)) {
	        		String nickName = userService.getNickName(userName);
		        		request.setAttribute("loggedInUser",nickName );
		        		request.setAttribute("listFriend",userService.getListFriend(nickName) );
		        		return "Home";
	        		}
	        	else {
		            request.setAttribute("message", "Sai tên đăng nhập hoặc mật khẩu !");
		            return"Login/login";
	        	}
    }
			return null;
}
    @RequestMapping(value = {"/Message"}, method = RequestMethod.GET)
    public String Message(HttpServletRequest request, HttpServletResponse response) {
    	String Name =request.getParameter("btn");
    	System.out.println(Name);
    	String[] friend = Name.split("##");
    	String nickName = friend[1];
		request.setAttribute("loggedInUser",nickName );
		request.setAttribute("listFriend",userService.getListFriend(nickName) );
		request.setAttribute("Friend",friend[0] );
		return "Home";
    }
    
	private boolean findService(String nickName) {
		for(int i=0;i<us.size();i++) {
			if(us.get(i).equals(nickName)) {
				return true;
			}
		}
		return false;
	}
}
