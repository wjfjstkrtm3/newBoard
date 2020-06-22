package com.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.dto.UserDetail;
import com.board.service.UserService;
import com.board.utils.CommonUtils;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Autowired
	private UserService service;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/userSignUp", method=RequestMethod.GET)
	public void UserSignUp() {
		
	}
	
	@RequestMapping(value="/userSignUp", method=RequestMethod.POST)
	public String UserSignUp(UserDetail vo) {
		try {
			vo.setPassword(bcryptPasswordEncoder.encode(vo.getPassword()));
			service.userSignUp(vo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public int idCheck(@RequestParam(value="id") String id) {
		int result = 0;
		try {
			result = service.idCheck(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/test", method=RequestMethod.POST)
	public HashMap<String, Object> test(@RequestBody Map<String, Object> map) {
		for(Map.Entry<String, Object> entry : map.entrySet()) {
			System.out.println("key : " + entry.getKey() + "value : " + entry.getValue());
		}
		return (HashMap)map;
	}
	
	@RequestMapping(value="/userFindId", method=RequestMethod.GET)
	public void userFindId() {
		
	}
	
	@ResponseBody
	@RequestMapping(value="/userFindId", method=RequestMethod.POST)
	public HashMap<String, Object> userFindId(Model model, @RequestParam(value="email") String email) {
		UserDetail userDetail = null;
		HashMap<String, Object> map = null;
		try {
			userDetail = service.userFindId(email);
			map = new HashMap<String, Object>();
			if(userDetail == null) {
				map.put("msg", "존재하지않는 이메일 입니다");
				
			} else {
				map.put("id", userDetail.getId());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="/userFindPassword", method=RequestMethod.GET)
	public void userFindPassword() {
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/userFindPassword", method=RequestMethod.POST)
	public int userFindPassword(@RequestBody@RequestParam Map<String, Object> map) {
		String id = (String)map.get("id");
		String email = (String)map.get("email");
		String temporaryPassword = CommonUtils.getRandomString();
		int result = 0;
		try {
			result = service.userFindPassword(map);
			
			if(result == 1) {
				MimeMessage msg = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
				
				messageHelper.setSubject(id + "님 비밀번호 찾기 메일입니다 !!!!");
				messageHelper.setText("비밀 번호는 : " + temporaryPassword + "입니다");
				Map<String, Object> updateMap = new HashMap<String, Object>();
				updateMap.put("id", id);
				updateMap.put("temporaryPassword", temporaryPassword);
				System.out.println("updateMap : " + updateMap.toString());
				service.temporaryPasswordInsert(updateMap);
				messageHelper.setTo(email);
				msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
				mailSender.send(msg);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/temporaryPassword", method=RequestMethod.POST)
	public int temporaryPassword(@RequestParam(value="id") String id,
								 @RequestParam(value="temporaryPassword") String temporaryPassword) {
		
		int result = 0;
		try {
			UserDetail user = service.temporaryPasswordSelect(id);
			if(user.getTemporaryPassword().equals(temporaryPassword)) {
				result = 1;
			}else {
				result = 0;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/changePwd", method=RequestMethod.POST)
	public int changePwd(@RequestParam(value="password") String password,
						 @RequestParam(value="id") String id) {
		int result = 0;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("password", bcryptPasswordEncoder.encode(password));
			result = service.userChangePwd(map);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	@RequestMapping(value="/toDoList", method=RequestMethod.GET)
	public void toDoList() {
	}
	
	
}
