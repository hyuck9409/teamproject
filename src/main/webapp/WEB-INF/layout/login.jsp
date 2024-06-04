<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/login.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<body>
<div class="container">
 <div class="box">
 	<form id="loginfrm" action="./checklogin" method="post">
	 	<div class="login-inputs">
	 		<div class="login-input">
	 			<label class="input-label">이메일</label>
				<input type="text" name="email" class="email base-input" placeholder="Email">
	 		</div>
			<div class="login-input">
				<label class="input-label">비밀번호</label>
				<input type="password" name="password" class="password base-input" placeholder="Password">
	 		</div>
	 	</div>
		<div class="buttons">
			<button type="submit" class="btn-login btn-primary">로그인</button>
			<button type="button" class="btn-signup btn-secondary" 
			onclick="location.href='${root}/signup'">회원가입</button>
		</div>
 	</form>
 </div>
</div>

<script type="text/javascript">
$(function(){
   	$("#loginfrm").submit(function(e){
   		e.preventDefault();
   		let fdata = $(this).serialize();
   		
   		$.ajax({
   			type:"post",
   			dataType:"json",
   			url:`${root}/checklogin`,
   			data:fdata,
   			success:function(data){
   				if(data.status == "success"){
   					location.href=`${root}/list?user_id=\${data.user_id}`
   				} else {
   					alert("아이디 또는 비밀번호가 맞지 않습니다")
   				}
   			}
   		})
   	});
   	
}); // close function

</script>


</body>
</html>