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
<link rel="stylesheet" href="./css/board.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<c:set var="stpath" value="https://kr.object.ncloudstorage.com/bitcamp-jsh/photocommon"/>
<div class="pos-a">	
	<div class="logo">
		<div class="logoimage">
			<img alt="" src="${root}/image/logo.png" height="100">
		</div>
	 	<div class="logotitle">내 생일을<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;축하해줘!</div>
	</div>	
</div>

<div class="list-header">
 <div class="list-title">${userdto.nickname}의 보드</div>
 <div class="list-buttons">
 <c:if test="${sessionScope.loginok != null}">
	 <button id="btnlogout" class="icon-button-full">
 		<img alt="" src="./image/icon-log-out.svg">
 		<span class="icon-button-text">로그아웃</span>
 	</button>
 </c:if>
 <c:if test="${sessionScope.loginok == null}">
	 <button id="btnlogin" class="icon-button-full"
	 	onclick="location.href='./login'">
 		<img alt="" src="./image/icon-log-in.svg">
 		<span class="icon-button-text">로그인</span>
 	</button>
 </c:if>
 	<button class="icon-button"
 		onclick="location.href='${root}/writephoto?user_id=${userdto.user_id}'">
 		<img alt="" src="./image/icon-image.svg">
 	</button>
 	<button class="icon-button" 
 		onclick="location.href='${root}/writetext?user_id=${userdto.user_id}'">
 		<img alt="" src="./image/icon-pen-square.svg">
 	</button>
 	 <c:if test="${sessionScope.loginok != null}">
	 	<button class="icon-button"
	 		onclick="location.href='${root}/profile?user_id=${userdto.user_id}'">
	 		<img alt="" src="./image/icon-user.svg">
	 	</button>
	 </c:if>
 </div>
</div>
<div class="list-container">
	<c:forEach var="dto" items="${list}">
		<a href="${root}/detail?user_id=${userdto.user_id}&memo_id=${dto.memo_id}">
			<div class="list-item ${dto.type=='photocard'? 'photocard' : ''}" 
			style="background-image: url('${stpath}/${dto.photo}')">
				<div class="list-item-content">${dto.content}</div>
				<div class="list-item-writer">${dto.writer}</div>
			</div>
		</a>
	</c:forEach>
	
</div>
<script type="text/javascript">
	$(function() {
		
		
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
		
	})
</script>
</body>
</html>