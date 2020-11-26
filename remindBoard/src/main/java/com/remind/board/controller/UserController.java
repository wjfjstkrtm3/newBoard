package com.remind.board.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.remind.board.dto.UserDto;
import com.remind.board.service.UserService;
import com.remind.board.utils.Etc;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp() {
		return "/user/signUp";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUp(UserDto userDto, MultipartHttpServletRequest request) {
		
		MultipartFile multipartFile = null;
		
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		final String filePath = "D:\\바탕 화면\\JavaAll\\file-images\\";
		
		try {
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
	
	
	
	
}
