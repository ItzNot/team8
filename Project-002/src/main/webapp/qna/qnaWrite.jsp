<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>	 
<%@ include file="qnaSubNav.jsp" %>   
  <div class="container py-5 h-100">  
  <div class="justify-content-center align-items-center h-100"> 
	<article>
	    <h2> 1:1 고객 게시판 </h2>
	    <h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>    
		<form name="formm" method="post" 
		action="ShopServlet?command=qna_write">
			<fieldset>	
				<legend>문의 작성</legend>		
				<div class="form-group col-md-8" >
				  <label for="formGroupExampleInput">제목</label>
				  <input type="text" class="form-control" name="subject"  size="77">
				</div>
				 <div class="form-group col-md-8">
				   <label for="exampleFormControlTextarea1">내용</label>
				   <textarea class="form-control" name="content" rows="8"></textarea>
				 </div>
			</fieldset><br>   
			
		 <div id="buttons" style="float:bottom">
			<input type="submit"  value="글쓰기"     class="submit"> 
			<input type="reset"   value="삭제"     class="cancel">
			<input type="button"  value="쇼핑 계속하기"  class="submit"  onclick="location.href='ShopServlet?command=index'">	
		  </div>
		</form>
	</article>
	</div>
	</div>
<%@ include file="../footer.jsp" %>