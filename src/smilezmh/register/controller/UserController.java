package smilezmh.register.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.el.ELException;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import smilezmh.register.pojo.User;
import smilezmh.register.pojo.UserExample;
import smilezmh.register.service.Register;


@Controller
public class UserController {
	@Autowired
	private Register re;
	@RequestMapping(value="/register")
	public String RegisterController(User user){
		re.userRegister(user);
		return "login";
	}
	@RequestMapping(value="/login")
	public String LoginController(String username1,String password1,Model mod){
		UserExample ue=new UserExample();
		ue.createCriteria().andUsernameEqualTo(username1).andPasswordEqualTo(password1);
		List<User> list=null;
		 list=re.userLogin(ue);
		if(list.size()!=0)
		return 
				"success";
		else 
			
			return "edituser";	
	}
	@RequestMapping(value="/edit")
	public String EditController(String username2,String password2,Model mod){
		User user=new User();
		user.setUsername(username2);
		user.setPassword(password2);
	    re.editUser(user);
	    mod.addAttribute("user", user);
	    mod.addAttribute("word", "修改密码成功！");
	    return "edituser";	
	}


	
}
