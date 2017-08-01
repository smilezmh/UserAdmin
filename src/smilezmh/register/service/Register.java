package smilezmh.register.service;

import java.util.List;

import smilezmh.register.pojo.User;
import smilezmh.register.pojo.UserExample;

public interface Register {
	public void userRegister(User user);
	public List<User> userLogin(UserExample ue);
	public Integer editUser(User user);
}