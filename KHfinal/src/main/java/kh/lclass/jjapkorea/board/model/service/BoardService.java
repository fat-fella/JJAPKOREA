package kh.lclass.jjapkorea.board.model.service;

import java.util.List;


import kh.lclass.jjapkorea.board.model.dto.BoardDto;
import kh.lclass.jjapkorea.board.model.dto.LikeDto;

public interface BoardService {
	public List<BoardDto> selectList()throws Exception;
	public BoardDto selectOne(int bno)throws Exception;
	public int insert(BoardDto dto)throws Exception;
	public int update(BoardDto dto)throws Exception;
	public int delete(int bno)throws Exception;	
	public void doLike (LikeDto lDto)throws Exception;
	public int getMyLikeCount (LikeDto lDto)throws Exception;
	public int getTotalLikeCount (int bno)throws Exception;
	public void deleteLike (LikeDto lDto)throws Exception;
	
}
