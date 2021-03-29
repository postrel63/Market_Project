package com.TeamProjects.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.TeamProjects.dto.BoardDTO;
import com.TeamProjects.dto.CartDTO;
import com.TeamProjects.dto.LikeDTO;
import com.TeamProjects.dto.MemberDTO;
import com.TeamProjects.dto.ProductsDTO;
import com.TeamProjects.dto.StoreDTO;
import com.TeamProjects.mapper.CartMapper;
import com.TeamProjects.mapper.MemberMapper;
import com.TeamProjects.mapper.StoreMapper;

@Service
public class StoreService {

	private ModelAndView mav;

	@Autowired
	private StoreMapper stmapper;
	@Autowired
	private CartMapper camapper;
	@Autowired
	private MemberMapper memapper;


	// 가게 상세보기
	public ModelAndView storeView(String stcode, String mid) {
		mav = new ModelAndView();
		StoreDTO storeDTO = stmapper.storeView(stcode); // store 정보
		System.out.println(storeDTO);
		ArrayList<ProductsDTO> productsList = stmapper.productsView(stcode); // 상품 정보
		System.out.println(mid);

		String operateCheck= stmapper.stoperatecheck(stcode);//가게open close 체크
	      System.out.println("가게상태"+operateCheck);
		ArrayList<CartDTO> cartView = camapper.cartView(mid); // 장바구니 보여주기
		System.out.println("CARTVIEW 리스트" + cartView);
		int cartallprice = camapper.cartallprice(mid); // 장바구니 총 가격
		System.out.println(cartallprice);
		mav.addObject("cartallprice", cartallprice);
		mav.addObject("cartView", cartView);

		System.out.println(productsList);
		mav.addObject("storeView", storeDTO);
		mav.addObject("productsView", productsList);
		mav.addObject("operateCheck",operateCheck);
		mav.setViewName("market/view");
		return mav;
	}

	public ModelAndView myStorelist(String loginId) {

		//ArrayList<String> myStorelist = stmapper.myStorelist(loginId);

		return mav;
	}


	// 아아디 세션 대신 stcode를 세션으로 저장하도록 하기
	public String getstcode(String loginId) {
		String result ="";
		// 사업자인지 아닌지 판단 사업자면 11 아니면 00
		int memst = stmapper.memst(loginId);
		
		// 사업장의 개수가 2개 이상이면 loginId를 세션으로 하고
		// 사업장의 개수가 1개면 stcode를 세션으로 받고
		
		
		
		System.out.println(memst);
		// stcode불러오기
		String stcode = stmapper.stcode(loginId);
		System.out.println(stcode);
		if (memst == 11) {
			result = stcode;
		}else {
			result = loginId;
		}

		System.out.println(result);
		return result;
	}

	public ArrayList<StoreDTO> storeChoice(String loginId) {
		ArrayList<StoreDTO> storeChoice =  stmapper.myStorelist(loginId);
		
		return storeChoice;
	}

	
	//사업자인지 아닌지
	public int memberorstore(String loginId) {
		// 사업자인지 아닌지 판단 사업자면 11 아니면 00
		System.out.println("mos 서비스"+loginId);
	int memberorstore = stmapper.memst(loginId);
	System.out.println(memberorstore);
		return memberorstore;
	}
	
	

	public ModelAndView storeJoin(StoreDTO storeDTO,RedirectAttributes ra) {
	   mav= new ModelAndView();
	   String address=storeDTO.getBaddr()+storeDTO.getBdetailaddr()+storeDTO.getBextraAddr();
	   System.out.println("주소"+address);
	   storeDTO.setStaddress(address);
	   
	   String pnum=storeDTO.getPnum1()+storeDTO.getPnum2()+storeDTO.getPnum2();
	   storeDTO.setStphone(pnum);
	   
	   String stcode="STORE"+storeDTO.getBid()+UUID.randomUUID().toString();
	   storeDTO.setStcode(stcode);
	   
	   int storeJoin=stmapper.storeJoin(storeDTO);
	   if(storeJoin>0) {
		   System.out.println("성공");
	   }
	   ra.addFlashAttribute("msg",storeDTO.getStname()+"가게가 등록되었습니다.");
	   mav.setViewName("redirect:/");
		return mav;
	}

	public ModelAndView memberstoreView(String bid) { //등록된 가게 목록리스트 보여주기
	mav= new ModelAndView();
	ArrayList<StoreDTO>storeList=stmapper.storeList(bid);
	System.out.println("@@"+storeList);
	mav.addObject("storeList",storeList);
	mav.setViewName("members/storeView");
		return mav;
	}

	public StoreDTO getstoreView(String stcode) {
   
		StoreDTO getstoreView=stmapper.getstoreView(stcode);
    System.out.println("storeDTO"+getstoreView);
   
		return getstoreView;
	}

	public String stimgUpload(StoreDTO storeDTO)throws IllegalStateException, IOException  {
		UUID uuid= UUID.randomUUID();
		MultipartFile stimagename=storeDTO.getStimagename();
		String stimage="";
		String stcode=storeDTO.getStcode();
		String savePath="C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\TeamProjects\\src\\main\\webapp\\resources\\storeimgfile\\"; 
		String selectimgfile=stmapper.selectimgfile(stcode); //현재 이미지 이름 불러오기
		File file=new File(savePath+selectimgfile);       //현재 이미지 주소
		file.delete();                                    //현재 파일삭제
		
	
	    
	    stimage=uuid.toString()+"_"+stimagename.getOriginalFilename(); //받아온 이미지 값
	    stimagename.transferTo(new File(savePath+stimage));       
	    storeDTO.setStimage(stimage);   
	    int stimgUpload=stmapper.stimgUpload(storeDTO);     //변경된 파일 업데이트
	    if(stimgUpload>0) {                                
	    System.out.println("insert확인");
	    }
        return stimage;
	}

	public String updateOp(StoreDTO storeDTO) {
		
		int updateOp=stmapper.updateOp(storeDTO);
		String Update="";
		if(updateOp>0) {
			Update ="오픈시간 수정 성공";
			System.out.println(Update);
			
		}
		return Update;
	}

	public String updatephone(StoreDTO storeDTO) {
		int updatephone=stmapper.updatephone(storeDTO);
		String Update="";
		if(updatephone>0) {
			Update="전화번호 수정 성공";
			System.out.println(Update);
		}
		return Update;
	}

	public String updatenote(StoreDTO storeDTO) {
		int updatenote=stmapper.updatenote(storeDTO);
		String Update="";
		if(updatenote>0) {
			Update="가게소개 수정 성공";
			System.out.println(Update);
		}
		return Update;
	}
	public String updatecategory(StoreDTO storeDTO) {
		int updatecategory=stmapper.updatecategory(storeDTO);
		String Update="";
		if(updatecategory>0) {
			Update="가게소개 수정 성공";
			System.out.println(Update);
		}
		return Update;
	}
	

	public String updateaddress(StoreDTO storeDTO) {
		int updateaddress=stmapper.updateaddress(storeDTO);
		String Update="";
		if(updateaddress>0) {
			Update="가게주소 수정 성공";
			System.out.println(Update);
		}
		return Update;
	}

	public ModelAndView storeProducts(String bid) {
		mav=new ModelAndView();
		ArrayList<StoreDTO>storeList=stmapper.storeList(bid);//등록된 가게 리스트 보여주기
		System.out.println("@@"+storeList);
		mav.addObject("storeList",storeList);
		mav.setViewName("members/storeProducts");
		return mav;
	}

	public ArrayList<ProductsDTO>storeProductsView(String stcode) {
		
		ArrayList<ProductsDTO>productsList=stmapper.productsList(stcode);
		System.out.println("상품들"+productsList);
		return productsList;
	}

	public ModelAndView productsjoin(String bid) {
		mav=new ModelAndView();
		mav= new ModelAndView();
		ArrayList<StoreDTO>storeList=stmapper.storeList(bid);
		System.out.println("@@"+storeList);
		mav.addObject("storeList",storeList);
		mav.setViewName("members/productsjoin");
			return mav;
		
	}

	public ArrayList<ProductsDTO>productjoinModal (ProductsDTO productsdto) throws IllegalStateException, IOException {
		
		
		UUID uuid= UUID.randomUUID();
		MultipartFile primagename=productsdto.getPrimagename();
		
		String primage=uuid.toString()+"_"+primagename.getOriginalFilename();//파일 저장할이름
		String stcode=productsdto.getStcode();
		String savePath="C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\TeamProjects\\src\\main\\webapp\\resources\\primgfile\\"; 
		primagename.transferTo(new File(savePath+primage)); //파일경로에 저장	
		
		productsdto.setPrimage(primage);  //파일이름 저장
		
		
		String bid=productsdto.getBid(); //상품코드 양식 id뽑아오기
		String prcode="PRODUCT_"+uuid.toString()+"_"+bid;
		
		productsdto.setPrcode(prcode); //상품코드 저장
		
		
		System.out.println("@@서비스 수량"+productsdto.getPrstock());
		int productjoin=stmapper.productjoin(productsdto);// 상품 insert 시키기
	   System.out.println("@@@서비스 후수량"+productsdto.getPrstock());
	     
		ArrayList<ProductsDTO>productjoinModal=stmapper.productsList(stcode);// 등록된 상품 보여주기
		return productjoinModal;
	}

	public ProductsDTO productModifyinfo(String prcode) {

		ProductsDTO productsdto=stmapper.productModifyinfo(prcode); //상품수정할 데이터
		
		return productsdto;
	}

	public ArrayList<ProductsDTO> productModifyModal(ProductsDTO productsdto) throws IllegalStateException, IOException  {
		UUID uuid= UUID.randomUUID();
		String prcode=productsdto.getPrcode();
		String primage=stmapper.selectPrimage(prcode); //이미지 이름값 가져오기
		System.out.println("@@사진이름"+primage);
		String savePath="C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\TeamProjects\\src\\main\\webapp\\resources\\primgfile\\"; 
		File file=new File(savePath+primage);       //현재 이미지 주소
		file.delete();
		
		MultipartFile primagename=productsdto.getPrimagename();
		primage=uuid.toString()+"_"+primagename.getOriginalFilename(); //받아온 이미지 값
	    primagename.transferTo(new File(savePath+primage));       
	    productsdto.setPrimage(primage);   
	    
	    int prModifyUpdate=stmapper.prModifyUpdate(productsdto); //수정파일 업데이트
	    
	    String stcode=productsdto.getStcode();
	    ArrayList<ProductsDTO>productList=stmapper.productsList(stcode);// 등록된 상품 보여주기
	  System.out.println("@@@@@"+stcode);
	    System.out.println("@@@@"+productList);
	    
		return productList;
	}

	public ArrayList<ProductsDTO> deleteProduct(String prcode,String stcode) {
		System.out.println("PRCODEPRCODE"+prcode);
		String primage=stmapper.selectPrimage(prcode); //이미지 이름값 가져오기
		System.out.println("@@@@@@@@딜리트이미지"+primage);
		String savePath="C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\TeamProjects\\src\\main\\webapp\\resources\\primgfile\\"; 
		File file=new File(savePath+primage);       //현재 이미지 주소
		file.delete();                              //현재 파일삭제
		
		int deleteProduct=stmapper.deleteProduct(prcode);
		if(deleteProduct>0) {
			System.out.println("DELTE성공");
		}else {
			System.out.println("DELTE실패");
		}
		ArrayList<ProductsDTO>productList=stmapper.productsList(stcode);// 등록된 상품 보여주기
		return productList;
	}

	public String deleteStoreList(String bid,String stcode) {
		
		String savePath="C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\TeamProjects\\src\\main\\webapp\\resources\\storeimgfile\\"; 
		String selectimgfile=stmapper.selectimgfile(stcode); //현재 이미지 이름 불러오기
		File file=new File(savePath+selectimgfile);       //현재 이미지 주소
		file.delete();                                    //현재 파일삭제
		
		String deletecheck="";
		
		int deleteProductList=stmapper.deleteProductList(stcode);//상품정보삭제
		if(deleteProductList>0) {
			System.out.println("productdel성공");
		}
		int deleteStore=stmapper.deleteStore(stcode);//가게정보삭제
		if(deleteStore>0) {
			System.out.println("storedel성공");
        deletecheck="OK";			
		
		}
		
		 
		
		return deletecheck;
	}

	public String selectminfo(MemberDTO memberDTO) {
		System.out.println("멤버서비스@@");
	   int selectcheck=memapper.selectminfo(memberDTO);
	    String checktext="";
	   if(selectcheck>0) {
		   checktext="OK";
	   }else {
		   checktext="NO";
	   }
	   
		return checktext;
	}

	public String prcheckbox(ProductsDTO productsDTO) {
		// TODO Auto-generated method stub

		String prcheck="prcheck";
        int prcheckbox=stmapper.prcheckbox(productsDTO);
        return prcheck;
        
	}

	public String stcheck(StoreDTO storeDTO) {
		
		int stcheckUpdate=stmapper.stcheckUpdate(storeDTO);
		String stcheck="확인";
		return stcheck;
	}

	public String stoperatecheck(String stcode) { //가게 open close 확인
		
		String stoperatecheck=stmapper.stoperatecheck(stcode);
		return stoperatecheck;
	}

	public int productCount(String stcode) {
		
		int productCount=stmapper.productCount(stcode);//판매중인 물품수 확인
	
		return productCount;
	}

	public ArrayList<StoreDTO> getmarketList(String areaname) {
		String area="%"+areaname+"%";
		ArrayList<StoreDTO>getmarket=stmapper.getmarketList(area);
		System.out.println("어레이"+getmarket);
		return getmarket;
	}
	
	public ArrayList<StoreDTO> getmarketListAll() {
		ArrayList<StoreDTO>getmarketListAll=stmapper.getmarketListAll();
		return getmarketListAll;
	}

	public ArrayList<StoreDTO> changemarket(StoreDTO storeDTO) {
		ArrayList<StoreDTO>getmarket=stmapper.changemarket(storeDTO);
		//해당 지역의 가게를 종류별 출력
		return getmarket;
	}


	public ArrayList<StoreDTO> changemarketAll(String stcategory) {//전체리스트에대한 카테고리별 출력
		ArrayList<StoreDTO>getmarketAll=stmapper.changemarketAll(stcategory);
		return getmarketAll;
	}
	
	public ArrayList<StoreDTO> marketopen(String areaname) {
		ArrayList<StoreDTO>marketopenList=stmapper.marketopen(areaname);//열린가게들출력
		return marketopenList;
	}
 
	

	public ArrayList<StoreDTO> marketopenAll() {
		ArrayList<StoreDTO>marketopenList=stmapper.marketopenAll();//열린가게들출력
		return marketopenList;
	}

	public String storeLike(LikeDTO likedto) { //좋아요를 누르면 +1  없으면 -1
		String storeLike=stmapper.storeLike(likedto);
		String stcode=likedto.getStcode();
		String check="";
		if(storeLike==null) {
			
			int likeInsert=stmapper.likeInsert(likedto);
			int likePlusUpdate=stmapper.likePlusUpdate(stcode);
			check="OK";
		}else {
			
			int likeDelete=stmapper.likeDelete(likedto);
			int likeMinusUpdate=stmapper.likeMinusUpdate(stcode);
			check="NO";
		}
		return check;
	}

	public String storeLikeCheck(LikeDTO likedto) {
		String storeLike=stmapper.storeLike(likedto);
		String check="";
		if(storeLike==null) {

			check="NO";
		}else {
	
			check="OK";
		}
		return check;
	}
	
	public String storeLikeCount(String stcode) {
		String storeLike=stmapper.storeLikeCount(stcode);//좋아요 숫자 카운팅
		 
		
		return storeLike;
	}

	public ArrayList<StoreDTO> selectLike(String areaname) {
		ArrayList<StoreDTO>selectLike=stmapper.selectLike(areaname);
		return selectLike;
	}

	public ArrayList<StoreDTO> selectLikeAll() {
		ArrayList<StoreDTO>selectLikeAll=stmapper.selectLikeAll();
		return selectLikeAll;
	}

	public ArrayList<StoreDTO> marketopencategory(StoreDTO storeDTO) {
		ArrayList<StoreDTO>marketopencategory=stmapper.marketopencategory(storeDTO);
		return marketopencategory;
	}

	public ArrayList<StoreDTO> selectLikecategory(StoreDTO storeDTO) {
		ArrayList<StoreDTO>selectLikecategory=stmapper.selectLikecategory(storeDTO);
		return selectLikecategory;
	}

	public ArrayList<StoreDTO> getmarketListcategory(StoreDTO storeDTO) {
		ArrayList<StoreDTO>getmarketListcategory=stmapper.getmarketListcategory(storeDTO);
		return getmarketListcategory;
	}

	public ArrayList<StoreDTO> marketopencategoryAll(String stcategory) {
		ArrayList<StoreDTO>marketopencategoryAll=stmapper.marketopencategoryAll(stcategory);
		return marketopencategoryAll;
	}

	public ArrayList<StoreDTO> selectLikecategoryAll(String stcategory) {
		ArrayList<StoreDTO>selectLikecategoryAll=stmapper.selectLikecategoryAll(stcategory);
		return selectLikecategoryAll;
	}

	public ArrayList<StoreDTO> getmarketListcategoryAll(String stcategory) {
		ArrayList<StoreDTO>getmarketListcategoryAll=stmapper.getmarketListcategoryAll(stcategory);
		return getmarketListcategoryAll;
	}

	public String getborank(BoardDTO boardDTO) {//board에 있는 리뷰별점들로부터 계산
		int borank=stmapper.getborankList(boardDTO);
		System.out.println("board개수"+borank);
        boardDTO.setBorank(borank);
		String getborank=stmapper.getborank(boardDTO);
		System.out.println("borank개수+"+getborank);
		StoreDTO storeDTO = new StoreDTO();
		storeDTO.setStrank(getborank);
		storeDTO.setStcode(boardDTO.getStcode());
		if(storeDTO.getStrank()!=null) {
			
		
		int storerankUpdate=stmapper.strankupdate(storeDTO);
		System.out.println("업뎃성공"+storerankUpdate);
		}else {
			getborank="0";
			System.out.println("getborank@@@@"+getborank);
		}
		return getborank;
	}

	public int getreviewcount(String stcode) {
	    int reivewcount=stmapper.getreviewcount(stcode);
		return reivewcount;
	}

	public ArrayList<StoreDTO> selectstrank() {
		ArrayList<StoreDTO>selectstrank=stmapper.selectstrank();
		return selectstrank;
		}

	public ArrayList<StoreDTO> selectstrankAll(String stcategory) {
		ArrayList<StoreDTO>selectstrankAll=stmapper.selectstrankAll(stcategory);
		return selectstrankAll;
		}

	public ArrayList<StoreDTO> selectstrankcategory(StoreDTO storeDTO) {
		ArrayList<StoreDTO>selectstrankcategory=stmapper.selectstrankcategory(storeDTO);
		return selectstrankcategory;
		}

	public ArrayList<StoreDTO> selectstrankarea(String areaname) {
		ArrayList<StoreDTO>selectstrankarea=stmapper.selectstrankarea(areaname);
		return selectstrankarea;
	}
	
	
}
