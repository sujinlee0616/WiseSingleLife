package com.wsl.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@Autowired
	BoardDAO dao;
	@Autowired
	BoardReplyDAO rdao;
	// 게시판 리스트
	@RequestMapping("board.do")
	public String board_list(Model model,String page)
	{
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		int rowSize=15;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<BoardVO> list=dao.boardListData(map);
		int totalpage=dao.boardTotalPage();
		
		// 1~10, 11~20
		final int BLOCK=5;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
				
		int allpage=totalpage;
		if(endpage>allpage)
			endpage=allpage;
		
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("allpage", allpage);
		
		return "board/list";
	}
	// 글 작성창 띄우기
	@RequestMapping("board_insert.do")
	public String board_insert()
	{
		return "board/insert";
	}
	// 글 작성완료
	@RequestMapping("board_insert_ok.do")
	public String board_insert_ok(BoardVO vo)
	{
		// 이름,제목,내용,비밀번호
		dao.boardInsert(vo);
		
		return "redirect:../web/board.do";
	}
	// 상세보기
	@RequestMapping("board_detail.do")
	public String board_detail(Model model,int no)
	{
		BoardVO vo=dao.boardDetailData(no);
		// 댓글 출력
		List<BoardReplyVO> rlist=rdao.replyListData(no);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("vo",vo);
		
		return "board/detail";
	}
	// 수정하기 창 띄우기
	@RequestMapping("board_update.do")
	public String board_update(int no, Model model)
	{
		BoardVO vo=dao.boardUpdateData(no);
		
		model.addAttribute("vo",vo);
		
		return "board/update";
	}
	// 수정완료;
	@RequestMapping("board_update_ok.do")
	public String board_update_ok(BoardVO vo)
	{
		dao.boardUpdate(vo);
		
		return "redirect:../web/board_detail.do?no="+vo.getNo();
	}
	
	// 삭제하기 창 띄우기
	@RequestMapping("board_delete.do")
	public String board_delete(int no,Model model)
	{	
		BoardVO vo=dao.boardDetailData(no);
		
		model.addAttribute("vo",vo);
		
		return "board/delete";
	}
	// 삭제완료
	@RequestMapping("board_delete_ok.do")
	public String board_delete_ok(int no)
	{
		dao.boardDelete(no);
		
		return "redirect:../web/board.do";
	}
	// 댓글 작성
	@RequestMapping("board_reply_insert.do")
	public String board_reply_insert(BoardReplyVO vo)
	{
		System.out.println(vo.getRno()+""+vo.getNo());
		System.out.println(vo.getId()+""+vo.getPwd()+""+vo.getMsg());
		
		rdao.replyInsert(vo);
		
		return "redirect:board_detail.do?no="+vo.getNo();
	}
	// 대댓글 작성
	@RequestMapping("board_reReply_insert.do")
	public String board_reReply_insert(BoardReplyVO vo)
	{
		BoardReplyVO rvo=new BoardReplyVO();
		rvo.setNo(vo.getNo());
		rvo.setMsg(vo.getMsg());
		rvo.setId(vo.getId());
		rvo.setPwd(vo.getPwd());
		
		rdao.reReplyInsert(vo.getRno(), rvo);
		
		return "redirect:board_detail.do?no="+vo.getNo();
	}
	
	// 댓글 수정하기
	@RequestMapping("board_reply_update.do")
	public String board_reply_update(BoardReplyVO vo)
	{
		rdao.replyUpdate(vo);
		
		return "redirect:board_detail.do?no="+vo.getNo();
	}
	// 댓글 삭제하기
	@RequestMapping("board_reply_delete.do")
	public String board_reply_delete(int no,int rno)
	{
		rdao.replyDelete(rno);
		
		return "redirect:board_detail.do?no="+no;
	}
	
}
