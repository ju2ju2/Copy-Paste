package tk.copyNpaste.etc;

import org.apache.ibatis.session.SqlSession;
import org.eclipse.jetty.websocket.api.CloseStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import tk.copyNpaste.mapper.EtcMapper;

@Repository
public class NotifyHandler extends TextWebSocketHandler {
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		EtcMapper etcdao = sqlsession.getMapper(EtcMapper.class);
		String userEmail = session.getPrincipal().getName().toString();
		int countNotify = etcdao.countNotify(userEmail);
		String countNotifyString = String.valueOf(countNotify);
		session.sendMessage(new TextMessage(countNotifyString));
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	}
	
	/*@Override*/
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	}
	

}
