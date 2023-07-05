package com.TeamProjects.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.CartDTO;
import com.TeamProjects.dto.MemberDTO;
import com.TeamProjects.dto.ProductsDTO;
import com.TeamProjects.service.CartService;

@Controller
public class CartController {
	
	private ModelAndView mav;
	@Autowired
	private CartService caservice;
	
	
		@RequestMapping(value="/cartadd") 
		public @ResponseBody String cartadd(CartDTO cartdto,HttpSession session ) {
			
			String loginId = (String) session.getAttribute("loginId");
			cartdto.setMid(loginId);
			String result ="";
			
			int cartdupli = caservice.cartdupli(cartdto);
			result="dupli";
			if(cartdupli == 0) {
			caservice.cartadd(cartdto);
			result="add";
			}
			return result;
			
		}
		
		@RequestMapping(value="/cartView") //장바구니 상세보기 페이지
		public ModelAndView cartView(HttpSession session) {
			mav = new ModelAndView();
			String mid = (String) session.getAttribute("loginId");
			
			//세션값이 없는 경우 페이지로 바로이동
			if(mid==null) {
				mav.setViewName("market/cart");
			}else {
				mav = caservice.cartView(mid);
			}
			//장바구니 총 가격까지 같이 페이지로 dto에 담아서 이동
			
			return mav;
			
		}
		
		
		@RequestMapping(value="/cartcount") //장바구니에 담긴 물건 갯수
		public @ResponseBody int cartcount(HttpSession session) {
			System.out.println("cartcount");
			String loginId = (String) session.getAttribute("loginId");
			int result =caservice.cartcount(loginId);
			System.out.println(result+"갯수");
			return result;
			
		}
		
		@RequestMapping(value="/cartdel") //장바구니 항목 삭제
		public ModelAndView cartdel(CartDTO cartdto,HttpSession session) { //mid랑 prcode//두 개 이상의 파라미터를 넘길때 @param 사용해야함 ->다시알아보기
			System.out.println(cartdto);
			String mid = (String) session.getAttribute("loginId");
			cartdto.setMid(mid);
			mav =caservice.cartdel(cartdto);
			
			return mav;
			
		}
		
		// 장바구니 리스트 
		@RequestMapping(value="/cartList")
		public @ResponseBody ArrayList<CartDTO> cartList(HttpSession session){
			String mid = (String) session.getAttribute("loginId");
			ArrayList<CartDTO> cartresult = caservice.cartList(mid);
			
			return cartresult;
			
		}
		
		
		@RequestMapping(value="/downcart")
		public @ResponseBody int downcart(HttpSession session,CartDTO cartdto){
			String mid = (String) session.getAttribute("loginId");
			cartdto.setMid(mid);
			int result = caservice.downcart(cartdto);
			
			return result;
			
		}
		@RequestMapping(value="/upcart")
		public @ResponseBody int upcart(HttpSession session,CartDTO cartdto){
			String mid = (String) session.getAttribute("loginId");
			cartdto.setMid(mid);
			int result = caservice.upcart(cartdto);
			
			return result;
			
		}
		
		
		
		
	

}
