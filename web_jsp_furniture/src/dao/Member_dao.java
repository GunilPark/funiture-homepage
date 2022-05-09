package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBConnection;
import dto.Member_dto;

public class Member_dao {
	Connection 			con = null;
	PreparedStatement 	ps  = null;
	ResultSet 			rs  = null;
	
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
				"    hobby_sports='"+dto.getHobby_sports()+"'	\r\n" + 
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
		String query="select id,name,password,area,address,\r\n" + 
				"    tell_1,tell_2,tell_3,\r\n" + 
				"    gender,hobby_travel,hobby_reading,\r\n" + 
				"    hobby_sports,\r\n" + 
				"    to_char(reg_date,'yyyy-MM-dd') as reg_date\r\n" + 
				"from homepage_박건일_member\r\n" + 
				"where id ='"+id+"'";
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String name           = rs.getString("name");
				String password       = rs.getString("password");
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
				
				dto = new Member_dto(id,name,password,area,address,
									tell_1,tell_2,tell_3,gender,
									hobby_travel,hobby_reading,hobby_sports,
									reg_date,"","","");
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
				" (id,name,password,area,address,\r\n" + 
				" tell_1,tell_2,tell_3,\r\n" + 
				" gender,hobby_travel,hobby_reading,\r\n" + 
				" hobby_sports,reg_date)\r\n" + 
				" values\r\n" + 
				" ('"+dto.getId()+"','"+dto.getName()+"','"+dto.getPassword()+"','"+dto.getArea()+"','"+dto.getAddress()+"',\r\n" + 
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






