<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.ProductDto" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
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
<h2>상품 추가</h2>
<br/>

<form class="row g-3" action="addProduct_proc.jsp" method="post" enctype="multipart/form-data">
<div class="input-group mb-3">
	<span class="input-group-text">상품명</span>
  <input type="text" class="form-control" name="name" placeholder="Product-Name" value="" aria-label="name" required>
  <span class="input-group-text">상품가격</span>
  <input type="text" class="form-control" name="price1" placeholder="Product-Price1" value="" aria-label="price1" required>
</div>
<br/>
<br/>
<div class="input-group mb-3">
	<span class="input-group-text">상품종류</span>
  <input type="text" class="form-control" name="kind" placeholder="Product-kind" value="" aria-label="kind" required>
  <span class="input-group-text">설명</span>
  <input type="text" class="form-control" name="content" placeholder="Product-content" value="" aria-label="content" required>
</div>
<br/>
<br/>

<div class="mb-3">
  <label for="formFile" class="form-label"></label>
  <input class="form-control" type="file" id="formFile" name="filename">
</div>


<div class="d-grid gap-2 col-2 mx-auto">
  <button class="btn btn-primary" type="submit">추가하기</button>
</div>
</form>
</main> 	
</body>
</html>