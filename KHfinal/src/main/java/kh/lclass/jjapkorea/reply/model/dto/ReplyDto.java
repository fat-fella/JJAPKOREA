package kh.lclass.jjapkorea.reply.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Component
public class ReplyDto {
	private int replyNo;
	private String memberId;
	private String replyContent;
	private String replyDate;
	private int boardNo;
	private int rref;
	private int rstep;
	private int rlevel;
	
	@Override
	public String toString() {
		return "ReplyDto [replyNo=" + replyNo + ", memberId=" + memberId + ", replyDate=" + replyDate + ", boardNo="
				+ boardNo + ", rref=" + rref + ", rstep=" + rstep + ", rlevel=" + rlevel + "]";
	}
	
	
}