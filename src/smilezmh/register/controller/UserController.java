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
	List<User> list=null;
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
		if(username1==null){
			username1="noexit";
		}
		if(password1==null){
			password1="12";
		}
		ue.createCriteria().andUsernameEqualTo(username1).andPasswordEqualTo(password1);
		//List<User> list=null;
		 list=re.userLogin(ue);
		if(list.size()!=0)
		return 
				"success";
		else 
			mod.addAttribute("word1", "密码输入错误请修改密码！");
			return "edituser";	
	}
	@RequestMapping(value="/refresh")
	public String EditController(String username2,String password2,Model mod){
		if(username2!=null&password2!=null){
		User user=new User();
		user.setUsername(username2);
		user.setPassword(password2);
	   int i= re.editUser(user);
	    mod.addAttribute("user", user);
	   if(i!=0) mod.addAttribute("word", "修改密码成功！");
	   else mod.addAttribute("word","没有该用户！");
	    return "edituser";}	else{
	    	return "edituser";
	    }
	}
}
