package dto;

public class Notice_dto {
	private String no,title,content,attach,hit,reg_id,reg_date;

	public Notice_dto(String no, String title, String content, String attach, String hit, String reg_id,
			String reg_date) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.attach = attach;
		this.hit = hit;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
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

	public String getAttach() {
		return attach;
	}

	public String getHit() {
		return hit;
	}

	public String getReg_id() {
		return reg_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	
}
