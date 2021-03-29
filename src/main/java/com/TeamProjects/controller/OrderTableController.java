package com.TeamProjects.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.TeamProjects.interceptor.SessionNames;
import com.TeamProjects.service.StoreService;

public class OrderTableController extends TextWebSocketHandler {

	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();

	
	
}
