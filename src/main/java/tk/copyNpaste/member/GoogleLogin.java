package tk.copyNpaste.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

import tk.copyNpaste.vo.MemberVO;

@Service
public class GoogleLogin {
	@Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
 
    private OAuth2Operations oauthOperations;
	
	public Person getGoogleUserInfo(HttpServletRequest request){
        String code = request.getParameter("code");
        
        oauthOperations = googleConnectionFactory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
                null);
 
        String accessToken = accessGrant.getAccessToken();
        Long expireTime = accessGrant.getExpireTime();
 
        if (expireTime != null && expireTime < System.currentTimeMillis()) {
            accessToken = accessGrant.getRefreshToken(); 
        }
 
        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
        Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();

 
        PlusOperations plusOperations = google.plusOperations();
        Person profile = plusOperations.getGoogleProfile();   
		  return profile;
		
		}	
		
    public MemberVO changeData(Person profile) throws JsonProcessingException, IOException {
    	MemberVO member = new MemberVO();
		// Person 형태 반환값 처리//profile.getAccountEmail();
		if (profile.getAccountEmail() != null)
			member.setUserSocialStatus(3); //일반회원:0, 카카오:1, 네이버:2, 구글:3
			member.setUserEmail(profile.getAccountEmail());
			member.setUserNick(profile.getDisplayName());		
	        String getImageUrl  = profile.getImageUrl().replaceAll("sz=50", "");
			member.setUserPhoto(getImageUrl);
			
			
		return member;
	}
	
}
