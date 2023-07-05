package com.TeamProjects.mapper;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.CheckDTO;
import com.TeamProjects.dto.CheckDetailDTO;
import com.TeamProjects.dto.MemberDTO;
import com.TeamProjects.dto.OrderManagementDTO;
import com.TeamProjects.dto.OrderManagementListDTO;
import com.TeamProjects.dto.OrderlistDTO;

public interface OrderManagementMapper {

	public ArrayList<OrderlistDTO> orderlist(String stcode);

	public OrderManagementDTO orderdetail(String chcode);

	public ArrayList<OrderManagementListDTO> orderdetailList(String chcode);

	public int newToafoot(OrderManagementDTO updatedto);

	public ArrayList<OrderlistDTO> afootorderlist(String stcode);

	public void orderdeleteinfo(String chcode);

	public void orderdeletelist(String chcode);

	public int afootToStart(OrderManagementDTO updatedto);

	public int deliEnd(OrderManagementDTO updatedto);

	public ArrayList<OrderlistDTO> orderEnd(String stcode);

	public OrderlistDTO neworder(String chcode);

	public OrderManagementDTO arrivetime(OrderManagementDTO updatedto);

	public ArrayList<OrderManagementDTO> myorderlist(String loginId);







}
