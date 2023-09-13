package kh.lclass.jjapkorea.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.board.model.dto.BoardDto;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession; //root-context.xml에 bean SqlSession객체에 적혀있는 아이디
	
	public List<BoardDto> selectList() throws Exception{ 
		return sqlSession.selectList("board.selectList");
	}
	public BoardDto selectOne(int bno) throws Exception{
		return sqlSession.selectOne("board.selectOne", bno);
	}
	// insert 시 selectKey를 이용해 PK 값이 추가되어있는 자료형
	public BoardDto insert(BoardDto dto) throws Exception{
		sqlSession.insert("board.insert", dto);
		return dto;
	}
	//답글

	public int update(BoardDto dto) throws Exception{
		return sqlSession.update("board.update", dto);
	}
	public int delete(int bno) throws Exception{
		return sqlSession.delete("board.delete", bno);
	}
}
