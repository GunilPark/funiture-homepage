package dto;

public class Free_dto {
	private String no,title,content,hit,reg_id,reg_name,reg_date,attach;
	
	public Free_dto(String no, String title, String content, String hit, String reg_id, String reg_name,
			String reg_date, String attach) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.reg_id = reg_id;
		this.reg_name = reg_name;
		this.reg_date = reg_date;
		this.attach = attach;
	}

	public Free_dto(String no, String title, String content, String hit, String reg_id, String reg_name,
			String reg_date) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.reg_id = reg_id;
		this.reg_name = reg_name;
		this.reg_date = reg_date;
	}

	public String getAttach() {
		return attach;
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

	public String getHit() {
		return hit;
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
	
}
