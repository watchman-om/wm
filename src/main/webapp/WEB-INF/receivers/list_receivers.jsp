<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--[if IE 9]>         <html class="no-js lt-ie10" lang="kor"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js" lang="kor"> <!--<![endif]-->
<head>
	<meta charset="utf-8">

	<title>온누리 모터스 - 방문차량 관리 시스템</title>

        <meta name="description" content="ProUI is a Responsive Bootstrap Admin Template created by pixelcave and published on Themeforest.">
        <meta name="author" content="pixelcave">
        <meta name="robots" content="noindex, nofollow">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

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
    </head>
    <body>
        <!-- Page Wrapper -->
        <!-- In the PHP version you can set the following options from inc/config file -->
        <!--
            Available classes:

            'page-loading'      enables page preloader
        -->
        <div id="page-wrapper">
            <!-- Preloader -->
            <!-- Preloader functionality (initialized in js/app.js) - pageLoading() -->
            <!-- Used only if page preloader is enabled from inc/config (PHP version) or the class 'page-loading' is added in #page-wrapper element (HTML version) -->
            <div class="preloader themed-background">
                <h1 class="push-top-bottom text-light text-center"><strong>온누리</strong> 모터스</h1>
                <div class="inner">
                    <h3 class="text-light visible-lt-ie9 visible-lt-ie10"><strong>불러오기 중..</strong></h3>
                    <div class="preloader-spinner hidden-lt-ie9 hidden-lt-ie10"></div>
                </div>
            </div>
            <!-- END Preloader -->
            <div id="page-container" class="sidebar-partial sidebar-visible-lg sidebar-no-animations">
                <jsp:include page="../sidebar.jsp"/>

                <!-- Main Container -->
                <div id="main-container">
                    <!-- Header -->
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
						<!-- <form action="page_ready_search_results.html" method="post"
							class="navbar-form-custom">
							<div class="form-group">
								<input type="text" id="top-search" name="top-search"
									class="form-control" placeholder="Search..">
							</div>
						</form> -->
						<!-- END Search Form -->
					</header>
                    <!-- END Header -->

                    <!-- Page content -->
                    <div id="page-content">
                        <!-- Page Header -->
                        <div class="content-header">
                            <div class="header-section">
                                <h1>
                                    <i class="gi gi-group"></i>수신자 관리<br><small>통보를 받을 수신자를 관리하세요.</small>
                                </h1>
                            </div>
                        </div>
                        <ul class="breadcrumb breadcrumb-top">
                            <li>수신자 목록</li>
                        </ul>
                        <!-- END Page Header -->

                        <!-- Example Block -->
                        <div class="block">
                            <!-- Example Title -->
                            <div class="block-title">
                                <div class="block-options pull-right">
                                    <a href="/receivers/addview" class="btn btn-alt btn-sm btn-default" data-toggle="tooltip" title="수신자 추가" ><i class="fa fa-plus"></i></a>
                                </div>
                                <h2>수신자 목록</h2>
                            </div>
                            <table id="general-table"
								class="table table-striped table-vcenter">
								<thead>
									<tr>
										<!-- <th style="width: 80px;" class="text-center"><input
											type="checkbox"></th> -->
										<th>이름</th>
										<!-- <th>푸쉬ID</th> -->
										<th>상태</th>
										<th style="width: 150px;" class="text-center">Actions</th>
									</tr>
								</thead>
								<tbody>
									<!-- <tr>
										<td class="text-center"><input type="checkbox"
											id="checkbox1-1" name="checkbox1-1"></td>
										<td><a href="receivers/detail">이승훈</a></td>
										<td>123asd56767</td>
										<td><a href="javascript:void(0)"
											class="label label-warning">대기중</a></td>
										<td class="text-center">
											<div class="btn-group btn-group-xs">
												<a href="javascript:void(0)" data-toggle="tooltip"
													title="Edit" class="btn btn-default"><i
													class="fa fa-pencil"></i></a> <a href="javascript:void(0)"
													data-toggle="tooltip" title="Delete" class="btn btn-danger"><i
													class="fa fa-times"></i></a>
											</div>
										</td>
									</tr> -->
								</tbody>
								<tfoot>
									<!-- <tr>
										<td colspan="6">
											<div class="btn-group btn-group-sm">
												<a href="javascript:void(0)"
													class="btn btn-primary" data-toggle="tooltip"
													title="Delete Selected"><i class="fa fa-times"></i></a>
											</div>
										</td>
									</tr> -->
									<tr>
										<td id="page_wrapper" colspan="6" style="text-align: center;">
										</td>
									</tr>
								</tfoot>
							</table>
                        </div>
                        <!-- END Example Block -->
                    </div>
                    <!-- END Page Content -->

                    <!-- Footer -->
                    <footer class="clearfix">
                        <div class="pull-right">
                            Crafted with <i class="fa fa-heart text-danger"></i> by <a href="http://goo.gl/vNS3I" target="_blank"> Onuuri</a>
                        </div>
                        <div class="pull-left">
                            <span id="year-copy"></span> &copy; <a href="http://www.onnurimotors.com/" target="_blank"> 온누리 모터스</a>
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
        <script src="js/ajax.js?ver=13"></script>
	
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
			});
			function start_sse() {
				if(typeof(EventSource) !== "undefined") {
					var param = "?flimit="+((page-1)*size_page)+"&nlimit="+size_page;
				    source = new EventSource("/sse/employee"+param);
				    source.onmessage = function(event) {
				    	var msg = JSON.parse(event.data);
				    	make_rows(msg);
				    };
				    source2 = new EventSource("/sse/employee/count");
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
				var label_is_receiving_kakao;
				var state_is_receiving_kakao;
				var tbody = $("#general-table tbody");
				tbody.empty();
				if(list.keys(list).length == 0) {
					format =	"<tr>"
							+		"<td colspan='6'>등록된 수신자가 없습니다.</td>"
							+	"</tr>";
					tbody.append(format);
				}
				else {
					for(var idx = 0, item; item = list[idx]; idx++) {
						if(item.is_RECEIVING_KAKAO == "1") {
							label_is_receiving_kakao = "수신";
							state_is_receiving_kakao = "success";
						} else {
							label_is_receiving_kakao = "수신거부";
							state_is_receiving_kakao = "danger";
						}
						format =	"<tr class='unit' id='"+item.employee_ID+"'>"
								/*+		"<td class='text-center'>"
								+			"<input type='checkbox' id='cb1"+item.employee_ID+"' name='checkbox1'>"
								+		"</td>"*/
								+		"<td><a href='receivers/"+item.employee_ID+"'>"+item.name+"</a></td>"
								//+		"<td>"+item.kakao_ACCOUNT+"</td>"
								+		"<td>"
								+			"<a href='javascript:toggle_receiving_kakao("+item.employee_ID+")' class='label label-"+state_is_receiving_kakao+"' id='label_is_receiving_kakao"+item.employee_ID+"'>"+label_is_receiving_kakao+"</a>"
								+			"<input type='hidden' id='input_is_receiving_kakao"+item.employee_ID+"' value='"+item.is_RECEIVING_KAKAO+"'>"
								+		"</td>"
								+		"<td class='text-center'>"
								+			"<div class='btn-group btn-group-xs'>"
								+				"<a href='/receivers/"+item.employee_ID+"/editview' data-toggle='tooltip' title='수정' class='btn btn-default'>"
								+					"<i class='fa fa-pencil'></i>"
								+				"</a>"
								+				"<a href='javascript:delete_prompt("+item.employee_ID+")' data-toggle='tooltip' title='삭제' class='btn btn-danger'>"
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
			function toggle_receiving_kakao(employee_id) {
				var state_now = $("#input_is_receiving_kakao"+employee_id).val();
				if(state_now == 1) {
					state_now = "on";
				} else {
					state_now = "off";
				}
				ajax_toggle_receiving_kakao(employee_id, state_now, function(json) {
					var jsonObj = JSON.parse(JSON.stringify(json));
					if(jsonObj.is_RECEIVING_KAKAO == "1") {
						$("#label_is_receiving_kakao"+employee_id).attr("class", "label label-success");
						$("#label_is_receiving_kakao"+employee_id).html("수신");
						$("#input_is_receiving_kakao"+employee_id).val(1);
					} else {
						$("#label_is_receiving_kakao"+employee_id).attr("class", "label label-danger");
						$("#label_is_receiving_kakao"+employee_id).html("수신거부");
						$("#input_is_receiving_kakao"+employee_id).val(0);
					}
				});
			}
			function delete_prompt(employee_id) {
				var test = confirm("정말로 삭제하시겠습니까?");
				if(test == true) {
					location.href = "/receivers/"+employee_id+"/delete";
				}
			}
		</script>
    </body>
</html>