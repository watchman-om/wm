<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="kor">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="js/vendor/jquery.min.js"></script>
	<script>
		function submit() {
			if($("#is_new") == "1") {
				form.management_form.action = "";
			}
		}
	</script>
</head>
<body>
	<div>
		<form name="management_form" action="" method="POST">
			점검날짜: <input type="text" id="date_mng" />
			<br />
			점검내용: <input type="text" id="comment" />
			<br />
			<a href="javascript:submit()">저장</a>
			<a href="javascript:history.back()">취소</a>
			<input type="hidden" id="is_new" value="${param.is_new}" />
			<input type="hidden" id="vehicle_id" value="${param.vehicle_id}" />
		</form>
	</div>
</body>
</html>