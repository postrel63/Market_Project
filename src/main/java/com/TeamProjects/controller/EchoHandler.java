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

public class EchoHandler extends TextWebSocketHandler {

	@Autowired
	private StoreService stservice;

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();//그냥 세션정보를 받음 
	Map<String, WebSocketSession> userSessions = new HashMap<>(); //로그인하는 사람의 로그인세션을 모두 받음

	@Override // 서버에 접속이 됐을 때
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("EEEEEstablished" + session);
		// 접속되는 유저 관리
		sessionList.add(session);
		
		String senderId = getId(session);
		userSessions.put(senderId, session); // 연결된 사용자의 아이디를 userSessions에 저장
		
		String stcode = getStcode(session);
		userSessions.put(stcode, session); // 
		
		
		Map<String,Object> map = session.getAttributes();
		  String loginId = (String)map.get("loginId");
		

		System.out.println("userSessions::"+userSessions);
		System.out.println("저장된 세션 리스트"+sessionList);
	}
	//웹소켓에 CONNECT 하기전에 세션에 필요한 정보를 모두 ATTRIBUTE 해줘야 한다
	//로그인 후 connect 한 뒤 
	// 문자열 이용하지말고 dto 나 map 형식으로 받아와서 String userid = map.블라블라
	
	
	

	@Override // 메세지를 보냈을 때
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("TTTTTextMessage" + session);
		// 보낸 사람 아이디 , 로그인했으면 로그인 아이디, 안했으면 소켓 아이디를 부여하도록
		String senderId = getId(session);
		System.out.println(senderId);
		
		
		
		for (WebSocketSession sess : sessionList) {
			
			//sess.sendMessage(new TextMessage(senderId + ": " + message.getPayload()));
		}
		System.out.println("protocol");
		// protocol: cmd,주문자,주문번호,주문개수,가게코드, (cmd,mid,chcode,prallcount,stcode)
		System.out.println(message.getPayload());
		String msg = message.getPayload();
		String[] strs = msg.split(",");
		if (strs != null && strs.length == 5) {
			String cmd = strs[0];
			String mid = strs[1];
			String chcode = strs[2];
			String prallcount = strs[3];
			String stcode = strs[4];

			System.out.println(mid);

			// 가게 사장이 접속해 있으면 주문이 가능하도록 -->애초에 주문조차 못하게 주문리스트에서 숨기거나 여기서 차단하거나
			WebSocketSession stcodeSession = userSessions.get(stcode);
			
			//주문 접수 거절 메세지 보내기 위해 사용자의 mid로 다시 보냄
			WebSocketSession userSession = userSessions.get(mid);
			
			//order 
			if ("order".equals(cmd) && stcodeSession != null) {
				TextMessage neworder = new TextMessage("새로운 주문이 접수되었습니다. 메뉴수량:"+prallcount+"<br>주문번호:"+chcode);
				
				System.out.println(neworder);
				stcodeSession.sendMessage(neworder);
				
			}else if("cancel".equals(cmd) && userSession != null) {
				TextMessage ordercancel = new TextMessage("주문이 취소되었습니다.<br>매장명:"+chcode+"<br>취소사유:"+prallcount);
				System.out.println(ordercancel);
				userSession.sendMessage(ordercancel);
				
			}else if("accept".equals(cmd) && userSession != null) {
				TextMessage orderaccept = new TextMessage("주문이 접수되었습니다.<br>배달예상시간:"+chcode+"분"+"<br>매장명:"+prallcount);
				System.out.println(orderaccept);
				userSession.sendMessage(orderaccept);
				
			}else if("start".equals(cmd) && userSession != null) {
				TextMessage orderaccept = new TextMessage("배달을 시작했어요!<br>매장명:"+chcode);
				System.out.println(orderaccept);
				userSession.sendMessage(orderaccept);
				
			}
		}
	}

	
	// 세션에 아이디를 저장하기 위해 원래 세션값 불러오는 메소드
	private String getId(WebSocketSession session) {
		System.out.println("getId method");
		// http세션에 있는 값을 map 에 보내줌
		Map<String, Object> httpSession = session.getAttributes();
		String loginId = (String) httpSession.get(SessionNames.LOGIN);

		return loginId;
		
		//String stcode = stservice.getstcode(loginId);
		//System.out.println("stcode" + stcode);
		// 아이디가 없다면 소켓세션 아이디 받고
		//if (null == loginId)
		//	return session.getId();
		//else // 아이디가 있으면 있는 아이디 받아오고 // 채팅방 구현을 하지않는 한 무조건 세션아이디를 받아오게 됨.
		//	return stcode;
	}
	private String getStcode(WebSocketSession session) {
		System.out.println("getStcode method");
		// http세션에 있는 값을 map 에 보내줌
		Map<String, Object> httpSession = session.getAttributes();
		String stcode = (String) httpSession.get("stcode");
		return stcode;
	}
	
	

	@Override // 서버가 닫혔을 때
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("CCCCClosed" + session);
		sessionList.remove(session);
	}
}
