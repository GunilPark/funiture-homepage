package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Free_dto;

public class Free_dao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 번호 조회
	public String getMaxNo() {
		String no="";
		String query =" select nvl(max(no),'F000') "+
		              " from homepage_박건일_freeboard";
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
	
	// 게시물 등록
		public int freeSave(Free_dto dto) {
			int result = 0;
			String query ="INSERT INTO homepage_박건일_freeboard\r\n" + 
					"(no,title,content,hit,reg_id,reg_name,reg_date)\r\n" + 
					"values\r\n" + 
					"('"+dto.getNo()+"','"+dto.getTitle()+"','"+dto.getContent()+"',0,'"+dto.getReg_id()+"','"+dto.getReg_name()+"','"+dto.getReg_date()+"')";
			try{
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("query:" + query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
				
			return result;
		}
		
		//목록조회 전체
		public int getTotalCount(String select,String search) {
			int result = 0;
			String query = "select count(*)\r\n" + 
					"from homepage_박건일_freeboard\r\n" + 
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
		
		//뷰생성
		public Free_dto getView(String no) {
			Free_dto dto = null;
			String query = "select no, title,content,hit,reg_id,reg_name,to_char(reg_date,'yyyy-MM-dd') as reg_date\r\n" + 
					"from homepage_박건일_freeboard\r\n" + 
					"where no = '"+no+"'";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				if(rs.next()) {
					no = rs.getString("no");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String hit = rs.getString("hit");
					String reg_id = rs.getString("reg_id");
					String reg_name = rs.getString("reg_name");
					String reg_date = rs.getString("reg_date");		
					//dto의 순서: no,title,content,hit,reg_id,reg_name,reg_date
					dto = new Free_dto(no,title,content,hit,reg_id,reg_name,reg_date);
				}	
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("getView() 오류-free : " + query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return dto;		
		}
		//삭제
		public int getDelete(String no) {
			int result = 0;
			String query = "delete from homepage_박건일_freeboard\r\n" + 
					"where no = '"+ no +"'";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("getDelete() 오류!:" + query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}

			System.out.println(query);
			return result;
		}
		
		
		//조회수 증가
		public void setHitCount(String no) {
			String query = "update homepage_박건일_freeboard\r\n" + 
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
	//업데이트
		public int freeUpdate(Free_dto dto) {
			int result = 0;
			String query = "update homepage_박건일_freeboard\r\n" + 
					"set title = '"+dto.getTitle()+"',content ='"+dto.getContent()+"',reg_date ='"+dto.getReg_date()+"',hit=0\r\n" + 
					"where no = '"+dto.getNo()+"'";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("freeUpdate() 오류: " + query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return result;
		}
	//삭제
		public int freeDelete(String no) {
			int result = 0;
			String query = "delete from homepage_박건일_freeboard\r\n" + 
					"where no = '"+no+"'";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("freeDelete() 오류 :" + query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			
			return result;
		}
		
		
	//리스트 생성
		public ArrayList<Free_dto> getList(String select,String search,int start,int end){
			ArrayList<Free_dto> dtos = new ArrayList<>();
			String query="select * from(\r\n" + 
					"select tbl.*, rownum as rnum\r\n" + 
					"from\r\n" + 
					"(select no,title,content,hit,reg_id,reg_name,to_char(reg_date,'yyyy-MM-dd') as reg_date\r\n" + 
					"from homepage_박건일_freeboard\r\n" + 
					"where "+select+" like '%"+search+"%' \r\n" + 
					"order by no desc)tbl) \r\n" + 
					"where rnum >="+start+" and rnum <="+end;
			try{
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String no = rs.getString("no");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String hit = rs.getString("hit");
					String reg_id = rs.getString("reg_id");
					String reg_name = rs.getString("reg_name");
					String reg_date = rs.getString("reg_date");
					Free_dto dto = new Free_dto(no,title,content,hit,reg_id,reg_name,reg_date);
					dtos.add(dto);
				}
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("query:" + query);
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return dtos;
		}
	
	
}
