package com.wsl.board2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wsl.board.BoardDAO;
import com.wsl.board.BoardVO;

import java.util.*;

@Controller
public class BoardController2 {
	@Autowired
	private BoardDAO2 dao;
	
	@RequestMapping("board_detail.do")
	public String board_detail(Model model, int no, String page) {
		
		BoardVO2 vo=dao.boardDetailData(no); // 게시판 상세정보
		dao.hitIncrement(no); // 조회수 증가
		List<ReplyVO2> cmt_list=dao.boardReplyData(no); // 댓글 리스트
		int commentCount=dao.boardReplyCount(no); // 해당 게시글의 댓글 총 개수 
		
		model.addAttribute("vo",vo);
		model.addAttribute("cmt_list", cmt_list);
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("curpage", page);
		
		return "board/detail";
	}
	
	@RequestMapping("board_update.do")
	public String board_update() {
		return "board/update";
	}
		
}
