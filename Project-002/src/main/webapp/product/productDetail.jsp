<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>       
<div class="container py-5 h-100">  
  <div class="row justify-content-center align-items-center h-100">  
  <article>
    <h1> 상품</h1>
    <div id="itemdetail" >
      <form  method="post" name="formm">    
        <fieldset>
          <legend> 상세 정보</legend>  
          <a href="ShopServlet?command=product_detail&pseq=${productVO.pseq}">         
            <span style="float: left;">
              <img  src="product_images/${productVO.image}"  />
            </span>              
            <h2> ${productVO.name} </h2>  
          </a>    
          <label> 가 격 : ${productVO.price2} 원 </label><br>
		  <!-- <p> ${productVO.price2} 원</p>  -->
          <label> 수 량 : </label>
          <input  type="text" name="quantity" size="2" value="1"><br>
          <input  type="hidden" name="pseq" value="${productVO.pseq}"><br>
        </fieldset>
        <div class="clear"></div>
        <div id="buttons">
          <input type="button" value="장바구니에 담기"   class="submit"    onclick="go_cart()"> 
          <input type="button" value="즉시 구매"       class="submit"    onclick="go_order()"> 
          <input type="reset"  value="취소"           class="cancel">
        </div>
      </form>  
    </div>
  </article>
  </div>
  </div>
<%@ include file="../footer.jsp" %>    