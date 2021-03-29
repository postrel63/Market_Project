package com.TeamProjects.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.OrderManagementDTO;
import com.TeamProjects.dto.OrderManagementListDTO;
import com.TeamProjects.dto.OrderlistDTO;
import com.TeamProjects.dto.StoreDTO;
import com.TeamProjects.mapper.CheckMapper;
import com.TeamProjects.mapper.OrderManagementMapper;
import com.TeamProjects.mapper.StoreMapper;


@Service
public class OrderManagementService {
	
	private ModelAndView mav;
	@Autowired
	private OrderManagementMapper ommapper;
	@Autowired
	private StoreMapper stmapper;
	@Autowired
	private CheckMapper chmapper;
	
	
	//신규주문목록 리스트
	public ArrayList<OrderlistDTO> orderlist(String stcode) {
		System.out.println("orderlist"+stcode);
		ArrayList<OrderlistDTO> orderlist = ommapper.orderlist(stcode);
		System.out.println(orderlist);
		
//		mav.addObject("orderlist",orderlist);
//		mav.setViewName("market/orderCheck");
//		
		return orderlist;
	}
	
	public ArrayList<OrderlistDTO> orderEnd(String stcode) {
		ArrayList<OrderlistDTO> orderEnd = ommapper.orderEnd(stcode);
		return orderEnd;
	}

	public  OrderManagementDTO orderdetail(String chcode) {

		//주문 상세보기
		OrderManagementDTO orderdetail= ommapper.orderdetail(chcode);
		System.out.println("orderdetail ::" + orderdetail);
		
	
		//${orderdetail.chcode}
		//${orderdetail.allprprice}
		//${orderdetail.chmemo}
		//${orderdetail.prname}
		//${orderdetail.prcount}
		//${orderdetail.prprice}
		//${orderdetail.receiveaddr}
		//${orderdetail.receivepn}
		//${orderdetail.chdate}
		//${orderdetail.stname}
		//${orderdetail.deliway}
		
	
		
		return orderdetail;
	}

	public ArrayList<OrderManagementListDTO> orderdetailList(String chcode) {
		//주문 목록 상세보기
		ArrayList<OrderManagementListDTO> orderdetailList= ommapper.orderdetailList(chcode);
		System.out.println(orderdetailList);
		
		//${orderdetailList.prname}
		//${orderdetailList.prcount}
		//${orderdetailList.allprprice}
				
		return orderdetailList;
	}

	//주문 접수중 -> 배달 진행중  
	public int newToafoot(OrderManagementDTO updatedto) {
		System.out.println("updatedto ::"+updatedto);
		int result = ommapper.newToafoot(updatedto);
		
		return result;
	}

	//진행중인 주문리스트
	public ArrayList<OrderlistDTO> afootorderlist(String stcode) {
		ArrayList<OrderlistDTO> afootorderlist = ommapper.afootorderlist(stcode);
		return afootorderlist;
	}

	//주문삭제
	public void orderdelete(String chcode) {
		ommapper.orderdeletelist(chcode);
		ommapper.orderdeleteinfo(chcode);
		
	}
	//배달진행중->배달중
	public int afootToStart(OrderManagementDTO updatedto) {
		int result = ommapper.afootToStart(updatedto);
		
		return result;
	}
	//배달중->배달완료
	public int deliEnd(OrderManagementDTO updatedto) {
		int result = ommapper.deliEnd(updatedto);
		return result;
	}

	//새로운 주문 실시간 추가
	public OrderlistDTO neworder(String chcode) {
		OrderlistDTO neworder = ommapper.neworder(chcode);
		
		return neworder;
	}

	public ArrayList<OrderManagementDTO> myorderlist(String loginId) {
		ArrayList<OrderManagementDTO> myorderlist = ommapper.myorderlist(loginId);
		return myorderlist;
	}

	public ModelAndView getstname(StoreDTO storedto) {
		mav = new ModelAndView();
		String stname = chmapper.getstname(storedto);
		System.out.println("가게이름"+stname);
		String loginId = storedto.getBid();
		ArrayList<StoreDTO> myStorelist = stmapper.myStorelist(loginId);
		System.out.println(myStorelist);
		mav.addObject("myStorelist",myStorelist);
		mav.addObject("stname",stname);
		mav.setViewName("market/orderFinish");
		
		
		return mav;
	}

		
		


	

}
