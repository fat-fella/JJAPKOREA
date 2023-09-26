package kh.lclass.jjapkorea.member.model.dto;

import lombok.Data;

@Data
public class BusinessFormDto {
	private int bform;
    private String bformName;
    
    public BusinessFormDto(int bform, String bformName) {
        this.bform = bform;
        this.bformName = bformName;
    }
}
