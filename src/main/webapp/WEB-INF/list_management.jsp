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
		<script src="js/ajax.js?ver=13"></script>
		<script src="js/refinestring.js?ver=2"></script>
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
			function edit_user_name() {
				if($("#btn_edit_user_name").html() == "수정") {
					$("#btn_edit_user_name").html("적용");
					$("#user_name").css("display", "none");
					$("#input_user_name").css("display", "");
					$("#input_user_name").val($("#user_name").html());
				} else {
					ajax_update_vehicle_user_name("${param.vehicle_id}", $("#input_user_name").val(), function(json) {
						var jsonObj = JSON.parse(JSON.stringify(json));
						$("#btn_edit_user_name").html("수정");
						$("#user_name").css("display", "");
						$("#input_user_name").css("display", "none");
						$("#user_name").html(jsonObj.user_NAME);
					});
				}
			}
			function edit_phone_number() {
				if($("#btn_edit_phone_number").html() == "수정") {
					$("#btn_edit_phone_number").html("적용");
					$("#phone_number").css("display", "none");
					$("#input_phone_number").css("display", "");
					$("#input_phone_number").val($("#phone_number").html());
				} else {
					ajax_update_vehicle_phone_number("${param.vehicle_id}", $("#input_phone_number").val(), function(json) {
						var jsonObj = JSON.parse(JSON.stringify(json));
						$("#btn_edit_phone_number").html("수정");
						$("#phone_number").css("display", "");
						$("#input_phone_number").css("display", "none");
						$("#phone_number").html(jsonObj.phone_NUMBER);
					});
				}
			}
			function edit_birth() {
				if($("#btn_edit_birth").html() == "수정") {
					$("#btn_edit_birth").html("적용");
					$("#birth").css("display", "none");
					$("#input_birth").css("display", "");
					$("#input_birth").val($("#birth").html());
				} else {
					ajax_update_vehicle_birth("${param.vehicle_id}", $("#input_birth").val(), function(json) {
						var jsonObj = JSON.parse(JSON.stringify(json));
						$("#btn_edit_birth").html("수정");
						$("#birth").css("display", "");
						$("#input_birth").css("display", "none");
						$("#birth").html(jsonObj.birth);
					});
				}
			}
			function edit_comment() {
				if($("#btn_edit_comment").html() == "수정") {
					$("#btn_edit_comment").html("적용");
					$("#comment").css("display", "none");
					$("#input_comment").css("display", "");
					$("#input_comment").val(refineContentRev($("#comment").html()));
				} else {
					ajax_update_vehicle_comment("${param.vehicle_id}", refineContent($("#input_comment").val()), function(json) {
						var jsonObj = JSON.parse(JSON.stringify(json));
						$("#btn_edit_comment").html("수정");
						$("#comment").css("display", "");
						$("#input_comment").css("display", "none");
						$("#comment").html(jsonObj.comment);
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
                <jsp:include page="sidebar.jsp"/>

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
                                    <i class="gi gi-car"></i>차량관리<br><small>차량을 관리하세요</small>
                                </h1>
                            </div>
                        </div>
                        <ul class="breadcrumb breadcrumb-top">
                        	<li><a href="list_history">방문내역 목록</a></li>
                            <li>차량관리</li>
                            
                        </ul>
                        <!-- END Page Header -->

                        <!-- Example Block -->
                        <div class="block">
                            <!-- Example Title -->
                            <div class="block-title">
                            	<div class="block-options pull-right">
                                    <a href="/vehicle/${vehicles[0].VEHICLE_ID}/editview" class="btn btn-alt btn-sm btn-default" data-toggle="tooltip" title="" data-original-title="Settings"><i class="fa fa-pencil"></i></a>
                                </div>
                                <h2>차량관리</h2>
                            </div>
                            <!-- END Example Title -->

                            <!-- Example Content -->
                            <table class="table table-striped table-vcenter">
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
									<td>
										<span id="user_name">${vehicles[0].USER_NAME}</span>
										<input id="input_user_name" type="text" style="display:none" />
										<a href="javascript:edit_user_name()"><span id="btn_edit_user_name">수정</span></a>
									</td>
									<td>연락처</td>
									<td>
										<span id="phone_number">${vehicles[0].PHONE_NUMBER}</span>
										<input id="input_phone_number" type="text" style="display:none" />
										<a href="javascript:edit_phone_number()"><span id="btn_edit_phone_number">수정</span></a>
									</td>
									<td>생년월일</td>
									<td>
										<span id="birth">${vehicles[0].BIRTH}</span>
										<input id="input_birth" type="text" style="display:none" />
										<a href="javascript:edit_birth()"><span id="btn_edit_birth">수정</span></a>
									</td>
								</tr>
								<tr>
									<td>메모</td>
									<td colspan="5">
										<span id="comment">${vehicles[0].COMMENT}</span>
										<textarea id="input_comment" style="display:none"></textarea>
										<a href="javascript:edit_comment()"><span id="btn_edit_comment">수정</span></a>
									</td>
								</tr>
							</table>
						</div>
						<div class="block">
                            <!-- Example Title -->
                            <div class="block-title">
                                <h2>차량 방문 내역</h2>
                            </div>
							<table class="table table-striped table-vcenter">
								<thead>
									<tr>
										<th>시간</th>
									</tr>
								</thead>
								<c:forEach items="${historys}" var="history">
									<tr>
										<td><a href="/vehicle/${vehicles[0].VEHICLE_ID}/history/${history.DATE_VISIT}/managements">${history.DATE_VISIT}</a></td>
									</tr>
								</c:forEach>
								<c:if test="${fn:length(historys) == 0}">
									<tr>
										<td colspan="4">
											점검 내역이 없습니다.
										</td>
									</tr>
								</c:if>
							</table>
                            <!-- END Example Content -->
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
    </body>
</html>