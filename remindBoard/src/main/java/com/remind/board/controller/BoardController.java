package com.remind.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.remind.board.dto.BoardDto;
import com.remind.board.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	/*
	// 게시물 목록
	@RequestMapping(value="/list")
	public void list(Model model) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = service.list();
			model.addAttribute("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
	}
	*/
	
	// 게시물 목록 + 페이징
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listPage(Model model, @RequestParam(value="num", defaultValue="1") int num){
			List<BoardDto> listPage = new ArrayList<BoardDto>();
			Map<String, Integer> map = null;
		try {
			// 게시물 총 개수
			int count = service.count();
			
			// 한 페이지에 출력할 게시물 개수
			int postNum = 10;
			
			// 하단 페이징 번호 [게시물 총 개수 / 한 페이지에 출력할 개수]
			// Math.ceil() : 소수점 이하를 올림한다
			int pageNum = (int)Math.ceil(count/postNum);
			
			// 페이지 번호에 따른 출력할 게시물 (첫번째 index)
			int displayPost = (num - 1) * postNum; // limit 10, 10 --> 11번째부터 10개
			
			map = new HashMap<String, Integer>();
			
			map.put("displayPost", displayPost);
			map.put("postNum", postNum);
			
			listPage = service.listPage(map);
			
			model.addAttribute("list", listPage); // 게시물 목록
			model.addAttribute("pageNum", pageNum); // 하단 페이징 번호
			model.addAttribute("currentNum", num); // 현재 페이지 번호
			model.addAttribute("count", count); // 총 게시물 수 (몇건의 게시물 할때 사용)
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return "/board/list";
	}
	
	// 게시물 조회
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String boarDetail(Model model, @RequestParam(value="bno") int bno) {
		try {
			BoardDto boardDto = service.boardDetail(bno);
			model.addAttribute("boardDto", boardDto);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
	return "/board/detail";
	
	}
	
	
	// 게시물 생성 (View)
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String boardWrite() {
		return "/board/write";
	}
	
	// 게시물 생성 (Back)
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String boardWrite(Model model, BoardDto boardDto) {
		int result = 0;
		try {
			boardDto.setWriter("스프링 시큐리티 추가해야함..");
			result = service.boardWrite(boardDto);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return "redirect:/board/list";
	}
	
	// 게시물 수정 (View)
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String boardUpdate(Model model, @RequestParam(value="bno") int bno) {
		try {
			BoardDto boardDto = service.boardDetail(bno);
			model.addAttribute("boardDto", boardDto);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return "/board/update";
	}
	
	// 게시물 수정 (Back)
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String boardUpate(BoardDto boardDto) {
		int result = 0;
		try {
			result = service.boardUpdate(boardDto);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		return "redirect:/board/detail?bno=" + boardDto.getBno();
	}
	
	// 게시물 삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String boardDelete(@RequestParam(value="bno") int bno) {
		int result = 0;
		try {
			result = service.boardDelete(bno);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return "redirect:/board/list";
	}
	
	
	
	
}
