package dto;

public class Comment_dto {

	private String no,reg_order,content,reg_id,reg_date;

	public Comment_dto(String no, String reg_order, String content, String reg_id, String reg_date) {
		this.no = no;
		this.reg_order = reg_order;
		this.content = content;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
	}

	public String getNo() {
		return no;
	}

	public String getReg_order() {
		return reg_order;
	}

	public String getContent() {
		return content;
	}

	public String getReg_id() {
		return reg_id;
	}

	public String getReg_date() {
		return reg_date;
	}
	
}
