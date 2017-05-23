<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="kor">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="js/vendor/jquery.min.js"></script>
	<script src="js/ajax.js?ver=5"></script>
	<script src="js/refinestring.js"></script>
	<script>
		function submit() {
			ajax_submit_management("${param.is_new}", "${param.vehicle_id}", "${param.management_id}", $("#date_mng").val(), refineContent($("#comment").val()), function(json) {
				var jsonObj = JSON.parse(JSON.stringify(json));
				history.back();
			});
		}
	</script>
</head>
<body>
	<div>
		점검날짜: <input type="text" id="date_mng" value="${managements[0].DATE_MNG}"/>
		<br />
		점검내용: <textarea id="comment"></textarea>
		<br />
		<a href="javascript:submit()">저장</a>
		<a href="javascript:history.back()">취소</a>
	</div>
	<script>
		$(function() {
			$("#comment").val(refineContentRev("${managements[0].COMMENT}"));
		});
	</script>
</body>
</html>