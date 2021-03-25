package com.KI.example.controller;
import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KI.example.domain.Board;
import com.KI.example.domain.User;
import com.KI.example.domain.lcList;
import com.KI.example.domain.Pagination;
import com.KI.example.domain.Comment;
import com.KI.example.service.BoardService;
import com.KI.example.service.UserService;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;





@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired BoardService boardservice;
	int group=0;
	int count=0;
	int pageNum=0;
	int page=0;


	
	
    @RequestMapping("/")
	public String home() {
	
		
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		
		
		return"/index";
	}
    
    @RequestMapping("/beforeWriting")
	public String beforeWriting(int b_number,Model model) {
    	
    	model.addAttribute("b_number",b_number);
		return "/writing";
	}
    
    
    @RequestMapping("/writingProcess")
	public String Writing(Board board, Model model)  throws Exception{
		boardservice.createBoard(board);
		boardservice.UpdateGroup(board);
		boardservice.UpdateOrder(board);
		model.addAttribute("board",board);
		

		return "/result";
	}
    
    @RequestMapping("/boardList")
    public String boardList(int b_number,int page, Model model,Pagination pagination) {
    
    	pageNum=(page-1)*3;
    
    	
    	List<Board> list=boardservice.selectBoardList(b_number, pageNum);
    	model.addAttribute("list", list);
    	
    	count= boardservice.getCount(b_number);
    	pagination = new Pagination(page,count);
    	model.addAttribute("pagination",pagination);
    	
    	model.addAttribute("b_number", b_number);
    
    	return "/boardList";
    }
    
    @RequestMapping("/Board")
    public String Board(Model model, Board board) {
    	boardservice.Hits(board);
    	
    	board= boardservice.selectBoard(board);
 
    	Comment comment= new Comment();
    	comment.setC_number(board.getB_num());
    	List<Comment>list=boardservice.selectComment(comment);
    	
    	model.addAttribute("board",board);
    	model.addAttribute("list", list);
    	
    	
    	
    	return "/board";
    }
    
   //--------------------------------------------------------------------------------------
    @RequestMapping("/commentProcess")
    public String Comment(Comment comment, Model model) {
    	
    	int c_number=comment.getC_number();
    	boardservice.Comment(comment);
    	List<Comment>list1=boardservice.selectComment(comment);
    	model.addAttribute("list", list1);
    	model.addAttribute("c_number", c_number);
    	return "/OK";
    }
    @RequestMapping("/commentEdit")
    public String CommentEdit(Comment comment, Model model) {
    	int c_number=comment.getC_number();
    	boardservice.CommentEdit(comment);
    	List<Comment>list2=boardservice.selectComment(comment);
    	model.addAttribute("list", list2);
    	model.addAttribute("c_number", c_number);
    	return "/OK";
    }
    
    @RequestMapping("/commentDelete")
    public String CommentDelete(Comment comment, Model model) {
    	
    	int c_number=comment.getC_number();
    	boardservice.CommentDelete(comment);
    	List<Comment>list3=boardservice.selectComment(comment);
    	model.addAttribute("list", list3);
    	model.addAttribute("c_number", c_number);
    	
    	return "/OK";
    }
    
    //-------------------------------------------------------------------------------------------
    @RequestMapping("/beforeReWriting")
    public String beforeReWriting(int b_num,int b_number, Model model) {
    	model.addAttribute("b_number",b_number);
    	model.addAttribute("b_num",b_num);
    	return "/ReWriting";
    }
    
    @RequestMapping("/ReWritingProcess")
    public String ReWriting(int b_num, Board board) throws Exception{
        
    	 board.setGroup_id(b_num);
    	 boardservice.createBoard(board);
 		 boardservice.UpdateOrder(board);
    	 
    	 return "/result";
    }
    @RequestMapping("/beforeEdit")
    public String beforeEdit(Board board, Model model) {
    	model.addAttribute("board", board);
    	return "/Editform";
    }
    
    @RequestMapping("/EditBoard")
    public String EditBoard(Board board) {
    	boardservice.EditBoard(board);
    	
    	return "/result";
    }
    
    @RequestMapping("/deleteBoard")
    public String deleteBoard(Board board) {
    	boardservice.deleteBoard(board);
    	return "/result";
    }
    
    
    @RequestMapping("/lcList")
    public String lcList(Model model, lcList lclist ) {
    	
    	List<lcList> list1 = boardservice.selectList();
    	model.addAttribute("list",  list1);
    	
   
    	return "/lcList";
    	
    }
 
    
    @RequestMapping("/Search")
    public String Search(Board board, Model model,Pagination pagination) {

    	List<Board> list2= boardservice.Search(board);
    	model.addAttribute("list",list2);
    	
    	count = list2.size();
    	page = board.getPage();
    	
    	pagination= new Pagination(count, page);
    	model.addAttribute("pagination",pagination);
    	return "/boardList";
    }

    
	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return"/signup";
	}
	
	@RequestMapping("/signup")
	public String signup(User user) {
		
		String encodedPassword= new BCryptPasswordEncoder().encode(user.getPassword());
		
		user.setPassword(encodedPassword);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		
		userservice.createUser(user);
		
		userservice.createAuthorities(user);
		return "/login";
	}
	
	@RequestMapping(value="/login")
	public String beforeLogin(Model model) {
		return "/login";
	}
	
	 @Secured({"ROLE_ADMIN"})
	 @RequestMapping(value="/admin")
	 public String admin(Model model) {
		 return "/admin";
	 }
	 @Secured({"ROLE_USER"})
	 @RequestMapping(value= "/user/info")
	 public String userInfo(Model model) {
		 return "/user_info";
	 }
	 
	 @RequestMapping(value="/denied")
	 public String denied(Model model) {
		 return "/denied";
	 }
	 
	
	
	
	

}
