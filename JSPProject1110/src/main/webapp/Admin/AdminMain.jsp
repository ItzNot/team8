<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.sampleDBDao" %>
<%@ page import="sample.sampleDBDto" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Admin Page</title>
  </head>
  <body>
    <%@ include file="header.jsp"%>
    
 
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<%
				sampleDBDao sda = new sampleDBDao();
				List<sampleDBDto> pil = sda.selectPersonInfoList();
				%>
    <br/>
    <br/>    
    <br/>
    <br/>
				<h2>Section title</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col">EMPNO</th>
								<th scope="col">ENAME</th>
								<th scope="col">JOB</th>
								<th scope="col">MGR</th>
								<th scope="col">SAL</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if (pil != null && pil.size() > 0) {
								for (sampleDBDto pi : pil) {
						%>
							<tr>
								<td><%= pi.getEmpno() %></td>
								<td><%= pi.getEname() %></td>
								<td><%= pi.getJob() %></td>
								<td><%= pi.getMgr() %></td>
								<td><%= pi.getSal() %></td>
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