<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.MemberDao" %>
<%@ page import="sample.MemberDto" %>
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
		MemberDao mda = new MemberDao();
    	MemberDto mdt = new MemberDto();
    
    %>
    
    	<h2 >고객 목록</h2>
   	    <br/>
   	 	<br/>
		<div class="row g-3">
			<div class="col">
				<input type="text" class="form-control"  aria-label="First name">
			</div>
			<div class="col">
				<input type="text" class="form-control"  aria-label="Last name">
			</div>
		</div>
    	<br/>
   	 	<br/>
		<div class="row g-3">
			<div class="col">
				<input type="text" class="form-control"  aria-label="First name">
			</div>
			<div class="col">
				<input type="text" class="form-control"  aria-label="Last name">
			</div>
		</div>
   	    <br/>
   	 	<br/>
		<div class="row g-3">
			<div class="col">
				<input type="text" class="form-control"  aria-label="First name">
			</div>
			<div class="col">
				<input type="text" class="form-control"  aria-label="Last name">
			</div>
		</div>
   	    <br/>
   	 	<br/>
		<div class="row g-3">
			<div class="col">
				<input type="text" class="form-control"  aria-label="First name">
			</div>
			<div class="col">
				<input type="text" class="form-control"  aria-label="Last name">
			</div>
		</div>
   	    <br/>
   	 	<br/>
		<div class="row g-3">
			<div class="col">
				<input type="text" class="form-control"  aria-label="First name">
			</div>
			<div class="col">
				<input type="text" class="form-control"  aria-label="Last name">
			</div>
		</div>
	</main>
</body>
</html>