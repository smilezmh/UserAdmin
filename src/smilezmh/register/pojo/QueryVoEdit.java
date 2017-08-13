package smilezmh.register.pojo;

import java.util.List;
/**
 * 存放List<User>，接收jsp页面传来的集合对象
 * @author Administrator
 *
 */
public class QueryVoEdit {
	private List<User> list;

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}
}
