package com.TeamProjects.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Select;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.BoardDTO;
import com.TeamProjects.dto.PageDTO;
import com.TeamProjects.dto.StoreDTO;

public interface BoardMapper {

	/* 게시글전체페이징 */
	public ArrayList<BoardDTO> boardListPaging(PageDTO pageDTO);
	public int getBoardListCnt();

	/* 베스트게시글페이징 */
	public ArrayList<BoardDTO> boardListPaging2(PageDTO pageDTO2);
	public int getBoardListCnt2();

	
	/* 게시글쓰기 DB 저장 */ 
	public int boardInsert(BoardDTO boardDTO);

	/* 게시글 최댓값 번호 불러오기 */
	public int boardNum();

	
	/* 게시글 상세페이지 */
	public BoardDTO boardView(int bonum);
	public void boardHitUp(int bonum);

	/* 상세페이지 수정 */
	public int boardUpdate(BoardDTO bDto);

	/* 상세페이지 삭제 */
	public int boardDelete(int bonum);

	/* 게시글 검색 */
	public ArrayList<BoardDTO> boardSearch(HashMap<String, String> map);
	
	/* 좋아요 업데이트 */ 
	public int insertBorecommend(BoardDTO bDto);
	
	/* 좋아요 숫자 가져오기 */
	public int selectBorecommend(int bonum);
	
	/* 게시글 자유일 때 Stcode 저장 */
	public void insertStcode(String bowriter);

	
	
	



}
