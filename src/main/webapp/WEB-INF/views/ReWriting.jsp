<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글쓰기</title>
<style>

  table {
    border-collapse: separate;
    margin:50px auto;
    
  }
  table tr td{
    border:2px solid  #0064FF;
    text-align:center;
  }
  a{
       width:50px;
       height:30px;
       background-color:#0064FF;
       position: relative;
       left:970px;
       top:30px;
       text-align:center;
  
  }
  
  div{
       width:50px;
       height:30px;
       background-color:#0064FF;
       position: relative;
       left:970px;
       top:30px;
       text-align:center;
  }
  
  #atest:hover {
  	background-image: url('https://obj-sg.thewiki.kr/data/ec9ca0ed8a9cebb88c20eba19ceab3a02e706e67.png');
  }
  

</style>
</head>
<body>
<h2 style="color:#0033FF; text-align:center;font-size:xx-large;">답글쓰기</h2>

<form action="/ReWritingProcess" method="post">


<input type="hidden" name="b_num" value="${b_num}">
<sec:authentication property="principal" var="user"/>
<input type= "hidden" name="b_id" value="${user.uName}">
<input type= "hidden" name="b_number" value="${b_number}">

<table>
     <tr>
         <td>제목</td>
         <td><input type= "text" name="b_title"></td>
     </tr>
     
     <tr>
         <td>내용</td>
         <td><textarea name= "b_content" cols="100" rows="30"></textarea></td>
     </tr>
     </table>

    <div><input type="submit" value="등록" style="background: url('https://mdn.mozillademos.org/files/7693/catfront.png') no-repeat;"></div>
    <a href="/boardList?b_number=${b_number}">취소</a>
    <a id="atest" href="#"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDELjJWHOAuHDe_4sn79hwOSqzAeq_iwXr7A&usqp=CAU"></a>
</form>



</body>
</html>