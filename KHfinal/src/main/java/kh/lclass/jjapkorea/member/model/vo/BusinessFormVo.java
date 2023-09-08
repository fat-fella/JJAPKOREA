package kh.lclass.jjapkorea.member.model.vo;

public class BusinessFormVo {
	private int bform;
    private String bformName;

    public int getBform() {
		return bform;
	}

	public void setBform(int bform) {
		this.bform = bform;
	}

	public String getBformName() {
		return bformName;
	}

	public void setBformName(String bformName) {
		this.bformName = bformName;
	}

	// 예시 생성자
    public BusinessFormVo(int bform, String bformName) {
        this.bform = bform;
        this.bformName = bformName;
    }
}
