package Start.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Start.Model.Login;
import Start.Model.Users;
import Start.Service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 

@Controller
public class SignUpController {
    @RequestMapping(value="/signup", method = RequestMethod.GET)
    public ModelAndView showIndex(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("signup");
        ModelAndView view = new ModelAndView("SignUp/signup");
        Users signupBean = new Users();
        view.addObject("signupBean", signupBean);
        return view;
    }
    UserService userService = new UserService();
    @RequestMapping(value="/signup" , method = RequestMethod.POST)
    public ModelAndView executeSignUp(HttpServletRequest request, HttpServletResponse response,
    		@ModelAttribute("signupBean") Users signupBean) {
    		ModelAndView view = null;
    		String userName=signupBean.getUsername();
    		String pass=signupBean.getPassword();
    		String nickName =signupBean.getNickname();
    		System.out.println("abc");
        	System.out.println(userName+"   "+ pass+"   "+ nickName);
        	Users us = new Users(userName,pass,nickName);
        	if(userService.SignUp(us)) {
        		//thông báo đăng ký thành công
        		//trả về đăng nhập
        		request.setAttribute("message","Thành Công" );
        		view = new ModelAndView("SignUp/signup2");
        	}
        	else {
        		request.setAttribute("message", "Invalid ussename or password!");
                view = new ModelAndView("SignUp/signup2");
        	}
        return view;
    }
}
