package smilezmh.register.controller;

import java.io.IOException;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.el.ELException;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;



import net.sf.json.JSON;
import net.sf.json.JSONObject;
import smilezmh.register.common.utils.Page;
import smilezmh.register.pojo.QueryVo;
import smilezmh.register.pojo.QueryVo1;
import smilezmh.register.pojo.QueryVoEdit;
import smilezmh.register.pojo.User;
import smilezmh.register.pojo.UserExample;
import smilezmh.register.service.AccessTime;
import smilezmh.register.service.QueryVoService;
import smilezmh.register.service.Register;

@Controller
public class UserController {
	List<User> list = null;	
	//Integer[] intList=null;
	@Autowired
	private Register re;//登录等相关服务
	@Autowired
	private AccessTime ac;//获取上次显示时间
	@Autowired
	private QueryVoService qv;
	//获取用户上次登录时间
	@RequestMapping(value = "/register")
	public String RegisterController(User user, Model mod,HttpServletRequest request,HttpServletResponse response) {
		re.userRegister(user);
		//String l=ac.AccessTime(request,response);
		mod.addAttribute("time", ac.AccessTime(request, response));//回传访问时间
		return "login";
		//return "register";
	}
//登录界面，如果登录正确跳转到用户管理界面，否则跳转到修改用户界面
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
			
			//将不重复国别放进集合中
			
			
			return "success";}
		else
			mod.addAttribute("word1", "密码输入错误请修改密码！");
		return "edituser";
	}
//修改用户密码功能
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
	//页面展示出所有的用户
	@RequestMapping(value="/search")
	public String SearchAdminController(Model mod,QueryVo1 vo1){
		List<User> user=re.searchList();
		Page<User> page = qv.getPageByQueryVo1(vo1);
		mod.addAttribute("page", page); 
		Set<String> city=new HashSet<String>();
		Set<String> career=new HashSet<String>();
		for(User u:user){
			city.add(u.getHome());
			career.add(u.getPro());
		}
		mod.addAttribute("itemlist", user);
		mod.addAttribute("home", city);
		mod.addAttribute("pro", career);
		return "success";
	}
	//搜索功能
	@RequestMapping(value="/selectID")
	public String SelectIdController(Model mod,Integer id){
		User user=re.selectById(id);
		mod.addAttribute("item", user);
		return "search";
	}
	
	//修改用户跳转并显示将要修改的用户
	@RequestMapping(value="/editUser")
	public String EditUserIdController(Model mod,Integer id){
		User user=re.selectById(id);
		mod.addAttribute("item1", user);
		return "edituserID";
	}
	//修改后跳转
	@RequestMapping(value="/editSuccess")
	public String EditSuccessShowController(Model mod,User user,HttpServletRequest request,HttpServletResponse response,QueryVo1 vo) throws UnsupportedEncodingException{
		//response.setContentType("text/html;charset=UTF-8");
		//request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8"); 
		re.updateUser(user);
		Page<User> page = qv.getPageByQueryVo1(vo);
		
		mod.addAttribute("page", page);
		return "success";
	}
	//删除也能更好
	@RequestMapping(value="/deleteUser")
	public String deleteController(Model mod,Integer id){
		re.deletebyid(id);
		List<User> user=re.searchList();
		mod.addAttribute("itemlist", user);
		return "success";
	}
	//进行禁用启用,互斥编辑禁用启用
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
	//采用ajax进行删除操作
	@RequestMapping(value="/deleteFunction")
	public @ResponseBody
	String deleteController(Integer id){
		re.deletebyid(id);
		return "ok";
	}
	//采用ajax进行编辑时,返回一个user对象
	@RequestMapping(value="/editFunction")
	public @ResponseBody
	User editController(Integer id){
		return re.selectById(id) ;
	}
	//增加用户
		@RequestMapping(value = "/addUser")
		public @ResponseBody
		String addUserController( User user ){
			//找到id最大的对象
			User user1=re.findMaxIdUser();
			System.out.println(user1.toString());
			user.setId(user1.getId()+1);
			user.setFlag(0);
			re.insertUser(user); 
			return "OK";
		}
		//多条件查询
		@RequestMapping(value="/multiSearch")
		 public String multiSearchController(QueryVo vo,Model mod){
			List<User> user=re.searchList();
			Set<String> city=new HashSet<String>();
			Set<String> career=new HashSet<String>();
			for(User u:user){
				city.add(u.getHome());
				career.add(u.getPro());
			}
			 mod.addAttribute("home2", city);
			 mod.addAttribute("pro2", career);
			
			
			Page<User> page=qv.getPageByQueryVo(vo);  
			//可以让下拉选框中的值一直显示
			//mod.addAttribute("home1", vo.getHome());
			//mod.addAttribute("pro1", vo.getPro());
			 mod.addAttribute("page", page);
			 return "multiSerach";
		
		}
		//批量删除页面跳转
		@RequestMapping(value = "/deleteManyJsp")
		public String deleteUsesrController( Model mod ,QueryVo1 vo){
			Page<User> page=qv.getPageByQueryVo1(vo);  
			 mod.addAttribute("page", page);
			
			return "listDeledit";
		}
		//批量删除
		@RequestMapping(value = "/deleteMany")
		public String deleteUsesrsController(Integer[] list,Model mod ,QueryVo1 vo){
			Page<User> page=qv.getPageByQueryVo1(vo);
			for(int i=0;i<list.length;i++){
				re.deletebyid(list[i]);
			}
			 mod.addAttribute("page", page);
			//for(int i=0;i<intList.length;i++)
			//System.out.println(intList[i]);
			return "listDeledit";
		}
		//批量修改
		@RequestMapping(value = "/editMany")
		public String editUsesrsController(QueryVoEdit edit,Model mod ,QueryVo1 vo){
			
			for(int i=0;i<edit.getList().size();i++){
				re.updateUser(edit.getList().get(i));
			}
			Page<User> page=qv.getPageByQueryVo1(vo);
			 mod.addAttribute("page", page);
			//for(int i=0;i<intList.length;i++)
			//System.out.println(intList[i]);
			return "listDeledit";
		}

}	

