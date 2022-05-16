package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Etc_dto;

public class Etc_dao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//조회수 증가
	public int hitUp(String no) {
		int result = 0;
		String query = "update homepage_박건일_etc\n" + 
				"set hit = hit+1\n" + 
				"where no = '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("hitUp() 오류: " + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	//뷰 생성
	public Etc_dto etcView(String no) {
		Etc_dto dto = null;
		String query = "select title,content,reg_id,reg_name,reg_date,hit\n" + 
				"from homepage_박건일_etc\n" + 
				"where no = '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				String reg_id = rs.getString("reg_id");
				String reg_name = rs.getString("reg_name");
				String reg_date = rs.getString("reg_date");
				String hit = rs.getString("hit");
				dto = new Etc_dto(no,title,content,reg_id,reg_name,reg_date,hit);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("etcView() 오류: " + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}
	
	
	
	//리스트 생성
	public ArrayList<Etc_dto> etcList(String select, String search){
		ArrayList<Etc_dto> dtos = new ArrayList<>();
		String query = "select no,title,content,reg_id,reg_name,reg_date,hit\r\n" + 
				"from homepage_박건일_etc\r\n" + 
				"where "+select+" like '%"+search+"%'\r\n"+
				"order by no desc";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no = rs.getString("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String reg_id = rs.getString("reg_id");
				String reg_name = rs.getString("reg_name");
				String reg_date = rs.getString("reg_date");
				String hit = rs.getString("hit");
				Etc_dto dto = new Etc_dto(no,title,content,reg_id,reg_name,reg_date,hit);
				dtos.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("etcList() 오류: " + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;
	}
	
	
	//저장!
	public int etcSave(Etc_dto dto) {
		int result = 0;
		String query="insert into homepage_박건일_etc\r\n" + 
				"(no,title,content,reg_id,reg_name,reg_date,hit)\r\n" + 
				"values\r\n" + 
				"('"+dto.getNo()+"','"+dto.getTitle()+"','"+dto.getContent()+"','"+dto.getReg_id()+"','"+dto.getReg_name()+"','"+dto.getReg_date()+"',0)";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("etcSave() 오류: " + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	//번호 생성
	public String getMaxNo() {
		String maxNo = "";
		String query = "select nvl(max(no),'E000') as maxno\r\n" + 
				"from homepage_박건일_etc";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				maxNo = rs.getString("maxno");
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("getMaxNo() 오류 : " + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);	
		}
		return maxNo;
	}

}
