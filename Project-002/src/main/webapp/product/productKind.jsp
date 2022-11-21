<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>     
  <div class="container py-5 h-100">  
  <div class="row justify-content-center align-items-center h-100">   
  <article>
    <h2> Item</h2>     
    <c:forEach items="${productKindList }"  var="productVO">
      <div id="item">
        <a href="ShopServlet?command=product_detail&pseq=${productVO.pseq}"> 
          <img src="product_images/${productVO.image}" />
          <h3 class="nav-link link-dark">${productVO.name} </h3>        
          <p class="nav-link link-dark">${productVO.price2} </p>
        </a>  
      </div>
    </c:forEach>    
    <div class="clear"></div>
  </article>
  </div>
  </div>
<%@ include file="../footer.jsp" %>    