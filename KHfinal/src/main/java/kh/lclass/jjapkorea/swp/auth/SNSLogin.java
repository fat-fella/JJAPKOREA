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

public class SNSLogin {
    private OAuth20Service oauthService;
    private SnsValue sns;

    public SNSLogin(SnsValue sns) {
        this.oauthService = new ServiceBuilder(sns.getClientId())
                .apiSecret(sns.getClientSecret())
                .callback(sns.getRedirectUrl())
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
        // 사용자 인증 코드로 액세스 토큰을 가져옴
        OAuth2AccessToken accessToken = oauthService.getAccessToken(code);

        // OAuth2 요청 생성
        OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
        oauthService.signRequest(accessToken, request);

        // OAuth 요청 로깅
        System.out.println("OAuth Request: " + request.toString());

        // OAuth 응답 받아오기
        Response response = oauthService.execute(request);

        // OAuth 응답 로깅
        System.out.println("OAuth Response Code: " + response.getCode());
        System.out.println("OAuth Response Body: " + response.getBody());

        // JSON 응답 파싱하여 사용자 정보 추출
        return parseJson(response.getBody());
    }

    private APISnsMember parseJson(String body) throws Exception {
        APISnsMember apiSnsMember = new APISnsMember();

        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(body);

        if (rootNode != null) {
            if (this.sns.isGoogle()) {
                JsonNode idNode = rootNode.get("id");
                if (idNode != null && !idNode.isNull()) {
                    String id = idNode.asText();
                    apiSnsMember.setGoogleid(id);
                }
                JsonNode emailNode = rootNode.get("email");
                if (emailNode != null && !emailNode.isNull()) {
                    apiSnsMember.setEmail(emailNode.asText());
                }
                JsonNode nameNode = rootNode.get("name");
                if (nameNode != null && !nameNode.isNull()) {
                    apiSnsMember.setMname(nameNode.asText());
                }
            } else if (this.sns.isNaver()) {
                JsonNode resNode = rootNode.get("response");
                if (resNode != null) {
                    JsonNode emailNode = resNode.get("email");
                    if (emailNode != null && !emailNode.isNull()) {
                        apiSnsMember.setEmail(emailNode.asText());
                    }
                    JsonNode nicknameNode = resNode.get("nickname");
                    if (nicknameNode != null && !nicknameNode.isNull()) {
                        apiSnsMember.setNickname(nicknameNode.asText());
                    }
                    JsonNode idNode = resNode.get("id");
                    if (idNode != null && !idNode.isNull()) {
                        apiSnsMember.setNaverid(idNode.asText());
                    }
                }
            } else if (this.sns.isKakao()) {
                JsonNode idNode = rootNode.get("id");
                if (idNode != null && !idNode.isNull()) {
                    apiSnsMember.setKakaoid(idNode.asText());
                }
                JsonNode kakaoAccountNode = rootNode.get("kakao_account");
                if (kakaoAccountNode != null) {
                    JsonNode emailNode = kakaoAccountNode.get("email");
                    if (emailNode != null && !emailNode.isNull()) {
                        apiSnsMember.setEmail(emailNode.asText());
                    }
                    JsonNode nicknameNode = kakaoAccountNode.get("profile").get("nickname");
                    if (nicknameNode != null && !nicknameNode.isNull()) {
                        apiSnsMember.setMname(nicknameNode.asText());
                    }
                }
            }
        }
        return apiSnsMember;
    }
}