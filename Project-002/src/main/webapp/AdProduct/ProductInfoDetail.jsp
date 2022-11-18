<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="sample.ProductDto"%>
<%@page import="sample.sampleDBDao"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
 <%@ include file="../Admin/header.jsp"%>
<%
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		sampleDBDao sdb = new sampleDBDao();
		ProductDto pd = sdb.selectProductInfoById(pseq);
	%>
	 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div>
			<br /> <br />
			<h2>
				정보상세

			</h2>
			<img src="/Project-002/img/<%=pd.getImage()%>" alt="<%=pd.getImage()%>" width="300px" class="rounded mx-auto d-block">
			<form name="productDetailForm" class="row g-3" method="post" enctype="multipart/form-data">
				<div class="mb-3">
				  <label for="formFile" class="form-label"></label>
				  <input class="form-control" type="file" id="formFile" name="filename">
				</div>
				<div class="input-group mb-3">
					<div class="input-group mb-3">
						<span class="input-group-text">상품ID</span> <input type="text"
							class="form-control" name="pseq" value="<%=pd.getPseq()%>"
							aria-label="pseq" readonly> 
						<span class="input-group-text">등록날짜</span>
						<input type="text" class="form-control" name="indate"
							value="<%=pd.getIndate()%>" aria-label="indate" readonly>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">상품명</span> <input type="text"
							class="form-control" name="name" value="<%=pd.getName()%>"
							aria-label="name" required> 
						<span class="input-group-text">상품가격</span>
						<input type="text" class="form-control" name="price2"
							value="<%=pd.getPrice2()%>" aria-label="price2" required>
					</div>

					<span class="input-group-text">제품종류</span> <input type="text"
						class="form-control" name="kind" value="<%=pd.getKind()%>"
						aria-label="kind" required> 
					<span class="input-group-text">제품설명</span>
					<input type="text" class="form-control" name="content"
						value="<%=pd.getContent()%>" aria-label="content" required>
				</div>
				<div class="input-group mb-3">
						<span class="input-group-text">인기도</span> <input type="text"
							class="form-control" name="bestyn" value="<%=pd.getBestyn()%>"
							aria-label="bestyn" required>
					</div>
		</div>
		<div class="d-flex justify-content-end">
				<button id="updateBtn" type="submit" class="btn btn-warning mb-3">수정</button>
				<button id="deleteBtn" type="button" class="btn btn-danger mb-3">삭제</button>
		</div>

		</form>
		</div>

		<script>
		document.getElementById('updateBtn').addEventListener('click', (e)=> {
			e.preventDefault();
			let form = document.productDetailForm;
				if(confirm('수정하겠습니까?')) {
					form.action = "updateProduct_proc.jsp";
					form.submit();
				}
		});
		document.getElementById('deleteBtn').addEventListener('click', (e)=> {
			e.preventDefault();
			let form = document.productDetailForm;
			if(confirm('삭제하겠습니까?')) {
				form.action = "deleteProduct_proc.jsp";
				form.submit();
			}
		});
		
	</script>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>