package com.TeamProjects.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.CheckDTO;
import com.TeamProjects.dto.CheckDetailDTO;
import com.TeamProjects.dto.MemberDTO;
import com.TeamProjects.dto.StoreDTO;
import com.TeamProjects.mapper.CartMapper;
import com.TeamProjects.mapper.CheckMapper;
import com.TeamProjects.mapper.MemberMapper;
import com.TeamProjects.mapper.StoreMapper;

@Service
public class CheckService {

	private ModelAndView mav;
	@Autowired
	private CheckMapper chmapper;
	@Autowired
	private MemberMapper membermapper;
	@Autowired
	private CartMapper camapper;
	@Autowired
	private StoreMapper stmapper;
	
	public ModelAndView orderinfo(String loginId,String stcode) { //주문 페이지에 사용자 정보 불러오기
	mav = new ModelAndView();
	MemberDTO memberinfo = membermapper.getmemberinfo(loginId);
	
	//store 정보
	StoreDTO storeDTO = stmapper.storeView(stcode); 
	System.out.println(storeDTO);
	
	int cartallprice = camapper.cartallprice(loginId);
	mav.addObject("cartallprice",cartallprice);
	
	mav.addObject("storeView",storeDTO);
	mav.addObject("memberinfo",memberinfo);
	mav.setViewName("market/order");
	System.out.println(memberinfo);
	
	return mav; 
	}
	
	//결제 정보를 주문서 테이블에 저장
	public ModelAndView insertorder(CheckDTO checkdto) {
		mav = new ModelAndView();
		System.out.println("checkservice insertorder");
		//총 가격
		int cartallprice = camapper.cartallprice(checkdto.getMid());
		checkdto.setPrallprice(cartallprice);
		//총 갯수
		int cartallcount = chmapper.cartallcount(checkdto.getMid());
		checkdto.setPrallcount(cartallcount);
		
		
		MemberDTO memberinfo = membermapper.getmemberinfo(checkdto.getMid());
		//새로운 배송지(newaddr) 인 경우
		if(checkdto.getSelectaddr().equals("newaddr")) {
			System.out.println("if newaddr");
			checkdto.setReceiveaddress("("+checkdto.getReceivepostcode()+")"+checkdto.getReceiveaddr()+","+checkdto.getReceivedetailaddr());
			System.out.println(checkdto.getReceiveaddress());
			System.out.println("새로운배송지: "+checkdto);
			
			
			//기본 배송지(defaultaddr)인 경우
		}else{
			System.out.println("defaultaddr");
			checkdto.setReceivename(memberinfo.getMname());
			checkdto.setReceivepn(memberinfo.getMphone());
			checkdto.setReceiveaddress(memberinfo.getMaddress());
			System.out.println("기본배송지: "+checkdto);
		}
		int insertResult = chmapper.insertorder(checkdto);
		
		
		
		return mav;
	}
	
	//주문서 상세보기 
	public ModelAndView insertorderdetail(CheckDetailDTO chdetaildto) {
		mav = new ModelAndView();
		System.out.println("주문서 상세보기"+chdetaildto);
		int insertResult = chmapper.insertorderdetail(chdetaildto);
		
		return mav;
	}
	
	//장바구니 비우기
	public void deletecart(String loginId) {
		chmapper.deletecart(loginId);
	}

	public ModelAndView orderinquiry(String loginId) {
		// TODO Auto-generated method stub
		return null;
	}

	//가게 이름
	public ModelAndView getstname(StoreDTO storedto) {
		mav = new ModelAndView();
		System.out.println("getstname service");
		System.out.println(storedto);
		System.out.println("getstname service2");
		System.out.println(storedto.getBid());
		System.out.println(storedto.getStcode());
		String stname = chmapper.getstname(storedto);
		System.out.println("가게이름"+stname);
		String loginId = storedto.getBid();
		ArrayList<StoreDTO> myStorelist = stmapper.myStorelist(loginId);
		System.out.println(myStorelist);
		mav.addObject("myStorelist",myStorelist);
		
		
		mav.addObject("stname",stname);
		mav.setViewName("market/orderCheck");
		
		
		return mav;
	}

	public ArrayList<CheckDTO> myList(String mid) {
		ArrayList<CheckDTO> myList = chmapper.myList(mid);
		return myList;
	}

	

}
