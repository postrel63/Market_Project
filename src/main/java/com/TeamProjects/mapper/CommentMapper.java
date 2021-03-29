package com.TeamProjects.mapper;

import java.util.ArrayList;

import com.TeamProjects.dto.CommentDTO;

public interface CommentMapper {

	int commentWrite(CommentDTO comment);

	ArrayList<CommentDTO> commentList(int co_bonum);

	int getMaxconum();
    
	/* 상세페이지 삭제시 댓글 삭제 */
	int commentDelete(int co_bonum);

	ArrayList<CommentDTO> commentDelList(int co_bonum);

	/* 댓글삭제 */
	int commentDelete2(int conum);

	

}
