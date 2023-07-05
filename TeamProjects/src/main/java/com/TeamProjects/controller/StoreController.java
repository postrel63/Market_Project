package com.TeamProjects.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.TeamProjects.dto.BoardDTO;
import com.TeamProjects.dto.LikeDTO;
import com.TeamProjects.dto.MemberDTO;
import com.TeamProjects.dto.ProductsDTO;
import com.TeamProjects.dto.StoreDTO;
import com.TeamProjects.service.StoreService;

@Controller
public class StoreController {
	
	
	private ModelAndView mav;
	
	@Autowired
	private StoreService stservice;
	@Autowired
	HttpSession session;

	
	@RequestMapping(value = "/review") //후기 페이지로 이동
	public String review() {
		
		return "review/review";
	}
	
	@RequestMapping(value = "/storeView")  //가게 상세보기, in>stcode,session,  out>상품코드를 리스트출력
	public ModelAndView  view(String stcode,HttpSession session) {
		System.out.println(stcode);
		String mid = (String) session.getAttribute("loginId");
		if(mid==null) {
			mid="null";
		}
		System.out.println(mid);
		mav = stservice.storeView(stcode,mid);
		
		
		return mav;
	}
	
	//내 점포 보기  in>session, out>점포 리스트
	@RequestMapping(value="/myStorelist")
	public ModelAndView myStorelist(HttpSession session) {
		System.out.println("myStorelist");
		String loginId =(String) session.getAttribute("loginId");
		mav =stservice.myStorelist(loginId);
		
		return mav;
	}
	
	// 내 점포 리스트 mav타입X
	@RequestMapping(value="/storeChoice")
	public @ResponseBody ArrayList<StoreDTO> storeChoice(HttpSession session){
		System.out.println("storeChoice");
		String loginId =(String) session.getAttribute("loginId");
		System.out.println(loginId);
		ArrayList<StoreDTO> storeChoice = stservice.storeChoice(loginId);
		System.out.println("storeChoice 리스트"+storeChoice);
		return storeChoice;
		
	}
	
	//사업자인지 아닌지
	@RequestMapping(value="/memberorstore")
	public @ResponseBody int memberorstore(HttpSession session) {
		System.out.println("memberorstore");
		String loginId =(String) session.getAttribute("loginId");
		int result = stservice.memberorstore(loginId);
		System.out.println(result);
		return result;
	}
	
	//선택한 가게를 세션에 attribute로 추가
	@RequestMapping(value="/choiceOneStore")
	public @ResponseBody void choiceOneStore(String stcode,HttpSession session) {
		System.out.println("라라라라라알알알아ㅏ");
		System.out.println(stcode);
		session.setAttribute("stcode", stcode);
		
	}
	
	
	@RequestMapping(value = "/storejoinForm") //storeJoin페이지 이동
	public String storejoinForm() {
		
		return "members/storeJoin";
	}
	


	@RequestMapping(value = "/storeJoin") //사업자 회원가입
	public ModelAndView storeJoin(StoreDTO storeDTO,RedirectAttributes ra) {
		System.out.println(storeDTO);
		mav=stservice.storeJoin(storeDTO,ra);
		
		return mav;
	}
	
	@RequestMapping(value = "/memberstoreView") //사업자 상세보기
	public ModelAndView memberstoreView(@RequestParam("loginId") String bid) {
		System.out.println(bid);
		mav=stservice.memberstoreView(bid);
		
		return mav;
	}
	@RequestMapping(value="/getstoreView") 
	public @ResponseBody StoreDTO getstoreView(String stcode) { //해당 사업자가 가지고있는 자신의 가게 보기
		System.out.println(stcode);
		StoreDTO getstoreView=stservice.getstoreView(stcode);
		
		return getstoreView;
	}
	@RequestMapping(value="/stimgUpload")  //이미지 파일 업로드
	public @ResponseBody String stimgfileUpload(StoreDTO storeDTO) throws IllegalStateException, IOException {    //가게 이미지 업로드
		String stimage=stservice.stimgUpload(storeDTO);
		return stimage;
    } 
    @RequestMapping(value="/updateOp")     //오픈시간 수정
    public @ResponseBody String updateOp(StoreDTO storeDTO) {
    	String updateOp=stservice.updateOp(storeDTO);
    	return updateOp;
    }

    @RequestMapping(value="/updatephone")    //가게 전화번호 수정
    public @ResponseBody String updatephone(StoreDTO storeDTO) {
    	String updatephone=stservice.updatephone(storeDTO);
    	return updatephone;
    }
    
    @RequestMapping(value="/updatenote")    //가게 소개 수정
    public @ResponseBody String updatenote(StoreDTO storeDTO) {
    	String updatenote=stservice.updatenote(storeDTO);
    	return updatenote;
    }
    
    @RequestMapping(value="/updatecategory")    //가게 종류 수정
    public @ResponseBody String updatecategory(StoreDTO storeDTO) {
    	String updatecategory=stservice.updatecategory(storeDTO);
    	return updatecategory;
    }
    
    
    @RequestMapping(value="/updateaddress")    //가게 주소 수정
    public @ResponseBody String updateaddress(StoreDTO storeDTO) {
    	String updateaddress=stservice.updateaddress(storeDTO);
    	return updateaddress;
    }
	@RequestMapping(value = "/storeProducts") //storeProducts페이지 이동
	public ModelAndView storeProducts(@RequestParam("loginId")String bid) {
	       mav=stservice.storeProducts(bid);
		return  mav;
	}
	
	@RequestMapping(value = "/storeProductsView") //storeProducts페이지 이동
	public @ResponseBody ArrayList<ProductsDTO>storeProductsView(String stcode) {
		ArrayList<ProductsDTO>storeProductsView=stservice.storeProductsView(stcode);
		return storeProductsView;
	}
	
	@RequestMapping(value="/productsjoin")//상품관리 창 띄우기
	public ModelAndView productsjoin(@RequestParam("loginId")String bid) {
		mav=stservice.productsjoin(bid);
		return mav;
	}
	@RequestMapping(value="/productjoinModal") // 상품등록 
	public @ResponseBody ArrayList<ProductsDTO>productjoinModal (ProductsDTO productsdto) throws IllegalStateException, IOException {
		System.out.println("@@@@@@@@@@@@"+productsdto.getPrstock());
		ArrayList<ProductsDTO>productjoinModal=stservice.productjoinModal(productsdto);
		System.out.println("@@@@@@@@@컨트롤러 수량"+productjoinModal);
		return productjoinModal;
	}
	
	@RequestMapping(value="/productModifyinfo") //상품수정 데이터 불러오기
	public @ResponseBody ProductsDTO productModifyinfo (String prcode)  {
		
		ProductsDTO productsdto=stservice.productModifyinfo(prcode);
		
		return productsdto;
	}
	
	@RequestMapping(value="/productModifyModal") // 상품등록 
	public @ResponseBody ArrayList<ProductsDTO>productModifyModal (ProductsDTO productsdto) throws IllegalStateException, IOException  {
		
		
		ArrayList<ProductsDTO>productModifyModal=stservice.productModifyModal(productsdto);
		return productModifyModal;
	}
	@RequestMapping(value="/deleteProduct")//상품삭제
	public @ResponseBody ArrayList<ProductsDTO>deleteProduct (String prcode,String stcode){
		ArrayList<ProductsDTO>productList=stservice.deleteProduct(prcode,stcode);
		
		return productList;
	}
	@RequestMapping(value="/deleteStoreList") //사업자의 가게정보,상품정보 삭제
	public @ResponseBody String deleteStoreList(String bid,String stcode) {
		String deleteStoreList=stservice.deleteStoreList(bid,stcode);
		
		return deleteStoreList;
	}
	@RequestMapping(value="/selectminfo") //사업자의 아이디 체크(탈퇴시)
	public @ResponseBody String selectminfo(MemberDTO memberDTO) {
		String selectcheck=stservice.selectminfo(memberDTO);
		System.out.println("@@@컨틀로러체크"+selectcheck);
		return selectcheck;
	}
	@RequestMapping(value="/prcheckbox") //체크시에 prcheck를 true or false 로 바꿔줌
	public @ResponseBody String prcheckbox(ProductsDTO productsDTO) {
		String prcheckbox=stservice.prcheckbox(productsDTO);
		
		return prcheckbox;
	}
	
	@RequestMapping(value="/stcheck") //판매시작,종료시에 가게의 open close를 바꿔줌
	public @ResponseBody String stcheck(StoreDTO storeDTO) {
		String stcheck=stservice.stcheck(storeDTO);
		
		return stcheck;
	}
	@RequestMapping(value="/stoperatecheck")// 가게가 열려있는지 닫혀있는지 알려줌
	public @ResponseBody String stoperatecheck(String stcode) {
		String stoperatecheck=stservice.stoperatecheck(stcode);
		
		return stoperatecheck;
	}
	@RequestMapping(value="/productCount")
	public @ResponseBody String productCount(String stcode) {
		int productCount=stservice.productCount(stcode);
		System.out.println("@@@"+productCount);
		return productCount+""; //문자로 결과를바꿔줌
	}
	@RequestMapping(value="/getmarketList")//지역을 받아와 해당지역에 대한 시장출력
	public @ResponseBody ArrayList<StoreDTO>getmarketList(String areaname){
		ArrayList<StoreDTO>getmarketList=stservice.getmarketList(areaname);
		return getmarketList;
	}
	
	@RequestMapping(value="/getmarketListAll")//전체에  대한 시장출력
	public @ResponseBody ArrayList<StoreDTO>getmarketListAll(){
		ArrayList<StoreDTO>getmarketListAll=stservice.getmarketListAll();
		return getmarketListAll;
	}
	@RequestMapping(value="/changemarket")//지역과 가게종류를 받아와 해당지역에 대한 시장출력
	public @ResponseBody ArrayList<StoreDTO>changemarket(StoreDTO storeDTO){
		ArrayList<StoreDTO>getmarketList=stservice.changemarket(storeDTO);
		return getmarketList;
	}
	
	@RequestMapping(value="/changemarketAll")//가게종류만을  받아와 전체지역에 대한 시장출력
	public @ResponseBody ArrayList<StoreDTO>changemarketAll(String stcategory){
		ArrayList<StoreDTO>changemarketAll=stservice.changemarketAll(stcategory);
		return changemarketAll;
	}
	@RequestMapping(value="/marketopen")//현재 열린가게들을 출력한다.
	public @ResponseBody ArrayList<StoreDTO>marketopen(String areaname){
		ArrayList<StoreDTO>marketopen=stservice.marketopen(areaname);
		return marketopen;
	}
	
	
	@RequestMapping(value="/marketopenAll")//현재 열린가게들을 출력한다.
	public @ResponseBody ArrayList<StoreDTO>marketopenAll(){
		ArrayList<StoreDTO>marketopenAll=stservice.marketopenAll();
		return marketopenAll;
	}
	
	
	@RequestMapping(value="/storeLike")//좋아요가 안되있으면 +1 되있으면 -1
	public @ResponseBody String storeLike(LikeDTO likedto) {
		String likeCheck=stservice.storeLike(likedto);
		return likeCheck;
	}
	
	@RequestMapping(value="/storeLikeCheck")//좋아요가 안되있으면 사진그대로,되있으면 사진변경
	public @ResponseBody String storeLikeCheck(LikeDTO likedto) {
		String likeCheck=stservice.storeLikeCheck(likedto);
		return likeCheck;
	}
	
	@RequestMapping(value="/storeLikeCount")//좋아요가 안되있으면 사진그대로,되있으면 사진변경
	public @ResponseBody String storeLikeCount(String stcode) {
		String likeCheck=stservice.storeLikeCount(stcode);
		return likeCheck;
	}
	
	@RequestMapping(value="/selectLike")//좋아요가 많은 순으로 출력.
	public @ResponseBody ArrayList<StoreDTO>selectLike(String areaname){
		ArrayList<StoreDTO>selectLike=stservice.selectLike(areaname);
		return selectLike;
	}
	@RequestMapping(value="/selectLikeAll")//좋아요가 많은 순으로 출력.
	public @ResponseBody ArrayList<StoreDTO>selectLikeAll(){
		ArrayList<StoreDTO>selectLikeAll=stservice.selectLikeAll();
		return selectLikeAll;
	}
	@RequestMapping(value="/marketopencategory")//지역과 가게종류를 받아 현재 열린가게 출력
	public @ResponseBody ArrayList<StoreDTO>marketopencategory(StoreDTO storeDTO){
		ArrayList<StoreDTO>marketopencategory=stservice.marketopencategory(storeDTO);
		return marketopencategory;
	}
	@RequestMapping(value="/selectLikecategory")//지역과 가게종류를 받아 현재 열린가게 출력
	public @ResponseBody ArrayList<StoreDTO>selectLikecategory(StoreDTO storeDTO){
		ArrayList<StoreDTO>selectLikecategory=stservice.selectLikecategory(storeDTO);
		return selectLikecategory;
	}
	@RequestMapping(value="/getmarketListcategory")//지역과 가게종류를 받아 현재 열린가게 출력
	public @ResponseBody ArrayList<StoreDTO>getmarketListcategory(StoreDTO storeDTO){
		ArrayList<StoreDTO>getmarketListcategory=stservice.getmarketListcategory(storeDTO);
		return getmarketListcategory;
	}
	
	@RequestMapping(value="/marketopencategoryAll")//전체에 대한 가게 종류에 열린가게
	public @ResponseBody ArrayList<StoreDTO>marketopencategoryAll(String stcategory){
		ArrayList<StoreDTO>marketopencategoryAll=stservice.marketopencategoryAll(stcategory);
		return marketopencategoryAll;
	}
	
	@RequestMapping(value="/selectLikecategoryAll")//전체에 대한 가게 종류에 열린가게
	public @ResponseBody ArrayList<StoreDTO>selectLikecategoryAll(String stcategory){
		ArrayList<StoreDTO>selectLikecategoryAll=stservice.selectLikecategoryAll(stcategory);
		return selectLikecategoryAll;
	}
	
	@RequestMapping(value="/getmarketListcategoryAll")//전체에 대한 가게 종류에 열린가게
	public @ResponseBody ArrayList<StoreDTO>getmarketListcategoryAll(String stcategory){
		ArrayList<StoreDTO>getmarketListcategoryAll=stservice.getmarketListcategoryAll(stcategory);
		return getmarketListcategoryAll;
	}
	
	@RequestMapping(value="/getborank")//가게 총평점 불러오기 view.jsp에서
	public @ResponseBody String getborank(BoardDTO boardDTO) {
        String borank=stservice.getborank(boardDTO);	
        System.out.println("@borank"+borank);
		return borank;
	}
	@RequestMapping(value="/getreviewcount")//총 리뷰수 불러오기
	public @ResponseBody String getreviewcount(String stcode) {
        int reviewcount=stservice.getreviewcount(stcode);	
        System.out.println("@reviewcount"+reviewcount);
		return reviewcount+"";
	}
	@RequestMapping(value="/selectstrank")//전체 평점순출력
	public @ResponseBody ArrayList<StoreDTO>selectstrank(){
		ArrayList<StoreDTO>selectstrank=stservice.selectstrank();
		return selectstrank;
	}
	
	@RequestMapping(value="/selectstrankAll")//전체 카테고리의 평점순 출력
	public @ResponseBody ArrayList<StoreDTO>selectstrankAll(String stcategory){
		ArrayList<StoreDTO>selectstrankAll=stservice.selectstrankAll(stcategory);
		return selectstrankAll;
	}
	@RequestMapping(value="/selectstrankcategory")//지역과 카테고리의 평점순출력
	public @ResponseBody ArrayList<StoreDTO>selectstrankcategory(StoreDTO storeDTO){
		ArrayList<StoreDTO>selectstrankcategory=stservice.selectstrankcategory(storeDTO);
		return selectstrankcategory;
	}
	
	@RequestMapping(value="/selectstrankarea")//지역과 카테고리의 평점순출력
	public @ResponseBody ArrayList<StoreDTO>selectstrankarea(String areaname){
		ArrayList<StoreDTO>selectstrankarea=stservice.selectstrankarea(areaname);
		return selectstrankarea;
	}
	
	
	


}
