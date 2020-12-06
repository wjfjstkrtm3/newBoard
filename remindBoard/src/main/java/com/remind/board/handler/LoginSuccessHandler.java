package com.remind.board.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.remind.board.dto.BoardType;
import com.remind.board.dto.UserDto;
import com.remind.board.service.AdminService;
import com.remind.board.service.UserService;

// 로그인 성공시 실행하는 핸들러
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

/*
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
*/	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
			UserDto userDto = new UserDto();
			List<BoardType> list = new ArrayList<BoardType>();
		try {
			// 로그인 성공시 부가작업 할것들
			HttpSession session = request.getSession();
			
			// 로그인한 사용자 이름
			authentication = SecurityContextHolder.getContext().getAuthentication();
			session.setAttribute("userName", authentication.getName());
			
			
			/*
			 // 관리자 계정만 볼 수 있는 게시판 제목들 list = adminService.getBoardTitleList();
			 session.setAttribute("boardTitle", list);
			 
			 // 로그인한 사용자 Dto userDto = userService.getUserById(authentication.getName());
			 session.setAttribute("userDto", userDto);
			 
			*/
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/board/listPageSearch");
		
		 
		
	}

	
}
