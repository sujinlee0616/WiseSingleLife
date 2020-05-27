package com.wsl.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BoardRestController {
	@Autowired
	private BoardDAO dao;
		
	@RequestMapping("board_pwd_check.do")
	public String board_pwd_check(BoardVO vo) 
	{
		String result="";
		String db_pwd=dao.boardGetPwd(vo.getNo());
		
		if(db_pwd.equals(vo.getPwd()))
		{
			result="true";
		}
		else
		{
			result="NOPWD";
		}
		// 클라이언트가 입력한 비번과 DB의 실제비번이 같은지 확인
//		boolean result=ReplyBoardDAO.boardCheckPwd(Integer.parseInt(no),user_input_pwd); 
		//System.out.println("result="+result);
		
		return result;
	}
}
