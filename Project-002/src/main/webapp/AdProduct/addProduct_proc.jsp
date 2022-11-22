<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="sample.sampleDBDao" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %> <%-- 한글깨짐수정 --%>
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
		
		Enumeration files = multi.getFileNames();
		String name = (String) files.nextElement();
		String filename = multi.getOriginalFileName(name);
		
		String name1 = multi.getParameter("name");
// 		request.getParameter("prdName"); //input name칸 변수명
		int price2 = Integer.parseInt(multi.getParameter("price2").toString());
		String kind = multi.getParameter("kind");
		String content = multi.getParameter("content");
		
		
		sampleDBDao spd = new sampleDBDao();
		int result = spd.insertProductInfo(name1, kind, price2, content, filename);
		
		if(result > 0) {
	%>
		<script>alert('추가')</script>
	<% 		
		} else {
	%>
		<script>alert('실패')</script>
	<%	
		}
	%>
		<script>location.href = "ProductMT.jsp"</script>
</body>
</html>