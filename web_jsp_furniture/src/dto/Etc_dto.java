package dto;

public class Etc_dto {
	private String no,title,content,reg_id,reg_name,reg_date,hit;	
	//생성용
	public Etc_dto(String no, String title, String content, String reg_id, String reg_name, String reg_date) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.reg_id = reg_id;
		this.reg_name = reg_name;
		this.reg_date = reg_date;
	}
	//리스트용
	public Etc_dto(String no, String title, String content, String reg_id, String reg_name, String reg_date, String hit) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.reg_id = reg_id;
		this.reg_name = reg_name;
		this.reg_date = reg_date;
		this.hit = hit;
	}
	

	public String getNo() {
		return no;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getReg_id() {
		return reg_id;
	}

	public String getReg_name() {
		return reg_name;
	}

	public String getReg_date() {
		return reg_date;
	}

	public String getHit() {
		return hit;
	}
	
}
