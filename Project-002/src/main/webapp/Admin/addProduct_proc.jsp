<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="sample.sampleDBDao" %>
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
		String prdName = request.getParameter("prdName"); //input name칸 변수명
		int price = Integer.parseInt(request.getParameter("price"));
		String company = request.getParameter("company");
		String address = request.getParameter("address");
		sampleDBDao spd = new sampleDBDao();
		int result = spd.insertProductInfo(prdName, price, company, address);
		
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