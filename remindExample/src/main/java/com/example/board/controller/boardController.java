package com.example.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.board.dto.boardDTO;
import com.example.board.service.boardService;

@Controller
@RequestMapping(value="/board")
public class boardController {

	@Autowired
	private boardService service;

/*	
    // 寃뚯떆�뙋 紐⑸줉 議고쉶
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public List<boardDTO> boardList(Model model) {
		List<boardDTO> list = new ArrayList<boardDTO>();
		try {
			list = service.boardList();
			System.out.println("list : " + list.toString());
			model.addAttribute("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return list;
	}
	
	*/
	
	// 寃뚯떆�뙋 紐⑸줉 + �럹�씠吏�(�걹�씠 �뾾�뒗 �럹�씠吏�)
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public List<boardDTO> listPage(@RequestParam(value="num", defaultValue = "0") int num, Model model) {
			List<boardDTO> list = new ArrayList<boardDTO>();
			Map<String, Integer> map = new HashMap<String, Integer>();
			
		try {
			// 寃뚯떆臾� 珥� 媛쒖닔
			int count = service.count();
			
			// �븳 �럹�씠吏��뿉 異쒕젰�븷 寃뚯떆臾� 媛쒖닔
			int postNum = 10;
			
			// �븯�떒 �럹�씠吏� 踰덊샇
			int pageNum = (int)Math.ceil((double)count/postNum);
			
			// �럹�씠吏� 踰덊샇�뿉 �뵲瑜� 異쒕젰�븷 index援ы븯湲�
			// ex) 1�럹�씠吏�硫� 0
			// ex) 2�럹�씠吏�硫� 10
			
			int displayPost = (num-1) * postNum;
			
			map.put("displayPost", displayPost);
			map.put("postNum", postNum);
			list = service.listPage(map);
			
			model.addAttribute("list", list);
			model.addAttribute("pageNum", pageNum);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		return list;
	}
	
}
