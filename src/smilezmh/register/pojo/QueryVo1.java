package smilezmh.register.pojo;

public class QueryVo1 {
	//页对象
	private Integer page;//当前页
	private Integer size=5;//每页数
	//开始行
	private Integer startRow=0;
	
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
	


}