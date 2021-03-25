<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
</head>
<body>

<form action="/EditBoard" method="post">


<input type="hidden" name="b_num" value="${board.b_num}">

<table>
     <tr>
         <td>제목</td>
         <td><input type="text" name="b_title"></td>
     </tr>
     
     <tr>
         <td>내용</td>
         <td><textarea name="b_content" cols="100" rows="30"></textarea></td>
     </tr>
     </table>

    <input type="submit" value="수정">
    <a href="/boardList?b_number=${board.b_number}&page=1">취소</a>
</form>



</body>
</html>