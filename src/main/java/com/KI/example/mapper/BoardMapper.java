package com.KI.example.mapper;

import java.util.List;



import org.apache.ibatis.annotations.Mapper;
import com.KI.example.domain.Board;
import com.KI.example.domain.Comment;
import com.KI.example.domain.lcList;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardMapper {
	
	public List<Board> selectBoardList(@Param("b_number")int b_number, @Param("pageNum") int pageNum);
	
	public void createBoard(Board board)throws Exception;
	
	public Board selectBoard(Board board);

	public List<lcList> selectList();

	public int getCount(int b_number);
	
	public List<Board> Search(Board board);

	public void UpdateGroup(Board board);

	public void UpdateOrder(Board board);

	public void Comment(Comment comment);
	
	public List<Comment> selectComment(Comment comment);

	public void EditBoard(Board board);

	public void deleteBoard(Board board);

	public void CommentEdit(Comment comment);

	public void CommentDelete(Comment comment);

	public void Hits(Board board);

	



}
