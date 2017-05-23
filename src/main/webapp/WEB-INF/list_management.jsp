<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js" lang="kor">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style>
		table {
			border-spacing: 0px;
			border: 1px solid black;
		}
		table tr{
			height: 30px;
		}
		table td {
			border-spacing: 0px;
			border: 1px solid black;
			min-width: 100px;
		}
	</style>
	<script src="js/vendor/jquery.min.js"></script>
	<script src="js/ajax.js"></script>
	<script>
		function edit_model() {
			if($("#btn_edit_model").html() == "수정") {
				$("#btn_edit_model").html("적용");
				$("#model").css("display", "none");
				$("#input_model").css("display", "");
				$("#input_model").val($("#model").html());
			} else {
				ajax_update_vehicle_model("${param.vehicle_id}", $("#input_model").val(), function(json) {
					var jsonObj = JSON.parse(JSON.stringify(json));
					$("#btn_edit_model").html("수정");
					$("#model").css("display", "");
					$("#input_model").css("display", "none");
					$("#model").html(jsonObj.model);
				});
			}
		}
		function toggle_notifiable() {
			ajax_toggle_notifiable("${param.vehicle_id}", $("#is_notifiable").html(), function(json) {
				var jsonObj = JSON.parse(JSON.stringify(json));
				if(jsonObj.is_NOTIFIABLE == "1") {
					$("#is_notifiable").html("on");
				} else {
					$("#is_notifiable").html("off");
				}
			});
		}
	</script>
</head>
<body>
	<div>
		<table>
			<tr>
				<td>차량번호</td>
				<td>${vehicles[0].LICENSE}</td>
				<td>모델</td>
				<td>
					<span id="model">${vehicles[0].MODEL}</span>
					<input id="input_model" type="text" style="display:none" />
					<a href="javascript:edit_model()"><span id="btn_edit_model">수정</span></a>
				</td>
				<td>알림 on/off</td>
				<td>
					<a href="javascript:toggle_notifiable()"><span id="is_notifiable"><c:choose><c:when test="${vehicles[0].IS_NOTIFIABLE eq 0}">off</c:when><c:otherwise>on</c:otherwise></c:choose></span></a>
				</td>
			</tr>
			<tr>
				<td>고객명</td>
				<td>${vehicles[0].USER_NAME}</td>
				<td>연락처</td>
				<td>${vehicles[0].PHONE_NUMBER}</td>
				<td>생년월일</td>
				<td>${vehicles[0].BIRTH}</td>
			</tr>
			<tr>
				<td colspan="6">${vehicles[0].COMMENT}</td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td colspan="4"><a href="form_management?is_new=1&vehicle_id=${param.vehicle_id}">점검 추가</a></td>
			</tr>
			<c:forEach items="${managements}" var="list">
				<tr onclick="location.href='form_management?is_new=0&mangement_id=${list.MANAGEMENT_ID}'">
					<td>${list.DATE_MNG}</td>
					<td>${param.vehicle_id}</td>
					<td>메모</td>
					<td>${list.COMMENT}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>