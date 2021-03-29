package com.TeamProjects.service;


import java.io.File;
import java.io.IOException;

import java.util.UUID;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.TeamProjects.dto.MemberDTO;
import com.TeamProjects.mapper.MemberMapper;





@Service
public class MemberService {
	private ModelAndView mav;

	@Autowired
	MemberMapper MemberMapper;	

	@Autowired 
	private HttpSession session;

	public String idCheck(String inputMid) {

		String idCheck=MemberMapper.selectIDcheck(inputMid);
		System.out.println("아이디"+idCheck);
		String checkResult=null;
		if(idCheck==null) {
			checkResult="OK";
		}else {
			checkResult="NO";
		}
		return checkResult;
	}

	public ModelAndView memberJoin(MemberDTO memberDTO,RedirectAttributes ra) {
		mav=new ModelAndView();
		String memail=memberDTO.getMemailId()+"@"+memberDTO.getMemailDomain();
		System.out.println("이메일"+memail);
		memberDTO.setMemail(memail);
		String maddress=memberDTO.getMaddr()+" "+memberDTO.getMedetailAddress()+memberDTO.getMextraAddress();
		memberDTO.setMaddress(maddress);
		String mphone=memberDTO.getPnum1()+"-"+memberDTO.getPnum2()+"-"+memberDTO.getPnum3();
		memberDTO.setMphone(mphone);

		int joinresult=MemberMapper.insertJoin(memberDTO);
		System.out.println("회원가입확인"+joinresult);
		if(joinresult>0) {
			ra.addFlashAttribute("msg",memberDTO.getMemailId()+"님 회원가입되었습니다.");
			mav.setViewName("redirect:/loginForm");
		}
		return mav;
	}

	public ModelAndView memberLogin(MemberDTO memberDTO,RedirectAttributes ra) {
		mav=new ModelAndView();
		System.out.println("로그인");
		String Mid=MemberMapper.selectLoginID(memberDTO);
		System.out.println("loginId"+Mid);
		if(Mid!=null) {
			ra.addFlashAttribute("msg","로그인 성공");
			mav.setViewName("redirect:/");
		} else {
			ra.addFlashAttribute("msg","아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.setViewName("redirect:/loginForm");
		}
		session.setAttribute("loginId",Mid);
		return mav;
	}
	// 회원 상세보기
	public ModelAndView memberView(String mid) {
		mav=new ModelAndView();
		MemberDTO memberDTO=MemberMapper.selectView(mid);
		
		mav.addObject("memberDTO",memberDTO);
		mav.setViewName("members/memberView");

		return mav;
	}

	public ModelAndView memberModify(String mid) {
		mav = new ModelAndView();
		MemberDTO memberDTO = MemberMapper.memberView(mid);

		mav.addObject("MemberDTO",memberDTO);
		mav.setViewName("members/memberModifyForm");
		return mav;
	}

	public ModelAndView memberModifyProcess(MemberDTO memberDTO) {
		mav = new ModelAndView();
		int updateResult = MemberMapper.memberModifyProcess(memberDTO);
		System.out.println("mid"+memberDTO.getMid());
		System.out.println("updateResult:"+updateResult);
		mav.setViewName("redirect:/memberView?mid="+memberDTO.getMid());
		return mav;
	}

	public ModelAndView memberDelete(String mid, RedirectAttributes ra) {
		mav=new ModelAndView();

		String savePath="C:\\Users\\kwj\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\TeamProject\\src\\main\\webapp\\resources\\fileUpload\\";
		String mfilename=MemberMapper.mfileSelect(mid);
		File file=new File(savePath+mfilename);
		file.delete(); 

		int deleteResult = MemberMapper.memberDelete(mid);
		System.out.println("deleteResult:"+deleteResult);
		ra.addFlashAttribute("modalmid", mid);
		ra.addFlashAttribute("msg","삭제");

		mav.setViewName("redirect:/");
		return mav;
	}

	public String kakaoLogin(MemberDTO memberDTO) {
		String url = "/";
		session.setAttribute("loginId", memberDTO.getMid());
		session.setAttribute("profileImg", memberDTO.getMfilename());
		System.out.println(memberDTO.getMfilename());
		url = "/";

		return url;
	}

	public String mphoneUpdate(MemberDTO memberDTO) {
		int result = MemberMapper.mphoneUpdate(memberDTO);

		String updateResult = null;
		if (result > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}

	public String memailUpdate(MemberDTO memberDTO) {

		int result = MemberMapper.memailUpdate(memberDTO);

		String updateResult = null;
		if (result > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}

	public String mnameUpdate(MemberDTO memberDTO) {

		int result = MemberMapper.mnameUpdate(memberDTO);

		String updateResult = null;
		if (result > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}

	public String maddressUpdate(MemberDTO memberDTO) {
		int result = MemberMapper.maddressUpdate(memberDTO);

		String updateResult = null;
		if (result > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}

	public String mbirthUpdate(MemberDTO memberDTO) {
		int result = MemberMapper.mbirthUpdate(memberDTO);

		String updateResult = null;
		if (result > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}

	public ModelAndView memberProfileUpload(MemberDTO memberDTO) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		// UUID
		UUID uuid = UUID.randomUUID();

		MultipartFile mfile = memberDTO.getMfile();

		// 저장 경로 설정, 파일 저장
		String mfilename = "";
		String savePath = "C:\\Users\\1\\Desktop\\TeamProjects0131\\src\\main\\webapp\\resources\\profileImg\\";

		//기존에 있던 프로필이미지 파일 삭제
		String oldFilename = MemberMapper.getProfile(memberDTO.getMid());
		File file = new File(savePath+oldFilename);
		file.delete();

		// 새로운 프로필이미지 파일 저장
		if (!mfile.isEmpty()) {
			mfilename = uuid.toString() + "_" + mfile.getOriginalFilename();
			mfile.transferTo(new File(savePath + mfilename));
			session.removeAttribute("profileImg");
			session.setAttribute("profileImg", mfilename);
		}
		memberDTO.setMfilename(mfilename);
		// MEMBERS 테이블 UPDATE

		System.out.println(memberDTO.getMfilename());

		int updateResult = MemberMapper.memberProfileUpload(memberDTO);
		System.out.println("updateResult::" + updateResult);
		// setView = memberView

		mav.setViewName("redirect:/memberView?mid=" + memberDTO.getMid());
		return mav;
	}

	public String getProfile(String mid) {
		String profileImg = "/resources/profileImg/"+MemberMapper.getProfile(mid);
		System.out.println(profileImg);

		return profileImg;
	}

	public String PwCheck(String inputPw, String inputMid) {
		int PwCheck=MemberMapper.selectPwCheck(inputPw, inputMid);
		System.out.println("비밀번호:"+PwCheck);
		String checkResult=null;
		if(PwCheck>0) {
			checkResult="OK";
		}else {
			checkResult="NO";
		}
		return checkResult;
	}

	public ModelAndView PwUpdate(MemberDTO memberDTO,RedirectAttributes ra) {
		mav = new ModelAndView();
		int result = MemberMapper.PwUpdate(memberDTO);
		System.out.println("PwModifyResult:"+result);
		if(result>0) {
			ra.addFlashAttribute("msg","비밀번호 변경 성공");
			session.invalidate();
			mav.setViewName("redirect:/loginForm");
		}else {
			ra.addFlashAttribute("msg","비밀번호 변경 실패");
			mav.setViewName("redirect:/PwModifyForm?mid=\" + memberDTO.getMid()");
		}


		return mav;
	}

	public String memberCheck(String mid) {
		String memberCheck=MemberMapper.memberCheck(mid);
		String Check="";
		if(memberCheck==null) {
			Check="NO";
		}
		else {
			Check="OK";
		}
		System.out.println(Check);
		return Check;
	}

	public String getAreaname(String mid) {
		String getAreaname=MemberMapper.getAreaname(mid);
		System.out.println("주소"+getAreaname);
		return getAreaname;
	}





}
