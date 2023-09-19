package kh.lclass.jjapkorea.swp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class APISnsMember {
	private String mid;
	private String mpw;
	private String mname;
	private Integer mpoint;

	private String email;
	private String googleid;
	private String naverid;
	private String kakaoid;
	private String nickname;

	private String loginip;
	private Date lastlogin;

	public static void main(String[] args) {
		APISnsMember user1 = new APISnsMember();
		user1.setMid("1111111");
		user1.setMname("adsfasfsaf1212121");

		APISnsMember user2 = new APISnsMember();
		user2.setMid("1111111");
		user2.setMname("adsfasfsaf");
		System.out.println(user1.equals(user2));
	}
}