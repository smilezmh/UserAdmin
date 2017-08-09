package smilezmh.register.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import smilezmh.register.pojo.User;
import smilezmh.register.pojo.UserExample;

public interface UserMapper {
    int countByExample(UserExample example);
    List<User> selectAll();
    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);
    int updateByPrimaryKey(User record);
    int updateByUsernameAndPassword(User record);
	User findUserMaxID();

    
    
    
}