<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %> 
<script src="member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

  <div class="container py-5 h-100">  
  <div class="row justify-content-center align-items-center h-100">  
  
  
  <article>
     <h2 class="pb-2 pb-md-0">회원가입</h2>
    <form id="join" action="ShopServlet?command=join" method="post" name="formm">
      <fieldset>
        <legend>기본 정보</legend>
        <label for="form-label">ID</label>
        <input type="text" name="id" >
        <input type="hidden" name="reid">
        <input type="button" value="중복 체크" onclick="idcheck()"><br><br>
        
        <label>비밀번호</label> 
        <input type="password"  name="pwd"><br><br> 
        
        <label>비밀번호 확인</label> 
        <input type="password"  name="pwdCheck"><br><br> 
        
        <label>성함</label>
        <input type="text" name="name"><br><br> 
        
        <label>이메일</label>
        <input type="text" name="email"><br><br>
        
        <label>휴대전화</label> 
        <input  type="text" name="phone"><br>
        
        
      </fieldset>
      <fieldset>
      <legend>추가 정보</legend>
      <label>주소</label>
       <div class="w-50">
         <div class="input-group mb-3 ">
  			<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" aria-label="Recipient's username" aria-describedby="button-addon2" name="zipNum">
  			<button class="btn btn-outline-secondary" onclick="sample4_execDaumPostcode()" type="button" id="button-addon1">우편번호 찾기</button><br>
			</div>
				<input type="text" id="sample4_roadAddress" class="form-control" placeholder="도로명주소" size="60" name="addr1">
				<input type="hidden" id="sample4_jibunAddress" class="form-control" placeholder="지번주소"  size="60"><br>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress"  class="form-control" placeholder="상세주소"  size="60" name="addr2"><br>
				<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
				<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
			</div>
      </fieldset>
      <div class="clear"></div>
      <div id="buttons">
        <input type="button"    value="회원가입"   class="submit" onclick="go_save()"> 
        <input type="reset"      value="취소"     class="cancel">
      </div>
    </form>
  </article>
  </div>
  </div>
<%@ include file="../footer.jsp" %>
  