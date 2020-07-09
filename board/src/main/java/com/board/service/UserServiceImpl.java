package com.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.UserDAO;
import com.board.dto.BoardVO;
import com.board.dto.UserDetail;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	

	// 회원가입
	@Override
	public void userSignUp(UserDetail vo) throws Exception {
		dao.userSignUp(vo);
	}

	// 아이디 중복확인
	@Override
	public int idCheck(String id) throws Exception {
		int result = dao.idCheck(id);
		return result;
	}

	// 내용 펼치기 (내가 쓴글) 
	@Override
	public List<BoardVO> getWroteBoard(String id) throws Exception {
		return dao.getWroteBoard(id);
	}

	// 내용 펼치기 (내가 북마크 한 글)
	@Override
	public List<BoardVO> getBookMark(String id) throws Exception {
		return dao.getBookMark(id);
	}

	// 북마크 버튼을 누르면 DB에 해당 글을 저장
	@Override
	public int scrapBoard(Map<String, Object> map) throws Exception {
		return dao.scrapBoard(map);
	}

	// 아이디 찾기
	@Override
	public UserDetail userFindId(String email) throws Exception {
		return dao.userFindId(email);
	}

	
	// boardDetail에 들어갔을때 북마크 체크 여부
	@Override
	public int scrapCheck(Map<String, Object> map) throws Exception {
		return dao.scrapCheck(map);
	}

	// 비밀번호 찾기(아이디, 이메일 검증)
	@Override
	public int userFindPassword(Map<String, Object> map) throws Exception {
		return dao.userFindPassword(map);
	}

	@Override
	public void scrapBoardDelete(Map<String, Object> map) throws Exception {
		dao.scrapBoardDelete(map);
	}

	// 임시 비밀번호 넣기
	@Override
	public void temporaryPasswordInsert(Map<String, Object> map) throws Exception {
		dao.temporaryPasswordInsert(map);
	}

	// 북마크 한 글 가져오기
	@Override
	public List<BoardVO> getScrap(String id) throws Exception {
		return dao.getScrap(id);
	}

	// 임시 비밀번호 가져오기 
	@Override
	public UserDetail temporaryPasswordSelect(String id) throws Exception {
		return dao.temporaryPasswordSelect(id);
	}

	
	// 비밀번호 변경
	@Override
	public int userChangePwd(Map<String, Object> map) throws Exception {
		int result = dao.userChangePwd(map);
		return result;
	}
}
