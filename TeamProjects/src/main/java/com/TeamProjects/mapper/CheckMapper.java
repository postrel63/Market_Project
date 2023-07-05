package com.TeamProjects.mapper;

import java.util.ArrayList;

import com.TeamProjects.dto.CheckDTO;
import com.TeamProjects.dto.CheckDetailDTO;
import com.TeamProjects.dto.MemberDTO;
import com.TeamProjects.dto.StoreDTO;

public interface CheckMapper {

	public int insertorder(CheckDTO checkdto);

	public int insertorderdetail(CheckDetailDTO chdetaildto);

	public void deletecart(String loginId);

	public int cartallcount(String mid);

	public String getstname(StoreDTO storedto);

	public ArrayList<CheckDTO> myList(String mid);





}
