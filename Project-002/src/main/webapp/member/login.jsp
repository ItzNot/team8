<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>     
<div class="container py-5 h-100">  
 <div class="justify-content-center align-items-center h-100">  
  <article>
    <h1>Login</h1><br>
    <form method="post" action="ShopServlet?command=login">
        <fieldset>
          <label>User ID</label>
          <input name="id" type="text" value="${id}" value="one"><br><br> 
          <label>Password</label> 
          <input name="pwd" type="password"><br><br>
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
