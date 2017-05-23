<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<!-- Main Sidebar -->
	<div id="sidebar">
	    <!-- Wrapper for scrolling functionality -->
	    <div id="sidebar-scroll">
	        <!-- Sidebar Content -->
	        <div class="sidebar-content">
	            <!-- Brand -->
	            <a href="index" class="sidebar-brand">
	                <i class="gi gi-flash"></i><span class="sidebar-nav-mini-hide"><strong>온누리</strong>모터스</span>
	            </a>
	            <!-- END Brand -->
	
	            <!-- User Info -->
	            <div class="sidebar-section sidebar-user clearfix sidebar-nav-mini-hide">
	                <div class="sidebar-user-name">관리자1</div>
	                <div class="sidebar-user-links">
	                    <a href="page_ready_user_profile.html" data-toggle="tooltip" data-placement="bottom" title="Profile"><i class="gi gi-user"></i></a>
	                    <a href="page_ready_inbox.html" data-toggle="tooltip" data-placement="bottom" title="Messages"><i class="gi gi-envelope"></i></a>
	                    <!-- Opens the user settings modal that can be found at the bottom of each page (page_footer.html in PHP version) -->
	                    <a href="javascript:void(0)" class="enable-tooltip" data-placement="bottom" title="Settings" onclick="$('#modal-user-settings').modal('show');"><i class="gi gi-cogwheel"></i></a>
	                    <a href="login.html" data-toggle="tooltip" data-placement="bottom" title="Logout"><i class="gi gi-exit"></i></a>
	                </div>
	            </div>
	            <!-- END User Info -->
	
	            <!-- Sidebar Navigation -->
	            <ul class="sidebar-nav">
	                <li>
	                    <a href="index"><i class="gi gi-stopwatch sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">메인</span></a>
	                </li>
	                <li class="sidebar-header">
	                    <span class="sidebar-header-options clearfix"><a href="javascript:void(0)" data-toggle="tooltip" title="Quick Settings"><i class="gi gi-settings"></i></a><a href="javascript:void(0)" data-toggle="tooltip" title="Create the most amazing pages with the widget kit!"><i class="gi gi-lightbulb"></i></a></span>
	                    <span class="sidebar-header-title">관리</span>
	                </li>
	                <li>
	                    <a href="list_vehicle"><i class="gi gi-charts sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">차량목록</span></a>
	                </li>
	                <li>
	                    <a href="list_history"><i class="gi gi-charts sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">히스토리</span></a>
	                </li>
	                <li>
	                    <a href="page_visit_history"><i class="gi gi-share_alt sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">방문내역</span></a>
	                </li>
	                <li>
	                    <a href="timeline"><i class="gi gi-stopwatch sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">타임라인</span></a>
	                </li>
	                <li class="sidebar-header">
	                    <span class="sidebar-header-options clearfix"><a href="javascript:void(0)" data-toggle="tooltip" title="Quick Settings"><i class="gi gi-settings"></i></a></span>
	                    <span class="sidebar-header-title">알림</span>
	                </li>
	                <li>
	                    <a href="page_widgets_social.html"><i class="gi gi-share_alt sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">수신자</span></a>
	                </li>
	            </ul>
	            <!-- END Sidebar Navigation -->
	
	            <!-- Sidebar Notifications -->
	            <div class="sidebar-header sidebar-nav-mini-hide">
	                <span class="sidebar-header-options clearfix">
	                    <a href="javascript:refresh_alerts()" data-toggle="tooltip" title="Refresh"><i class="gi gi-refresh"></i></a>
	                </span>
	                <span class="sidebar-header-title">활동</span>
	            </div>
	            <div id="alerts" class="sidebar-section sidebar-nav-mini-hide">
	            	<c:forEach items="${alerts}" var="list_alerts">
	            		<div class="alert alert-info alert-alt">
	            			<small>${list_alerts.TIME_PASSED}</small>
	            			<i class="fa fa-arrow-up fa-fw"></i> 차량입고 (${list_alerts.LICENSE})
	            		</div>
	            	</c:forEach>
	                <!-- <div class="alert alert-success alert-alt">
	                    <small>5분 전</small><br>
	                    <i class="fa fa-thumbs-up fa-fw"></i> 새 차량입고 (30 고 3512)
	                </div>
	                <div class="alert alert-info alert-alt">
	                    <small>10분 전</small><br>
	                    <i class="fa fa-arrow-up fa-fw"></i> 차량입고 (21 서 2017)
	                </div>
	                <div class="alert alert-warning alert-alt">
	                    <small>3시간전 </small><br>
	                    <i class="fa fa-exclamation fa-fw"></i> Running low on space<br><strong>18GB in use</strong> 2GB left
	                </div>
	                <div class="alert alert-danger alert-alt">
	                    <small>어제</small><br>
	                    <i class="fa fa-bug fa-fw"></i> <a href="javascript:void(0)"><strong>New bug submitted</strong></a>
	                </div> -->
	            </div>
	            <!-- END Sidebar Notifications -->
	        </div>
	        <!-- END Sidebar Content -->
	    </div>
	    <!-- END Wrapper for scrolling functionality -->
	</div>
	<!-- END Main Sidebar -->