package com.tistory.pentode.service.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tistory.pentode.vo.BoardVO;

public interface BoardDAO {
	List<BoardVO> selectBoardList() throws Exception;
	BoardVO selectBoardView(@Param(value = "num") Integer num) throws Exception;
}
