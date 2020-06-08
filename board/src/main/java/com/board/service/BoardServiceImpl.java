package com.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public void BoardUpdate(BoardVO vo, MultipartHttpServletRequest request, String[] files, String[] fileNames) throws Exception {
		dao.BoardUpdate(vo);
		// List<Map<String, Object>> 인 이유는 파일 하나씩 map에 파일들이 key, value로 저장되어있고 파일을 여러개를 담기위해서 List를 사용
		// -> 즉 Map에는 파일들의 정보가 하나씩 들어있고, List에는 그 파일들을 보관하기위해서 사용
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(vo, request, files, fileNames);
		
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i < size; i++) {
			tempMap = list.get(i);
			
			// 새로운 파일일때
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			} else {
				// 파일을 삭제했을때
				dao.updateFileList(tempMap);
			}
		}
		
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

	@Override
	public void boardHit(int bno) throws Exception {
		dao.boardHit(bno);
	}

	
}
