package com.TeamProjects.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.CartDTO;
import com.TeamProjects.mapper.CartMapper;

@Service
public class CartService {

	private ModelAndView mav;
	@Autowired
	private CartMapper camapper;
	
	
	public void cartadd(CartDTO cartdto) { //장바구니 담기
		System.out.println(cartdto);
		camapper.cartadd(cartdto);
	}
	

	public ModelAndView cartView(String mid) { //장바구니 상세보기 페이지
		mav = new ModelAndView();
		ArrayList<CartDTO> cartView = camapper.cartView(mid);
			
		//장바구니 총 가격
		int cartallprice = camapper.cartallprice(mid);
		System.out.println(cartView);
		
		mav.addObject("cartView",cartView);
		mav.addObject("cartallprice",cartallprice);
		
		
		mav.setViewName("market/cart");
		
		return mav;
	}
	
	


	public int cartcount(String loginId) { //장바구니 담긴 물건 갯수
		int cartcount = camapper.cartcount(loginId);
		System.out.println(cartcount+"서비스");
		return cartcount;
	}


	public ModelAndView cartdel(CartDTO cartdto) { //장바구니 항목 삭제
		mav = new ModelAndView();
		camapper.cartdel(cartdto);
		
		mav.setViewName("redirect:/cartView");
		
		return mav;
	}


	public int cartdupli(CartDTO cartdto) {	//장바구니 중복 확인
		int cartdupli = camapper.cartdupli(cartdto);
		
		return cartdupli;
	}


	public ArrayList<CartDTO> cartList(String mid) { //STOREVIEW 페이지에서 보여줄 장바구니 리스트
		ArrayList<CartDTO> cartList = camapper.cartList(mid);
		return cartList;
	}


	public int downcart(CartDTO cartdto) {
		int result = camapper.downcart(cartdto);
		return result;
	}
	public int upcart(CartDTO cartdto) {
		int result = camapper.upcart(cartdto);
		return result;
	}



	




}
