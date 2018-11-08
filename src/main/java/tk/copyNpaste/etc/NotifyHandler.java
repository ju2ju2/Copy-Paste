package tk.copyNpaste.etc;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
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
	
	Map<String, WebSocketSession> users = new HashMap<>();

	@Autowired
	SqlSession sqlsession;
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String messagePayload = message.getPayload();
		if (StringUtils.isNotEmpty(messagePayload)) {
			String[] strs = messagePayload.split(",");
			String toUserEmail = strs[0];
			WebSocketSession toUserEmailWebSocket = users.get(toUserEmail);
			
			if (toUserEmailWebSocket != null) {
				EtcMapper etcdao = sqlsession.getMapper(EtcMapper.class);
				int toCountNotify = etcdao.countNotify(toUserEmail);
				String toCountNotifyString = String.valueOf(toCountNotify);
				toUserEmailWebSocket.sendMessage(new TextMessage(toCountNotifyString));
			}
		}
	}
	

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String userEmail = session.getPrincipal().getName().toString();
		users.put(userEmail, session);
	}
	
	/*@Override*/
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	}
	

}
