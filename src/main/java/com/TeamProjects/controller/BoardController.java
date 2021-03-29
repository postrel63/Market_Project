
package com.TeamProjects.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.TeamProjects.dto.BoardDTO;
import com.TeamProjects.dto.CartDTO;
import com.TeamProjects.dto.ProductsDTO;
import com.TeamProjects.service.BoardService;


@Controller
public class BoardController {
	private ModelAndView mav;
	
	@Autowired
	private BoardService boardService;

	
	
	/* 게시글 페이지로 이동 */	
	@RequestMapping(value = "/boardList")
	public ModelAndView boardSearch(@RequestParam(value = "page", defaultValue = "1") int page,
		@RequestParam(value = "page2", defaultValue = "1") int page2) {
		mav = boardService.boardListSearch(page, page2);
		return mav;
	}

   	
	/* 게시글 저장 */
	@RequestMapping(value = "/boardWrite")
	public ModelAndView boardWrite(BoardDTO boardDTO) throws IllegalStateException, IOException {
		System.out.println("/boardWrite=="+boardDTO);
		String stcode = boardDTO.getStcode();
		String changeStcode ="0";
		
		if(stcode == null) {
		  boardDTO.setStcode(changeStcode);	
		  boardService.boardInsert(boardDTO);
		} else {
		mav = boardService.boardInsert(boardDTO);
		}
		
		return mav;
	}
	

	/* 게시글 상세페이지 */
	@RequestMapping(value = "/boardView")
	public ModelAndView boardView(int bonum) {
		mav = boardService.boardView(bonum);
		return mav;
	}

	/* 상세페이지 수정 */
	 @RequestMapping(value = "/boardUpdate") 
	 public @ResponseBody String boardUpdate(BoardDTO bDto) { 
      System.out.println("/boardUpdate");
	  System.out.println(bDto); 
	  String bUpdate = boardService.boardUpdate(bDto);
	  System.out.println(bUpdate); 
	  return bUpdate; 
	  }
	 
	 
	/* 상세페이지 삭제 */
     @RequestMapping(value = "/boardDel")
	  public ModelAndView boardDelete(int bonum) {
	  mav = boardService.boardDelete(bonum);
	  return mav;
      } 
    
	/* 게시글 검색 */
     @RequestMapping(value="/boardSearch")
 	  public ModelAndView boardSearch(String botype, String searchtype, String keyword) {
 		mav = boardService.boardSearch(botype, searchtype, keyword);
 		return mav;
 	}

	/* 게시글쓰기 구매목록&상점코드 불러오기 */
	@RequestMapping(value ="/getWriteInfo")
	public @ResponseBody ArrayList<CartDTO> getWriteInfo(String mid) {
		 ArrayList<CartDTO> writeInfoList = boardService.getWriteInfo(mid);
		return writeInfoList;
	}
	
	/* 좋아요 업데이트 */
	@RequestMapping(value="/insertBorecommend")
	public @ResponseBody int insertBorecommend (BoardDTO bDto) {
		int recommendNum = boardService.insertBorecommend(bDto);
		System.out.println(recommendNum);
		return recommendNum;
		
	}

	/* 글쓰기 페이지 이동 */
	@RequestMapping(value="/gotoWrite")
	public String gotoWrite() { 
	return "board/boardWrite";
	}
	
	
	
	
	

}
