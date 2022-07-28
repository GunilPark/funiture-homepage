package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.News_dto;


public class News_dao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public String getMaxNo() {
		String maxNo = "";
		String query = "select nvl(max(no),'n000') from homepage_박건일_news";
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
	
	public int Qanda(News_dto dto) {
	int result = 0;
	String query="insert into homepage_박건일_news\r\n" + 
			" (no,title,content,attach,reg_id,reg_date)\r\n" + 
			" values\r\n" + 
			" ('"+dto.getNo()+"','"+dto.getTitle()+"','"+dto.getContent()+"','"+dto.getAttach()+"','"+dto.getReg_id()+"','"+dto.getReg_date()+"')" ;
	try {
		con = DBConnection.getConnection();
		ps = con.prepareStatement(query);
		result = ps.executeUpdate();
	}catch(SQLException e) {
		System.out.println("newsSave() 오류" + query);
		e.printStackTrace();
	}finally {
		DBConnection.closeDB(con, ps, rs);
	}
	return result;
	}

	public ArrayList<News_dto> getList() {
		ArrayList<News_dto> dtos = new ArrayList<>();
		String query = "select no,title,content,attach,hit,reg_id,to_char(reg_date,'yyyy-MM-dd')\r\n" + 
				"from homepage_박건일_news";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String attach = rs.getString(4);
				String hit = rs.getString(5);
				String reg_id = rs.getString(6);
				String reg_date = rs.getString(7);
				News_dto dto = new News_dto(no, title, content, attach, hit, reg_id, reg_date);
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

	
	//조회수 증가
	public void setHitCount(String no) {
		String query = "update homepage_박건일_news\r\n" + 
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
	
	
	//뷰생성
	public News_dto getView(String no) {
		News_dto dto = null;
		String query = "select a.no, a.title,a.content, a.attach, b.name,to_char(a.reg_date,'yyyy-MM-dd') as reg_date,a.hit\r\n" + 
				"from homepage_박건일_news a, homepage_박건일_member b\r\n" + 
				"where a.reg_id = b.id\r\n" + 
				"and a.no = '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				no = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String attach = rs.getString(4);
				String reg_id = rs.getString(5);
				String reg_date = rs.getString(6);
				String hit = rs.getString(7);		
				//dto의 순서: no,title,content,attach,hit,reg_id,reg_date
				dto = new News_dto(no,title,content,attach,hit,reg_id,reg_date);
			}	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;		
	}
	//삭제
	public int getDelete(String no) {
		int result =0;
		String query="delete from homepage_박건일_news\r\n" + 
				"where no ='"+no+"'"; 
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
	
	
	// 등록
	public int newsSave(News_dto dto){
		int result =0;
		String query="insert into homepage_박건일_news\r\n" + 
				//no,title,content,attach,hit,reg_id,reg_date
				" (no,title,content,attach,reg_id,reg_date)\r\n" + 
				" values\r\n" + 
				" ('"+dto.getNo()+"','"+dto.getTitle()+"','"+dto.getContent()+"','"+dto.getAttach()+"','"+dto.getReg_id()+"','"+dto.getReg_date()+"')" ; 
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result  = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("noticeSave() 오류:"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		return result;
	}
	
	//업데이트
	public int newsUpdate(News_dto dto) {
		int result = 0;
		String query = "update homepage_박건일_news\r\n" + 
				"set title = '"+dto.getTitle()+"',attach = '"+dto.getAttach()+"',reg_date = '"+dto.getReg_date()+"',hit = 0, content = '"+dto.getContent()+"'\r\n" + 
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
	public ArrayList<News_dto> getList(String select, String search, int start, int end) {
		ArrayList<News_dto> dtos = new ArrayList<>();
		String query = "select * from(\r\n" + 
				"select tbl.*, rownum as rnum\r\n" + 
				"from\r\n" + 
				"(select a.no, a.title, a.attach, b.name, to_char(a.reg_date,'yyyy-MM-dd') as reg_date,a.hit\r\n" + 
				"from homepage_박건일_news a, homepage_박건일_member b\r\n" + 
				"where a.reg_id = b.id\r\n" + 
				"and "+select+" like '%"+search+"%'\r\n" + 
				"order by a.no desc)tbl)\r\n" + 
				"where rnum >="+start+" and rnum <="+end;
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no = rs.getString(1);
				String title = rs.getString(2);
				String attach = rs.getString(3);
				String reg_id = rs.getString(4);
				String reg_date = rs.getString(5);
				String hit = rs.getString(6);
				String rNum = rs.getString(7);
				//dto의 순서: no,title,content,attach,hit,reg_id,reg_date
				News_dto dto = new News_dto(no, title, "", attach, hit, reg_id, reg_date);
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
	
	//목록조회 전체
	public int getTotalCount(String select,String search) {
		int result = 0;
		String query = "select count(*)\r\n" + 
				"from homepage_박건일_news a,homepage_박건일_member b\r\n" + 
				"where a.reg_id = b.id\r\n" + 
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
	
}












