package com.TeamProjects.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TeamProjects.dto.CommentDTO;
import com.TeamProjects.mapper.CommentMapper;

@Service
public class CommentService {
	
	@Autowired
	private CommentMapper commentMapper;

	public ArrayList<CommentDTO> commentWrite(CommentDTO comment) {
        int nextCno = commentMapper.getMaxconum()+1;
        comment.setConum(nextCno);
		
		int insertComment = commentMapper.commentWrite(comment);
		ArrayList<CommentDTO> commentList = commentMapper.commentList(comment.getCo_bonum());
		
		return commentList;
	}

	public ArrayList<CommentDTO> commentList(int co_bonum) {
		ArrayList<CommentDTO> commentList = commentMapper.commentList(co_bonum);
		return commentList;
	}

	public ArrayList<CommentDTO> commentDelete(CommentDTO comment) {
         int commentDel = commentMapper.commentDelete2(comment.getConum());
         ArrayList<CommentDTO> commentDelList = commentMapper.commentDelList(comment.getCo_bonum());
		return commentDelList;
	}

	
}
