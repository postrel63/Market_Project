package com.TeamProjects.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.EventDTO;
import com.TeamProjects.mapper.EventMapper;

@Service
public class EventService {
	private ModelAndView mav;
	
	@Autowired
	private EventMapper eMapper;

	public ModelAndView eventInsert(EventDTO eDto) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		UUID uuid = UUID.randomUUID();
		MultipartFile efile = eDto.getEfile();
		
		String efilename = uuid.toString()+"_" +efile.getOriginalFilename();
		
		String savePath="C:\\Users\\1\\Desktop\\TeamProjects0131\\src\\main\\webapp\\resources\\fileUpload\\";
		
		if(!efile.isEmpty()) {
			efile.transferTo(new File(savePath+efilename));
		}
		eDto.setEfilename(efilename);
		int eInsert = eMapper.eventInsert(eDto);
		mav.setViewName("redirect:/"); 
		return mav;
	}

	  public ModelAndView eList() {
	  mav = new ModelAndView();
	  ArrayList<EventDTO> eDto2 = eMapper.eventList();
	  System.out.println(eDto2);
	  mav.addObject("eList",eDto2); 
	  mav.setViewName("/home");
	  
	  return mav; 
	  }

	public ModelAndView showevent() {
		mav = new ModelAndView();
		  ArrayList<EventDTO> eDto2 = eMapper.eventList();
		 
		  mav.addObject("eList",eDto2); 
		  System.out.println(eDto2);
		  mav.setViewName("board/showEvent");
		  
		  return mav; 
	}
	 

}
