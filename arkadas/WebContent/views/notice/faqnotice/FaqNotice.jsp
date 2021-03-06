<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.notice.faqnotice.model.vo.FaqNotice"%>
<%
	ArrayList<FaqNotice> list = (ArrayList<FaqNotice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css" rel="stylesheet" type="text/css">
<style type="text/css">
.hanna {font-family:'hanna';}
.headline{
	font-family:'Jeju Gothic';
	font-size : 45px;
	color : red;
}
.subhead{
	font-family: 'Jeju Gothic';
	font-size : 23px;
	font-weight : bold;
	color : rgb(38, 56, 56);
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주묻는질문</title>

<!-- 스크립트 영역 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
</head>
<body>
	<%@ include file = "/views/common/menubar.jsp" %>
	<%@ include file = "/views/notice/NoticeMenu.jsp" %>
	<div class="outer">
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<h1 class="headline" align="center" style="color:red;">자주묻는질문</h1>
		<br>
		<%if(loginUser!=null&&loginUser.getUserId().equals("admin")){ %>
	<button type="button" class="navyBtn" onClick="location.href='<%=request.getContextPath()%>/FaqNoticeRegForm.no'">글작성</button>
		<%} %>
		<div style="display:flex; justify-content:center;">
		<table class="listArea" align="center">
			<thead>
				<tr>
					<th class="subhead" width="90" colspan="2" style="color:orange;"><h3>글번호</h3><hr style="border: solid 2px black;"><br></th>
					
					<th class="subhead" width="400" style="color:orange;"><h3>글제목</h3><hr style="border: solid 2px black;"><br></th>
					<th class="subhead" width="200" style="color:orange;"><h3>작성자</h3><hr style="border: solid 2px black;"><br></th>
					<th class="subhead" width="100" style="color:orange;"><h3>조회수</h3><hr style="border: solid 2px black;"><br></th>
					<th class="subhead" width="200" style="color:orange;"><h3>작성일</h3><hr style="border: solid 2px black;"><br></th>
				</tr>
			</thead>
			<tbody>
				 <% if(list.isEmpty()){ %>
				 	<tr>
						<td colspan="5">존재하는 글이 없습니다.</td>
					</tr>
				 <% }else{  %>
				 	<% for(FaqNotice n : list){ %>
				 		<tr>
				 			<td align="center" colspan="2"><br><%= n.getFAQ_SEQNO()    %></td>
				 			
							<td align="center"><br><%= n.getFAQ_TITLE()    %></td>
							<td align="center"><br><%= n.getFAQ_CRT_USER() %></td>
							<td align="center"><br><%= n.getFAQ_CRT_DATE() %></td>
							<td align="center"><br><%= n.getFAQ_READ_COUNT() %></td>
				 		</tr>
				 	<% } %>
				 <% } %>
			</tbody>
			
		</table>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<form class="searchArea" align="center">
			<select id="condition" name="condition">
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" name="search">
			<button type="submit">검색하기</button>
		</form>	

	</div>
</body>
<script>
		<%if (!list.isEmpty()) {%>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				var FnNo = $(this).children().eq(0).text();
				//console.log(nno);
				
				// 쿼리 스트링을 이용하여 get방식으로(url 노출) 글번호를 server로 전달
				location.href="<%=request.getContextPath()%>/FaqNoticeDetail.no?FnNo=" + FnNo;
			});
		});
		<%} %>
	</script>

</html>