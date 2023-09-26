package kh.lclass.jjapkorea.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.lclass.jjapkorea.board.model.dao.LikeDao;
import kh.lclass.jjapkorea.board.model.dto.LikeDto;


@Service
public class LikeServiceImpl implements LikeService{

	@Autowired
	private LikeDao likeDao;
	
	@Override
	public int likeCount(LikeDto dto) throws Exception {
		return likeDao.likeCount(dto);
	}

	@Override
	public int likeGet(LikeDto dto) throws Exception {
		return likeDao.likeGet(dto);
	}

	@Override
	public void likeInsert(LikeDto dto) throws Exception {
		likeDao.likeInsert(dto);
	}

	@Override
	public void likeUpdate(LikeDto dto) throws Exception {
		likeDao.likeUpdate(dto);
	}

}