<%@page import="sample.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.QnaDto" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../Admin/header.jsp"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
 				<%
				QnaDao qda = new QnaDao();
				List<QnaDto> qdt = qda.selectQnaInfo();
				%>
    <br/>
    <br/>    
    <br/>
    <br/>
    

    	<h2 >Q&A 목록</h2>
		
			
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자ID</th>
								<th scope="col">답변유무</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if (qdt != null && qdt.size() > 0) {
								for (QnaDto qd : qdt) {
						%>
							<tr>
								<td><%= qd.getQseq() %></td>
								<td><a href="QnaDetail.jsp?qseq=<%=qd.getQseq()%>"><%=qd.getSubject() %></a></td>
								<td><%= qd.getId() %></td>
								<td><%= qd.getRep() %></td>
								<td><%= qd.getIndate() %></td>
							</tr>
						<% 
								}
							}
						%>

						</tbody>
					</table>
				</div>
				</main>
</body>
</html>