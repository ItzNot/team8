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
				<%
				MemberDao mda = new MemberDao();
				List<MemberDto> mdt = mda.selectMemberInfo();
				%>
    <br/>
    <br/>    
    <br/>
    <br/>
    

    	<h2 >고객 목록</h2>
		
			
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col">고객ID</th>
								<th scope="col">고객이름</th>
								<th scope="col">고객email</th>
								<th scope="col">고객우편번호</th>
								<th scope="col">거주지</th>
								<th scope="col">고객전화번호</th>
								<th scope="col">사용여부</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if (mdt != null && mdt.size() > 0) {
								for (MemberDto md : mdt) {
						%>
							<tr>
								<td><%= md.getId() %></td>
								<td><a href="MemberDetail.jsp?id=<%=md.getId()%>"><%= md.getName()%></a></td>
								<td><%= md.getEmail() %></td>
								<td><%= md.getZip_num() %></td>
								<td><%= md.getAddress() %></td>
								<td><%= md.getPhone() %></td>
								<td><%= md.getUseyn() %></td>
								<td><%= md.getIndate() %></td>
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