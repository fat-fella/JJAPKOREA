package kh.lclass.jjapkorea.board.model.service;

import java.util.List;


import kh.lclass.jjapkorea.board.model.dto.BoardDto;
import kh.lclass.jjapkorea.board.model.dto.BoardParam;
import kh.lclass.jjapkorea.board.model.dto.BoardSelectReplyParam;
import kh.lclass.jjapkorea.board.model.dto.Criteria;

public interface BoardService {
	public List<BoardDto> selectList()throws Exception;
	public BoardDto selectOne(int bno)throws Exception;
	public int insert(BoardDto dto)throws Exception;
	public int update(BoardDto dto)throws Exception;
	public int delete(int bno)throws Exception;	
	public int boardReadCnt(BoardParam param) throws Exception;

	
// 좋아요 갯수 증감
	public int totalLike(int bno) throws Exception;
	public int totalLikeCancel(int bno) throws Exception;

// 게시물 목록 + 페이징
	public int getTotal(Criteria cri) throws Exception;
	public List<BoardDto> getListPage(Criteria cri) throws Exception;
	
}
