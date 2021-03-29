package com.TeamProjects.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.CheckDTO;
import com.TeamProjects.dto.CheckDetailDTO;
import com.TeamProjects.dto.StoreDTO;
import com.TeamProjects.mapper.StoreMapper;
import com.TeamProjects.service.CheckService;

@Controller
public class CheckController {

	private ModelAndView mav;
	@Autowired
	private CheckService chservice;
	@Autowired
	private StoreMapper stmapper;
	
	//주문서 페이지 // 주문회원 정보를 같이 불러옴
	@RequestMapping(value="/cartorder")
	public ModelAndView cartorder(HttpSession session,String stcode) { // 세션 받아오기
		System.out.println("cartorder");
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(loginId);
		mav= chservice.orderinfo(loginId,stcode); //세션키를 이용해서 주문자의 정보와 가게 정보 가져오기
		
		
//		return "market/order";
		return mav;
		
	}
	
	//주문 완료 페이지,사용자 입력 정보를 주문서리스트 테이블에 저장하고
	//세션을 통해 장바구니에 있는 상품들을 insert select 문을 통해 주문서상세보기 테이블에 저장. 
	@RequestMapping(value="/payment")
	public @ResponseBody List<CheckDTO> cartorder(CheckDTO checkdto,CheckDetailDTO chdetaildto,HttpSession session) {
		System.out.println("cartorder controller");
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(checkdto);
		
		//달력을 이용 랜덤주문코드 생성
		 Calendar cal = Calendar.getInstance();
		 int year = cal.get(Calendar.YEAR);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		 
		 for(int i = 1; i <= 6; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 
		 String ordercode = ymd + "_" + subNum;
		
		 //주문서 리스트 서비스
		checkdto.setChcode(ordercode);
		checkdto.setMid(loginId);
		mav = chservice.insertorder(checkdto);
		
		//주문서 상세보기 서비스
		chdetaildto.setChcode(ordercode);
		chdetaildto.setMid(loginId);
		mav = chservice.insertorderdetail(chdetaildto);
		
		//장바구니 비우기
		chservice.deletecart(loginId);
		
		//모든 주문이 끝나면 주문정보를 다시 return
		
		List<CheckDTO> result = new ArrayList<CheckDTO>();
		result.add(checkdto);
		System.out.println("result::"+result);
		/* mav.setViewName("market/orderinquiry"); */
		
		return result;
	}
	//주문 결과
	@RequestMapping(value="/orderinquiry")
	public ModelAndView orderinquiry(HttpSession session) {
		
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(loginId);
		if(loginId==null) {
			mav.setViewName("market/paymentFinish");
		}else {
			mav = chservice.orderinquiry(loginId);
		}
		
		
		return mav;
		
	}
	//주문확인
	@RequestMapping(value="/orderCheck")
	public ModelAndView  orderCheck(HttpSession session,StoreDTO storedto) {
		mav = new ModelAndView();
		System.out.println("orderCheck controller");
		String bid = (String)session.getAttribute("loginId");
		String stcode = (String)session.getAttribute("stcode");
		storedto.setStcode(stcode);
		storedto.setBid(bid);
		System.out.println(bid);
		System.out.println(stcode);
		
		//가게 이름
		mav = chservice.getstname(storedto);
		
		return mav;
		
	}
	
	/* 주문 목록 페이지 */
	@RequestMapping(value= "/MyListForm")
	public  String MyListForm() {

		return "members/myListForm";
	}
	
	@RequestMapping(value="/list") //장바구니 상세보기 페이지
	public @ResponseBody ArrayList<CheckDTO> MyList(HttpSession session) {
		String mid = (String) session.getAttribute("loginId");
		ArrayList<CheckDTO> result = chservice.myList(mid);
		return result;
		
	}
	
}
