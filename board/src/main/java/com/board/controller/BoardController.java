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
	
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public void getList(Model model) {
		try {
			List<BoardVO> list = service.list();
			model.addAttribute("list", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value="/boardWrite", method=RequestMethod.GET)
	public void boardWrite() {
		
	}
	
	@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
	public String boardWrite(@RequestParam(value="title") String title,
							 @RequestParam(value="content") String content,
							 @RequestParam(value="writer") String writer) {
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		
		try {
			service.write(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value="/boardDetail")
	public void boardDetail(@RequestParam(value="bno") int bno, Model model) {
		try {
			BoardVO vo = service.listOne(bno);
			model.addAttribute("one", vo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.GET)
	public void boardUpdate(@RequestParam(value="bno")int bno, Model model) {
		try {
			BoardVO vo = service.listOne(bno);
			model.addAttribute("one", vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(BoardVO vo) {
		try {
			service.BoardUpdate(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/boardDetail?bno=" + vo.getBno();
	}
	
	@RequestMapping(value="/boardDelete")
	public String boardDelete(@RequestParam(value="bno") int bno) {
		try {
			service.BoardDelete(bno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/board/boardList";
	}
	
	
	@RequestMapping(value="/boardListPage", method=RequestMethod.GET)
	public void getListPage(Model model, @RequestParam(value="num") int num) {
		try {
			
			System.out.println("num :" + num);
			// 게시판 총 갯수
			int count = service.BoardCount();
			
			// 한 페이지에 출력할 게시물 갯수
			int postNum = 10;
			
			// 하단 페이지 번호 ([게시물 총 개수 / 한 페이지에 출력할 게시물 갯수])
			int pageNum = (int)Math.ceil((double)count/postNum);
			
			// 페이지 번호에 따른 출력할 게시물
			int displayPost = (num-1) * postNum;
			 
			
			List<BoardVO> list = service.listPage(displayPost, postNum);
			model.addAttribute("list", list);
			model.addAttribute("pageNum", pageNum);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
