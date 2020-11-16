package com.tistory.pentode;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	
	@RequestMapping(value="/test.do")
	public String test() {
		return "base-definition";
	}
}
