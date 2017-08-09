package smilezmh.register.controller;

import java.io.IOException;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.el.ELException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import smilezmh.register.pojo.User;
import smilezmh.register.pojo.UserExample;
import smilezmh.register.service.AccessTime;
import smilezmh.register.service.Register;

@Controller
public class UserController {
	List<User> list = null;	
	@Autowired
	private Register re;
	@Autowired
	private AccessTime ac;
	
	@RequestMapping(value = "/register")
	public String RegisterController(User user, Model mod,HttpServletRequest request,HttpServletResponse response) {
		re.userRegister(user);
		//String l=ac.AccessTime(request,response);
		mod.addAttribute("time", ac.AccessTime(request, response));//回传访问时间
		return "login";
		//return "register";
	}

	@RequestMapping(value = "/login")
	public String LoginController(String username1, String password1,Model mod) {
		UserExample ue = new UserExample();
		if (username1 == null) {
			username1 = "noexit";
		}
		if (password1 == null) {
			password1 = "12";// 因为数据库中语句不能为空，所以赋值，因为有表单校验，所以赋值后数据库中一定不会有这样的值
		}
		ue.createCriteria().andUsernameEqualTo(username1).andPasswordEqualTo(password1);
		list = re.userLogin(ue);
		if (list.size() != 0){
			//mod.addAttribute("time1", ac.AccessTime(request, response));//回传访问时间
			
			List<User> user=re.searchList();
			mod.addAttribute("itemlist", user);
			return "success";}
		else
			mod.addAttribute("word1", "密码输入错误请修改密码！");
		return "edituser";
	}

	@RequestMapping(value = "/refresh")
	public String EditController(String username2, String password2, Model mod) {
		if (username2 != null & password2 != null) {// 如果不是手动输入接口进来的应该不为空，进行数据库的更新
			User user = new User();
			user.setUsername(username2);
			user.setPassword(password2);
			int i = re.editUser(user);
			mod.addAttribute("user", user);
			if (i != 0)
				mod.addAttribute("word", "修改密码成功！");
			else
				mod.addAttribute("word", "没有该用户！");
			return "edituser";
		} else {
			return "edituser";
		}
	}
	@RequestMapping(value="/search")
	public String SearchAdminController(Model mod){
		List<User> user=re.searchList();
		mod.addAttribute("itemlist", user); 
		return "success";
	}
	@RequestMapping(value="/selectID")
	public String SelectIdController(Model mod,Integer id){
		User user=re.selectById(id);
		mod.addAttribute("item", user);
		return "search";
	}
	@RequestMapping(value="/editUser")
	public String EditUserIdController(Model mod,Integer id){
		User user=re.selectById(id);
		mod.addAttribute("item1", user);
		return "edituserID";
	}
	@RequestMapping(value="/editSuccess")
	public String EditSuccessShowController(Model mod,User user){
		
		re.updateUser(user);
		List<User> user1=re.searchList();
		mod.addAttribute("itemlist", user1);
		return "success";
	}
	@RequestMapping(value="/deleteUser")
	public String deleteController(Model mod,Integer id){
		re.deletebyid(id);
		List<User> user=re.searchList();
		mod.addAttribute("itemlist", user);
		return "success";
	}
	//进行禁用启用
	@RequestMapping(value="/123")
	public @ResponseBody
	String onOffController( Integer id){
		System.out.println(id);
		User user=re.selectById(id);
		if(user.getFlag()==0)
			user.setFlag(1);
		else user.setFlag(0);
		 re.updateUser(user);
		 return "OK";
		
		//re.updateUser(user);
		
		//mod.addAttribute("flag", re.selectById(id).getFlag());
		
	}
	@RequestMapping(value="/deleteFunction")
	public @ResponseBody
	String deleteController(Integer id){
		re.deletebyid(id);
		return "ok";
	}
	@RequestMapping(value="/editFunction")
	public @ResponseBody
	User editController(Integer id){
		return re.selectById(id) ;
	}
}	

