package com.TeamProjects.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.TeamProjects.dto.BoardDTO;
import com.TeamProjects.dto.CartDTO;
import com.TeamProjects.dto.CheckDTO;
import com.TeamProjects.dto.StoreDTO;
import com.TeamProjects.mapper.BoardMapper;
import com.TeamProjects.mapper.CartMapper;
import com.TeamProjects.mapper.CheckMapper;
import com.TeamProjects.mapper.CommentMapper;
import com.TeamProjects.mapper.MemberMapper;
import com.TeamProjects.dto.PageDTO;
import com.TeamProjects.dto.ProductsDTO;

@Service
public class BoardService {
	private ModelAndView mav;

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
    private CommentMapper commentMapper;
		
	@Autowired 
	private CartMapper cartMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	/* 게시글 목록 출력 */
	public ModelAndView boardListSearch(int page, int page2) {
		mav = new ModelAndView();

		/* 전체목록페이징 */
		int pageLimit =10; 
		int pageNumLimit =6; 
		
		int startRow = (page -1) * pageLimit +1;
		int endRow = page * pageLimit;
		
		PageDTO pageDTO= new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		ArrayList<BoardDTO> boardList= boardMapper.boardListPaging(pageDTO);
		System.out.println(boardList);
		
		int boardListCnt = boardMapper.getBoardListCnt();
		int maxPage = (int)(Math.ceil((double)boardListCnt/pageLimit));
		int startPage = ((int)(Math.ceil((double)page/pageNumLimit))-1) * pageNumLimit +1;
		int endPage = startPage + pageNumLimit -1;
		if(endPage >maxPage) { 	endPage = maxPage; 	}
		
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);
		
		mav.addObject("bList", boardList);
		mav.addObject("pageDTO", pageDTO);
		
		/* 베스트후기페이징 */
		  int pageLimit2 =3; 
		  int pageNumLimit2 =1;
		  
		  int startRow2 = (page2 -1) * pageLimit2 +1;
		  int endRow2 = page2 * pageLimit2;
		  
		  PageDTO pageDTO2 = new PageDTO(); pageDTO2.setStartrow(startRow2);
		  pageDTO2.setEndrow(endRow2);
		  
		  ArrayList<BoardDTO> boardBestList = boardMapper.boardListPaging2(pageDTO2); 
		  int boardListCnt2 = boardMapper.getBoardListCnt2(); 
		  int maxPage2 = (int)(Math.ceil((double)boardListCnt2/pageLimit2)); 
		  int startPage2 = ((int)(Math.ceil((double)page2/pageNumLimit2))-1) * pageNumLimit2 +1; 
		  int endPage2 = startPage2 + pageNumLimit2 -1; 
		  
		  if(endPage2 >maxPage2) { endPage2 = maxPage2; }
		  
		  pageDTO2.setPage(page2); 
		  pageDTO2.setStartpage(startPage2);
		  pageDTO2.setEndpage(endPage2); 
		  pageDTO2.setMaxpage(maxPage2);
		  
		  mav.addObject("bBestList", boardBestList); 
		  mav.addObject("pageDTO2", pageDTO2);
		  mav.setViewName("board/boardList");
		return mav;
	}

	/* 게시글 저장 */
	public ModelAndView boardInsert(BoardDTO boardDTO) throws IllegalStateException, IOException{
		mav = new ModelAndView();
		UUID uuid = UUID.randomUUID();
		MultipartFile bfile = boardDTO.getBofile();
		
		String bfileName = uuid.toString()+"_" +bfile.getOriginalFilename();
		String savePath="C:\\Users\\DONGKUNG\\Desktop\\TeamProjects2111111\\TeamProjects2\\src\\main\\webapp\\resources\\boardfile\\";	
		 if(!bfile.isEmpty()) { 
			 bfile.transferTo(new File(savePath+bfileName)); 
			 }
		 System.out.println(bfileName);
		 
		 boardDTO.setBofilename(bfileName);
        int bNum = boardMapper.boardNum()+1;
        boardDTO.setBonum(bNum);
        int bWriteInsert = boardMapper.boardInsert(boardDTO);
        System.out.println(bWriteInsert);
        mav.setViewName("redirect:/boardList");
		return mav;
	}

	/* 게시글 상세페이지 */
	public ModelAndView boardView(int bonum) {
        mav = new ModelAndView();
        boardMapper.boardHitUp(bonum);
                
        BoardDTO bDto = boardMapper.boardView(bonum);
        System.out.println(bDto);
        mav.addObject("bView",bDto);
        
         
		/* 프로필 사진출력 */
        String mFilename = memberMapper.getMfilename(bonum);
        mav.addObject("mFilename",mFilename);
        mav.setViewName("board/boardView");
        
        return mav;
	}

	/* 상세페이지 수정 */
	public String boardUpdate(BoardDTO bDto) {
          int bUpdate = boardMapper.boardUpdate(bDto);
          String bUpdate2 = null;
          if(bUpdate>0) {
        	  bUpdate2 ="OK";
          }else {
        	  bUpdate2 ="NO";
          }
		  return bUpdate2;
	}

	/* 상세페이지 삭제 */
	public ModelAndView boardDelete(int bonum) {
		 int commentDel = commentMapper.commentDelete(bonum);
		 int boardDel = boardMapper.boardDelete(bonum);
		 
		 
         mav.setViewName("redirect:/boardList");
		 return mav;
	}

	/* 게시글 검색 */
	public ModelAndView boardSearch(String botype, String searchtype, String keyword) {
          mav = new ModelAndView();
          ArrayList<BoardDTO> boardList = null;
          
          HashMap<String, String> map = new HashMap<String, String>();
          map.put("botype",botype);
          map.put("searchtype",searchtype);
          map.put("keyword",keyword);
          
          boardList = boardMapper.boardSearch(map);
          
          System.out.println(boardList);
          mav.addObject("bList", boardList);
          mav.setViewName("board/boardSearchList");
    	  return mav;
	}

	/* 게시글쓰기 구매목록&상점코드 불러오기 */
	  public ArrayList<CartDTO> getWriteInfo(String mid) { 
	  ArrayList<CartDTO> prList = cartMapper.getWriteInfo(mid);
	  System.out.println(prList);
	  
	  return prList; 
	  }

		/* 좋아요 업데이트 */
	public int insertBorecommend(BoardDTO bDto) {
		boardMapper.insertBorecommend(bDto);
		int bonum = bDto.getBonum();
		int recommendNum = boardMapper.selectBorecommend(bonum);
		return recommendNum;
	}
     
	
	 

	
	



	 

	

	
		
	

}
 