package com.board.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.board.dto.BoardVO;

@Component
public class FileUtils {

	private static final String filePath = "C:\\dev\\file\\";
	
	public List<Map<String, Object>> parseInsertFileInfo(BoardVO vo, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		String boardBno = Integer.toString(vo.getBno());
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdir();
		}
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				
				// 업로드한 파일 데이터를 지정한 파일에 저장한다.
				multipartFile.transferTo(file);
				
				listMap = new HashMap<String, Object>();
				listMap.put("board_bno", boardBno);
				listMap.put("original_file_name", originalFileName);
				listMap.put("stored_file_name", storedFileName);
				listMap.put("file_size", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
		
		
	}
	
}
