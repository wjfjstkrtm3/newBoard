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
import com.remind.board.dto.PageDto;
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
			// 페이지 클래스 분리
			PageDto page = new PageDto(num, service.count());
			/*
			// 게시물 총 개수
			int count = service.count();
			
			// 한 페이지에 출력할 게시물 개수
			int postNum = 10;
			
			// 하단 페이징 번호 [게시물 총 개수 / 한 페이지에 출력할 개수]
			// Math.ceil() : 소수점 이하를 올림한다
			int pageNum = (int)Math.ceil(count/postNum);
			
			// 페이지 번호에 따른 출력할 게시물 (첫번째 index)
			int displayPost = (num - 1) * postNum; // limit 10, 10 --> 11번째부터 10개
			
			// 하단에 표시할 페이지 번호의 개수
			int pageNum_cnt = 10;
			
			// 표시되는 페이지 번호 중 마지막 번호
			int endPageNum = (int)Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt;
			
			// 표시되는 페이지 번호 중 첫번째 번호                      // 여기는 무조건 9
			int startPageNum = endPageNum - (pageNum_cnt - 1); // 1, 11, 21, 31, 41 ..
			// int startPageNum = endPageNum - pageNum_cnt + 1; 위방법이나 아래방법 둘중에
			
			// -----------------------------------------------------------------------
			// 여기 위에까지 하면 endPageNum이 무조건 10, 20, 30, 이렇게 된다 
			// 만약 게시물의 총 수로 인해서 endPageNum이 13일때는 14 ~ 20 페이지까지는 빈 페이지가 된다
			// 그래서 아래 조건을 추가한다
			
			int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt)); // 112 / 10 --> 12
			
			if(endPageNum > endPageNum_tmp) {
				endPageNum = endPageNum_tmp;
			}
			---------------------------------------------------------------------------------------------------------
			  만약 전체 게시물 수가 52개, 현재 페이지 번호가 3이라면..
			 int endPageNum = Math.ceil(3 / 10) * 10 --> 10
			 int endPageNum_cnt = Math.ceil(52 / 10) --> 6
			 if(10 > 6) {
					endPageNum = 6;
				}   마지막 페이지가 6
			  만약 전체 게시물 수가 500개, 현재 페이지 번호가 3이라면..
			 int endPageNum = Math.ceil(3 / 10) * 10 --> 10
			 int endPageNum_cnt = Math.ceil(500 / 10) --> 50
			 if(10 > 50) { --> false
			 	endPageNum = endPageNum_cnt; 
			 } --> endPageNum은 10페이지가됨
			 
			---------------------------------------------------------------------------------------------------------
			 
			boolean prev = (startPageNum() == 1) ? false : true;
							// 시작페이지가 1이면 이전버튼이 없게 false return
			boolean next = (endPageNum() * pageNum_cnt()) >= count() ? false: true;
			// 10 * 10 >= 100(10페이지) --> false --> 총 게시물이 100개니까 10페이지
			// next버튼 없음
			// 10 * 10 >= 101(11페이지) --> true --> 총 게시물이 101개니까 11페이지
			// next버튼 생김
			
			*/
			
			map = new HashMap<String, Integer>();
			
			map.put("displayPost", page.getDisplayPost()); // 페이지 번호에따른 limit 시작값
			map.put("postNum", page.getPostNum()); // 한 페이지에 보여줄 게시물 수  
			
			listPage = service.listPage(map);
			
			model.addAttribute("list", listPage); // 게시물 목록
			// model.addAttribute("pageNum", pageNum); // 하단 페이징 번호
			model.addAttribute("currentNum", num); // 현재 페이지 번호
			model.addAttribute("page", page);
			
			/*
			PageDto 클래스 전체를 보내면 아래내용 생략가능
			model.addAttribute("count", page.getCount()); // 총 게시물 수 (몇건의 게시물 할때 사용)
			model.addAttribute("startPageNum", page.getStartPageNum()); // 표시되는 페이지 번호 중 첫번째 번호
			model.addAttribute("endPageNum", page.getEndPageNum()); // 표시되는 페이지 번호 충 마지막 번호
			model.addAttribute("prev", page.isPrev()); // 이전 버튼
			model.addAttribute("next", page.isNext()); // 다음 버튼
			*/
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return "/board/list";
	}
	
	
	// 게시물 목록 + 페이징 + 검색
		@RequestMapping(value="/listPageSearch", method=RequestMethod.GET)
		public String listPageSearch(Model model, @RequestParam(value="num", defaultValue="1") int num,
											      @RequestParam(value="searchType", defaultValue="") String searchType,
											      @RequestParam(value="keyword", defaultValue="") String keyword){
				List<BoardDto> listPage = new ArrayList<BoardDto>();
				Map<String, Integer> map = null;
			try {
				// 페이지 클래스 분리
				PageDto page = new PageDto(num, service.count());
				
				map = new HashMap<String, Integer>();
				
				map.put("displayPost", page.getDisplayPost()); // 페이지 번호에따른 limit 시작값
				map.put("postNum", page.getPostNum()); // 한 페이지에 보여줄 게시물 수  
				
				listPage = service.listPage(map);
				
				model.addAttribute("list", listPage); // 게시물 목록
				// model.addAttribute("pageNum", pageNum); // 하단 페이징 번호
				model.addAttribute("currentNum", num); // 현재 페이지 번호
				model.addAttribute("page", page);
				
				
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
