package dao;

import java.util.ArrayList;

import dto.News_dto;

public class Make_dao {

	public static void main(String[] args) {
		News_dao dao = new News_dao();
		ArrayList<News_dto> dtos = dao.getList();

	}

}
