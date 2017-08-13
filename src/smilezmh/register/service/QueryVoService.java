package smilezmh.register.service;

import org.springframework.stereotype.Service;

import smilezmh.register.common.utils.Page;
import smilezmh.register.pojo.QueryVo;
import smilezmh.register.pojo.QueryVo1;
import smilezmh.register.pojo.User;

public interface QueryVoService {
	public Page<User> getPageByQueryVo(QueryVo vo);
	public Page<User> getPageByQueryVo1(QueryVo1 vo1);
	
}
