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
<link rel="stylesheet" href="./css/scroll.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<c:set var="stpath" value="https://kr.object.ncloudstorage.com/bitcamp-jsh/photocommon"/>
<body>

<div class="pos-a">	
	<div class="logo">
		<div class="logoimage">
			<img alt="" src="${root}/image/logo.png" height="100">
		</div>
	 	<div class="logotitle">내 생일을<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;축하해줘!</div>
	</div>	
</div>

<div class="container">
	<div class="box">
		<div class="detail-item"
			style="background-image: url('${stpath}/${dto.photo}')">
			<div class="photocard-background"></div>
			<div class="photocard-form scrollbar">
				<div class="detail-text overflow">${dto.content}</div>
				<div class="detail-writer">${dto.writer}</div>
				<div class="detail-createdat">
					<fmt:formatDate value="${dto.created_at}" pattern="yyyy.MM.dd"/>
				</div>
			</div>
		</div>
		<div class="detail-page">
		 	<button class="page-button">
		 		<img alt="" src="./image/icon-left.svg">
		 	</button>
		 	<div class="page-info">1 / 20</div>
		 	<button class="page-button page-button-right">
		 		<img alt="" src="./image/icon-left.svg">
		 	</button>
		</div>
		<div class="detail-buttons">
		 	<button class="icon-button"
		 		onclick="location.href='${root}/writephoto?user_id=${user_id}'">
		 		<img alt="" src="./image/icon-image.svg">
		 	</button>
		 	<button class="icon-button"
		 		onclick="location.href='${root}/list?user_id=${user_id}'">
		 		<img alt="" src="./image/icon-layout-dashboard.svg">
		 	</button>
		 	<button class="icon-button" 
		 		onclick="location.href='${root}/writetext?user_id=${user_id}'">
		 		<img alt="" src="./image/icon-pen-square.svg">
		 	</button>
		 	 <c:if test="${sessionScope.loginok != null}">
			 	<button class="icon-button btn-hide" num="${dto.memo_id}" ishidden="${dto.is_hidden}">
		 		 	<c:if test="${dto.is_hidden == 0}">
				 		<img alt="" src="./image/icon-eye-off.svg">
		 	 		</c:if>
		 		 	<c:if test="${dto.is_hidden == 1}">
				 		<img alt="" src="./image/icon-eye.svg">
		 	 		</c:if>
			 	</button>
			 </c:if>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		$(".btn-hide").click(function(){
			let confirmation = confirm("정말 숨기시겠습니까?");
			if (confirmation) {
			    let num = $(this).attr("num"); 
			    let isHidden = $(this).attr("ishidden"); 
			    
			    $.ajax({
			    	type: "get",
			    	dataType: "text",
			    	url:"./hide?memo_id="+num+"&is_hidden="+isHidden,
			    	success:function(data){
			    		location.reload();
			    	}
			    })
			}	
		});
	});
</script>
</body>
</html>