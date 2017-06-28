<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--[if IE 9]>         <html class="no-js lt-ie10" lang="kor"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js" lang="kor"> <!--<![endif]-->
<head>
<meta charset="utf-8">

<title>온누리 모터스 - 방문차량 목록</title>

<meta name="description"
	content="ProUI is a Responsive Bootstrap Admin Template created by pixelcave and published on Themeforest.">
<meta name="author" content="pixelcave">
<meta name="robots" content="noindex, nofollow">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Icons -->
<!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
<link rel="shortcut icon" href="img/favicon.png">
<link rel="apple-touch-icon" href="img/icon57.png" sizes="57x57">
<link rel="apple-touch-icon" href="img/icon72.png" sizes="72x72">
<link rel="apple-touch-icon" href="img/icon76.png" sizes="76x76">
<link rel="apple-touch-icon" href="img/icon114.png" sizes="114x114">
<link rel="apple-touch-icon" href="img/icon120.png" sizes="120x120">
<link rel="apple-touch-icon" href="img/icon144.png" sizes="144x144">
<link rel="apple-touch-icon" href="img/icon152.png" sizes="152x152">
<link rel="apple-touch-icon" href="img/icon180.png" sizes="180x180">
<!-- END Icons -->

<!-- Stylesheets -->
<!-- Bootstrap is included in its original form, unaltered -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Related styles of various icon packs and plugins -->
<link rel="stylesheet" href="css/plugins.css">

<!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
<link rel="stylesheet" href="css/main.css">

<!-- Include a specific file here from css/themes/ folder to alter the default theme of the template -->

<!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
<link rel="stylesheet" href="css/themes.css">
<!-- END Stylesheets -->

<!-- Modernizr (browser feature detection library) -->
<script src="js/vendor/modernizr.min.js"></script>
<script src="js/ajax.js?ver=7"></script>
<script>
	function delete_vehicle(vehicle_id) {
		ajax_delete_vehicle(vehicle_id, function(json) {
			alert("삭제하였습니다");
		});
	}
</script>
</head>
<body>
	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Preloader -->
		<!-- Preloader functionality (initialized in js/app.js) - pageLoading() -->
		<!-- Used only if page preloader is enabled from inc/config (PHP version) or the class 'page-loading' is added in #page-wrapper element (HTML version) -->
		<div class="preloader themed-background">
			<h1 class="push-top-bottom text-light text-center">
				<strong>Pro</strong>UI
			</h1>
			<div class="inner">
				<h3 class="text-light visible-lt-ie10">
					<strong>Loading..</strong>
				</h3>
				<div class="preloader-spinner hidden-lt-ie10"></div>
			</div>
		</div>
		<!-- END Preloader -->

		<!-- Page Container -->
		<div id="page-container"
			class="sidebar-partial sidebar-visible-lg sidebar-no-animations">
			<jsp:include page="sidebar.jsp"/>

			<!-- Main Container -->
			<div id="main-container">
				<header class="navbar navbar-default">
					<!-- Left Header Navigation -->
					<ul class="nav navbar-nav-custom">
						<!-- Main Sidebar Toggle Button -->
						<li><a href="javascript:void(0)"
							onclick="App.sidebar('toggle-sidebar');this.blur();"> <i
								class="fa fa-bars fa-fw"></i>
						</a></li>
						<!-- END Main Sidebar Toggle Button -->
					</ul>
					<!-- END Left Header Navigation -->

					<!-- Search Form -->
					<form action="list_vehicle" method="post"
						class="navbar-form-custom">
						<div class="form-group">
							<input type="text" id="top-search" name="license"
								class="form-control" placeholder="Search..">
						</div>
					</form>
					<!-- END Search Form -->
				</header>
				<!-- END Header -->

				<!-- Page content -->
				<div id="page-content">
					<!-- Table Styles Header -->
					<div class="content-header">
						<div class="header-section">
							<h1>
								<i class="gi gi-cars"></i>차량목록<br> 
								<small>방문한 차량들의 목록을 확인할 수 있습니다.</small>
							</h1>
						</div>
					</div>
					<ul class="breadcrumb breadcrumb-top">
						<li>차량목록</li>
						<li><a href="">General</a></li>
					</ul>
					<!-- END Table Styles Header -->

					<!-- Table Styles Block -->
					<div class="block">
						<!-- Table Styles Title -->
						<div class="block-title">
							<h2>
								<strong>차량</strong> 목록
							</h2>
						</div>
						<!-- END Table Styles Title -->

						<!-- Table Styles Content -->
						<!-- Changing classes functionality initialized in js/pages/tablesGeneral.js -->
						<div class="table-options clearfix">
							<div class="btn-group btn-group-sm pull-right">
								<a href="/vehicle/addview" class="btn btn-primary"
									id="style-hover" data-toggle="tooltip" title=".table-hover">차량 추가</a>
							</div>
							<!-- <div class="btn-group btn-group-sm pull-left">
								<a href="/vehicle/delete" class="btn btn-primary"
									id="style-hover" data-toggle="tooltip" title=".table-hover">차량 삭제</a>
							</div> -->
						</div>
						<div class="table-responsive">
							<table id="general-table" class="table table-striped table-vcenter">
								<thead>
									<tr>
										<!-- <th style="width: 80px;" class="text-center"><input
											type="checkbox"></th> -->
										<th>차량번호</th>
										<th>차종</th>
										<th>소유주</th>
										<th>상태</th>
										<th style="width: 150px;" class="text-center">Actions</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
								<tfoot>
									<!-- <tr>
										<td colspan="7">
											<div class="btn-group btn-group-sm pull-right">
												<a href="javascript:void(0)" class="btn btn-primary"
													data-toggle="tooltip" title="Settings"><i
													class="fa fa-cog"></i></a>
												<div class="btn-group btn-group-sm dropup">
													<a href="javascript:void(0)"
														class="btn btn-primary pull-right dropdown-toggle"
														data-toggle="dropdown"><span class="caret"></span></a>
													<ul
														class="dropdown-menu dropdown-custom dropdown-menu-right">
														<li><a href="javascript:void(0)"><i
																class="fa fa-print pull-right"></i> Print</a></li>
														<li class="dropdown-header"><i
															class="fa fa-share pull-right"></i> Export As</li>
														<li><a href="javascript:void(0)">.pdf</a> <a
															href="javascript:void(0)">.cvs</a></li>
													</ul>
												</div>
											</div>
											<div class="btn-group btn-group-sm">
												<a href="javascript:void(0)" class="btn btn-primary"
													data-toggle="tooltip" title="Edit Selected"><i
													class="fa fa-pencil"></i></a> <a href="javascript:void(0)"
													class="btn btn-primary" data-toggle="tooltip"
													title="Delete Selected"><i class="fa fa-times"></i></a>
											</div>
										</td>
									</tr> -->
									<tr>
										<td id="page_wrapper" colspan="7" style="text-align: center;">
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- END Table Styles Content -->
					</div>
					<!-- END Table Styles Block -->
				</div>
				<!-- END Page Content -->

				<!-- Footer -->
				<footer class="clearfix">
					<div class="pull-right">
						Crafted with <i class="fa fa-heart text-danger"></i> by <a
							href="http://goo.gl/vNS3I" target="_blank">pixelcave</a>
					</div>
					<div class="pull-left">
						<span id="year-copy"></span> &copy; <a href="http://goo.gl/TDOSuC"
							target="_blank">ProUI 3.7</a>
					</div>
				</footer>
				<!-- END Footer -->
			</div>
			<!-- END Main Container -->
		</div>
		<!-- END Page Container -->
	</div>
	<!-- END Page Wrapper -->

	<!-- Scroll to top link, initialized in js/app.js - scrollToTop() -->
	<a href="#" id="to-top"><i class="fa fa-angle-double-up"></i></a>

	<!-- jQuery, Bootstrap.js, jQuery plugins and Custom JS code -->
	<script src="js/vendor/jquery.min.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/app.js"></script>
	<script src="js/ajax.js?ver=11"></script>

	<!-- Load and execute javascript code used only in this page -->
	<script src="js/pages/tablesGeneral.js"></script>
	<script>$(function(){ TablesGeneral.init(); });</script>
	<script>
		var page, size_page;
		var source, source2;
		$(function() {
			page = 1;
			size_page = 10;
			start_sse();
			$("header").css("display", "table");
			$("header").css("width", "100%");
			$("header form").css("display", "table-cell");
			$("header form").css("width", "100%");
			$("header form").css("float", "none");
			$("header div").css("margin-bottom", "0px");
		});
		function start_sse() {
			if(typeof(EventSource) !== "undefined") {
				var param = "?flimit="+((page-1)*size_page)+"&nlimit="+size_page+"&license=";
				if("${license}" != "") {
					param = param + "${license}";
				}
			    source = new EventSource("/sse/vehicle"+param);
			    source.onmessage = function(event) {
			    	var msg = JSON.parse(event.data);
			    	make_rows(msg);
			    };
			    source2 = new EventSource("/sse/vehicle/count");
			    source2.onmessage = function(event) {
			    	make_pages(event.data);
			    };
			}
		}
		function stop_sse() {
			source.close();
			source2.close();
		}
		function set_page(to_page) {
			stop_sse();
			page = to_page;
			start_sse();
		}
		function make_rows(list) {
			if($("#general-table input[name='checkbox1']:checked").length > 0) {
				return;
			}
			var format;
			var label_is_notifiable;
			var state_is_notifiable;
			var tbody = $("#general-table tbody");
			tbody.empty();
			if(list.keys(list).length == 0) {
				format =	"<tr>"
						+		"<td colspan='7'>등록된 차량이 없습니다.</td>"
						+	"</tr>";
				tbody.append(format);
			}
			else {
				for(var idx = 0, item; item = list[idx]; idx++) {
					if(item.is_NOTIFIABLE == "1") {
						label_is_notifiable = "알림";
						state_is_notifiable = "success";
					} else {
						label_is_notifiable = "알림해제";
						state_is_notifiable = "danger";
					}
					format =	"<tr class='unit' id='"+item.vehicle_ID+"'>"
							/*+		"<td class='text-center'>"
							+			"<input type='checkbox' id='cb1"+item.vehicle_ID+"' name='checkbox1'>"
							+		"</td>"*/
							+		"<td><a href='list_management?vehicle_id="+item.vehicle_ID+"'>"+item.license+"</a></td>"
							+		"<td>"+item.model+"</td>"
							+		"<td>"+item.user_NAME+"</td>"
							+		"<td>"
							+			"<a href='javascript:toggle_notifiable("+item.vehicle_ID+")' class='label label-"+state_is_notifiable+"' id='label_is_notifiable"+item.vehicle_ID+"'>"+label_is_notifiable+"</a>"
							+			"<input type='hidden' id='input_is_notifiable"+item.vehicle_ID+"' value='"+item.is_NOTIFIABLE+"'>"
							+		"</td>"
							+		"<td class='text-center'>"
							+			"<div class='btn-group btn-group-xs'>"
							+				"<a href='/vehicle/"+item.vehicle_ID+"/editview' data-toggle='tooltip' title='수정' class='btn btn-default'>"
							+					"<i class='fa fa-pencil'></i>"
							+				"</a>"
							+				"<a href='javascript:delete_prompt("+item.vehicle_ID+")' data-toggle='tooltip' title='삭제' class='btn btn-danger'>"
							+					"<i class='fa fa-times'></i>"
							+				"</a>"
							+			"</div>"
							+		"</td>"
							+	"</tr>";
					tbody.append(format);
				}
			}
		}
		function make_pages(data) {
			if($("#general-table input[name='checkbox1']:checked").length > 0) {
				return;
			}
			var first = page - 5;
			var last = page + 5;
			var format;
			var page_wrapper = $("#page_wrapper");
			
			page_wrapper.empty();
			
			if(first < 1) {
				first = 1;
			}
			if(last > (data-1)/size_page + 1) {
				last = (data-1)/size_page + 1;
			}
			
			if(first > 1) {
				format = "<a href='javascript:set_page(1)' style='margin: 10px;'>&lt;&lt;</a>";
				page_wrapper.append(format);
			}
			for(var idx = first; idx <= last; idx++) {
				if(idx != page) {
					format = "<a href='javascript:set_page("+idx+")' style='margin: 10px;'>"+idx+"</a>";
				} else {
					format = "<span style='margin: 10px;'>"+idx+"</span>";
				}
				page_wrapper.append(format);
			}
			if(last < (data-1)/size_page+1) {
				format = "<a href='javascript:set_page("+((data-1)/size_page+1)+")' style='margin: 10px;'>&gt;&gt;</a>";
				page_wrapper.append(format);
			}
		}
		function toggle_notifiable(vehicle_id) {
			var state_now = $("#input_is_notifiable"+vehicle_id).val();
			if(state_now == 1) {
				state_now = "on";
			} else {
				state_now = "off";
			}
			ajax_toggle_notifiable(vehicle_id, state_now, function(json) {
				var jsonObj = JSON.parse(JSON.stringify(json));
				if(jsonObj.is_NOTIFIABLE == "1") {
					$("#label_is_notifiable"+vehicle_id).attr("class", "label label-success");
					$("#label_is_notifiable"+vehicle_id).html("알림");
					$("#input_is_notifiable"+vehicle_id).val(1);
				} else {
					$("#label_is_notifiable"+vehicle_id).attr("class", "label label-danger");
					$("#label_is_notifiable"+vehicle_id).html("알림해제");
					$("#input_is_notifiable"+vehicle_id).val(0);
				}
			});
		}
		function delete_prompt(vehicle_id) {
			var test = confirm("정말로 삭제하시겠습니까?");
			if(test == true) {
				location.href = "/vehicle/"+vehicle_id+"/delete";
			}
		}
	</script>
</body>
</html>