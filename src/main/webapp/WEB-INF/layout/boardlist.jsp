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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<div class="list-header">
 <div class="list-title">${dto.nickname}의 보드</div>
 <div class="list-buttons"> 	
 	<button id="btnlogout" class="icon-button-full">
 		<img alt="" src="./image/icon-log-out.svg">
 		<span class="icon-button-text">로그아웃</span>
 	</button>
 	<button class="icon-button">
 		<img alt="" src="./image/icon-image.svg">
 	</button>
 	<button class="icon-button">
 		<img alt="" src="./image/icon-pen-square.svg">
 	</button>
 	<button class="icon-button">
 		<img alt="" src="./image/icon-menu.svg">
 	</button>
 </div>
</div>
<div class="list-container">
	<div class="list-item"></div>
	<div class="list-item"></div>
	<div class="list-item"></div>
	<div class="list-item"></div>
	<div class="list-item"></div>
</div>
<script type="text/javascript">

	// 로그아웃 버튼
	$("#btnlogout").click(function(){
		$.ajax({
			type:"get",
			dataType:"text",
			url:`${root}/logout`,
			success:function(){
				// 전체 페이지 새로고침
				location.href="./login"
			},
		})
	});
</script>
</body>
</html>