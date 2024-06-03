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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
body * {
	font-family: "Noto Sans KR", sans-serif;
}
</style>
</head>
<body>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>내용</th>
			<th>작성날짜</th>
			<th>숨김여부</th>
			<th>숨김 버튼</th>
		</tr>
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>내용</td>
			<td>작성날짜</td>
			<td>숨김여부</td>
			<td>
				<button type="button" id="hideButton" class="btn-signup btn-secondary">숨김</button>
			</td>
		</tr>

	</table>
	<script>
	document.getElementById('hideButton').addEventListener('click', function() {
        let confirmation = confirm("정말 숨기시겠습니까?");
        if (confirmation) {
            
        }
    });
</script>
	
</body>
</html>