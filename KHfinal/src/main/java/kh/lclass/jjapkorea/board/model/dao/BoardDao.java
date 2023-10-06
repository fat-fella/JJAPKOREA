package kh.lclass.jjapkorea.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.board.model.dto.BoardDto;
import kh.lclass.jjapkorea.board.model.dto.LikeDto;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 목록
		public List<BoardDto> selectList() throws Exception{ 
			return sqlSession.selectList("board.selectList");
		}
		
	// 게시글 상세	
		public BoardDto selectOne(int bno) throws Exception{
			return sqlSession.selectOne("board.selectOne", bno);
		}
		
	// 글 등록	
		// insert 시 selectKey를 이용해 PK 값이 추가되어있는 자료형
		public BoardDto insert(BoardDto dto) throws Exception{
			sqlSession.insert("board.insert", dto);
			return dto;
		}
		
	// 글 수정	
		public int update(BoardDto dto) throws Exception{
			return sqlSession.update("board.update", dto);
		}

	// 글 삭제	
		public int delete(int bno) throws Exception{
			return sqlSession.delete("board.delete", bno);
		}
	// 게시판 조회수
		public int boardReadCnt(int bno) throws Exception{
			return sqlSession.update("board.boardReadCnt", bno);
		}
		
	// 좋아요 갯수
		public int totalLike(int bno) throws Exception{
			return sqlSession.update("board.updateLike", bno);
		}
		
		public int totalLikeCancel(int bno) throws Exception{
			return sqlSession.update("board.updateLikeCancel", bno);
		}
}
