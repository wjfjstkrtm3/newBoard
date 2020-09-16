package com.example.board.controller;

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

import com.example.board.dto.boardDTO;
import com.example.board.service.boardService;

@Controller
@RequestMapping(value="/board")
public class boardController {

	@Autowired
	private boardService service;

/*	
    // 게시판 목록 조회
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public List<boardDTO> boardList(Model model) {
		List<boardDTO> list = new ArrayList<boardDTO>();
		try {
			list = service.boardList();
			System.out.println("list : " + list.toString());
			model.addAttribute("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return list;
	}
	
	*/
	
	// 게시판 목록 + 페이징(끝이 없는 페이징)
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public List<boardDTO> listPage(@RequestParam(value="num", defaultValue = "0") int num, Model model) {
			List<boardDTO> list = new ArrayList<boardDTO>();
			Map<String, Integer> map = new HashMap<String, Integer>();
			
		try {
			// 게시물 총 개수
			int count = service.count();
			
			// 한 페이지에 출력할 게시물 개수
			int postNum = 10;
			
			// 하단 페이징 번호
			int pageNum = (int)Math.ceil((double)count/postNum);
			
			// 페이지 번호에 따른 출력할 index구하기
			// ex) 1페이지면 0
			// ex) 2페이지면 10
			
			int displayPost = (num-1) * postNum;
			
			map.put("displayPost", displayPost);
			map.put("postNum", postNum);
			list = service.listPage(map);
			
			model.addAttribute("list", list);
			model.addAttribute("pageNum", pageNum);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		return list;
	}
	
}
