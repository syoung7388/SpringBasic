<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 작성</title>
</head>


<body>
<form action="/writingProcess" method="post">
<input type="hidden" name="b_number" value="${b_number}">


<h2 style="text-align: center">글쓰기</h2>


<sec:authentication property="principal" var="user"/>


<input type="hidden" name="b_id" value="${user.uName}">
   

<table>
   <tr> 
      <td>제목</td>
      <td><input type="text" name="b_title" ></td>
   </tr>
   
   <tr>
       <td>내용</td>
       <td><textarea name="b_content" cols="100" rows="30"></textarea></td>
   </tr>
   <tr>
      <td colspan=2><input type= "submit" value="등록"><a href="/boardList?b_number=${b_number}">취소</a></td>
   </tr>

</table>
</form>
</body>
</html>