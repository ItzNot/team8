<%@ page import="sample.ProductDto" %>
<%@ page import="sample.sampleDBDao" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//addPerson.jsp -> Form 태그 양식 "name" -> submit ->
		//action = "addPerson_proc.jsp"
		String name = request.getParameter("prdName"); //input name칸 변수명
		int price = Integer.parseInt(request.getParameter("price"));
		int prdid = Integer.parseInt(request.getParameter("prdid"));
		String company = request.getParameter("company");
		String address = request.getParameter("address");
		String grade = request.getParameter("grade");
		
		ProductDto pd = new ProductDto();
		pd.setPrdname(name);
		pd.setPrice(price);
		pd.setCompany(company);
		pd.setAddress(address);
		pd.setGrade(grade);
		pd.setPrdid(prdid);
		
		sampleDBDao pda = new sampleDBDao();
		int result = pda.updateProductInfo(pd);
		
		if(result > 0) {
	%>
	<script>
		alert('수정')
		location.href = "ProductMT.jsp"
	</script>
	<% 		
		} else {
	%>
	<script>
		alert('실패')
		location.href = "ProductInfoDetail.jsp?prdid=<%=pd.getPrdid()%>";
	</script>
	<%	
		}
	%>
</body>
</html>