package Start.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
public class ForgotpasswordController {
	@RequestMapping("/forgotpassword")
	public String fogot() {
		return "Login/Forgotpassword/forgotpassword";
		//xài thư viện javamail gửi mail bằng mail config
	}
	@Autowired
    @RequestMapping(value = {"/forgotpassword"}, method = RequestMethod.GET)
    public ModelAndView showForgot(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("Login/Forgotpassword/forgotpassword");
        return view;
    }

    UserService userService = new UserService();
    int code =-1;
    @RequestMapping(value = {"/forgotpassword"}, method = RequestMethod.POST)
    public ModelAndView executeForgot(HttpServletRequest request, HttpServletResponse response) {
    	//lay du lieu tu thang name ten la Email trong form post
    	String userName =request.getParameter("Email");
    	System.out.println(userName);
    	ModelAndView view = null;
	        if(userService.isUsers(userName)) {
	        	//gui code quen mk
	        		code=(int) (Math.random()*1000000);
	        		if(userService.sendCode(code,userName)) {
	        			System.out.println("code");
	            			view = new ModelAndView("Login/Forgotpassword/forgotpassword2");
	        		}
    	        	else {
    		            request.setAttribute("message", "Invalid ussename or password!");
    		            view = new ModelAndView("Login/Forgotpassword/forgotpassword");
    		        	}
	        }
        return view;
    }
}
