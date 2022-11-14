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
 <%@ include file="header.jsp"%>
<%
		int prdid = Integer.parseInt(request.getParameter("prdid"));
		sampleDBDao sdb = new sampleDBDao();
		ProductDto pd = sdb.selectProductInfoById(prdid);
	%>
	 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div>
			<br /> <br />
			<h2>
				정보상세
				<button id="updateBtn" type="submit" class="btn btn-warning mb-3">수정</button>
				<button id="deleteBtn" type="button" class="btn btn-danger mb-3">삭제</button>
			</h2>
			<form name="productDetailForm" class="row g-3" method="post">

				<div class="input-group mb-3">
					<div class="input-group mb-3">
						<span class="input-group-text">상품ID</span> <input type="text"
							class="form-control" name="prdid" value="<%=pd.getPrdid()%>"
							aria-label="prdid" readonly> <span class="input-group-text">등록날짜</span>
						<input type="text" class="form-control" name="createdt"
							value="<%=pd.getCreatedt()%>" aria-label="createdt" readonly>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">상품명</span> <input type="text"
							class="form-control" name="prdName" value="<%=pd.getPrdname()%>"
							aria-label="prdname"> <span class="input-group-text">상품가격</span>
						<input type="text" class="form-control" name="price"
							value="<%=pd.getPrice()%>" aria-label="Price">
					</div>

					<span class="input-group-text">제품회사명</span> <input type="text"
						class="form-control" name="company" value="<%=pd.getCompany()%>"
						aria-label="company"> <span class="input-group-text">주소</span>
					<input type="text" class="form-control" name="address"
						value="<%=pd.getAddress()%>" aria-label="address">
				</div>
				<div class="input-group mb-3">
						<span class="input-group-text">등급</span> <input type="text"
							class="form-control" name="grade" value="<%=pd.getGrade()%>"
							aria-label="grade">
					</div>
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