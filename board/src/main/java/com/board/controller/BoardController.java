package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/boardwrite", method=RequestMethod.GET)
	public String boardWriteForm() {
		return "/board/boardwrite";
	}
	
	@RequestMapping(value="/boardwrite", method=RequestMethod.POST)
	public String boardWrite(@RequestParam(value="title") String title,
							 @RequestParam(value="content") String content,
							 @RequestParam(value="writer") String writer) {
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		
		System.out.println("tostring : " +vo.toString());
		try {
			service.write(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/boardlist";
	}
	
}
