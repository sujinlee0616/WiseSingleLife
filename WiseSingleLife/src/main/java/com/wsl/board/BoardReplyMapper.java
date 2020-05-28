package com.wsl.board;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.wsl.board.*;

public interface BoardReplyMapper {
	@SelectKey(keyProperty="rno",resultType=int.class,before=true,
			statement="SELECT NVL(MAX(rno)+1,1) as rno FROM boardreply")
	@Insert("INSERT INTO boardreply(rno,no,id,pwd,msg,group_id) VALUES("
			+ "#{rno},#{no},#{id},#{pwd},#{msg},"
			+ "(SELECT NVL(MAX(group_id)+1,1) FROM boardreply))")
	public void replyInsert(BoardReplyVO vo);
	
	@Select("SELECT rno,no,id,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,group_tab FROM boardreply "
			+ "WHERE no=#{no} "
			+ "ORDER BY group_id DESC,group_step ASC")
	public List<BoardReplyVO> replyListData(int no);
	
	@Update("UPDATE boardreply SET "
			+ "msg=#{msg} "
			+ "WHERE no=#{no}")
	public void replyUpdate(BoardReplyVO vo);
}
