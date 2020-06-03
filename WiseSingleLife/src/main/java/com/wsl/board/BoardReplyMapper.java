package com.wsl.board;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
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
			+ "WHERE rno=#{rno}")
	public void replyUpdate(BoardReplyVO vo);
	
	// 여기서부터 대댓글 관련
	@Select("SELECT group_id,group_step,group_tab "
			+ "FROM boardreply "
			+ "WHERE rno=#{rno}")
	public BoardReplyVO replyParentInfoData(int rno);
	@Update("UPDATE boardreply SET "
			+ "group_step=group_step+1 "
			+ "WHERE group_id=#{group_id} "
			+ "AND group_step>#{group_step}")
	public void replyGroupStepIncrement(BoardReplyVO vo);
	@Update("UPDATE boardreply SET "
			+ "depth=depth+1 "
			+ "WHERE rno=#{rno}")
	public void replyDepthIncrement(int rno);
	
	@SelectKey(keyProperty="rno",resultType=int.class,before=true,
			statement="SELECT NVL(MAX(rno)+1,1) as rno FROM boardreply")
	@Insert("INSERT INTO boardreply(rno,no,id,pwd,msg,group_id,group_step,group_tab,root) VALUES("
			+ "#{rno},#{no},#{id},#{pwd},#{msg},"
			+ "#{group_id},#{group_step},#{group_tab},#{root})")
	public void reReplyInsert(BoardReplyVO vo);
	
	// 삭제하기
	
	@Delete("DELETE FROM boardreply "
			+ "WHERE rno=#{rno}")
	public void replyDelete(int rno);
	
	@Select("SELECT depth,root FROM boardreply "
			+ "WHERE rno=#{rno}")
	public BoardReplyVO replyInfoData(int rno);
	
	@Update("UPDATE boardreply SET "
			+ "msg=#{msg} "
			+ "WHERE rno=#{rno}")
	public void replyMsgUpdate(BoardReplyVO vo);
	
	@Update("UPDATE boardreply SET "
			+ "depth=depth-1 "
			+ "WHERE rno=#{rno}")
	public void replyDepthDecrement(int rno);
	
	@Select("SELECT pwd FROM boardreply "
			+ "WHERE rno=#{rno}")
	public String replyGetPwd(int rno);
	
	@Select("SELECT COUNT(*) FROM boardreply "
			+ "WHERE no=#{no}")
	public String replyCount(int no);
}
