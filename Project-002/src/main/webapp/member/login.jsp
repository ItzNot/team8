<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>     
<div class="container py-5 h-100">  
 <div class="justify-content-center align-items-center h-100">  
  <article>
    <h1>Login</h1><br>
    <form method="post" action="ShopServlet?command=login">
        <fieldset>
        <div class="form-group col-md-4" >
			<label for="formGroupExampleInput">ID</label>
			<input type="text" class="form-control" name="id">
		</div>
		<div class="form-group col-md-4" >
			<label for="formGroupExampleInput">PW</label>
			<input type="password" class="form-control" name="pwd">
		</div><br>
        </fieldset>
        <div class="clear"></div>
        <div id="buttons">
            <input type="submit" value="로그인">
            <input type="button" value="회원가입" 
                 onclick="location='ShopServlet?command=join_form'">
            <input type="button" value="아이디 비밀번호 찾기" 
                 onclick="location='ShopServlet?command=find_id_form'">     
        </div>
    </form>  
  </article>
 </div>
</div>
<%@ include file="../footer.jsp" %>      
