<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.OrderDao" %>
<%@ page import="sample.OrderDto" %>
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
				<%
				OrderDao oda = new OrderDao();
				List<OrderDto> odt = oda.selectOrderList();
				%>
    <br/>
    <br/>    
    <br/>
    <br/>
    

    	<h2 >주문 목록</h2>
		
			
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col">주문ID</th>
								<th scope="col">회원ID</th>
								<th scope="col">회원이름</th>
								<th scope="col">구매일자</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if (odt != null && odt.size() > 0) {
								for (OrderDto od : odt) {
						%>
							<tr>
								<td><%= od.getOseq() %></td>
								<td><a href="OrderDetail.jsp?oseq=<%=od.getOseq()%>"><%= od.getId() %></a></td>
								<td><%= od.getName() %></td>
								<td><%= od.getIndate() %></td>
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