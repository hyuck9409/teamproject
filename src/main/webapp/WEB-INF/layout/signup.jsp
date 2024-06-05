<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/login.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript">   
     let idCheck=false;
     let nicknameCheck=false;
     $(function(){
       //중복버튼 이벤트
       $("#btncheckid").click(function(){
    	  if($("#emailid").val()==''){
    		  alert("가입할 아이디를 입력해주세요");
    		  return;
    	  }
    	  
    	  $.ajax({
    		 type:"get",
    		 dataType:"json",
    		 url:"./idcheck",
    		 data:{"searchid":$("#emailid").val()},
    		 success:function(data){
    			 if(data.count==0){
    				 alert("가입 가능한 이메일입니다");
    				 idCheck=true;
    			 }else{
    				 alert("이미 가입되어있는 이메일입니다");
    				 idCheck=false;
    				 $("#emailid").val("");
    			 }
    		 }
    	  });
       });
       
       $("#btnchecknick").click(function(){
     	  if($("#nicknameid").val()==''){
     		  alert("가입할 닉네임을 입력해주세요");
     		  return;
     	  }
     	  
     	  $.ajax({
     		 type:"get",
     		 dataType:"json",
     		 url:"./nickcheck",
     		 data:{"searchnick":$("#nicknameid").val()},
     		 success:function(data){
     			 if(data.count==0){
     				 alert("가입 가능한 닉네임입니다");
     				nicknameCheck=true;
     			 }else{
     				 alert("이미 가입되어있는 닉네임입니다");
     				nicknameCheck=false;
     				 $("#nicknameid").val("");
     			 }
     		 }
     	  });
        });
       
       //아이디를 입력시 다시 중복확인을 누르도록 중복변수를 초기화
       $("#nicknameid").keyup(function(){
    	   nicknameCheck=false;
       });
   });  //close function 
 
   
   function check()
   {
	   if(!idCheck){
		   alert("아이디 중복확인을 해주세요");
		   return false;
	   } else if (!nicknameCheck) {
		   alert("닉네임 중복확인을 해주세요");
		   return false;
	   } else {
		   return true;
	   }
   }
   </script>
</head>
<body>
	<div class="container">
		<div class="box">
			<div class="logo">
				<div class="logoimage">
					<img alt="" src="${root}/image/logo.png" height="100">
				</div>
			 	<div class="logotitle">내 생일을<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;축하해줘!</div>
			</div>
			<form action="./insert" method="post" onsubmit="return check()">
				<div class="login-inputs">
					<div class="login-input">
						<label class="input-label">이메일</label>
						<div class="button-input">
							<input type="text" name="email" id="emailid"
								class="email base-input" placeholder="Email" required="required">
							<div class="buttons">
								<button type="button" class="btn-signup btn-secondary" id="btncheckid">중복확인</button>
							</div>
						</div>
					</div>
					<div class="login-input">
						<label class="input-label">비밀번호</label> <input type="password"
							name="password" class="password base-input" placeholder="Password" required="required">
					</div>
					<div class="login-input">
						<label class="input-label">비밀번호 확인</label> 
						<input type="password" class="passwordcheck base-input" placeholder="Password Check" required="required">
					</div>
					<div class="login-input">
						<label class="input-label">닉네임</label>
						<div class="button-input">
							<input type="text"
								name="nickname" id="nicknameid" class="nickname base-input" placeholder="Nickname" required="required">
							<div class="buttons">
								<button type="button" class="btn-signup btn-secondary" id="btnchecknick">중복확인</button>
							</div>
						</div>
					</div>
					<div class="login-input">
						<label class="input-label">생년월일</label> 
						<input type="date" required="required"
							name="birthday" class="birth base-input">
					</div>			
				</div>
				<div class="buttons">
					<button type="submit" class="btn-login btn-primary">회원가입</button>
				</div>
			</form>
		</div>
	</div>


</body>
</html>