<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Team8 Shop</title>
  <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/headers/">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  <script type="text/javascript" src="member/member.js"></script>
  <script type="text/javascript" src="mypage/mypage.js"></script> 
  <meta name="theme-color" content="#712cf9">
</head>

<body>
<div class="container" id="wrap">
<!--헤더파일 시작 -->
  <header>
    <!--로고  시작--->  
    <div id="logo">
      <a href="ShopServlet?command=index" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
       <svg class="bi me-2" width="40" height="32" role="img"> <circle cx="15" cy="15" r="10" stroke="black" stroke-width="3" fill="blue" /></svg>
      </a>  
    </div>
    <!--로고 끝-->     
    <nav id="catagory_menu">
     <ul class="nav col-14 col-md-auto mb-2 justify-content-end mb-md-0">
       <c:choose>
       <c:when test="${empty sessionScope.loginUser}">
       <li>         
         <a href="ShopServlet?command=login_form"  class="nav-link link-dark ">LOGIN</a>
        <!-- <a href="ShopServlet?command=admin_login_form"  class="nav-link link-dark ">| ADMIN)</a>  -->
	   </li>		       
       <li class="nav-link link-dark">/</li>
       <li><a href="ShopServlet?command=join_form" class="nav-link px-2 link-dark">JOIN</a></li>
       </c:when>
       <c:otherwise>
       <li style="color:orange" class="nav-link px-2">
         ${sessionScope.loginUser.name}(${sessionScope.loginUser.id})
       </li>
       <li><a href="ShopServlet?command=logout" class="nav-link px-2 link-dark">LOGOUT</a></li>
       </c:otherwise>       
       </c:choose>
       <li class="nav-link link-dark">/</li>
       <li>
         <a href="ShopServlet?command=cart_list" class="nav-link px-2 link-dark">CART</a>
       </li><li class="nav-link link-dark">/</li>
       <li>
         <a href="ShopServlet?command=mypage" class="nav-link px-2 link-dark">MY PAGE</a>
       </li><li class="nav-link link-dark">/</li>
       <li>
         <a href="ShopServlet?command=qna_list" class="nav-link px-2 link-dark">Q&amp;A(1:1)</a>
       </li>
     </ul>
    </nav>

    <nav id="top_menu">
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li>
          <a href="ShopServlet?command=catagory&kind=1" class="nav-link px-2 link-dark">Kind 1</a>
        </li>&nbsp;&nbsp;&nbsp;
        <li>
          <a href="ShopServlet?command=catagory&kind=2" class="nav-link px-2 link-dark">Kind 2</a>
        </li>&nbsp;&nbsp;&nbsp;
        <li>
          <a href="ShopServlet?command=catagory&kind=3" class="nav-link px-2 link-dark">Kind 3</a>
        </li>&nbsp;&nbsp;&nbsp;
        <li>
          <a href="ShopServlet?command=catagory&kind=4" class="nav-link px-2 link-dark">Kind 4</a>
        </li>&nbsp;&nbsp;&nbsp; 
        <li>
          <a href="ShopServlet?command=catagory&kind=5" class="nav-link px-2 link-dark">Kind 5</a>
        </li>  
      </ul>
    </nav>
    <div class="clear"></div>
    <hr>
  </header>
  </div>
  <!--헤더파일 들어가는 곳 끝 -->