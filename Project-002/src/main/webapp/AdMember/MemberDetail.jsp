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
    	String id = request.getParameter("id");
		MemberDao mda = new MemberDao();
    	MemberDto mdt = new MemberDto();
    	mdt = mda.selectMemberByid(id);
		MemberDto mdt1 = new MemberDto();
		mdt1 = mda.selectMemberAllPriceByid(id);
    
    %>
    
    	<h2 ><%=mdt.getName() %>님</h2>
   	    <br/>
   	 	<br/>
		<div class="row g-3">
			<div class="col"> 아이디
				<input type="text" class="form-control"  aria-label="id" value="<%=mdt.getId()%>" readonly>
			</div>
			<div class="col"> 총 구매가격
				<input type="text" class="form-control"  aria-label="name" value="<%=mdt1.getMemAllPrice()%>원" readonly>
			</div>
		</div>
    	<br/>
   	 	<br/>
		<div class="row g-3">
			<div class="col"> 이메일
				<input type="text" class="form-control"  aria-label="email" value="<%=mdt.getEmail()%>" readonly>
			</div>
			<div class="col"> 휴대폰번호
				<input type="text" class="form-control"  aria-label="phone" value="<%=mdt.getPhone()%>" readonly>
			</div>
		</div>
   	    <br/>
   	 	<br/>
		<div class="row g-3">
			<div class="col"> 우편번호
				<input type="text" class="form-control"  aria-label="zip_num" value="<%=mdt.getZip_num()%>" readonly>
			</div>
			<div class="col"> 주소
				<input type="text" class="form-control"  aria-label="address" value="<%=mdt.getAddress()%>" readonly>
			</div>
		</div>
   	    <br/>
   	 	<br/>
		<div class="row g-3">
			<div class="col"> 사용여부
				<input type="text" class="form-control"  aria-label="useyn" value="<%=mdt.getUseyn()%>" readonly>
			</div>
			<div class="col"> 등록날짜
				<input type="text" class="form-control"  aria-label="indate" value="<%=mdt.getIndate()%>" readonly>
			</div>
		</div>
	</main>
</body>
</html>