package com.TeamProjects.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.TeamProjects.dto.MemberDTO;
import com.TeamProjects.service.MemberService;



@Controller
public class MemberController {

	private ModelAndView mav;

	@Autowired
	HttpSession session;
	@Autowired
	MemberService memberservice;

	/* 아이디 중복확인 */
	@RequestMapping(value="/idCheck")
	public @ResponseBody String idCheck(String inputMid) {
		String checkResult = memberservice.idCheck(inputMid);
		System.out.println("컨트롤러"+checkResult);
		return checkResult;
	}
	
	/* 비밀번호 확인 */
	@RequestMapping(value="/PwCheck")
	public @ResponseBody String PwCheck(String inputMid, String inputPw) {
		String checkResult = memberservice.PwCheck(inputPw, inputMid);
		System.out.println("컨트롤러"+checkResult);
		return checkResult;
	}
	
	/* 회원삭제 페이지 */
	@RequestMapping(value= "/DeleteForm")
	public  String DeleteForm() {

		return "members/memberDelete";
	}
	
	/* 비밀번호 변경 페이지 */
	@RequestMapping(value= "/PwModifyForm")
	public  String PWmodifyForm() {

		return "members/PwModifyForm";
	}
	
	/* 로그인 */
	@RequestMapping(value= "/loginForm")
	public  String loginForm() {

		return "members/loginForm";
	}

	/* 회원가입 */
	@RequestMapping(value= "/joginForm")
	public  String joginForm() {

		return "members/joginForm";
	}

	//	/* 회원가입 기능*/
	@RequestMapping(value="/memberJoin")
	public ModelAndView memberJoin(MemberDTO memberDTO,RedirectAttributes ra) {
		mav=memberservice.memberJoin(memberDTO,ra);
		return mav;
	}
	/* 로그인 기능*/
	@RequestMapping(value="/memberLogin")
	public ModelAndView memberLogin(MemberDTO memberDTO,RedirectAttributes ra) {
		mav=memberservice.memberLogin(memberDTO,ra);


		return mav;

	}

	/* 로그아웃 기능 */
	@RequestMapping(value="/memberLogout")
	public String memberLogout() {
		session.invalidate();

		return "redirect:/";

	}

	/* 회원 정보 */
	@RequestMapping(value="/memberView")
	public ModelAndView memberView(String mid){
		System.out.println("/memberView");
		System.out.println("아이디:"+mid);
		mav=memberservice.memberView(mid);
		return mav;

	}

	/* 회원삭제 */
	@RequestMapping(value = "/memberDelete")
	public ModelAndView memberDelete(@RequestParam("mid") String mid, RedirectAttributes ra) {
		System.out.println("/memberDelete");
		System.out.println("mid:"+mid);
		mav = memberservice.memberDelete(mid,ra);
		return mav;
	}

	/* 카카오 로그인 */
	@RequestMapping(value = "/kakaoLogin", produces = "application/json;charset=UTF-8")
	public @ResponseBody String kakaoLogin(MemberDTO memberDTO) {
		System.out.println("memberDTO::  "+memberDTO );
		String url = memberservice.kakaoLogin(memberDTO);
		return url;
	}
	
	// 비밀번호 수정
		@RequestMapping(value = "/PwUpdate")
		public ModelAndView PwUpdate(MemberDTO memberDTO,RedirectAttributes ra) {
			System.out.println("/PwUpdate");
			System.out.println(memberDTO);
			mav = memberservice.PwUpdate(memberDTO,ra);
			return mav;
		}
	
	// 전화번호 수정
	@RequestMapping(value = "/mphoneUpdate")
	public @ResponseBody String mphoneUpdate(MemberDTO memberDTO) {
		System.out.println("/mphoneUpdate");
		System.out.println(memberDTO);
		String updateResult = memberservice.mphoneUpdate(memberDTO);
		return updateResult;
	}

	// 이메일 수정
	@RequestMapping(value = "/memailUpdate")
	public @ResponseBody String memailUpdate(MemberDTO memberDTO) {
		System.out.println("/memailUpdate");
		System.out.println(memberDTO);
		String updateResult = memberservice.memailUpdate(memberDTO);
		return updateResult;
	}

	// 이름 수정
	@RequestMapping(value = "/mnameUpdate")
	public @ResponseBody String mnameUpdate(MemberDTO memberDTO) {
		System.out.println("/mnameUpdate");
		System.out.println(memberDTO);
		String updateResult = memberservice.mnameUpdate(memberDTO);
		return updateResult;
	}

	// 주소 수정
	@RequestMapping(value = "/maddressUpdate")
	public @ResponseBody String maddressUpdate(MemberDTO memberDTO) {
		System.out.println("/maddressUpdate");
		System.out.println(memberDTO);
		String updateResult = memberservice.maddressUpdate(memberDTO);
		return updateResult;
	}

	// 생일 수정
	@RequestMapping(value = "/mbirthUpdate")
	public @ResponseBody String mbirthUpdate(MemberDTO memberDTO) {
		System.out.println("/mbirthUpdate");
		System.out.println(memberDTO);
		String updateResult = memberservice.mbirthUpdate(memberDTO);
		return updateResult;
	}
	
	// 프로필 수정
	@RequestMapping(value = "/memberProfileUpload")
	public ModelAndView memberProfileUpload(MemberDTO memberDTO) throws IllegalStateException, IOException {
		System.out.println("/memberProfileUpload");
		System.out.println(memberDTO);
		mav= memberservice.memberProfileUpload(memberDTO);
		return mav;
	}
	
	// 프로필 가져오기
	@RequestMapping(value = "/getProfile" )
	public @ResponseBody String getProfile(@RequestParam("mid") String mid) {
		System.out.println("/getProfile_mid::"+mid);
		String profileImg = memberservice.getProfile(mid);
		return profileImg;
	}
	@RequestMapping(value="/memberCheck")
	public @ResponseBody String memberCheck(String mid) {
		String memberCheck=memberservice.memberCheck(mid);//회원인지 사업자인지 체크하는부분
 
		return memberCheck;
	}
   
	@RequestMapping(value="/getAreaname")
	public @ResponseBody String getAreaname(String mid) {
	    String getAreaname=memberservice.getAreaname(mid);	
		
		return getAreaname;
		
	}

}
