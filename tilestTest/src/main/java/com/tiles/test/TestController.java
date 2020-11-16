package com.tiles.test;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	
	/* 타일즈 적용 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		return "homePage";
	}
	
	@RequestMapping(value="/test2")
	public String test2() {
		return "sibal";
	}
}
