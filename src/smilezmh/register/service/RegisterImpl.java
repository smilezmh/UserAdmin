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
		userMapper.insert(user);
	}
	public List<User> userLogin(UserExample ue){
		return userMapper.selectByExample(ue);
	}
	public Integer editUser(User user){
		UserExample ue=new UserExample();
		ue.createCriteria().andUsernameEqualTo(user.getUsername());
		List<User> list1=userMapper.selectByExample(ue);
		
		if(list1.size()!=0){
			user.setId(list1.get(0).getId());
		return userMapper.updateByUsernameAndPassword(user);
		}
		else return 0;
	}
}
