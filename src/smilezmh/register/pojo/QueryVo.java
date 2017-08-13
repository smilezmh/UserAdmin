package smilezmh.register.pojo;

public class QueryVo {
	private String username;
	private String home;//国别
	private String pro;//职业
	//页对象
	private Integer page;//当前页
	private Integer size=5;//每页数
	//开始行
	private Integer startRow=0;
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getPro() {
		return pro;
	}
	public void setPro(String pro) {
		this.pro = pro;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		
		this.page = page;
	}
	
	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}


}
