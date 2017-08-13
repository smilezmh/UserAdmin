package smilezmh.register.mapper;

import java.util.List;

import smilezmh.register.pojo.QueryVo;
import smilezmh.register.pojo.QueryVo1;
import smilezmh.register.pojo.User;

public interface QueryVoDao {
	//	求符合查询条件的分页的总条数total
	public Integer countUserByQueryVo(QueryVo vo);
	//求每页分页对象中User对象结果集
	public List<User> getUserListByQueryVo(QueryVo vo);
	
	//success页面中的分页处理
	public Integer countUserByQueryVo1(QueryVo1 vo1);
	//求每页分页对象中User对象结果集
	public List<User> getUserListByQueryVo1(QueryVo1 vo1);
	
}
