package dto;

public class Member_dto {
	private String id,name,password,area,address,tell_1,tell_2,tell_3,
				    gender,hobby_travel,hobby_reading,hobby_sports,
				    reg_date,level_gubun,exit_gubun,exit_date;
	private int pw_lenght;
	
	public Member_dto(String id, String name, String area, String reg_date, String level_gubun) {
		this.id = id;
		this.name = name;
		this.area = area;
		this.reg_date = reg_date;
		this.level_gubun = level_gubun;
	}
	
	
	public Member_dto(String id, String name, String password, int pw_lenght, String area, String address, String tell_1,
			String tell_2, String tell_3, String gender, String hobby_travel, String hobby_reading, String hobby_sports,
			String reg_date, String level_gubun, String exit_gubun, String exit_date) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.pw_lenght = pw_lenght;
		this.area = area;
		this.address = address;
		this.tell_1 = tell_1;
		this.tell_2 = tell_2;
		this.tell_3 = tell_3;
		this.gender = gender;
		this.hobby_travel = hobby_travel;
		this.hobby_reading = hobby_reading;
		this.hobby_sports = hobby_sports;
		this.reg_date = reg_date;
		this.level_gubun = level_gubun;
		this.exit_gubun = exit_gubun;
		this.exit_date = exit_date;
	}

	
	
	public int getPw_lenght() {
		return pw_lenght;
	}


	public void setPw_lenght(int pw_lenght) {
		this.pw_lenght = pw_lenght;
	}


	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public String getArea() {
		return area;
	}

	public String getAddress() {
		return address;
	}

	public String getTell_1() {
		return tell_1;
	}

	public String getTell_2() {
		return tell_2;
	}

	public String getTell_3() {
		return tell_3;
	}

	public String getGender() {
		return gender;
	}

	public String getHobby_travel() {
		return hobby_travel;
	}

	public String getHobby_reading() {
		return hobby_reading;
	}

	public String getHobby_sports() {
		return hobby_sports;
	}

	public String getReg_date() {
		return reg_date;
	}

	public String getLevel_gubun() {
		return level_gubun;
	}

	public String getExit_gubun() {
		return exit_gubun;
	}

	public String getExit_date() {
		return exit_date;
	}


	
	/*
id,name,password,area,address,tell_1,tell_2,tell_3,
gender,hobby_travel,hobby_reading,hobby_sports,
reg_date,level_gubun,exit_gubun,exit_date
 
 
id
name
password
area
address
tell_1
tell_2
tell_3
gender
hobby_travel
hobby_reading
hobby_sports
reg_date
level_gubun
exit_gubun
exit_date	

	 */
}
