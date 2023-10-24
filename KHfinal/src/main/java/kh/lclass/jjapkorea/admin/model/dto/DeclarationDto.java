package kh.lclass.jjapkorea.admin.model.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class DeclarationDto {
	private int rownum;
	private int rno;
	private int bno;
	private String btitle;
	private String mid;
	private String rid;
	@JsonProperty("rCategory")
	private String rCategory;
	@JsonProperty("rContent")
	private String rContent;
	private String rCheck;
}
