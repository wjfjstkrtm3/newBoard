package com.remind.board.controller;


import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.remind.board.dto.BoardType;
import com.remind.board.dto.MakeBoardDto;
import com.remind.board.dto.UserDto;
import com.remind.board.service.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

	@Autowired
	private AdminService service;
	
	
	@GetMapping(value="/makeBoard")
	public String makeBoard(Model model, HttpSession session) {
		List<BoardType> list = new ArrayList<BoardType>();
		try {
			
			
			// 게시판 이름
			list = service.getBoardTitleList();
			model.addAttribute("boardTitle", list);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/board/makeBoard";
		
	}
	
	// 게시판 만들기 or 제거
	@RequestMapping(value="/makeBoardWrite")
	public String makeBoard(Model model, @RequestParam(value="dataArray", defaultValue = "") String dataArray[],
										 @RequestParam(value="deleteArray", defaultValue = "") String deleteArray[]) {
		String type = "";
		int result = 0;
		try {
			
			// '-'버튼에 있는 게시판 삭제하기
			if(deleteArray.length > 0) {
				for(int i = 0; i < deleteArray.length; i++) {
								
					type = deleteArray[i];
					result = service.boardDelete(type);
				}
			}
						
			
			
			// mybatis에서 해결하지말고
			// dataArray의 length만큼 돌려서 담는 방법
			// 게시물의 제목을 담음 (게시물의 제목이 여러개 날라올 수 있으니까)
			for(int i = 0; i < dataArray.length; i++) {
				type = dataArray[i];
				service.makeBoard(type);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/makeBoard";
		
	}
	
	// 게시판 제목 List
	@ResponseBody
	@PostMapping(value="/getBoardTitleList")
	public List<BoardType> getBoardTitleList(Model model) {
		List<BoardType> list = new ArrayList<BoardType>();
		try {
			list = service.getBoardTitleList();
			model.addAttribute("boardTitle", list);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 게시판 title을 누르면 id로 해당 게시판 조회
	@GetMapping(value="/goBoardById")
	public String getBoardListById(Model model, @RequestParam(value="id") int id) {
		List<MakeBoardDto> list = new ArrayList<MakeBoardDto>();
		BoardType boardType = new BoardType();
		int count = 0;
		try {
			list = service.getBoardListById(id);
			boardType = service.getBoardTitleById(id);
			count = service.boardCount(id);
			// 게시물 List
			model.addAttribute("list", list);
			
			// 게시판 id, type return
			model.addAttribute("boardType", boardType);
			
			// 게시물 수
			model.addAttribute("count", count);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/board/goBoardById";
	
	}
	
	// 게시판 글쓰기 (View)
	@GetMapping(value="/write")
	public String boardWrite(Model model, @RequestParam(value="id") String id) {
		try {
			model.addAttribute("id" , id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/admin/board/write";
	}
	
	// 게시판 글쓰기 (Back)
	@PostMapping(value="/write")
	public String boardWrite(MakeBoardDto makeBoardDto, Principal principal) {
		try {
			// 작성자 set
			makeBoardDto.setWriter(principal.getName());
			
			// 게시물 makeBoardDto set
			service.boardWrite(makeBoardDto);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return "redirect:/admin/goBoardById?id=" + makeBoardDto.getBoard_type() ;
		
	}
	
	// Member 관리 페이지 (View)
	@GetMapping(value="/memberManage")
	public String memberManange(Model model) {
		List<UserDto> list = new ArrayList<UserDto>();
		int count = 0;
		try {
			list = service.selectUsers();
			model.addAttribute("list", list);
			
			count = service.userCount();
			model.addAttribute("userCount", count);
				
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return "/admin/memberManage";
	}
	
	@PostMapping(value="/selectMemberUpdate")
	public void selectMemberUpdate() {
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
