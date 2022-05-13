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
	
	//리스트 생성
		public ArrayList<Free_dto> getList(){
			ArrayList<Free_dto> dtos = new ArrayList<>();
			String query="select no,title,content,hit,reg_id,reg_name,reg_date\r\n" + 
					"from homepage_박건일_freeboard";
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
