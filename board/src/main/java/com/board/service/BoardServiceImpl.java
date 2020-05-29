package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.dto.BoardVO;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	
	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public void write(BoardVO vo) throws Exception {
		dao.write(vo);
		
	}

	@Override
	public BoardVO listOne(int bno) throws Exception {
		return dao.listOne(bno);
	}

	@Override
	public void BoardUpdate(BoardVO vo) throws Exception {
		dao.BoardUpdate(vo);
	}

	@Override
	public void BoardDelete(int bno) throws Exception {
		dao.BoardDelete(bno);
	}

}
