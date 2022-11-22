<%@page import="sample.OrderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.OrderDao" %>
<%@ page import="sample.OrderDetailDto" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
		int oseq = Integer.parseInt(request.getParameter("oseq"));
		OrderDao oda = new OrderDao();
		OrderDto ot = new OrderDto();
		OrderDetailDto odt = new OrderDetailDto();
		odt = oda.selectOrderPricebymemid(oseq);
		ot = oda.selectOrderbymemid(oseq);
		List<OrderDetailDto> odd = oda.selectListOrderbymemid(oseq);
	%>
    	<h2><%=ot.getName()%>의 주문 목록</h2>
    	<h3>총 구입비용 : <%= odt.getAllPrice() %>원</h3>
    	<br/>
 
    	
    	<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col">주문상세ID</th>
								<th scope="col">주문ID</th>
								<th scope="col">상품ID</th>
								<th scope="col">구입상품수량</th>
								<th scope="col">구입상품총가격</th>
								<th scope="col">처리상태</th>
							</tr>
						</thead>
						<tbody>
						<%
							if (odd != null && odd.size() > 0) {
								for (OrderDetailDto odl : odd) {
						%>
							<tr>
								<td><%= odl.getOdseq() %></td>
								<td><%= odl.getOseq() %></td>
								<td><a href="../AdProduct/ProductInfoDetail.jsp?pseq=<%=odl.getPseq()%>"><%= odl.getPseq() %></a></td>
								<td><%= odl.getQuantity() %></td>
								<td><%= odl.getAllPrice() %>원</td>
								<td><%= odl.getResult() %></td>
							</tr>
						<% 
								}
							}
						%>

						</tbody>
					</table>
				</div>

</main>
</body>
</html>