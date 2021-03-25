<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<style>
 h2{
  background-color:#0064FF;
  text-align:center; 
  color:white;
  width:300px; 
  height:50px;
  margin:50px auto;
  border-radius:10px 100px / 120px
}
table {
    border-collapse: seperate;
    margin-left: 250px;
  }
table tr td{
    border-bottom: 2px solid  #0064FF;
    text-align:left;
    width:1000px;
}

a{
       width:50px;
       height:30px;
       background-color:#0064FF;
       position: relative;
       left:1150px;
       top:0px;
       text-align:center;
       border: 2px solid;
       text-decoration: none;
        }
span{
      color:#0064FF;
      font-size:larger;
      font-weight:bold;
}

p{
      width:1000px;
      margin-left: 250px;

}


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>
<body>
<center>
<h2>게시물 확인</h2>
</center>
<table>  
   <tr >
    <td style="border:0 solid black; height:50px; font-size:40px;">${board.b_title}</td>
    </tr>
    <tr>
     <td style="border:0 solid black; height:20px;font-size:10px;" >${board.b_id}님</td>
    </tr>
    <tr>
     <td style="border:0 solid black; height:10px;font-size:10px;">${board.b_dateTime}</td>
    </tr>
  
    <tr>
     <td style="height:20px;font-size:10px; width:100px">${board.b_hits}</td>
    </tr>
  
   <tr>
     <td style="height:200px; width:140px" >${board.b_content}</td>
   </tr>
</table>
  
  
  
  
<c:choose>
  <c:when test="${board.b_number eq 2}">
     <sec:authorize access="hasRole('ROLE_ADMIN')">
     <br><a href="/beforeReWriting?b_num=${board.b_num}&b_number=${board.b_number}" style="color:white;">답글</a>
     </sec:authorize>
  </c:when>
  
  <c:when test="${board.b_number ne 2}">
      <sec:authorize access="isAuthenticated()">
      <br><a href="/beforeReWriting?b_num=${board.b_num}&b_number=${board.b_number}" style="color: white;">답글</a>
      </sec:authorize>
  </c:when>
</c:choose>

<a href="/boardList?b_number=${board.b_number}&page=1" style="color:white;">이전</a>

<sec:authentication property="principal" var="user"/>
<c:choose>
   <c:when test="${user.uName eq board.b_id}">
       <a href="beforeEdit?b_num=${board.b_num}&b_number=${board.b_number}" style="color:white;">수정</a>
       <a href="/deleteBoard?b_num=${board.b_num}" style="color:white;">삭제</a>  
   </c:when>
   <c:when test="${user.uName ne board.b_id}">
   </c:when>
</c:choose>




<div id="div_comment">
<c:forEach items="${list}" var="item">
    <c:choose>
       <c:when test="${user.uName eq item.c_id}">
       <div class="comment-form">
             <p style="font-size:smaller;"><span>${item.c_id}님</span>(${item.c_date})</p>
             <p style="border-bottom: 1px solid #DDDDDD;">${item.c_comment} 
	         <button class="btn-comment-edit">수정</button>
	         <button class="btn-comment-delete"c_num="${item.c_num}" c_number="${item.c_number}">삭제</button></p>
       </div>
        
       <div class="comment-update" style="display:none;">
            <p><textarea name="c_comment" row="1" cols="60"></textarea>
             <button class="btn-comment-update"c_num="${item.c_num}" c_number="${item.c_number}">등록</button>
             <button class="btn-comment-cancel">취소</button></p>
        </div>
        </c:when>
        
        <c:when test="${user.uName ne item.c_id}">
            <p style="font-size:smaller;"><span>${item.c_id}님</span>(${item.c_date})</p>
            <p style="border-bottom: 1px solid #DDDDDD;">${item.c_comment}</p>
        </c:when>
        
   </c:choose>   
</c:forEach>


<form action="commentProcess">
 <input type="hidden" name= "c_id" value="${user.uName}">
   <p><input type="text" name="c_comment" >
      <input type="hidden" name="c_number" value="${board.b_num}">
      <input type="button" value="등록하기" id="insert_ok"> </p>
</form>
</div>

<script>
    $(document).on('click', '#insert_ok',function(){
    	
    	let c_comment= $('input[name="c_comment"]').val();
    	let c_id= $('input[name="c_id"]').val();
    	let c_number=$('input[name="c_number"]').val();
    	$.ajax({
    		method:"POST",
    		url:"commentProcess",
    		data:{c_comment,c_number,c_id}
    	})
    	.done(function (html){
    		$('#div_comment').html(html);
    	});
    });
    
    $(document).on('click','.btn-comment-edit',function(){
    	$(this).parent().parent().next().show(500);
    	$(this).parent().hide(500);
    });
    
    
    $(document).on('click','.btn-comment-update', function(){
    	let c_comment=$(this).prev().val();
    	let c_num=$(this).attr('c_num');
    	let c_number=$(this).attr('c_number');
    	
    	$.ajax({
    		method:"POST",
    		url:"commentEdit",
    		data: {c_comment:c_comment,c_num:c_num,c_number:c_number}
    	})
    	.done(function(html){
    		$('#div_comment').html(html);
    	});
    });
    
    $(document).on('click','.btn-comment-cancel',function(){
    	$(this).parent().prev().show();
    	$(this).parent().hide();
    })
    
    $(document).on('click','.btn-comment-delete',function(){
    	
    	let c_num=$(this).attr('c_num');
    	let c_number=$(this).attr('c_number');
    	
    	$.ajax({
    		method:"POST",
    		url:"commentDelete",
    		data:{c_num:c_num, c_number:c_number}
    	})
    	.done(function(html){
    		$('#div_comment').html(html);
    	});
    });


</script>



</body>
</html>