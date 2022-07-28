package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Furniture_dto;
import dto.Member_dto;

public class Member_dao {
	Connection 			con = null;
	PreparedStatement 	ps  = null;
	ResultSet 			rs  = null;
	
	
	  // 암호화
    public String encryptSHA256(String value) throws NoSuchAlgorithmException{
        String encryptData ="";
         
        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        sha.update(value.getBytes());
 
        byte[] digest = sha.digest();
        for (int i=0; i<digest.length; i++) {
            encryptData += Integer.toHexString(digest[i] &0xFF).toUpperCase();
        }
         
        return encryptData;
    }
	
	//
	public int getDelete(String no) {
		int result = 0;
		String query = "delete from homepage_박건일_furniture\r\n" + 
				"where no = '"+no+"'";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result  = ps.executeUpdate();			
		}catch(Exception e) {
			System.out.println("getDelete() 오류:"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	
	
	//furniture 업데이트
	public int furnitureUpdate(Furniture_dto dto) {
		int result = 0;
		String query = "update homepage_박건일_furniture\r\n" + 
				"set p_name = '"+dto.getP_name()+"',p_size = '"+dto.getP_size()+"', attach = '"+dto.getAttach()+"', img_order = "+dto.getImg_order()+", reg_id = '"+dto.getReg_id()+"', reg_date = '"+dto.getReg_date()+"'\r\n" + 
				"where no = '"+dto.getNo()+"'";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result  = ps.executeUpdate();			
		}catch(Exception e) {
			System.out.println("furnitureUpdate() 오류:"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	
	//img_order 삭제 후 감소 조정
	public int orderDown(String img_order) {
		int result = 0;
		String order = Integer.toString((Integer.parseInt(img_order)+1));
		String query = "UPDATE homepage_박건일_furniture\r\n" + 
				"SET img_order = img_order-1\r\n" + 
				"where img_order = '"+order+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("orderZero() 오류:" +query);
		}finally {
			DBConnection.closeDB(con, ps, rs);	
			if(!order.equals("20")) {
			orderDown(order);
			}
		}
		
		return result;
	}
	//img_order 삭제 후 감소 조정
		public int orderDown(String img_order, String ori_img_order) {
			int result = 0;
			String order = Integer.toString((Integer.parseInt(img_order)+1));
			String query = "UPDATE homepage_박건일_furniture\r\n" + 
					"SET img_order = img_order-1\r\n" + 
					"where img_order = '"+order+"'";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("orderZero() 오류:" +query);
			}finally {
				DBConnection.closeDB(con, ps, rs);	
				if(!order.equals(ori_img_order)) {
				orderDown(order,ori_img_order);
				}
			}
			
			return result;
		}
	
	
	//img_order 업데이트시 밀당.
	public int orderUp(String ori_img_order, String img_order) {
		int result = 0;
		String query = "";
		if(Integer.parseInt(img_order) < Integer.parseInt(ori_img_order)) {
		
			String order = Integer.toString((Integer.parseInt(img_order)+1));
			if(Integer.parseInt(order) < 20) {
				orderUp(ori_img_order,order);
			}
			query = "UPDATE homepage_박건일_furniture\r\n" + 
					"SET img_order = img_order+1\r\n" + 
					"where img_order = '"+img_order+"'";
			
		}
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("orderUp() 오류:" +query);
		}finally {
			DBConnection.closeDB(con, ps, rs);	
		}
		return result;
	}

	
	
	//이미 존재하느 img_order를 한칸씩 밀기.
		public int orderZero(String img_order) {
			if(Integer.parseInt(img_order) <= 20) {
				String order = Integer.toString((Integer.parseInt(img_order)+1));
				orderZero(order);
			}
			int result = 0;
			String query = "UPDATE homepage_박건일_furniture\r\n" + 
					"SET img_order = img_order+1\r\n" + 
					"where img_order = '"+img_order+"'";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("orderZero() 오류:" +query);
			}finally {
				DBConnection.closeDB(con, ps, rs);	
			}
			return result;
		}
	
	
	//가구 뷰 들고오기
		public Furniture_dto getFurniture(String no) {
			Furniture_dto dto = null;
			String query = "SELECT p_name,p_size,attach,img_order,reg_id,to_char(reg_date,'YYYY-MM-dd')as reg_date\r\n" + 
					"FROM homepage_박건일_furniture\r\n" + 
					"where no = '"+no+"'";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String p_name = rs.getString("p_name");
					String p_size = rs.getString("p_size");
					String attach = rs.getString("attach");
					String img_order = rs.getString("img_order");
					String reg_id = rs.getString("reg_id");
					String reg_date = rs.getString("reg_date");
					dto = new Furniture_dto(no,p_name,p_size,attach,img_order,reg_id,reg_date);
				}
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("getFurniture() 오류: "+query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return dto;
		}
		//가구 리스트 생성
		public ArrayList<Furniture_dto> getFurnitureList(){
			ArrayList<Furniture_dto> dtos = new ArrayList<>();
			String query = "select no,p_name,p_size,attach,img_order,reg_id,to_char(reg_date,'yyyy-MM-dd')as reg_date\r\n" + 
					"from homepage_박건일_furniture\r\n" + 
					"order by img_order";
			try {
				con = DBConnection.getConnection();
				ps  = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String no			= rs.getString("no");
					String p_name		= rs.getString("p_name");
					String p_size		= rs.getString("p_size");
					String attach		= rs.getString("attach");
					String img_order	= rs.getString("img_order");
					String reg_id		= rs.getString("reg_id");
					String reg_date		= rs.getString("reg_date");
					Furniture_dto dto = new Furniture_dto(no,p_name,p_size,attach,img_order,reg_id,reg_date);
					dtos.add(dto);
				}
				
			}catch(Exception e) {
				System.out.println("getFurnitureList() 오류:"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}	
			
			return dtos;
		}
		
	//가구 리스트 생성
		public ArrayList<Furniture_dto> getFurnitureList(int start,int end){
			ArrayList<Furniture_dto> dtos = new ArrayList<>();
			String query = "select * from(\r\n" + 
					"select tbl.*, rownum as rnum\r\n" + 
					"from \r\n" + 
					"(select no,p_name,p_size,attach,img_order,reg_id,to_char(reg_date,'yyyy-MM-dd')as reg_date\r\n" + 
					"from homepage_박건일_furniture\r\n" + 
					"order by img_order)tbl)\r\n" + 
					"where rnum >= "+start+" and rnum <= "+end;
			try {
				con = DBConnection.getConnection();
				ps  = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String no			= rs.getString("no");
					String p_name		= rs.getString("p_name");
					String p_size		= rs.getString("p_size");
					String attach		= rs.getString("attach");
					String img_order	= rs.getString("img_order");
					String reg_id		= rs.getString("reg_id");
					String reg_date		= rs.getString("reg_date");
					Furniture_dto dto = new Furniture_dto(no,p_name,p_size,attach,img_order,reg_id,reg_date);
					dtos.add(dto);
				}
				
			}catch(Exception e) {
				System.out.println("getFurnitureList() 오류:"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}	
			
			return dtos;
		}
	
	
	//가구 생성
		public int furnitureSave(Furniture_dto dto) {
			int result = 0;
			//no,p_name,p_size,attach,img_order,reg_id,reg_date
			String query = "insert into homepage_박건일_furniture\r\n" + 
					"values('"+dto.getNo()+"','"+dto.getP_name()+"','"+dto.getP_size()+"','"+dto.getAttach()+"','"+dto.getImg_order()+"','"+dto.getReg_id()+"','"+dto.getReg_date()+"')";
			try {
				con = DBConnection.getConnection();
				ps  = con.prepareStatement(query);
				result  = ps.executeUpdate();			
			}catch(Exception e) {
				System.out.println("furnitureSave() 오류:"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			
			return result;
		}
	
	// 번호 생성
		public String getMaxNo() {
			String no="";
			String query =" select nvl(max(no),'F000') "+
			              " from homepage_박건일_furniture";
			try {
				con = DBConnection.getConnection();
				ps  = con.prepareStatement(query);
				rs  = ps.executeQuery();
				if(rs.next()) {
					no = rs.getString(1);
				}
			}catch(Exception e) {
				System.out.println("getMaxNo() 오류:"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return no;
		}
	
	//아이디 중복 검사
		public int getIdCheck(String id) {
			int result = 0;
			String query = "select count(*)\r\n" + 
					"from \"HOMEPAGE_박건일_MEMBER\"\r\n" + 
					"where id = '"+id+"'";
			try {
				con = DBConnection.getConnection();
				ps  = con.prepareStatement(query);
				rs = ps.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
				
			}catch(Exception e) {
				System.out.println("getIdCheck() 오류:"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}	
			
			return result;
		}
	
	
	//가입 해지
		public int getDeleteMember(String id, String exit_date) {
			int result = 0;
			String query="update homepage_박건일_member\r\n" + 
					"set exit_gubun = 'out', exit_date = '"+exit_date+"'\r\n" + 
					"where id = '"+id+"'";
			try {
				con = DBConnection.getConnection();
				ps  = con.prepareStatement(query);
				result = ps.executeUpdate();
			}catch(Exception e) {
				System.out.println("getDeleteMember() 오류:"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}	
			return result;
		}
	//퍼니쳐 전체
		public int getTotalCount() {
			int result = 0;
			String query = "select count(*)\r\n" + 
					"from homepage_박건일_furniture\r\n";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("getTotalCount() 오류: " + query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			
			return result;
		}
	
	//목록조회 전체
		public int getTotalCount(String select,String search) {
			int result = 0;
			String query = "select count(*)\r\n" + 
					"from homepage_박건일_member b\r\n" + 
					"where "+select+" like '%"+search+"%'";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("getTotalCount() 오류: " + query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			
			return result;
		}
	
	// 멤버리스트
	public ArrayList<Member_dto> getList(String select, String search, int start, int end){
		ArrayList<Member_dto> dtos = new ArrayList<>();
		String query = "select * from(\n" + 
				"select tbl.*, rownum as rnum\n" + 
				"from\n" + 
				"(select id, name, area, TO_CHAR(reg_date,'yyyy-MM-dd') as reg_date, level_gubun\n" + 
				"from homepage_박건일_member\n" + 
				"where "+select+" like '%"+search+"%'\n" + 
				"order by level_gubun desc)tbl)\n" + 
				"where rnum >="+start+" and rnum <="+end;
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String area = rs.getString("area");
				String reg_date = rs.getString("reg_date");
				String level_gubun = rs.getString("level_gubun");

				//id, name, area, reg_date, level_gubun
				Member_dto dto = new Member_dto(id, name, area, reg_date, level_gubun);
				dtos.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("getList() 오류" + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}
	
	
	// 회원정보 수정
	public int memberUpdate(Member_dto dto){
		int result =0;
		String query="update homepage_박건일_member	\r\n" + 
				" set name ='"+dto.getName()+"',	\r\n" + 
				"    area ='"+dto.getArea()+"',	\r\n" + 
				"    address ='"+dto.getAddress()+"',	\r\n" + 
				"    tell_1 ='"+dto.getTell_1()+"',	\r\n" + 
				"    tell_2 ='"+dto.getTell_2()+"',	\r\n" + 
				"    tell_3 ='"+dto.getTell_3()+"',	\r\n" + 
				"    gender ='"+dto.getGender()+"',	\r\n" + 
				"    hobby_travel ='"+dto.getHobby_travel()+"',	\r\n" + 
				"    hobby_reading ='"+dto.getHobby_reading()+"',	\r\n" + 
				"    hobby_sports='"+dto.getHobby_sports()+"',	\r\n" + 
				"    level_gubun='"+dto.getLevel_gubun()+"'	\r\n" + 
				" where id ='"+dto.getId()+"'";
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("memberUpdate() 오류:"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		
		return result;
	}
	
	// 회원 정보 상세 조회
	public Member_dto getMemberView(String id){
		Member_dto dto = null;
		String query="select id,name,password,pw_lenght,area,address,tell_1,tell_2,tell_3,decode(gender,'m','남','여')as gender,\r\n" + 
				"hobby_travel,hobby_reading,hobby_sports,to_char(reg_date,'yy-MM-dd') as reg_date,\r\n" + 
				"decode(level_gubun,'member','회원','manager','직원','top','관리자') as level_gubun,\r\n" + 
				"decode(exit_gubun,'in','가입','탈퇴') as exit_gubun,\r\n" + 
				"nvl(to_char(exit_date,'yy-MM-dd'),' ') as exit_date\r\n" + 
				"from homepage_박건일_member\r\n" + 
				"where id = '"+id+"'";
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String name           = rs.getString("name");
				String password       = rs.getString("password");
				int	pw_lenght		= rs.getInt("pw_lenght");
				String area           = rs.getString("area");
				String address        = rs.getString("address");
				String tell_1         = rs.getString("tell_1");
				String tell_2         = rs.getString("tell_2");
				String tell_3         = rs.getString("tell_3");
				String gender         = rs.getString("gender");
				String hobby_travel   = rs.getString("hobby_travel");
				String hobby_reading  = rs.getString("hobby_reading");
				String hobby_sports   = rs.getString("hobby_sports");
				String reg_date       = rs.getString("reg_date");
				String level_gubun	  = rs.getString("level_gubun");
				String exit_gubun	  = rs.getString("exit_gubun");
				String exit_date	  = rs.getString("exit_date");
				
				
				dto = new Member_dto(id,name,password,pw_lenght,area,address,
									tell_1,tell_2,tell_3,gender,
									hobby_travel,hobby_reading,hobby_sports,
									reg_date,level_gubun,exit_gubun,exit_date);
			}
		}catch(Exception e) {
			System.out.println("getMemberView() 오류:"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		return dto;
	}
	
	
	//로그인
	public ArrayList<String> checkLogin(String id,String password){
		ArrayList<String> arr = new ArrayList<>();
		String query="select name,level_gubun\r\n" + 
				" from homepage_박건일_member\r\n" + 
				" where id='"+id+"'\r\n" + 
				" and password ='"+password+"'\r\n" + 
				" and exit_gubun ='in'";
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String name 		= rs.getString("name");
				String level_gubun  = rs.getString("level_gubun");
				arr.add(name);
				arr.add(level_gubun);
			}
		}catch(Exception e) {
			System.out.println("checkLogin() 오류:"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		return arr;
	}
	
	
	// 회원가입
	public int memberSave(Member_dto dto){
		int result =0 ;
		String query="insert into homepage_박건일_member\r\n" + 
				" (id,name,password,pw_lenght,area,address,\r\n" + 
				" tell_1,tell_2,tell_3,\r\n" + 
				" gender,hobby_travel,hobby_reading,\r\n" + 
				" hobby_sports,reg_date)\r\n" + 
				" values\r\n" + 
				" ('"+dto.getId()+"','"+dto.getName()+"','"+dto.getPassword()+"','"+dto.getPw_lenght()+"','"+dto.getArea()+"','"+dto.getAddress()+"',\r\n" + 
				" '"+dto.getTell_1()+"','"+dto.getTell_2()+"','"+dto.getTell_3()+"','"+dto.getGender()+"','"+dto.getHobby_travel()+"','"+dto.getHobby_reading()+"','"+dto.getHobby_sports()+"','"+dto.getReg_date()+"')";
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("memberSave() 오류:"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
}






