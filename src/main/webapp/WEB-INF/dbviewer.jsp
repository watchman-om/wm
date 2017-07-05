<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js" lang="kor">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style>
		.dvtable {
			border: 1px solid black;
			border-spacing: 0px;
		}
		.dvtd {
			border: 1px solid black;
		}
	</style>
	<script src="js/vendor/jquery.min.js"></script>
	<script src="js/ajax.js?ver=6"></script>
	<script src="js/json-to-table.js"></script>
	<script>
		function jsonToTable(title, results) {
			/*var table = "";
			$("#dbviewerframe").append("<table class='dvtable' id='"+title+"'><tr id='dvattr' class='dvtr'>");
			// get the first result set, or you can loop trhrough all, assuming that each reuslt set is the same. 
			if (results.length > 0) {
				var columnsIn = results[0]; 
				for(var key in columnsIn) {
					$("#"+title+" #dvattr").append("<td class='dvtd'>"+key.toUpperCase()+"</td>");
				}
				$("#"+title+" #dvattr").append("</tr>");
				var index = 0;
				for(var item in results) {
					$("#"+title).append("<tr id='dvlist"+(index++)+"'>");
					$("#"+title).append("</tr>");
				}
			}
			$("#"+title).append("</tr></table>");*/
			
			/*$("#dbviewerframe").append("<table></table>");
			var table_obj = $('table');
		    $.each(results, function(index, item){
		         var table_row = $('<tr>', {id: item.id});
		         var table_cell = $('<td>', {html: item.data});
		         table_row.append(table_cell);
		         table_obj.append(table_row);
		    });*/
		    
		    var jsonHtmlTable = ConvertJsonToTable(results, title, null, 'Download');
		    $("#dbviewerframe").append("<h2>"+title+"</h2>"+jsonHtmlTable+"<br />");
		}
	</script>
</head>
<body>
	<div id="dbviewerframe">
	</div>
	<script>
		ajax_get_vehicle(function(json) {
			jsonToTable("vehicle", json);
			ajax_get_all_history(function(json) {
				jsonToTable("history", json);
				ajax_get_history_management(function(json) {
					jsonToTable("history_management", json);
					ajax_get_management(function(json) {
						jsonToTable("management", json);
						ajax_get_employee(function(json) {
							jsonToTable("employee", json);
						});
					});
				});
			});
		});
	</script>
</body>
</html>