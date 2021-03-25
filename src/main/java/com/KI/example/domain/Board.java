package com.KI.example.domain;

public class Board {
	
	private int b_num; 
	private String b_title;
	private String b_content;
	private String b_dateTime;
	private int b_hits;
	private int group_id;
	private int b_order;
	private String b_id;
	private int b_number;
	private int Rownum;
	private int page=1;
	private String select;
	private int pageNum;
	private String search;

	
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num= b_num;
	}
	
	
	public String getB_id() {
		return b_id;
	}
	
	public void setB_id(String b_id) {
		this.b_id= b_id;
	}
	
	
	
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title= b_title;
	}
	
	
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content= b_content ;
	}
	
	
	public String getB_dateTime() {
		return b_dateTime;
	}
	
	public void setb_datetime(String b_dateTime) {
		this.b_dateTime= b_dateTime;
	}
	
	
	public int getB_number() {
		return b_number;
	}
	public void setB_number(int b_number) {
		this.b_number = b_number;
	}
	
	public int getB_order() {
		return b_order;
	}
	public void setB_order(int b_order) {
		this.b_order = b_order;
	}
	
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	
	
	public int getB_hits() {
		return b_hits;
	}
	public void setB_hits(int b_hits) {
		this.b_hits = b_hits;
	}
	public int getRownum() {
		return Rownum;
	}
	public void setRownum(int Rownum) {
		this.Rownum = Rownum;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int page) {
		this.pageNum = (page-1)*3;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
}



//b_num
//b_title
//b_content
//b_dateTime
//b_hits
//group_id
//b_order
//b_id
//b_number
