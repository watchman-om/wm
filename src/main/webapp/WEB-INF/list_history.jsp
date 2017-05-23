<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		table td {
			border-spacing: 0px;
			border: 1px solid black;
		}
	</style>
</head>
<body>
	<div>
		<table>
			<c:forEach items="${historys}" var="list">
				<tr>
					<td>${list.DATE_VISIT} ${list.TIME_VISIT}</td>
					<td><a href="list_management?vehicle_id=${list.VEHICLE_ID}">${list.LICENSE}</a></td>
				</tr>
				<tr>
					<td>메모</td>
					<td>${list.COMMENT}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>