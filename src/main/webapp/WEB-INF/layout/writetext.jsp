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
<link rel="stylesheet" href="./css/board.css">
<link rel="stylesheet" href="./css/scroll.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<c:set var="now" value="<%=new java.util.Date()%>" />
<div class="container">
	<div class="box">
		<form action="./inserttext" method="post">
			<div class="detail-item">
				<input type="hidden" value="${user_id}"name="user_id">
				<div class="detail-text">
					<textarea rows="" cols="" class="detail-textarea" name="content" required="required"></textarea>
				</div>
				<div class="detail-writer">
					<input type="text" name="writer" class="writer transparent-input" 
					placeholder="Nickname" required="required"
					value="${sessionScope.loginid!=null and sessionScope.loginok =='yes'? sessionScope.nickname : ''}">
				</div>
				<div class="detail-createdat">
					<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" />
				</div>
			</div>
			<div class="detail-buttons">
			 	<button type="summit" class="icon-button-full">
			 		<img alt="" src="./image/icon-pen-square.svg">
			 		<span class="icon-button-text">등록하기</span>
			 	</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>