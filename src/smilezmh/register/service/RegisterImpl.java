package smilezmh.register.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import smilezmh.register.mapper.UserMapper;
import smilezmh.register.pojo.User;
import smilezmh.register.pojo.UserExample;

@Service
public class RegisterImpl implements Register {
	@Autowired
	private UserMapper userMapper;
	public void userRegister(User user){
		if(user.getUsername()!=null)
		userMapper.insert(user);//用户注册时插入值
		else ;
	}
	public List<User> userLogin(UserExample ue){
		return userMapper.selectByExample(ue);//登录查询数据库中是否存在这样的值
	}
	public Integer editUser(User user){
		UserExample ue=new UserExample();
		ue.createCriteria().andUsernameEqualTo(user.getUsername());
		List<User> list1=userMapper.selectByExample(ue);
		
		if(list1.size()!=0){
			user.setId(list1.get(0).getId());//将查询到的同名的id给user
		return userMapper.updateByUsernameAndPassword(user);
		}
		else return 0;
	}
}
