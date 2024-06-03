<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<div class="container">
		<div class="box">
			<form action="./insert" method="post">
				<div class="login-inputs">
					<div class="login-input">
						<label class="input-label">이메일</label> <input type="text"
							name="email" class="email base-input" placeholder="Email">
					</div>
					<div class="buttons">
						<button type="button" class="btn-signup btn-secondary">중복확인</button>
					</div>
					<div class="login-input">
						<label class="input-label">비밀번호</label> <input type="password"
							name="password" class="password base-input" placeholder="Password">
					</div>
					<div class="login-input">
						<label class="input-label">비밀번호 확인</label> 
						<input type="password" class="passwordcheck base-input" placeholder="Password Check">
					</div>
					<div class="login-input">
						<label class="input-label">닉네임</label> <input type="text"
							name="nickname" class="nickname base-input" placeholder="Nickname">
					</div>
					<div class="login-input">
						<label class="input-label">생년월일</label> <input type="date"
							name="birthday" class="birth base-input" placeholder="Nickname">
					</div>
					<div class="buttons">
						<button type="button" class="btn-signup btn-secondary">중복확인</button>
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