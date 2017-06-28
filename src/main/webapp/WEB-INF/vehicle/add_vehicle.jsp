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
        <link rel="shortcut icon" href="<c:url value='/'/>img/favicon.png">
        <link rel="apple-touch-icon" href="<c:url value='/'/>img/icon57.png" sizes="57x57">
        <link rel="apple-touch-icon" href="<c:url value='/'/>img/icon72.png" sizes="72x72">
        <link rel="apple-touch-icon" href="<c:url value='/'/>img/icon76.png" sizes="76x76">
        <link rel="apple-touch-icon" href="<c:url value='/'/>img/icon114.png" sizes="114x114">
        <link rel="apple-touch-icon" href="<c:url value='/'/>img/icon120.png" sizes="120x120">
        <link rel="apple-touch-icon" href="<c:url value='/'/>img/icon144.png" sizes="144x144">
        <link rel="apple-touch-icon" href="<c:url value='/'/>img/icon152.png" sizes="152x152">
        <link rel="apple-touch-icon" href="<c:url value='/'/>img/icon180.png" sizes="180x180">
        <!-- END Icons -->

        <!-- Stylesheets -->
        <!-- Bootstrap is included in its original form, unaltered -->
        <link rel="stylesheet" href="<c:url value='/'/>css/bootstrap.min.css">

        <!-- Related styles of various icon packs and plugins -->
        <link rel="stylesheet" href="<c:url value='/'/>css/plugins.css">

        <!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
        <link rel="stylesheet" href="<c:url value='/'/>css/main.css">

        <!-- Include a specific file here from css/themes/ folder to alter the default theme of the template -->

        <!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
        <link rel="stylesheet" href="<c:url value='/'/>css/themes.css">
        <!-- END Stylesheets -->

        <!-- Modernizr (browser feature detection library) -->
        <script src="<c:url value='/'/>js/vendor/modernizr.min.js"></script>
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
                                    <i class="gi gi-cars"></i>차량 추가<br><small>관리할 차량을 수동으로 추가 하세요.</small>
                                </h1>
                            </div>
                        </div>
                        <ul class="breadcrumb breadcrumb-top">
                            <li><a href="/list_vehicle">차량 목록</a></li>
                            <li>차량 추가</li>
                        </ul>
                        <!-- END Page Header -->

                        <div class="block">
	                        <!-- Basic Form Elements Title -->
	                        <div class="block-title">
	                            <div class="block-options pull-right">
	                                <a href="list_vehicle" class="btn btn-alt btn-sm btn-default toggle-bordered enable-tooltip" title="취소하고 목록으로 돌아가기">취소</a>
	                            </div>
	                            <h2><strong>차량</strong> 정보입력</h2>
	                        </div>
	                        <!-- END Form Elements Title -->
	
	                        <!-- Basic Form Elements Content -->
	                        <form action="add" method="post" class="form-horizontal form-bordered">
	                        	<div class="form-group">
	                                <label class="col-md-3 control-label" for="NAME">차량번호</label>
	                                <div class="col-md-9">
	                                    <input type="text" id="input_license" name="LICENSE" class="form-control" placeholder="차량번호">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-md-3 control-label" for="KAKAO_ACCOUNT">모델</label>
	                                <div class="col-md-9">
	                                    <input type="text" id="input_model" name="MODEL" class="form-control" placeholder="모델">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-md-3 control-label" for="KAKAO_ACCOUNT">고객명</label>
	                                <div class="col-md-9">
	                                    <input type="text" id="input_user_name" name="USER_NAME" class="form-control" placeholder="고객명">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-md-3 control-label" for="KAKAO_ACCOUNT">연락처</label>
	                                <div class="col-md-9">
	                                    <input type="text" id="input_phone_number" name="PHONE_NUMBER" class="form-control" placeholder="연락처">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-md-3 control-label" for="KAKAO_ACCOUNT">생년월일</label>
	                                <div class="col-md-9">
	                                    <input type="text" id="input_birth" name="BIRTH" class="form-control" placeholder="생년월일">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-md-3 control-label" for="KAKAO_ACCOUNT">알림여부</label>
	                                <div class="col-md-9">
	                                    <label class="switch switch-default"><input type="checkbox" checked onchange="javascript:toggle_is_notifiable(this)"><span></span></label>
	                                    <input type="hidden" id="input_is_notifiable" name="IS_NOTIFIABLE" value="1" />
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-md-3 control-label" for="KAKAO_ACCOUNT">메모</label>
	                                <div class="col-md-9">
	                                    <textarea id="input_comment" name="COMMENT" class="form-control" placeholder="메모"></textarea>
	                                </div>
	                            </div>
	                            <div class="form-group form-actions">
	                                <div class="col-md-9 col-md-offset-3">
	                                    <button type="button" class="btn btn-sm btn-primary" onclick="javascript:submit_fn()"><i class="fa fa-angle-right"></i> 제출</button>
	                                    <button type="reset" class="btn btn-sm btn-warning"><i class="fa fa-repeat"></i> 리셋</button>
	                                </div>
	                            </div>
	                        </form>
	                        <!-- END Basic Form Elements Content -->
	                    </div>
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
        <script src="<c:url value='/'/>js/vendor/jquery.min.js"></script>
        <script src="<c:url value='/'/>js/vendor/bootstrap.min.js"></script>
        <script src="<c:url value='/'/>js/plugins.js"></script>
        <script src="<c:url value='/'/>js/app.js"></script>
        <script src="<c:url value='/'/>js/ajax.js?ver=12"></script>
		<script src="<c:url value='/'/>js/refinestring.js?ver=2"></script>
        <script>
        	function toggle_is_notifiable(obj) {
        		if(obj.checked) {
					$("#input_is_notifiable").val(1);
        		} else {
					$("#input_is_notifiable").val(0);
        		}
        	}
        	function submit_fn() {
        		ajax_insert_vehicle_total($("#input_license").val(), $("#input_is_notifiable").val(), $("#input_model").val(), $("#input_user_name").val(), $("#input_birth").val(), $("#input_phone_number").val(), refineContent($("#input_comment").val()), function(json) {
        			var jsonObj = JSON.parse(JSON.stringify(json));
        			if(jsonObj.is_NOTIFIABLE == -1) {
        				alert("이미 존재하는 차량번호 입니다.");
        			} else {
        				alert("추가완료하였습니다.");
        				location.href = "/list_management?vehicle_id="+jsonObj.vehicle_ID;
        			}
        		});
        	}
        </script>
    </body>
</html>