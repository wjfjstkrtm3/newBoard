package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dto.BoardVO;
import com.board.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/boardlist", method=RequestMethod.GET)
	public void getList(Model model) {
		try {
			List<BoardVO> list = service.list();
			model.addAttribute("list", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
}
