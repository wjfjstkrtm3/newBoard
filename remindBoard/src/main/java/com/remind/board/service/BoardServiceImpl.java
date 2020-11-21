package com.remind.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.remind.board.dao.BoardDao;
import com.remind.board.dto.BoardDto;
import com.remind.board.utils.FileUtils;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Autowired
	private FileUtils fileUtils;
	
	// 게시물 목록
	@Override
	public List<BoardDto> list() throws Exception {
		return dao.list();
	}

	// 총 게시물 수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	// 게시물 총 개수 + 검색 적용
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return dao.searchCount(searchType, keyword);
	}

	// 게시물 목록 + 페이징
	@Override
	public List<BoardDto> listPage(Map<String, Integer> map) throws Exception {
		return dao.listPage(map);
	}

	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<BoardDto> listPageSearch(Map<String, Object> map) throws Exception {
		return dao.listPageSearch(map);
	}

	// 게시물 조회
	@Override
	public BoardDto boardDetail(int bno) throws Exception {
		return dao.boardDetail(bno);
	}

	// 게시물 생성
	@Override
	public void boardWrite(BoardDto boardDto, MultipartHttpServletRequest request) throws Exception {
		dao.boardWrite(boardDto);
		
		if(request != null) {
			List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(boardDto, request);
			
			int size = list.size();
			
			for(int i = 0; i < size; i++) {
				dao.insertFile(list.get(i));
			}
		}
		
		
		
	}
	
	// 게시물 수정
	@Override
	public int boardUpdate(BoardDto boardDto) throws Exception {
		return dao.boardUpdate(boardDto);
	}

	// 게시물 삭제
	@Override
	public int boardDelete(int bno) throws Exception {
		return dao.boardDelete(bno);
		
	}

	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return dao.selectFileList(bno);
	}

	// 첨부파일 다운
	@Override
	public Map<String, Object> selectFileInfo(int file_no) throws Exception {
		return dao.selectFileInfo(file_no);
	}

	
	

	
}
