<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<style>

   table{
      border collapse: collapse;
      margin:50px auto;
   }
   
   table tr td{
      text-align:center;
      width:300px;
      height:50px;
      border:2px solid #0064FF;
      
   } 
   table tr th{
      height:10px;
      border:2px solid #0064FF;
   }
   
   div{
      position: relative;
      left:740px;
      top:30px;
   }
   span{
      width:50px;
      height:30px;
      background-color:#0064FF;
      position: relative;
      left:1000px;
      top:0px;
      text-align:center;
   }
    a { text-decoration:none !important }



</style>

</head>
<body>
<h2 style="color:#0033FF; text-align:center;font-size:xx-large;">목록</h2>
<div>
<form action="/Search" method="post">
    <select name="select" id="search select">
    <option value="">선택해주세요</option>
    <option value="b_title">제목</option>
    <option value = "b_content">내용</option>
    <option value="b_id">아이디</option>
    </select>
  <input type="text" name="search">
  <input type="hidden" name="page" value="1">
  <input type="submit" value="검색">
</form>

</div>
<table>
<tr>
   <td>NUM</td>
   <td>게시판</td>
</tr>
    
    <c:forEach items="${list}" var="item">
        <tr>
           <td><a href="/boardList?b_number=${item.l_number}&page=1" style="color:black;">${item.l_number}</a></td>
           <td>${item.l_board}</td>
        
        </tr>
    
    </c:forEach>
</table>
<span ><a href="/" style="color:white;">돌아가기</a></span>

</body>
</html>