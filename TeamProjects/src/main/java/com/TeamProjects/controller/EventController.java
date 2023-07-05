package com.TeamProjects.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.TeamProjects.dto.EventDTO;
import com.TeamProjects.service.EventService;

@Controller
public class EventController {
    private ModelAndView mav;
    
    @Autowired
    private EventService eService;
    
    @RequestMapping(value="/event")
    public String event() {
    	return "board/event";
    }
    
    @RequestMapping(value="/eventInsert")
	public ModelAndView eventInsert(EventDTO eDto) throws IllegalStateException, IOException {
		mav = eService.eventInsert(eDto);
		
		return mav;
	}
    
    @RequestMapping(value="/showevent")
    public ModelAndView showevent() {
    	mav = eService.showevent();
    	return mav;
    }
    
    @RequestMapping(value="/sale")
    public String sale() {
    	return "board/sale";
    }
	
	
   
	
	
	 
	 
	 
	 
	
	
		
}
