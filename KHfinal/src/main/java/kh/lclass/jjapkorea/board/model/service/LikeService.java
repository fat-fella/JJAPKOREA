package kh.lclass.jjapkorea.board.model.service;

import kh.lclass.jjapkorea.board.model.dto.LikeDto;

public interface LikeService {
	public int likeCount(LikeDto dto) throws Exception;
	public int likeGet(LikeDto dto) throws Exception;
	public void likeInsert(LikeDto dto) throws Exception;
	public void likeUpdate(LikeDto dto) throws Exception;
}
