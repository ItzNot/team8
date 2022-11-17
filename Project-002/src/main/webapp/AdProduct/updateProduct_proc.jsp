<%@ page import="sample.ProductDto" %>
<%@ page import="sample.sampleDBDao" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>
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
		String uploadDir = this.getClass().getResource("").getPath();
// 		uploadDir = uploadDir.substring(1, uploadDir.indexOf("Users")) + "project1111_team8/team8/Project-002/src/main/webapp/img";
// 		uploadDir = "../img";
		uploadDir = "C://img";
		
		MultipartRequest multi = new MultipartRequest(request, uploadDir, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String name = (String) files.nextElement();
		String filename = multi.getFilesystemName(name);
		
		String name1 = multi.getParameter("name"); //input name칸 변수명
		int price1 = Integer.parseInt(multi.getParameter("price1"));
		int pseq = Integer.parseInt(multi.getParameter("pseq"));
		String kind = multi.getParameter("kind");
		String content = multi.getParameter("content");
		String bestyn = multi.getParameter("bestyn");
		
		ProductDto pd = new ProductDto();
		pd.setName(name1);
		pd.setPrice1(price1);
		pd.setKind(kind);
		pd.setContent(content);
		pd.setBestyn(bestyn);
		pd.setPseq(pseq);
		pd.setImage(filename);
		
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
		location.href = "Product/ProductInfoDetail.jsp?prdid=<%=pd.getPseq()%>";
	</script>
	<%	
		}
	%>
</body>
</html>