<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.MemberDao" %>
<%@ page import="sample.MemberDto" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		MemberDao mda = new MemberDao();
		
		boolean check = mda.selectIdPw(id, pw);
		if(check) {
	%>
	<script>
	<%
		session.setAttribute("id", id);	
	%>
		alert('로그인성공')
		location.href = "../Admin/AdminMain.jsp"
	</script>
	<% 		
		} else {
	%>
	<script>
		alert('로그인실패')
		location.href = "Login.jsp";
	</script>
	<%	
		}
	%>
</body>
</html>