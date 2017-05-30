<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="kor">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="js/vendor/jquery.min.js"></script>
	<script src="js/ajax.js?ver=10"></script>
	<script src="js/refinestring.js?ver=2"></script>
	<script>
		function submit() {
			<c:choose>
				<c:when test="${is_new eq 1}">
					ajax_insert_vehicle($("#license").val(), $("#is_notifiable").val(), function(json) {
						var jsonObj = JSON.parse(JSON.stringify(json));
						if(jsonObj.is_NOTIFIABLE == "-1") {
							alert("이미 존재하는 차량번호 입니다.");
						} else {
							alert("성공적으로 추가하였습니다.");
							location.href = "/list_vehicle";
						}
					});
				</c:when>
				<c:otherwise>
					ajax_update_vehicle("${param.vehicle_id}", $("#license").val(), $("#is_notifiable").val(), $("#model").val(), $("#user_name").val(), $("#birth").val(), $("#phone_number").val(), refineContent($("#comment").val()), function(json) {
						var jsonObj = JSON.parse(JSON.stringify(json));
					});
				</c:otherwise>
			</c:choose>
		}
	</script>
</head>
<body>
	<div>
		차량번호: <input type="text" id="license" value="${vehicles[0].LICENSE}"/>
		<br />
		알림여부: 
		<select id="is_notifiable" name="is_notifiable">
		    <option value="1">on</option>
		    <option value="0">off</option>
		</select>
		<br />
		<c:if test="${is_new ne 1}">
			차량 모델: <input type="text" id="model" value="${vehicles[0].MODEL}" /><br />
			고객명: <input type="text" id="user_name" value="${vehicles[0].USER_NAME}" /><br />
			생년월일: <input type="text" id="birth" value="${vehicles[0].BIRTH}" /><br />
			연락처: <input type="text" id="phone_number" value="${vehicles[0].PHONE_NUMBER}" /><br />
			메모: <textarea id="comment"></textarea><br />
		</c:if>
		<a href="javascript:submit()">저장</a>
		<a href="javascript:history.back()">취소</a>
	</div>
	<script>
		$(function() {
			$("#is_notifiable").val(${vehicles[0].IS_NOTIFIABLE});
			$("#comment").val(refineContentRev("${vehicles[0].COMMENT}"));
		});
	</script>
</body>
</html>