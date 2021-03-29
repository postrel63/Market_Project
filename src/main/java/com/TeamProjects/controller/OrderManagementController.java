package com.TeamProjects.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.OrderManagementDTO;
import com.TeamProjects.dto.OrderManagementListDTO;
import com.TeamProjects.dto.OrderlistDTO;
import com.TeamProjects.dto.StoreDTO;
import com.TeamProjects.service.OrderManagementService;



@Controller
public class OrderManagementController {

	private ModelAndView mav;
	@Autowired
	private OrderManagementService omservice;
	
	//주문들어온 신규목록을 보여줌  in>가게 코드, out>주문번호,주문갯수,주문시간
	@RequestMapping(value="/orderlist")
	public @ResponseBody ArrayList<OrderlistDTO> orderlist(String stcode) {
		System.out.println(stcode);
		System.out.println("orderlist controller");
		ArrayList<OrderlistDTO> orderlist =omservice.orderlist(stcode);
		
		System.out.println(orderlist);
		return orderlist;
	}
	
	//주문완료를 보여줌 
	@RequestMapping(value="/orderEnd")
	public @ResponseBody ArrayList<OrderlistDTO> orderEnd(String stcode) {
		System.out.println(stcode);
		System.out.println("orderEnd controller");
		ArrayList<OrderlistDTO> orderEnd =omservice.orderEnd(stcode);
		
		System.out.println(orderEnd);
		return orderEnd;
	}
	
	//주문 클릭 ->상세보기  in>주문코드 out>요청사항 고객정보
	@RequestMapping(value="/orderdetail")
	public @ResponseBody OrderManagementDTO orderdetail(String chcode){
		System.out.println(chcode);
		chcode = chcode.replaceFirst("^([0-9]{8})([0-9]{6})$","$1_$2");
		System.out.println(chcode);
		
		 OrderManagementDTO orderdetail = omservice.orderdetail(chcode);
		
		 
		 return orderdetail;
		
	}
	//주문 클릭 ->상세보기  in>주문코드 out>주문내역
	@RequestMapping(value="/orderdetailList")
	public @ResponseBody ArrayList<OrderManagementListDTO> orderdetailList(String chcode){
		System.out.println(chcode);
		chcode = chcode.replaceFirst("^([0-9]{8})([0-9]{6})$","$1_$2");
		System.out.println(chcode);
		
		ArrayList<OrderManagementListDTO> orderdetailList = omservice.orderdetailList(chcode);
		
		
		return orderdetailList;
		
	}
	
	// 주문접수중을 배달준비중으로 변경 in>delitime chcode session에 있는 stcode
	@RequestMapping(value="/newToafoot")
	public @ResponseBody int newToafoot(HttpSession session,OrderManagementDTO updatedto) {
		System.out.println("update new to afoot");
		String stcode = (String)session.getAttribute("stcode");
		System.out.println(stcode);
		updatedto.setStcode(stcode);
		System.out.println(updatedto);
		int result = omservice.newToafoot(updatedto);
		
		return result;
	}
	
	//진행주문건 
	@RequestMapping(value="/afootorderlist")
	public @ResponseBody ArrayList<OrderlistDTO> orderlistafoot(String stcode){
		System.out.println(stcode);
		ArrayList<OrderlistDTO> afootorderlist = omservice.afootorderlist(stcode);
		
		return afootorderlist;
		
	}
	
	// 배달준비중을 배달중으로 변경 in>
	@RequestMapping(value="/afootToStart")
	public @ResponseBody int afootToStart(HttpSession session,OrderManagementDTO updatedto) {
		System.out.println("update afoot To Start");
		String stcode = (String)session.getAttribute("stcode");
		System.out.println(stcode);
		updatedto.setStcode(stcode);
		System.out.println(updatedto);
		int result = omservice.afootToStart(updatedto);
		
		return result;
	}
	
	// 배달중을 배달완료으로 변경 in>
	@RequestMapping(value="/deliEnd")
	public @ResponseBody int deliEnd(HttpSession session,OrderManagementDTO updatedto) {
		System.out.println("update afoot To Start");
		String stcode = (String)session.getAttribute("stcode");
		System.out.println(stcode);
		updatedto.setStcode(stcode);
		System.out.println(updatedto);
		int result = omservice.deliEnd(updatedto);
		
		return result;
	}
	
	//주문 삭제
	@RequestMapping(value="/orderdelete")
	public @ResponseBody void orderdelete(String chcode) {
		System.out.println("주문삭제 ::"+chcode);
		omservice.orderdelete(chcode);
		
	}
	
	//주문완료건
		@RequestMapping(value="/orderFinish")
		public ModelAndView orderCheck(HttpSession session,StoreDTO storedto) {
			mav = new ModelAndView();
			
			String loginId = (String)session.getAttribute("loginId");
			String stSession = (String)session.getAttribute("stcode");
			System.out.println("가게코드 세션"+stSession);
			String bid = (String)session.getAttribute("loginId");
			String stcode = (String)session.getAttribute("stcode");
			storedto.setStcode(stcode);
			storedto.setBid(bid);
			mav = omservice.getstname(storedto);
			
			
			return mav;
			
		}
	
	//가게 변경
		@RequestMapping(value="/changeStore")
		public @ResponseBody void changeStore(HttpSession session, String stcode) {
			System.out.println("변경할 stcode ::"+stcode);
			session.removeAttribute("stcode");
			session.setAttribute("stcode",stcode);
		}
		
		//주문이 실시간으로 추가되도록
		@RequestMapping(value="/newmenuappend")
		public @ResponseBody OrderlistDTO newmenuappend(HttpSession session, String chcode) {
			System.out.println("newmenuappend"+chcode);
			
			OrderlistDTO neworder = omservice.neworder(chcode);
			System.out.println(neworder);
			return neworder;
		}
	
		// 내 주문
		@RequestMapping(value="/myorderlist")
		public @ResponseBody ArrayList<OrderManagementDTO> myorderlist(HttpSession session) {
			System.out.println("myorderlist");
			String loginId = (String)session.getAttribute("loginId");
			ArrayList<OrderManagementDTO> myorderlist = omservice.myorderlist(loginId);
			System.out.println(myorderlist);
			return myorderlist;
		}
		
		
		
	
	
}
