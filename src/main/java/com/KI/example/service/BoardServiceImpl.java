package com.KI.example.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.KI.example.domain.Board;
import com.KI.example.domain.lcList;
import com.KI.example.domain.Comment;
import com.KI.example.domain.Pagination;

import com.KI.example.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Autowired 
	BoardMapper boardmapper;
	
	@Override
	public List<Board> selectBoardList(int b_number,int pageNum){
		return boardmapper.selectBoardList(b_number,pageNum);
	}
	
	@Override
	public void createBoard(Board board) throws Exception {
		boardmapper.createBoard(board);
	}
	
	@Override
	public Board selectBoard(Board board) {
		return boardmapper.selectBoard(board);
	}
	
	@Override
	public List<lcList> selectList() {
		return boardmapper.selectList();
	}
	
	@Override
	public int getCount(int b_number) {
		return boardmapper.getCount(b_number);
	}
	
	@Override
	public List<Board> Search(Board board) {
		return  boardmapper.Search(board);
	}

	@Override
	public void UpdateGroup(Board board) {
		boardmapper.UpdateGroup(board);
		
	}



	@Override
	public void UpdateOrder(Board board) {
	    boardmapper.UpdateOrder(board);
		
	}

	@Override
	public void Comment(Comment comment) {
		boardmapper.Comment(comment);
		
	}

	@Override
	public List<Comment> selectComment(Comment comment) {
		return boardmapper.selectComment(comment);
	}

	@Override
	public void EditBoard(Board board) {
		boardmapper.EditBoard(board);
		
	}

	@Override
	public void deleteBoard(Board board) {
		boardmapper.deleteBoard(board);
		
	}

	@Override
	public void CommentEdit(Comment comment) {
		boardmapper.CommentEdit(comment);
		
	}

	@Override
	public void CommentDelete(Comment comment) {
		boardmapper.CommentDelete(comment);
		
	}

	@Override
	public void Hits(Board board) {
		boardmapper.Hits(board);
		
	}


}
