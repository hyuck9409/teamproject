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
<body>
<c:set var="now" value="<%=new java.util.Date()%>" />

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
		<form action="./insertphoto" method="post" enctype="multipart/form-data">
			<div class="detail-item photocard">
				<div class="photocard-background"></div>
				<div class="photocard-form">
					<input type="hidden" value="${user_id}" name="user_id">
					<div class="detail-text">
						<textarea rows="" cols="" class="detail-textarea scrollbar" name="content" required="required"></textarea>
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
			</div>
			<div class="detail-buttons">
			 	<button type="button" class="icon-button-full">
			 		<img alt="" src="./image/icon-image.svg">
			 		<label class="icon-button-text" for="myfile">사진 추가</label>
					<input type="file" name="upload" id="myfile" class="form-control"
						required="required" style="display:none">
			 	</button>
			 	<button type="submit" class="icon-button-full">
			 		<img alt="" src="./image/icon-pen-square.svg">
			 		<span class="icon-button-text">등록하기</span>
			 	</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$(function(){
    $("#myfile").change(function(){
        
        let reg=/(.*?)\/(jpg|jpeg|png|gif)$/;
        let f=$(this)[0].files[0];
        if(!f.type.match(reg)){
            alert("이미지 파일만 가능합니다");
            return;
        }
        if(f){
            let reader=new FileReader();
            reader.onload=function(e){
                $(".photocard").css("background-image","url("+e.target.result+")");
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }
    });
});
</script>
</body>
</html>