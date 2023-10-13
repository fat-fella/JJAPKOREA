package kh.lclass.jjapkorea.swp.service;

import java.util.Date;

import kh.lclass.jjapkorea.swp.domain.APISnsMember;
import kh.lclass.jjapkorea.swp.dto.APISnsLoginDTO;
import kh.lclass.jjapkorea.swp.dto.APISnsSignUpDTO;

public interface APISnsMemberService {
	APISnsMember login(APISnsLoginDTO dto) throws Exception;
	APISnsMember signup(APISnsSignUpDTO dto) throws Exception;
	void keepLogin(String apimid, String apiid, Date expire);
	APISnsMember checkLoginBefore(String value);
	APISnsMember getBySns(APISnsMember snsUser);
	APISnsMember mid(APISnsMember snsUser);
	APISnsMember apimid(APISnsMember snsUser);
	APISnsMember psignup(APISnsLoginDTO dto) throws Exception;
	

}