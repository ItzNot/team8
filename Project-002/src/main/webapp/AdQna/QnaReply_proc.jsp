<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.QnaDao"%>
<%@ page import="sample.QnaDto"%>
<%@ page import="java.util.*" %>   
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>    
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//addPerson.jsp -> Form 태그 양식 "name" -> submit ->
		//action = "addPerson_proc.jsp"
		MultipartRequest multi = new MultipartRequest(request, "/img", 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		String reply = multi.getParameter("reply");
		int qseq = Integer.parseInt(multi.getParameter("qseq"));
		
		QnaDto qd = new QnaDto();
		qd.setReply(reply);
		qd.setQseq(qseq);
		
		QnaDao pd = new QnaDao();
		int result = pd.updateQnaInfo(qd);
		if(result > 0) {
	%>
	<script>
		alert('완료')
		location.href = "QnaMT.jsp"
	</script>
	<% 		
		} else {
	%>
	<script>
		alert('실패')
		location.href = "QnaMT.jsp";
	</script>
	<%	
		}
	%>
</body>
</html>