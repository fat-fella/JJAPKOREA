package kh.lclass.jjapkorea.swp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class APISnsMember {
	private String mid;
	private String mpw;
	private String mname;
	private Integer mpoint;
	
	private String apimid;
	private String apiid;
	
	private String email;
	private String id;
	
	private String googleid;
	private String naverid;
	private String kakaoid;
	private String nickname;
	private String loginip;
	private Date lastlogin;
	
	
	
	
}