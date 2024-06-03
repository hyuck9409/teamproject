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
 <div class="list-title">어쩌구님의 보드</div>
 <div class="list-buttons">
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

</body>
</html>