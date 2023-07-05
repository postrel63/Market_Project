package com.TeamProjects.mapper;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.CartDTO;

public interface CartMapper {

	public void cartadd(CartDTO cartdto);

	public ArrayList<CartDTO> cartView(String mid);

	public int cartcount(String loginId);

	public int cartdel(CartDTO cartdto);

	public int cartdupli(CartDTO cartdto);

	public int cartallprice(String mid);
	
	public ArrayList<CartDTO> cartList(String mid);

	/* 게시글쓰기 구매목록&상점코드 불러오기 */
	public ArrayList<CartDTO> getWriteInfo(String mid);

	public int downcart(CartDTO cartdto);

	public int upcart(CartDTO cartdto);


}
