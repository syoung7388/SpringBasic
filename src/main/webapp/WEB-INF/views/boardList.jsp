<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<style>

   table{
      border collapse: collapse;
      margin:50px auto;
   }
   
   table tr td{
      text-align:center;
      width:100px;
      height:80px;
      border:2px solid #0064FF;
      
   } 
   table tr th{
      height:10px;
      border:2px solid #0064FF;
   }
   
   p{
       width:50px;
       height:30px;
       background-color:#0064FF;
       position: relative;
       left:970px;
       top:30px;
       text-align:center;
   }
   a { text-decoration:none !important }
   
   ul{
     width:400px;
     heigth:50px;
     margin:30px auto;
     }
     
  li{
     list-style:none;
     width:40px;
     line-height:40px;
     border:2px solid #0064FF;
     float:left;
     text-align:center;
     margin:0 5px;
     border-radius:10px 100px / 120px;
     }
   

</style>

<body>

<h2 style="color:#0033FF; text-align:center;font-size:xx-large;">BoardList</h2>

<p><a href="/beforeWriting?b_number=${b_number}" style="color:white;">글쓰기</a></p>
<p><a href="/lcList?b_number=${b_number}" style="color:white; ">이전</a></p>


<table>
 <tr>
     <th>Num</th>
     <th>제목</th>
     <th>ID</th>
     <th>날짜</th>
     <th>조회수</th>
 </tr>
 
<c:forEach items= "${list}" var= "item" varStatus="status">

        <tr>
         <td><a href="/Board?b_num=${item.b_num}">${item.b_num}</a></td>
           <c:choose>
              <c:when test="${item.b_order eq 1}">
                 <td>${item.b_title}</td>
              </c:when>
                <c:when test="${item.b_order ne 1}">
                 <td>RE:${item.b_title}</td>
              </c:when>
           </c:choose>
         
         <td>${item.b_id}</td>
         <td>${item.b_dateTime}</td>
         <td>${item.b_hits}</td>
        </tr>
</c:forEach>
</table>


<div>
     <ul>
       <c:choose>
       <c:when test="${pagination.prevPage lt 1}">
          <li style= "display:none;">
          <span>◀</span>
          </li>
       </c:when>
       <c:when test= "${pagination.prevPage ge 1}">
       <li>
         <a href= "/boardList?page=${pagination.prevPage}&b_number=${b_number}">
         ◀
         </a>
       </li>
       </c:when>
       </c:choose>
       <c:forEach var="i" begin = "${pagination.startPage}" end = "${pagination.endPage}" step ="1">
         <c:choose>
         <c:when test="${pagination.page eq i}">
         <li style= "background-color:white; ">
           <span>${i}</span>
           </li>
         </c:when>
         <c:when test= "${pagination.page ne i}">
          <li >
              <a href= "/boardList?page=${i}&b_number=${b_number}">${i}</a>
         
          </li>
         
         
         </c:when>
         
         </c:choose>
       
       </c:forEach>
      
       <c:choose>
       <c:when test= "${pagination.nextPage lt pagination.lastPage}">
       <li style="">
           <a href= "/boardList?page=${pagination.nextPage}&b_number=${b_number}">▶</a>
        </li>
       </c:when>
       <c:when test ="${pagination.nextPage ge pagination.lastPage} ">
       <li style= "display:none;">
        <a href= "/boardList?page=${pagination.nextPage}&b_number=${b_number}"></a> 
       </li>
       </c:when>

       <c:when test ="${pagination.nextPage eq pagination.lastPage}">
       <li>
        <a href= "/boardList?page=${pagination.nextPage}&b_number=${b_number}">▶</a> 
       </li>
       </c:when>
       
       </c:choose>
 
       
     </ul>
   
   
   </div>

</body>
</html>