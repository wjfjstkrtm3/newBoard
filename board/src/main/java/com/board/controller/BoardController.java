package com.board.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.board.dto.BoardReplyVO;
import com.board.dto.BoardVO;
import com.board.dto.Page;
import com.board.dto.ReplyPage;
import com.board.dto.SearchCriteria;
import com.board.dto.WriteBoardVO;
import com.board.service.BoardReplyService;
import com.board.service.BoardService;
import com.board.utils.CommonUtils;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	
	@Autowired
	private BoardService service;

	@Autowired
	private BoardReplyService replyService;

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
							 HttpServletRequest request, Map<String, Object> map
							 ) {
		String writer = CommonUtils.getUserName();
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		
		
		Map<String, String> mapVO = new HashMap<String, String>();
		mapVO.put("title", title);
		mapVO.put("content", content);
		mapVO.put("writer", writer);
		
		
		try {
			service.write(vo, request);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/boardListPageSearch";
	}
	
	@RequestMapping(value="/boardDetail")
	public void boardDetail(@RequestParam(value="bno") int bno, Model model, SearchCriteria sc,
							@RequestParam(value="num", defaultValue="1") int num,
							@RequestParam(value="replyPageNum", defaultValue="1")int replyPageNum) {
		try {  
			
			BoardVO vo = service.listOne(bno);
			service.boardHit(bno);
			List<Map<String, Object>> map = service.selectFileList(bno);
			
			// List<BoardReplyVO> getReplyList = replyService.getListReply(vo.getBno());
			ReplyPage replyPage = new ReplyPage();
			replyPage.setNum(replyPageNum);
			replyPage.setCount(replyService.getBoardReplyCount(bno));
			List<BoardReplyVO> list = replyService.boardReplyPage(replyPage.getDisplaypost(), replyPage.getPostNum(), bno);
			
			model.addAttribute("one", vo);
			model.addAttribute("num", num); // 현재 페이지 번호
			model.addAttribute("sc", sc); // searchType, keyword
			
			// 페이지 처리
			model.addAttribute("replyPage", replyPage);
			model.addAttribute("reply", list);
			
			
			// model.addAttribute("reply", getReplyList);
			model.addAttribute("fileMap", map);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.GET)
	public void boardUpdate(@RequestParam(value="bno")int bno, Model model) {
		try {
			BoardVO vo = service.listOne(bno);
			List<Map<String, Object>> fileList = service.selectFileList(bno);
			
			model.addAttribute("one", vo);
			model.addAttribute("fileList", fileList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(@RequestParam(value="num") int num, BoardVO vo, 
						      @RequestParam(value="searchType", required=false, defaultValue="")String searchType,
			                  @RequestParam(value="keyword", required=false, defaultValue="")String keyword,
			                  @RequestParam(value="bno") int bno,
			                  @RequestParam(value="fileNoDel[]") String[] files,
			                  @RequestParam(value="fileNameDel[]") String[] fileNames,
			                  MultipartHttpServletRequest request) {
		try { 
			service.BoardUpdate(vo, request, files, fileNames);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/boardDetail?bno=" + vo.getBno() + "&num=" + num + "&searchType=" + searchType + "&keyword=" + keyword;
	}
	
	@RequestMapping(value="/boardDelete")
	public String boardDelete(@RequestParam(value="bno") int bno) {
		try {
			service.BoardDelete(bno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/board/boardListPageSearch";
	}
	
	
	
	// 게시판 + 페이징
	@RequestMapping(value="/boardListPage", method=RequestMethod.GET)
	public void getListPage(Model model, @RequestParam(value="num") int num) {
		try {
			/*
			// 게시판 총 갯수
			int count = service.BoardCount();
			
			// 한 페이지에 출력할 게시물 갯수
			int postNum = 10;
			
			// 하단 페이지 번호 ([게시물 총 개수 / 한 페이지에 출력할 게시물 갯수])
			int pageNum = (int)Math.ceil((double)count/postNum);
			
			// 페이지 번호에 따른 출력할 게시물
			int displayPost = (num-1) * postNum;
			 
			// 한번에 표시할 페이징 번호의 갯수
			int pageNum_cnt = 10;
			
			// 표시되는 페이지 번호 중 마지막 번호
			int endPageNum = (int)Math.ceil((double)num/pageNum_cnt) * pageNum_cnt;
			
			// 표시되는 페이지 번호 중 첫번째 번호
			int startPageNum = endPageNum - pageNum_cnt + 1;
			
			// 마지막 번호 재계산
			// ex) 저기위는 단순히 마지막 페이지 번호가 10, 20, 30 .. 단순히 계속 이렇게 되는데
			// ex) 만약에 총 게시물이 62개면 보통 1~7페이지까지 나와야하는데 위의 로직대로면 8,9,10페이지가 쓸데없이 나오기때문에 재계산이 필요하다
			
			int endPageNum_tmp = (int)Math.ceil((double)count / pageNum_cnt);
			if(endPageNum > endPageNum_tmp) {
				endPageNum = endPageNum_tmp;
			}
			
			boolean prev = startPageNum == 1 ? false : true;
			boolean next = endPageNum * pageNum_cnt >= count ? false : true;
			
			
			*/
			
			Page page = new Page();
			page.setNum(num);
			page.setCount(service.BoardCount());
			
			List<BoardVO> list = service.listPage(page.getDisplaypost(), page.getPostNum());
			model.addAttribute("list", list);
			
			/*
			model.addAttribute("pageNum", page.getPageNum());
			
			// 시작 밑 끝 번호
			model.addAttribute("startPageNum", page.getStartPageNum());
			model.addAttribute("endPageNum", page.getEndPageNum());
			
			// 이전 및 다음
			model.addAttribute("prev", page.isPrev());
			model.addAttribute("next", page.isNext());
			
			
			*/
			
			model.addAttribute("page", page);
			
			// 현재 페이지
			model.addAttribute("select", num);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 게시판 + 페이징 + 검색
	@RequestMapping(value="/boardListPageSearch", method=RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam(value="num", defaultValue="1") int num,
											   @RequestParam(value="searchType", required=false, defaultValue="")String searchType,
											   @RequestParam(value="keyword", required=false, defaultValue="")String keyword) {
		
		// 2페이지를 눌렀을떄 초기화가 검색이 초기화가 되버려
		// 
		try {
			
			Page page = new Page();
			page.setNum(num);
			page.setCount(service.BoardCount());
			
			SearchCriteria sc = new SearchCriteria();
			sc.setSearchType(searchType);
			sc.setKeyword(keyword);
				
			List<BoardVO> list = service.listPageSearch(page.getDisplaypost(), page.getPostNum(), searchType, keyword);
			
			model.addAttribute("list", list);
			
			model.addAttribute("page", page);
			
			// 현재 페이지
			model.addAttribute("select", num);
			
			
			model.addAttribute("sc", sc);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/boardReplyWrite", method=RequestMethod.POST)
	public String writeReply(@RequestBody WriteBoardVO vo) {
		System.out.println(vo.toString());
		// 댓글을 작성하면 다시 그 게시물로 이동하는데 bno, num, searchType, keyword
		BoardReplyVO replyVo = new BoardReplyVO();
		replyVo.setBno(vo.getBno());
		replyVo.setWriter(vo.getWriter());
		replyVo.setContent(vo.getContent());
		try {
			replyService.writeReply(replyVo);
		}catch(Exception e) {
				e.printStackTrace();
		}
		return "redirect:/board/boardDetail?bno=" + vo.getBno() + "&num=" + vo.getNum() + 
				       "&searchType=" + vo.getSearchType() + "&keyword=" + vo.getKeyword();
	}
	
	
	@RequestMapping(value="/reply/boardReplyUpdate", method=RequestMethod.GET)
	public void updateReply(@RequestParam(value="rno") int rno, Model model) {
		try {
			BoardReplyVO replyVo = replyService.getReplyOne(rno);
			model.addAttribute("replyVo", replyVo);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/reply/boardReplyUpdate", method=RequestMethod.POST)
	public String updateReply(BoardReplyVO replyVO, SearchCriteria sc, Page page, BoardVO vo, Model model) {
		try {
			replyService.updateReply(replyVO);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/board/boardDetail?bno=" + vo.getBno() + "&num=" + page.getNum() + 
			       "&searchType=" + sc.getSearchType() + "&keyword=" + sc.getKeyword();
	}
	

	
	@RequestMapping(value="/reply/boardReplyDelete", method=RequestMethod.GET)
	public String deleteReply(BoardReplyVO replyVO, SearchCriteria sc, Page page, BoardVO vo, Model model) {
		try {
			replyService.deleteReply(replyVO.getRno());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/boardDetail?bno=" + vo.getBno() + "&num=" + page.getNum() + 
			       "&searchType=" + sc.getSearchType() + "&keyword=" + sc.getKeyword();
	}
	
	
	@RequestMapping(value="/fileDown")
	public void downloadFile(@RequestParam(value="f_bno") int f_bno, HttpServletResponse response) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("f_bno", f_bno);
		try {
			Map<String, Object> fileMap = service.selectFileInfo(map);
			String storedFileName = (String)fileMap.get("stored_file_name");
			String originalFileName = (String)fileMap.get("original_file_name");
			
			byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\dev\\file\\"+storedFileName));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.getOutputStream().write(fileByte);
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public void test() {
	}
	
	@ResponseBody
	@RequestMapping(value="/test2", method=RequestMethod.POST)
	public Map<String, Object> test2(@RequestBody Map<String, Object> map) {
		System.out.println(map.toString());
		return map;
	}
	
	@RequestMapping(value="/test3", method=RequestMethod.GET)
	public void test3(Model model, @RequestParam(value="num", defaultValue="1") int num,
											   @RequestParam(value="searchType", required=false, defaultValue="")String searchType,
											   @RequestParam(value="keyword", required=false, defaultValue="")String keyword) {
		
		// 2페이지를 눌렀을떄 초기화가 검색이 초기화가 되버려
		// 
		try {
			
			Page page = new Page();
			page.setNum(num);
			page.setCount(service.BoardCount());
			
			SearchCriteria sc = new SearchCriteria();
			sc.setSearchType(searchType);
			sc.setKeyword(keyword);
				
			List<BoardVO> list = service.listPageSearch(page.getDisplaypost(), page.getPostNum(), searchType, keyword);
			
			model.addAttribute("list", list);
			
			model.addAttribute("page", page);
			
			// 현재 페이지
			model.addAttribute("select", num);
			
			
			model.addAttribute("sc", sc);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/test4", method=RequestMethod.GET)
	public void test4() {
		
	}
	
	
}
