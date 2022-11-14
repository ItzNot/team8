<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.sampleDBDao" %>
<%@ page import="sample.ProductDto" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%@ include file="header.jsp"%>
 
     <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<%
				sampleDBDao sda = new sampleDBDao();
				List<ProductDto> lpd = sda.selectProductList();
				%>
    <br/>
    <br/>    
    <br/>
    <br/>
    
    
    			<h2 >상품 목록  
				<a class="btn btn-primary" href="ProductInfo.jsp" role="button">상품추가</a> </h2>
			
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col">상품ID</th>
								<th scope="col">상품명</th>
								<th scope="col">상품가격</th>
								<th scope="col">상품회사</th>
								<th scope="col">배송지</th>
								<th scope="col">회원등급</th>
								<th scope="col">상품등록일자</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if (lpd != null && lpd.size() > 0) {
								for (ProductDto pd : lpd) {
						%>
							<tr>
								<td><%= pd.getPrdid() %></td>
								<td><a href="ProductInfoDetail.jsp?prdid=<%= pd.getPrdid()%>"><%= pd.getPrdname() %></a></td>
								<td><%= pd.getPrice() +"원" %></td>
								<td><%= pd.getCompany() %></td>
								<td><%= pd.getAddress() %></td>
								<td><%= pd.getGrade() %></td>
								<td><%= pd.getCreatedt() %></td>
							</tr>
						<% 
								}
							}
						%>

						</tbody>
					</table>
				</div>

			</main>
			<script src="https://getbootstrap.kr/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
</body>
</html>