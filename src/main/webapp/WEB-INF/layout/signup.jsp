<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<div class="container">
 <div class="box">
 	<form>
	 	<div class="login-inputs">
	 		<div class="login-input">
	 			<label class="input-label">이메일</label>
				<input type="text" name="email" class="email base-input" placeholder="Email">
	 		</div>

	 	</div>
		<div class="buttons">
			<button type="button" class="btn-signup btn-secondary">회원가입</button>
		</div>
 	</form>
 </div>
</div>


</body>
</html>