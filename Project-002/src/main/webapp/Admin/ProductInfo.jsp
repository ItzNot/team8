<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.ProductDto" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%@ include file="header.jsp"%>
 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<br/>
<br/>
<h2>상품 추가</h2>
<br/>
<% LocalDate now = LocalDate.now();
	ProductDto pt = new ProductDto();
%>

<form class="row g-3" action="addProduct_proc.jsp" method="post">
<div class="input-group mb-3">
	<span class="input-group-text">상품명</span>
  <input type="text" class="form-control" name="prdName" placeholder="Product-Name" value="" aria-label="name" required>
  <span class="input-group-text">상품가격</span>
  <input type="text" class="form-control" name="price" placeholder="Product-Price" value="" aria-label="Price" required>
</div>
<br/>
<br/>
<div class="input-group mb-3">
	<span class="input-group-text">제품회사명</span>
  <input type="text" class="form-control" name="company" placeholder="Product-company" value="" aria-label="company" required>
  <span class="input-group-text">주소</span>
  <input type="text" class="form-control" name="address" placeholder="Product-address" value="" aria-label="address" required>
</div>
<br/>
<br/>
<div class="d-grid gap-2 col-2 mx-auto">
  <button class="btn btn-primary" type="submit">추가하기</button>
</div>
</form>

</main> 	
</body>
</html>