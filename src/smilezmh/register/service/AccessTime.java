package smilezmh.register.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;
import org.springframework.http.HttpRequest;


public interface AccessTime {



	public String AccessTime(HttpServletRequest request, HttpServletResponse response);
}
