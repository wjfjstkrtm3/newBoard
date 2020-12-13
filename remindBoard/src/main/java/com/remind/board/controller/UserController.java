package com.remind.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.remind.board.dto.BoardDto;
import com.remind.board.dto.UserDto;
import com.remind.board.service.UserService;
import com.remind.board.utils.Etc;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService service;
	
	// 암호화 의존 설정
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp() {
		return "/user/signUp";
	}
	
	
	// 회원가입 (파일처리 포함)
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUp(UserDto userDto, MultipartHttpServletRequest request) {
		
		MultipartFile multipartFile = null;
		
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		final String filePath = "D:\\바탕 화면\\JavaAll\\file-images\\";
		
		try {
			// 비밀번호 암호화
			userDto.setPassword(bCryptPasswordEncoder.encode(userDto.getPassword()));
			
			multipartFile = request.getFile("file01");
			
			// 회원가입을 했을때 파일이 있을경우
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.indexOf("."));
				storedFileName = Etc.getRandomString() + originalFileExtension;
				
				File file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				
				userDto.setImage(storedFileName);
				
				//회원가입을 했을때 파일이 없을경우
			}else {
				
				// DB에서는 image를 default로 "default.png"로 설정을 해두었지만, 
				// Mapper에서는 #{image}로 받게되어있다
				// 그래서 값을 설정안해주면 null값이 들어가기때문에 설정을 해줘야한다
				userDto.setImage("default.png");
			}
			
			
			service.userSignUp(userDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/login";
	}
	
	
	// ResponseBody를 붙이지 않으면 오류가난다 (return 타입에는 int를 쓸 수가 없다)
	// ResponseBoyd를 붙일 경우 return 값을 그대로 반환해주기때문에 result값이 들어가게된다
	
	// 회원가입 ID 중복확인
	@ResponseBody
	@RequestMapping(value="userIdCheck", method=RequestMethod.GET)
	public int userIdCheck(@RequestParam(value="id") String id) {
		int result = 0;
		try {
			result = service.userIdCheck(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return result;
	}
	
	
	// 마이페이지 View
	@GetMapping(value="/mypage")
	public String userUpdate(Model model) {
		try {
			
		}catch(Exception e) {
			
		}
		return "/user/mypage";
	}
	
	// 마이페이지 Back
	@PostMapping(value="/mypage")
	public String userUpdate(Model model, MultipartHttpServletRequest request, UserDto userDto) { 
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		final String filePath = "D:\\바탕 화면\\JavaAll\\file-images\\";
		
		// 비밀번호 암호화
		userDto.setPassword(bCryptPasswordEncoder.encode(userDto.getPassword()));
		
		try {
			
			multipartFile = request.getFile("file01");
			
			// 이미지 객체가 비어있지 않다면.. (마이페이지에서 수정할때 이미지 넣었을때)
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.indexOf("."));
				storedFileName = Etc.getRandomString() + originalFileExtension;
				
				// filePath에 해당되는 파일의 File 객체를 생성 (껍데기 생성) (디렉터리 생성)
				File file = new File(filePath + storedFileName);
				
				// 업로드한 데이터를 지정한 file에 저장한다
				multipartFile.transferTo(file);
				
				userDto.setImage(storedFileName);
			
				service.mypageUpdate(userDto);
				
				// 이미지 객체가 비어있다면.. (마이페이지에서 수정할때 이미지 넣었을때)
			} else {
				userDto.setImage("default.png");
				service.mypageUpdate(userDto);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/board/listPageSearch";
	}
	
	
	// user 마이페이지 비밀번호 확인
	@ResponseBody
	@PostMapping(value="/passwordCheck")
	public boolean passwordCheck(@RequestParam(value="id") String id, @RequestParam(value="password") String password) {
		UserDto userDto = null;
		boolean result = false;
		try {
			userDto = service.passwordCheck(id);
			result = bCryptPasswordEncoder.matches(password, userDto.getPassword());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		return result;
	}
	
	
	// 로그인 페이지 비밀번호 찾기 (id와 email 일치하는지)
	@ResponseBody
	@PostMapping(value="/checkIdEmail")
	public int checkIdEmail(@RequestBody UserDto userDto) {
		int result = 0;
		try {
			result = service.checkIdEmail(userDto);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	// 로그인 페이지 비밀번호 변경
	@ResponseBody
	@PostMapping(value="/updatePassword")
	public int updatePassword(@RequestBody UserDto userDto) {
		int result = 0;
		try {
			userDto.setPassword(bCryptPasswordEncoder.encode(userDto.getPassword()));
			result = service.updatePassword(userDto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	
	}
	
	
	// 게시물 bookMark
	@ResponseBody
	@PostMapping(value="/boardBookMark")
	public String boardBookMark(@RequestBody Map<String, Object> map) {
		int result = 0;
		String msg = "";
		try {
			// 북마크 된 글이면 북마크 해제
			if(map.get("bmStatus").equals("true")) {
				
				result = service.boardBookMarkDelete(map);
				msg = "delete";
			// 북마크 된 글이 아니면 북마크 등록
			} else {
				
				result = service.boardBookMarkInsert(map);
				msg = "insert";
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return msg;
	}
	
	
	// 게시물 bookMarkStatus 
	@ResponseBody
	@PostMapping(value="/boardBookMarkStatus")
	public int boardBookMarkStatus(@RequestBody Map<String, Object> map) {
			int result = 0;
		try {
			result = service.boardBookMarkStatus(map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 북마크 페이지 View
	@GetMapping(value="/bookMarkPage")
	public String bookMarkPage(Model model, @RequestParam(value="searchText", defaultValue = "") String searchText) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<BoardDto> list = new ArrayList<BoardDto>();
			map.put("id", Etc.getUser());
			map.put("searchText", searchText);
			
			list = service.selectBookMarkList(map);
			
			model.addAttribute("bookMarkList", list);
			model.addAttribute("count", list.size());
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/user/bookMark";
	}
	
	
	// 북마크 페이지 검색
	@ResponseBody
	@PostMapping(value="/bookMarkSearch")
	public List<BoardDto> bookMarkSearch(@RequestParam(value="searchText", defaultValue = "") String searchText) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardDto> list = new ArrayList<BoardDto>();
		try {
			map.put("id", Etc.getUser());
			map.put("searchText", searchText);
			
			list = service.selectBookMarkList(map);
		}catch(Exception e) { 
			e.printStackTrace();
		}
		
		return list;
	}
	
	

	
}
