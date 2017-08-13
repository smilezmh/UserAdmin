package smilezmh.register.service;

import java.text.SimpleDateFormat;



import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import smilezmh.register.mapper.TimeMapper;
import smilezmh.register.pojo.LoginTime;

/**
 * 需求：利用cookie获得上次访问时间，显示在页面中，并将数据时间写入数据库中
 * @author Administrator
 *
 */
@Service
public class AccessTimeImpl implements AccessTime {
	@Autowired
	private TimeMapper timemapper=null;
	//@Autowired
	private LoginTime time=new LoginTime();//必须初始实例化，要不会报错，或者用自动注入，在application.xml中加入相应的<bean>对象
	private String currentTime;
	private String getCurrentTime() {
		return currentTime;
	}
	public void setCurrentTime(String currentTime) {
		this.currentTime = currentTime;
	}
	public String AccessTime(HttpServletRequest request,HttpServletResponse response) {
		// TODO Auto-generated method stub
		String lastAccessTime=null;
		Date date=new Date();
		SimpleDateFormat format=new SimpleDateFormat();
		currentTime=format.format(date);
		Cookie cookie=new Cookie("createtime",currentTime);
		cookie.setMaxAge(60*100*50);
		//cookie.setPath("/register");
		response.addCookie(cookie);
		Cookie[] cookies= request.getCookies();
		if(cookies!=null)
		for(Cookie co:cookies){
			if(co.getName().equals("createtime")){
				lastAccessTime=co.getValue();
			}
		}
		
		time.setId(UUID.randomUUID().toString());
		time.setCreatetime(lastAccessTime);
		timemapper.insert(time);
		//atime.setCreatetime(lastAccessTime);
		//am.insert(atime);
		return lastAccessTime;
	}

}
