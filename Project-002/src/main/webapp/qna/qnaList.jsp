<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>   
<%@ include file="qnaSubNav.jsp" %>   
  <div class="container py-2 h-100">  
  <div class="row justify-content-center align-items-center h-100"> 
  <article>
    <h2> 1:1 고객 게시판 </h2>
    <h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>
    <form name="formm" method="post">
      <table id="cartList" class="table">
      <tr>
        <th>번호</th> <th>제목</th> <th>등록일</th> <th>답변 여부</th>    
      </tr>
      <c:forEach items="${qnaList}"  var="qnaVO">
      <tr>  
        <td> ${qnaVO.qseq} </td>    
        <td> <a href="ShopServlet?command=qna_view&qseq=${qnaVO.qseq}"> ${qnaVO.subject} </td>      
        <td> <fmt:formatDate value="${qnaVO.indate}" type="date"/></td>
        <td> 
          <c:choose>
            <c:when test="${qnaVO.rep==1}"> no </c:when>
            <c:when test="${qnaVO.rep==2}"> yes </c:when>
          </c:choose>
        </td>    
      </tr>
      </c:forEach>    
      </table>
      <div id="buttons" style="float:right">
      <input type="button"  value="1:1 질문하기"  class="submit"    
onclick="location.href='ShopServlet?command=qna_write_form'"> 
      <input type="button"    value="쇼핑 계속하기"  class="cancel"  
onclick="location.href='ShopServlet?command=index'">  
      </div>
    </form>
  </article>
  </div>
  </div>
<%@ include file="../footer.jsp" %>