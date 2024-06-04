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
<link rel="stylesheet" href="./css/profile.css">
<link rel="stylesheet" href="./css/board.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>

<div class="profile-container">
	<div class="profile-info">
		<div class="profile-header">
			<div class="logo">
			
			</div>
			<div class="logotitle"><h1>내 생일을 축하해줘!</h1></div>
		</div>
		<div class="profile-content">
			<h2 class="profile-title">${userdto.nickname}님의 프로필</h2>
			<div class="profile-detail">
				<div class="profile-item">
					<div class="profile-item-title">이메일</div>
					<div class="profile-item-content">${userdto.email}</div>
				</div>
				<div class="profile-item">
					<div class="profile-item-title">생년월일</div>
					<div class="profile-item-content">${userdto.birthday}</div>
				</div>
				<div class="profile-item">
					<div class="profile-item-title">보드 색상</div>
					<div class="profile-item-content">${userdto.board_color}</div>
				</div>
			</div>
		</div>
	</div>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>내용</th>
				<th>작성날짜</th>
				<th>숨김여부</th>
				<th>숨김 버튼</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list}">
				<tr onclick="location.href=''">
					<td>${dto.memo_id}</td>
					<td>${dto.writer}</td>
					<td>${dto.content}</td>
					<td>${dto.created_at}</td>
					<td></td>
					<td>
					 <button id="hideButton" class="icon-button-full"
					 	onclick="location.href='./login'">
				 		<img alt="" src="./image/icon-eye-off.svg">
				 		<span class="icon-button-text" style="color: black;">글숨기기</span>
				 	</button>
					</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
</div>
<script>
	document.getElementById('hideButton').addEventListener('click', function() {
	       let confirmation = confirm("정말 숨기시겠습니까?");
	       if (confirmation) {
	           
	       }
	   });
</script>
	
</body>
</html>