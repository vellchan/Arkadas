<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.notice.faqnotice.model.vo.FaqNotice" %>
<%
	FaqNotice n = (FaqNotice)request.getAttribute("faqNotice");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 상세보기</title>
<style>
	.outer{
		width:800px;
		height:600px;
		
		
		margin:auto;
		margin-top:50px;
	}
	#detailArea{width:75%; margin:auto;border-color:black;}
	#detailArea p{height:400px;}
	.btns a{text-decoration:none; color:black;}
	
	
</style>
</head>
<body>
	<%@ include file = "/views/common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		
		<h2 align="center" style="color:red;">자주묻는질문 상세보기</h2>
		

		<table id="detailArea" border="1">
			<tr>
				<td align="center" style="color:orangered;">제목</td>
				<td colspan="3"><%= n.getFAQ_TITLE() %></td>
			</tr>
			<tr>
				<td align="center" style="color:orangered;">작성자</td>
				<td><%= n.getFAQ_CRT_USER() %></td>
				<td align="center" style="color:orangered;">조회수</td>
				<td><%= n.getFAQ_CRT_DATE() %></td>
			</tr>
			<tr>
				<td align="center" style="color:orangered;" colspan="4">내용</td>
			
			</tr>
			<tr>
				<td colspan="4">
					<p><%= n.getFAQ_CONTENT() %></p>
				</td>
			</tr>	
		</table>
		
		<br>
		
		<div class="btns" align="center">
		
			<a href="FaqNotice.no">목록으로</a> &nbsp;&nbsp;
				
			<!-- 로그인 기능 없을경우 이것을 임시사용 -->
			<a href="FaqNoticeUpdateForm.no?FnNo=<%=n.getFAQ_SEQNO()%>">수정하기</a> &nbsp;&nbsp;
			<a href="FaqNoticeDelete.no?FnNo=<%=n.getFAQ_SEQNO()%>">삭제하기</a>
		
				
			<!-- 글을 보는 회원이 admin인 경우 수정하기,삭제하기 버튼이 보이도록 하자!  로그인 기능 추가시 이것을 사용-->
			<%-- <% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
			<a href="MainNoticeUpdateForm.no?MnNo=<%=n.getMainNoticeNo()%>">수정하기</a> &nbsp;&nbsp;
			<a href="MainNoticeDelete.no?MnNo=<%=n.getMainNoticeNo()%>">삭제하기</a>
		
			<% } %> --%>
			<!-- 공지사항을 수정화면으로 넘어가기 위해 NoticeUpdateFormServlet 만들러 가자!! -->
		</div>
	</div>
	<%-- <%@ include file = "/views/common/footer.jsp" %>--%>
	
</body>
</html>