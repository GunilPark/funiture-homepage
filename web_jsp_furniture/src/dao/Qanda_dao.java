package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Qanda_dto;

public class Qanda_dao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	//조회수 증가
	public void setHitCount(String no) {
		String query = "update homepage_박건일_qanda\r\n" + 
				"set hit = hit + 1\r\n" + 
				"where no = '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("setHitCount() 오류: " + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		
	}
	//작성자 이름 받아오기
	public String getName(String id) {
		String name = "";
		String query = "select name \r\n" + 
				"from homepage_박건일_member \r\n" + 
				"where id = '"+id+"'\r\n";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				name = rs.getString(1);
			}	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println("query:" + query);
		return name;		
	}
	
	//삭제
		public int getDelete(String no) {
			int result = 0;
			String query = "delete from homepage_박건일_qanda\r\n" + 
					"where no = '"+no+"'";		
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("getDelete() 오류: " + query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return result;
		}
	
	
	//답장 작성 및 업데이트
		public int insertA(String no, String a_content, String a_reg_id, String a_reg_date) {
			int result = 0;
			String query = "update homepage_박건일_qanda\r\n" + 
					"set a_content = '"+a_content+"', a_reg_id = '"+a_reg_id+"', a_reg_date = '"+a_reg_date+"'\r\n" + 
					"where no = '"+no+"'";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
					
			}catch(SQLException e) {
				System.out.println("insertA() 오류: " + query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
	
			return result;
		}
	
	//뷰생성
		public Qanda_dto getView(String no) {
			Qanda_dto dto = null;
			
			
			String query = "select a.no, a.q_title,a.q_content, b.name q_name, to_char(a.q_reg_date,'yyyy-MM-dd') as q_reg_date, a.hit, a.ispublic, a.a_content, a.a_reg_id, to_char(a.a_reg_date,'yyyy-MM-dd') as a_reg_date \r\n" + 
					"from homepage_박건일_qanda a, homepage_박건일_member b\r\n" + 
					"where a.q_reg_id = b.id\r\n" + 
					"and a.no = '"+no+"'";
			
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				if(rs.next()) {
					no = rs.getString("no");
					String q_title = rs.getString("q_title");
					String q_content = rs.getString("q_content");
					String q_reg_id = rs.getString("q_name");
					String q_reg_date = rs.getString("q_reg_date");
					String hit = rs.getString("hit");
					String ispublic = rs.getString("ispublic");
					String a_content = rs.getString("a_content");
					String a_reg_id = rs.getString("a_reg_id");
					String a_reg_date = rs.getString("a_reg_date");
					//업데이트 dto순서: no,q_title,q_content,q_reg_id,q_reg_date,hit,ispublic,a_content, a_reg_id, a_reg_date;
					dto = new Qanda_dto(no,q_title,q_content,q_reg_id,q_reg_date,hit,ispublic,a_content,a_reg_id,a_reg_date);
				}	
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return dto;		
		}
	
	//번호 생성
	public String getMaxNo() {
		String maxNo = "";
		String query = "select nvl(max(no),'Q000') from homepage_박건일_qanda";
		try{
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				maxNo = rs.getString(1);
			}	
		}catch(SQLException e) {
			System.out.println("getMaxNo() 오류:"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return maxNo;
	}
	
	//목록조회 전체
	public int getTotalCount(String select,String search) {
		int result = 0;
		String query = "select count(*)\r\n" + 
				"from homepage_박건일_qanda a,homepage_박건일_member b\r\n" + 
				"where a.q_reg_id = b.id\r\n" + 
				"and "+select+" like '%"+search+"%'";
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
	
	
	//업데이트 dto순서: no,q_title,q_content,q_reg_id,q_reg_date,hit,ispublic,a_content, a_reg_id, a_reg_date;
		public int qandaSave(Qanda_dto dto) {
			int result = 0;
			String query = "insert into homepage_박건일_qanda\r\n" + 
					"(no,q_title,q_content,q_reg_id,q_reg_date,hit,ispublic)\r\n" + 
					"values\r\n" + 
					"('"+dto.getNo()+"','"+dto.getQ_title()+"','"+dto.getQ_content()+"','"+dto.getQ_reg_id()+"','"+dto.getQ_reg_date()+"',0,'"+dto.getIspublic()+"')";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
			}catch(SQLException e) {
				System.out.println("noticeUpdate() 오류:" + query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return result;
		}
	
	
	
	
	//업데이트 dto순서: no,q_title,q_content,q_reg_id,q_reg_date,hit,ispublic,a_content, a_reg_id, a_reg_date;
	public int qandaUpdate(Qanda_dto dto) {
		int result = 0;
		String query = "update homepage_박건일_qanda\r\n" + 
				"set title = '',attach = '',reg_date = '',hit = 0, question = ''\r\n" + 
				"where no = '"+dto.getNo()+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("noticeUpdate() 오류:" + query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	
	//리스트 생성
	public ArrayList<Qanda_dto> getList(String select, String search, int start, int end) {
		ArrayList<Qanda_dto> dtos = new ArrayList<>();
		String query = "select * from(\r\n" + 
				"select tbl.*, rownum as rnum\r\n" + 
				"from\r\n" + 
				"(select a.no, a.q_title, a.q_content, a.q_reg_id, to_char(a.q_reg_date,'yyyy-MM-dd') as reg_date,a.hit,a.ispublic,a.a_reg_id\r\n" + 
				"from homepage_박건일_qanda a, homepage_박건일_member b\r\n" + 
				"where a.q_reg_id = b.id\r\n" + 
				"and "+select+" like '%"+search+"%'\r\n" + 
				"order by a.no desc)tbl)\r\n" + 
				"where rnum >="+start+" and rnum <="+end;
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no = rs.getString(1);
				String q_title = rs.getString(2);
				String q_content = rs.getString(3);
				String q_reg_id = rs.getString(4);
				String q_reg_date = rs.getString(5);
				String hit = rs.getString(6);
				String ispublic = rs.getString(7);
				String a_reg_id = rs.getString(8);
				String rNum = rs.getString(9);
	//업데이트 dto순서: no,q_title,q_content,q_reg_id,q_reg_date,hit,ispublic,a_content, a_reg_id, a_reg_date;
				Qanda_dto dto = new Qanda_dto(no,q_title,q_content,q_reg_id,q_reg_date,hit,ispublic,"", a_reg_id, "");
				dtos.add(dto);
			}
		}catch(SQLException e) {
			System.out.println("getList() 오류:" + query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;
		
	}
	
	
}
