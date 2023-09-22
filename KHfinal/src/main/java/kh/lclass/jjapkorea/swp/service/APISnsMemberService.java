package kh.lclass.jjapkorea.swp.service;

import java.util.Date;

import kh.lclass.jjapkorea.swp.domain.APISnsMember;
import kh.lclass.jjapkorea.swp.dto.APISnsLoginDTO;

public interface APISnsMemberService {
	APISnsMember login(APISnsLoginDTO dto) throws Exception;
	void keepLogin(String apimid, String apiid, Date expire);
	APISnsMember checkLoginBefore(String value);
	APISnsMember getBySns(APISnsMember snsUser);

}