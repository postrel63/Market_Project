package com.TeamProjects.mapper;

import org.apache.ibatis.annotations.Param;

import com.TeamProjects.dto.MemberDTO;

public interface MemberMapper {
	
	public String selectIDcheck(String inputMid);

	public int insertJoin(MemberDTO memberDTO);

	public String selectLoginID(MemberDTO memberDTO);

	public String getProfile(String mid);

	public MemberDTO selectView(String mid);

	public MemberDTO memberView(String mid);

	public int memberModifyProcess(MemberDTO memberDTO);

	public int memberDelete(String mid);
	
	public int mphoneUpdate(MemberDTO memberDTO);

	public int memailUpdate(MemberDTO memberDTO);
	
	public int mnameUpdate(MemberDTO memberDTO);

	public int maddressUpdate(MemberDTO memberDTO);

	public int mbirthUpdate(MemberDTO memberDTO);

	public int memberProfileUpload(MemberDTO memberDTO);
	
	public int selectPwCheck(@Param("inputPw") String inputPw, @Param("inputMid") String inputMid);

	public String mfileSelect(String mid);

	public int selectminfo(MemberDTO memberDTO);

	public int PwUpdate(MemberDTO memberDTO);

	public String memberCheck(String mid);

	public String getAreaname(String mid);

	public MemberDTO getmemberinfo(String loginId);
	
	/* 댓글사진출력 */
	public String getMfilename(int bonum);
}
