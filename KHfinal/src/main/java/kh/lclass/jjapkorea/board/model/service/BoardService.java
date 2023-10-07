package kh.lclass.jjapkorea.board.model.service;

import java.util.List;


import kh.lclass.jjapkorea.board.model.dto.BoardDto;
import kh.lclass.jjapkorea.board.model.dto.PageDto;

public interface BoardService {
	public List<BoardDto> selectList()throws Exception;
	public BoardDto selectOne(int bno)throws Exception;
	public int insert(BoardDto dto)throws Exception;
	public int update(BoardDto dto)throws Exception;
	public int delete(int bno)throws Exception;	

// 좋아요 갯수 증감
	public int totalLike(int bno) throws Exception;
	public int totalLikeCancel(int bno) throws Exception;

// 게시물 목록 + 페이징
	public int count() throws Exception;
	public List<BoardDto> listPage(PageDto page) throws Exception;
	
}
