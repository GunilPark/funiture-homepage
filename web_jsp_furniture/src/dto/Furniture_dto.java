package dto;

public class Furniture_dto {
		String no,p_name,p_size,attach,img_order,reg_id,reg_date;

		public Furniture_dto(String no, String p_name, String p_size, String attach, String img_order, String reg_id,
				String reg_date) {
			this.no = no;
			this.p_name = p_name;
			this.p_size = p_size;
			this.attach = attach;
			this.img_order = img_order;
			this.reg_id = reg_id;
			this.reg_date = reg_date;
		}

		public String getNo() {
			return no;
		}

		public void setNo(String no) {
			this.no = no;
		}

		public String getP_name() {
			return p_name;
		}

		public void setP_name(String p_name) {
			this.p_name = p_name;
		}

		public String getP_size() {
			return p_size;
		}

		public void setP_size(String p_size) {
			this.p_size = p_size;
		}

		public String getAttach() {
			return attach;
		}

		public void setAttach(String attach) {
			this.attach = attach;
		}

		public String getImg_order() {
			return img_order;
		}

		public void setImg_order(String img_order) {
			this.img_order = img_order;
		}

		public String getReg_id() {
			return reg_id;
		}

		public void setReg_id(String reg_id) {
			this.reg_id = reg_id;
		}

		public String getReg_date() {
			return reg_date;
		}

		public void setReg_date(String reg_date) {
			this.reg_date = reg_date;
		}
		
		
		
}
