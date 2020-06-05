package com.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.dto.BoardVO;
import com.board.utils.FileUtils;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private FileUtils fileUtils;
	
	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public void write(BoardVO vo, HttpServletRequest request) throws Exception {
		dao.write(vo);
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(vo, request);
		int size=list.size();
		for(int i = 0;  i < size; i++) {
			dao.insertFile(list.get(i));
		}
		
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

	@Override
	public int BoardCount() throws Exception {
		return dao.BoardCount();
	}

	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		return dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return dao.selectFileList(bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return dao.selectFileInfo(map);
	}

	
}
