package com.remind.board.utils;

import java.util.UUID;

import org.springframework.stereotype.Component;

@Component
public class Etc {

	public static String getRandomString() {
		return UUID.randomUUID().toString();
	}
	
}
