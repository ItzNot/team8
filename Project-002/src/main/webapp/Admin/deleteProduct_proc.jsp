<%@ page import="sample.sampleDBDao"%>
<%@ page import="sample.ProductDto" %>
<%@page import="java.util.*"%>
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
		//addPerson.jsp -> Form 태그 양식 "name" -> submit ->
		//action = "addPerson_proc.jsp" 
		int prdid = Integer.parseInt(request.getParameter("prdid"));
		
		sampleDBDao spd = new sampleDBDao();
		int result = spd.deleteProductInfo(prdid);
		
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
		location.href = "PersonInfoDetail.jsp?prdid=<%=prdid%>";
	</script>
	<%	
		}
	%>
</body>
</html>