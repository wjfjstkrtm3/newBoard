package com.remind.board.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.remind.board.dto.BoardDto;

@Component
public class FileUtils {

	// final과 static final의 차이점
	// final은 생성자로 객체마다 다른 값을 가질 수있다
	// static final은 일단 static이 객체가 아니라 클래스에 속해있다
	// 그래서 new연산자로 객체를 만들지 못하고, 객체. 으로만 접근이가능하다
	
	// 즉, 해당 클래스에만 고정이되고, 객체마다 다른값을 가지지않는다
	// 그래서 static final을 상수라고 한다
	private static final String filePath = "D:\\바탕 화면\\JavaAll\\file\\";
	
	public List<Map<String, Object>> parseInsertFileInfo(BoardDto boardDto, MultipartHttpServletRequest request) throws Exception{
		
		/*
		 request.getFileNames()의 return 값은 Iterator<String>
		 getFileNames는 
		 <input type="file" name="uploadFile"> 태그가 폼 요소에 있다면
		 input 태그에서 file 속성으로 지정된 태그의 name 속성의 값 즉 file 속성을 가진 파라미터의 이름을 Enumeration 객체 타입으로 반환
		 JSP에서 넘어온 <input> 태그의 name을 확실히 알고 있다면 getFile(), 확실히 알수 없다면 getFileNames() 를 사용한다
		  파일 업로드를 할때 파일을 한개만 올릴수도 있지만.. 여러개를 올리는 경우도 있으므로 getFileNames()를 많이 사용하는 편
		*/
		Iterator<String> iterator = request.getFileNames();
		
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		
		// <selectkey> 에서 받아온 bno를 넣어줌
		// <selectkey> 위에 parameterType에 적어둔 boardDto에 bno에 저장이됨
		int bno = boardDto.getBno();
		
		
		// 파일 경로에 암것도 없으면 디렉터리(폴더) 생성
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdir();
		}
		
		
		while(iterator.hasNext()) {
			
			
			// request.getFile() return -> String
			// 위에서 name의 값을 확실히 알고있다면 request.getFileNames()가 아니라 request.getFile을 쓰기도하지만
			// 다중파일 업로드를 사용하기때문에 getFileNames()를 사용을하고 저장된 parameter 이름들을 iterator로 읽어들인다
			multipartFile = request.getFile(iterator.next());
			
			// 하나씩 읽었을때 만약에 <input type="file" name="file_01">
			// 이렇게 날아온 file_01이름을 가지고 있는 file객체가 비었으면..
			// 그러니까 만약에 내가 input태그 두개만들고 input태그 하나만 사용해서 파일하나만 작성하면
			// 나머지 하나 파일은 name만 가지고있는 빈 객체가 되기때문에
			// 아래 검사를 해줘야한다.. 해주지않으면 하나는 읽고, 하나는 밑에서 indexOf할떄 못찾아서 오류가남
			
			/*
			 처음에 저거 위에있는 거를 if문안에다가 넣고, 파일을 하나만 막 넣었는데도 안됬다..
			 왜냐하면 request.getFile(iterator.next())를 사용해서 multipartFile에 담지않고
			 아래 조건문을 사용했기때문에 당연히 비어있으니까 true라서 안타고, 파일이 계속 안넣어진거지
			 */
			
			
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.indexOf("."));
				// getRandomString() 메서드는 32글자의 랜덤한 문자열(숫자포함)을 만들어서 반환해주는 기능을 한다
				storedFileName = Etc.getRandomString() + originalFileExtension;
				
				
				
				
				/*
				 substring() 함수는 string 객체의 시작 인덱스로 부터 인덱스 전 까지 문자열의 부분 문자열을 반환
				/ex) aa.txt
			    /indexOf(".") --> 2 return
				/originalFileName.substring(2);
				.txt return
				
				indexOf() 함수는 배열에서 지정된 요소를 찾을 수 있는 첫 번째 인덱스를 반환하고 존재하지 않으면 -1을 반환합니다.
				ex) var stringValue = '생활코딩 - 자바스크립트 레퍼런스';
				stringValue.indexOf("생활"); // 0
				stringValue.indexOf("PHP"); // -1
				stringValue.indexOf("자바스크립트, 0"); // 7
				stringValue.indexOf("자바스크립트, 2"); // 7
				stringValue.indexOf("자바스크립트, 7"); // -1 '크립트 레퍼런스'에는 '자바스크립트'가 없기 때문에 -1을 리턴한다 
				*/
				
				
				
				
				
				// File(String filePath);
				// filePath에 해당되는 파일의 File 객체를 생성 (껍데기 생성) (디렉터리 생성)
				// D:\\바탕 화면\\JavaAll\\file\\test.txt 이러한 객체를 생성
				file = new File(filePath + storedFileName);
				
				// 업로드 한 파일 데이터를 지정한 file에 저장한다
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("bno", bno);
				listMap.put("org_file_name", originalFileName);
				listMap.put("stored_file_name", storedFileName);
				listMap.put("file_size", multipartFile.getSize());
				list.add(listMap);
			}
				
		
		}
		return list;
	}
	
	public List<Map<String, Object>> parseUpdateFileInfo(BoardDto boardDto, MultipartHttpServletRequest request, String filesNo[], String filesName[]) throws Exception{
		
					Iterator<String> iterator = request.getFileNames();
					List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
					Map<String, Object> listMap = null;
					
					MultipartFile multipartFile = null;
					
					String originalFileName = "";
					String originalFileExtension = "";
					String storedFileName = "";
					
					int bno = boardDto.getBno();
						
					File file = new File(filePath);
					if(file.exists() == false) {
						file.mkdir();
					}
					
					// MultipartServletRequest 객체에서 가지고온 fileNames가 있으면.. 
					// 새로운 파일이 들어오면..
					// 애초에 파일삭제버튼을 누르면 <input> 태그 자체가 사라지기때문에 fileNames에는 해당 파일객체가 저장이안됨
					
					while(iterator.hasNext()) {
						multipartFile = request.getFile(iterator.next());
						
						if(multipartFile.isEmpty() == false) {
							
							originalFileName = multipartFile.getOriginalFilename();
							originalFileExtension = originalFileName.substring(originalFileName.indexOf("."));
							storedFileName = Etc.getRandomString() + originalFileExtension;
							
							file = new File(filePath + storedFileName);
							multipartFile.transferTo(file);
							
							listMap = new HashMap<String, Object>();
							listMap.put("IS_NEW", "Y");
							listMap.put("bno", bno);
							listMap.put("org_file_name", originalFileName);
							listMap.put("stored_file_name", storedFileName);
							listMap.put("file_size", multipartFile.getSize());
							
							list.add(listMap);
						}
					}
					
					// 삭제한 파일일때.. (파일옆에있는 삭제버튼을 누르면 fileNo와 filesName이 날라오기때문에 null이 아님)
					if(filesNo != null || filesName != null) {
						for(int i = 0; i < filesNo.length; i++) {
							listMap = new HashMap<String, Object>();
							listMap.put("IS_NEW", "N");
							listMap.put("file_no", filesNo[i]);
							list.add(listMap);
						}
					}
					
		/*
			여기서 list를 return하게 되면
			list안에는 [{"IS_NEW":"Y", "bno":100, "org_file_name":abcd.txt, "stored_file_name":sadasdsdascvxa...txt, "file_size":10mb},
					 {"IS_NEW":"N", "bno":101, "org_file_name":abcdefg.txt, "stored_file_name":kjhkjbkkjkjh...txt, "file_size":5mb}]
		        이런식으로 들어가게됨
		     이 함수를 호출할 BoardServiceImpl에서는 List를 반복문 돌려서 Map하나하나 꺼내서
		     IS_NEW 값이 Y이면 service.insertFile()를 실행하고
		     IS_NEW 값이 N이면 service.updateFile()를 실행한다
		
		 */
		 System.out.println("list : " + list.toString());
		return list;
		
	}
	
	
	
	
	
	
	
}
