<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>   

<sec:authentication property="principal" var="user"/>
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
      <input type="hidden" name="c_number" value="${c_number}">
      <input type="button" value="등록하기" id="insert_ok"> </p>
</form>
</div>