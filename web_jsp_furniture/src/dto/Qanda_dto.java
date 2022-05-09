package dto;

public class Qanda_dto {
	private String no,q_title,q_content,q_reg_id,q_reg_date,hit,ispublic,a_content, a_reg_id, a_reg_date;

	public Qanda_dto(String no, String q_title, String q_content, String q_reg_id, String q_reg_date, String hit,
			String ispublic, String a_content, String a_reg_id, String a_reg_date) {
		this.no = no;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_reg_id = q_reg_id;
		this.q_reg_date = q_reg_date;
		this.hit = hit;
		this.ispublic = ispublic;
		this.a_content = a_content;
		this.a_reg_id = a_reg_id;
		this.a_reg_date = a_reg_date;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_reg_id() {
		return q_reg_id;
	}

	public void setQ_reg_id(String q_reg_id) {
		this.q_reg_id = q_reg_id;
	}

	public String getQ_reg_date() {
		return q_reg_date;
	}

	public void setQ_reg_date(String q_reg_date) {
		this.q_reg_date = q_reg_date;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getIspublic() {
		return ispublic;
	}

	public void setIspublic(String ispublic) {
		this.ispublic = ispublic;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_reg_id() {
		return a_reg_id;
	}

	public void setA_reg_id(String a_reg_id) {
		this.a_reg_id = a_reg_id;
	}

	public String getA_reg_date() {
		return a_reg_date;
	}

	public void setA_reg_date(String a_reg_date) {
		this.a_reg_date = a_reg_date;
	}

	
	
	
}
