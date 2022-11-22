<%@ page import="sample.sampleDBDao"%>
<%@ page import="sample.ProductDto" %>
<%@page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MultipartRequest multi = new MultipartRequest(request, "/img", 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		int pseq = Integer.parseInt(multi.getParameter("pseq"));
		
		sampleDBDao spd = new sampleDBDao();
		int result = spd.deleteProductInfo(pseq);
		
		if(result > 0) {
	%>
	<script>
		alert('삭제')
		location.href = "ProductMT.jsp"
	</script>
	<% 		
		} else {
	%>
	<script>
		alert('실패')
		location.href = "PersonInfoDetail.jsp?pseq=<%=pseq%>";
	</script>
	<%	
		}
	%>
</body>
</html>