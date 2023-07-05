package com.TeamProjects.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.TeamProjects.dto.CommentDTO;
import com.TeamProjects.service.CommentService;

@Controller
public class CommentController {

	
	  @Autowired 
	  private CommentService commentService;
	  
	  @RequestMapping(value="/commentWrite")
	  public @ResponseBody ArrayList<CommentDTO> commentWrite(CommentDTO comment) {
		  ArrayList<CommentDTO> commentList = commentService.commentWrite(comment);
		  return commentList;
	  }
	  
	  @RequestMapping(value="/commentList")
	  public @ResponseBody ArrayList<CommentDTO> commentList(int co_bonum){
		  ArrayList<CommentDTO> commentList = commentService.commentList(co_bonum);
		  return commentList;
	  }
	  
	  @RequestMapping(value="/commentDelete")
	  public @ResponseBody ArrayList<CommentDTO> commentDelete(CommentDTO comment) {
		  ArrayList<CommentDTO> commentDelete = commentService.commentDelete(comment);
		  return commentDelete;
	  }
	  
	
	  
}
