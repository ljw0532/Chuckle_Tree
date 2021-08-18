package com.company.cktree.socket;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class EchoHandler extends TextWebSocketHandler{
	HttpSessionHandshakeInterceptor i = null;
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//로그인중인 개별유저
	Map<String,WebSocketSession> userSessionsMap = new HashMap<String,WebSocketSession>();
	
	//클라이언트가 서버로 연결중일때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		String key = session.getId();	
		userSessionsMap.put(key,session);
			System.out.println("ㅇㅇ"+userSessionsMap.get(key));
	}

	//클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String msg = message.getPayload();
		if(msg != null) {
			String[] strs = msg.split(",");
			log(strs.toString());
			if(strs != null && strs.length == 5) {
				String b_no = strs[0];
				String b_writer = strs[1];
				String count = strs[2];
				String b_title = strs[3];
				String m_name = strs[4];		
				String comment = m_name+"님이 " + b_writer + "님의 " + b_title +" 게시물에 좋아요를 눌렀습니다.";
				
				System.out.println("b_writer"+userSessionsMap.get(b_writer));
				WebSocketSession receiversession = userSessionsMap.get(session.getId());
				System.out.println("리시버세션"+receiversession);
			
					TextMessage txtmsg = new TextMessage(comment);
					receiversession.sendMessage(txtmsg);//작성자에게 알려줍니다
				
			}
		}
	}
	
	//연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		String senderId = getMemberId(session);
		if(senderId!=null) {
			log(senderId + "연결 종료됨");
			userSessionsMap.remove(senderId);
			sessions.remove(session);
		}
	}
	
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}
		
	//로그찍기
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	
	//세션에서 회원아이디 가져오기
	private String getMemberId(WebSocketSession session) {
		Map<String,Object> httpSession = session.getAttributes();
		String m_id = (String) httpSession.get("session_m_id");
		
		
		return m_id == null ? null: m_id;
	}
}
