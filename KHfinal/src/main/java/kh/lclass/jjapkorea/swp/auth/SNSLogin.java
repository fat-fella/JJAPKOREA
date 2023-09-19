package kh.lclass.jjapkorea.swp.auth;

import java.util.Iterator;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import kh.lclass.jjapkorea.swp.domain.APISnsMember;
import kh.project.dml.member.model.vo.FpMemberVo;

public class SNSLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
//				.scope("profile")
				.build(sns.getApi20Instance());
		
		this.sns = sns;
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	public String getKakaoAuthURL() {
	    return this.oauthService.getAuthorizationUrl();
	}

	public APISnsMember getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}

	private APISnsMember parseJson(String body) throws Exception {
		APISnsMember apiSnsMember = new APISnsMember();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		if (this.sns.isGoogle()) {
			String id = rootNode.get("id").asText();
			if (sns.isGoogle())
			apiSnsMember.setGoogleid(id);
			apiSnsMember.setEmail(rootNode.get("email").asText());
			apiSnsMember.setMname(rootNode.get("name").asText());
			
		} else if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			apiSnsMember.setEmail(resNode.get("email").asText());
			apiSnsMember.setNickname(resNode.get("nickname").asText());
			apiSnsMember.setNaverid(resNode.get("id").asText());
			
		} else if (this.sns.isKakao()) {
			apiSnsMember.setKakaoid(rootNode.get("id").asText());
			JsonNode kakaoAccountNode = rootNode.get("kakao_account");
			apiSnsMember.setEmail(kakaoAccountNode.get("email").asText());
			apiSnsMember.setMname(kakaoAccountNode.get("profile").get("nickname").asText());
		}
		return apiSnsMember;
	}
	
}
