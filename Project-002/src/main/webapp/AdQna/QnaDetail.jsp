<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="sample.QnaDao"%>
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
    <br/>
    <br/>    
    <br/>
    <br/>
    <%
    	int qseq = Integer.parseInt(request.getParameter("qseq"));
		QnaDao qda = new QnaDao();
		QnaDto qd = new QnaDto();	
		qd = qda.selectQnaByqseq(qseq);
    %>
    
    <h2><%=qd.getName()%>님의 질문</h2>
    <br/>
    <br/>
		<form class="row g-3" action="QnaReply_proc.jsp" method="post" enctype="multipart/form-data">
		<div class="row g-3">
			<div class="col">
				<input type="text" name="qseq" class="form-control"  aria-label="글번호" value="<%=qd.getQseq() %>" readonly>
			</div>
		</div>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">질문 제목</label>
			 <input type="text" class="form-control" id="exampleFormControlInput1" value="<%=qd.getSubject()%>" readonly>
		</div>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">질문 내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly><%=qd.getContent()%></textarea>
		</div>
		<br/>

		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">답변 내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="reply" required placeholder="<%=qd.getReply()%>"></textarea>
		</div>

		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-outline-primary" type="submit">작성</button>
		</div>
		</form>
	</main>

</body>
</html>