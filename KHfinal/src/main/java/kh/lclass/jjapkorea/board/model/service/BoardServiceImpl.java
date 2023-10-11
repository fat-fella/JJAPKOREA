package kh.lclass.jjapkorea.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.board.model.dao.BoardDao;
import kh.lclass.jjapkorea.board.model.dto.BoardDto;
import kh.lclass.jjapkorea.board.model.dto.Criteria;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<BoardDto> selectList() throws Exception{
		 return boardDao.selectList();
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardDto selectOne(int bno) throws Exception{
		boardDao.boardReadCnt(bno);
		 return boardDao.selectOne(bno);
	}

	@Override
	public int insert(BoardDto dto) throws Exception {
		 BoardDto returnVo = boardDao.insert(dto); 
		 int result = returnVo.getBno();
		 return result;
	}

	@Override
	public int update(BoardDto dto) throws Exception {
		 return boardDao.update(dto);
	}

	@Override
	public int delete(int bno) throws Exception {
		return boardDao.delete(bno);
	}
	

	@Override
	public int boardReadCnt(int bno) throws Exception {
		return boardDao.boardReadCnt(bno);
	}


	@Override
	public int getTotal(Criteria cri) throws Exception{
		return boardDao.getTotal(cri);
	}
	
	@Override
	public List<BoardDto> getListPage(Criteria cri) throws Exception {
	 return boardDao.getListPage(cri);
	}
	
	@Override
	public int totalLike(int bno) throws Exception {
		return boardDao.totalLike(bno);
	}

	@Override
	public int totalLikeCancel(int bno) throws Exception {
		return boardDao.totalLikeCancel(bno);
	}

}
