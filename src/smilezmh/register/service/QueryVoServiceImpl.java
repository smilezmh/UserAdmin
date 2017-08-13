package smilezmh.register.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import smilezmh.register.common.utils.Page;
import smilezmh.register.mapper.QueryVoDao;
import smilezmh.register.pojo.QueryVo;
import smilezmh.register.pojo.QueryVo1;
import smilezmh.register.pojo.User;

/**
 * 分页对象管理
 * @author Administrator
 *
 */
@Service
public class QueryVoServiceImpl implements QueryVoService {
	
	
	@Autowired
    private	QueryVoDao dao;
	public Page<User> getPageByQueryVo(QueryVo vo){
		Page<User> page=new Page<User>();
		
		page.setSize(5);
		vo.setSize(5);
		if(null!=vo){//vo包括过来的select下拉列表的option对象的值
			//对vo进行处理
		//对QueryVo对象进行预处理，防止出现为空现象
		 if(null!=vo.getPage()){//page当前页不能为空
			 page.setPage(vo.getPage());
			vo.setStartRow((vo.getPage() -1)*vo.getSize());
		}
		//国别不能为空，前后去掉字符串
		if(null!=vo.getHome() && "".equals(vo.getHome().trim())){
			vo.setHome(vo.getHome().trim());
		}
		if(null!=vo.getPro() && "".equals(vo.getPro().trim())){
			vo.setPro(vo.getPro().trim());
			
		}if(null!=vo.getUsername() && "".equals(vo.getUsername().trim())){
			vo.setUsername(vo.getUsername().trim());
			
		}
		
		//得到符合条件总条数
		page.setTotal(dao.countUserByQueryVo(vo));
//得到结果集
		page.setRows(dao.getUserListByQueryVo(vo));
	} 
		
		//得到Page对象需要四个参数
				//设置当前页
				//page.setPage(0);
				//每页显示10条数据
			
				return page;
}
	public Page<User> getPageByQueryVo1(QueryVo1 vo){
		Page<User> page=new Page<User>();
		
		page.setSize(5);
		vo.setSize(5);
		if(null!=vo){//vo包括过来的select下拉列表的option对象的值
			//对vo进行处理
		//对QueryVo对象进行预处理，防止出现为空现象
		 if(null!=vo.getPage()){//page当前页不能为空
			 page.setPage(vo.getPage());
			vo.setStartRow((vo.getPage() -1)*vo.getSize());
		}
		//得到符合条件总条数
		page.setTotal(dao.countUserByQueryVo1(vo));
//得到结果集
		page.setRows(dao.getUserListByQueryVo1(vo));
	} 
		
		//得到Page对象需要四个参数
				//设置当前页
				//page.setPage(0);
				//每页显示10条数据
			
				return page;
	}
}
