package kh.lclass.jjapkorea.board.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class BoardSelectReplyParam {
	private int bno;
	private int selectReplyNo;
}
