package kh.lclass.jjapkorea.reply.model.service;

import java.util.List;

import kh.lclass.jjapkorea.reply.model.dto.ReplyDto;


public interface ReplyService {
	public List<ReplyDto> selectList(Integer boardNo) throws Exception;
	public ReplyDto selectOne(int replyNo) throws Exception;
	public List<ReplyDto> insert(ReplyDto rdto) throws Exception;
	public List<ReplyDto> insertreplyreply(ReplyDto rdto) throws Exception;
	public ReplyDto update(ReplyDto rdto) throws Exception;
	public List<ReplyDto> delete(int replyNo) throws Exception;
	public List<ReplyDto> selectMoreList(Integer rref);
}
