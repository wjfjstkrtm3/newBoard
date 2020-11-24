package com.remind.board.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.remind.board.dto.BoardDto;
import com.remind.board.dto.PageDto;
import com.remind.board.dto.UserDto;
import com.remind.board.service.BoardService;
import com.remind.board.utils.Etc;

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
			
				List<BoardDto> listPageSearch = new ArrayList<BoardDto>();
				
				Map<String, Object> map = null;
				
			try {
				// 페이지 클래스 분리
				// PageDto page = new PageDto(num, service.count());
				PageDto page = new PageDto(num, service.searchCount(searchType, keyword));
				
				// 검색 타입과 검색어
				// page.setSearchWord(searchType, keyword); // 문자열 return
				page.setSearchType(searchType);
				page.setKeyword(keyword);
				
				map = new HashMap<String, Object>();
				
				map.put("displayPost", page.getDisplayPost()); // 페이지 번호에따른 limit 시작값
				map.put("postNum", page.getPostNum()); // 한 페이지에 보여줄 게시물 수  
				
				map.put("searchType", searchType);
				map.put("keyword", keyword);
				
				// listPage = service.listPage(map);
				listPageSearch = service.listPageSearch(map);
				model.addAttribute("list", listPageSearch); // 게시물 목록
				// model.addAttribute("pageNum", pageNum); // 하단 페이징 번호
				model.addAttribute("currentNum", num); // 현재 페이지 번호
				model.addAttribute("page", page);
				
				// model.addAttribute("searchType", searchType);
				// model.addAttribute("keyword", keyword);
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				
			}
			return "/board/list";
		}
		

	
	
	// 게시물 조회
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String boarDetail(Model model, @RequestParam(value="bno") int bno) {
		
		List<Map<String, Object>> selectFileList = null;
		
		
		
		try {
			BoardDto boardDto = service.boardDetail(bno);
			model.addAttribute("boardDto", boardDto);
			
			// 첨부파일 조회
			selectFileList = service.selectFileList(bno);
			model.addAttribute("selectFileList", selectFileList);
			
			
			
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
	public String boardWrite(Model model, BoardDto boardDto, MultipartHttpServletRequest request) {
		try {
			boardDto.setWriter(Etc.getUser());
			service.boardWrite(boardDto, request);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return "redirect:/board/listPageSearch";
	}
	
	// 게시물 수정 (View)
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String boardUpdate(Model model, @RequestParam(value="bno") int bno) {
		List<Map<String, Object>> selectFileList = new ArrayList<Map<String, Object>>();
		try {
			BoardDto boardDto = service.boardDetail(bno);
			model.addAttribute("boardDto", boardDto);
			
			// 첨부파일 조회
			selectFileList = service.selectFileList(bno);
			model.addAttribute("selectFileList", selectFileList);
			
			// 첨부파일 제한
			model.addAttribute("fileCount", service.fileCount(bno));
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return "/board/update";
	}
	
	// 게시물 수정 (Back)
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String boardUpate(BoardDto boardDto, MultipartHttpServletRequest request, 
							@RequestParam(value="filesNo") String filesNo[], 
							@RequestParam(value="filesName") String filesName[]) {
		try {
			 service.boardUpdate(boardDto, request, filesNo, filesName);
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
		return "redirect:/board/listPageSearch";
	}
	
	@RequestMapping(value="/fileDown", method=RequestMethod.GET)
	public void FileDown(HttpServletResponse response, @RequestParam(value="file_no") int file_no ) {
			String originalFileName = "";
			String storedFileName = "";
		
		try {
			Map<String, Object> resultMap = service.selectFileInfo(file_no);
			originalFileName = (String)resultMap.get("org_file_name");
			storedFileName = (String)resultMap.get("stored_file_name");
			
			// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다
			byte fileByte[] = FileUtils.readFileToByteArray(new File("D:\\바탕 화면\\JavaAll\\file\\" + storedFileName));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
			
			// 출력 스트림으로부터 주어진 바이트 배열 b의 모든 바이트를 보낸다
			response.getOutputStream().write(fileByte);
			
			// f버퍼에 잔류하는 모든 바이트를 출력한다
			response.getOutputStream().flush();
			
			// 사용한 시스템 자원을 반납하고 출력 스트림을 닫는다
			response.getOutputStream().close();
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
}
