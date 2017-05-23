<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--[if IE 9]>         <html class="no-js lt-ie10" lang="kor"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js" lang="kor"> <!--<![endif]-->
<head>
<meta charset="utf-8">

	<title>ProUI - Responsive Bootstrap Admin Template</title>

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
									<link rel="apple-touch-icon" href="img/icon114.png"
										sizes="114x114">
										<link rel="apple-touch-icon" href="img/icon120.png"
											sizes="120x120">
											<link rel="apple-touch-icon" href="img/icon144.png"
												sizes="144x144">
												<link rel="apple-touch-icon" href="img/icon152.png"
													sizes="152x152">
													<link rel="apple-touch-icon" href="img/icon180.png"
														sizes="180x180">
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

		<div id="page-container"
			class="sidebar-partial sidebar-visible-lg sidebar-no-animations">
			<jsp:include page="sidebar.jsp"/>

			<!-- Main Container -->
			<div id="main-container">
				<header class="navbar navbar-default"> <!-- Left Header Navigation -->
				<ul class="nav navbar-nav-custom">
					<!-- Main Sidebar Toggle Button -->
					<li><a href="javascript:void(0)"
						onclick="App.sidebar('toggle-sidebar');this.blur();"> <i
							class="fa fa-bars fa-fw"></i>
					</a></li>
					<!-- END Main Sidebar Toggle Button -->

				</ul>
				<!-- END Left Header Navigation --> <!-- Search Form -->
				<form action="page_ready_search_results.html" method="post"
					class="navbar-form-custom">
					<div class="form-group">
						<input type="text" id="top-search" name="top-search"
							class="form-control" placeholder="Search..">
					</div>
				</form>
				<!-- END Search Form --> </header>
				<!-- END Header -->

				<!-- Page content -->
				<div id="page-content">
					<!-- Blank Header -->
					<div class="content-header">
						<div class="header-section">
							<h1>
								<i class="gi gi-brush"></i>타임라인<br><small>오늘 벌어진 일을
										여기에!</small>
							</h1>
						</div>
					</div>
					<ul class="breadcrumb breadcrumb-top">
						<li>메인</li>
						<li><a href="">타임라인</a></li>
					</ul>
					<!-- END Blank Header -->

					<div class="row">
						<div class="block full">
							<!-- Timeline Style Title -->
							<div class="block-title">
								<div class="block-options pull-right">
									<a href="javascript:void(0)"
										class="btn btn-alt btn-sm btn-default" data-toggle="tooltip"
										title="" data-original-title="Settings"><i
										class="fa fa-cog"></i></a>
								</div>
								<h2>
									<strong>Timeline</strong> Style
								</h2>
							</div>
							<!-- END Timeline Style Title -->

							<!-- Timeline Style Content -->
							<!-- You can remove the class .block-content-full if you want the block to have its regular padding -->
							<div class="timeline block-content-full">
								<h3 class="timeline-header">
									Web Conference <small><strong>June 14, 2014</strong></small>
								</h3>
								<!-- You can remove the class .timeline-hover if you don't want each event to be highlighted on mouse hover -->
								<ul class="timeline-list timeline-hover">
									<li>
										<div class="timeline-icon">
											<i class="gi gi-cake"></i>
										</div>
										<div class="timeline-time">
											8:00 <strong>am</strong>
										</div>
										<div class="timeline-content">
											<p class="push-bit">
												<strong>Breakfast</strong>
											</p>
											<p class="push-bit">An awesome breakfast will wait for
												you at the lobby!</p>
											<div class="row push">
												<div class="col-sm-6 col-md-4">
													<a href="img/placeholders/photos/photo6.jpg"
														data-toggle="lightbox-image"> <img
														src="img/placeholders/photos/photo6.jpg" alt="image"></a>
												</div>
												<div class="col-sm-6 col-md-4">
													<a href="img/placeholders/photos/photo7.jpg"
														data-toggle="lightbox-image"> <img
														src="img/placeholders/photos/photo7.jpg" alt="image"></a>
												</div>
											</div>
										</div>
									</li>
									<li class="active">
										<div class="timeline-icon">
											<i class="fa fa-file-text"></i>
										</div>
										<div class="timeline-time">
											9:15 <strong>am</strong>
										</div>
										<div class="timeline-content">
											<p class="push-bit">
												<strong>Web Design Session</strong>
											</p>
											A1 Conference Room
										</div>
									</li>
									<li>
										<div class="timeline-icon">
											<i class="fa fa-coffee"></i>
										</div>
										<div class="timeline-time">
											10:30 <strong>am</strong>
										</div>
										<div class="timeline-content">
											<strong>Coffee Break</strong>
										</div>
									</li>
									<li class="active">
										<div class="timeline-icon">
											<i class="fa fa-file-text"></i>
										</div>
										<div class="timeline-time">
											11:00 <strong>pm</strong>
										</div>
										<div class="timeline-content">
											<p class="push-bit">
												<strong>Web Development Session</strong>
											</p>
											B6 Conference Room
										</div>
									</li>
									<li>
										<div class="timeline-icon">
											<i class="fa fa-cutlery"></i>
										</div>
										<div class="timeline-time">
											1:30 <strong>pm</strong>
										</div>
										<div class="timeline-content">
											<p class="push-bit">
												<strong>Lunch</strong>
											</p>
											<p class="push-bit">Awesome food prepared by our awesome
												chefs!</p>
											<div class="row push">
												<div class="col-sm-6 col-md-4">
													<a href="img/placeholders/photos/photo23.jpg"
														data-toggle="lightbox-image"> <img
														src="img/placeholders/photos/photo23.jpg" alt="image"></a>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="timeline-icon">
											<i class="gi gi-beach_umbrella"></i>
										</div>
										<div class="timeline-time">
											3:00 <strong>pm</strong>
										</div>
										<div class="timeline-content">
											<p class="push-bit">
												<strong>Break</strong>
											</p>
											Relax time after lunch
										</div>
									</li>
									<li class="active">
										<div class="timeline-icon">
											<i class="fa fa-file-text"></i>
										</div>
										<div class="timeline-time">
											5:00 <strong>pm</strong>
										</div>
										<div class="timeline-content">
											<p class="push-bit">
												<strong>Web Standards Session</strong>
											</p>
											C1 Conference Room
										</div>
									</li>
									<li>
										<div class="timeline-icon">
											<i class="gi gi-drink"></i>
										</div>
										<div class="timeline-time">
											10:00 <strong>pm</strong>
										</div>
										<div class="timeline-content">
											<p class="push-bit">
												<strong>Happy Hour</strong>
											</p>
											<p class="push-bit">
												Free drinks at <a href="javascript:void(0)">Cafe-Bar</a>!
											</p>
											<div id="gmap-timeline" class="gmap" style="height: 200px;"></div>
										</div>
									</li>
									<li>
										<div class="timeline-icon">
											<i class="fa fa-globe"></i>
										</div>
										<div class="timeline-content">
											<p class="push-bit">
												<strong>End of first day</strong>
											</p>
											<p class="push-bit">Lorem ipsum dolor sit amet,
												consectetur adipiscing elit. Maecenas ultrices, justo vel
												imperdiet gravida, urna ligula hendrerit nibh, ac cursus
												nibh sapien in purus. Mauris tincidunt tincidunt turpis in
												porta. Integer fermentum tincidunt auctor. Vestibulum
												ullamcorper, odio sed rhoncus imperdiet, enim elit
												sollicitudin orci, eget dictum leo mi nec lectus.</p>
											<p>Nam commodo turpis id lectus scelerisque vulputate.
												Integer sed dolor erat. Fusce erat ipsum, varius vel euismod
												sed, tristique et lectus? Etiam egestas fringilla enim, id
												convallis lectus laoreet at. Fusce purus nisi, gravida sed
												consectetur ut, interdum quis nisi. Quisque egestas nisl id
												lectus facilisis scelerisque!</p>
										</div>
									</li>
								</ul>
							</div>
							<!-- END Timeline Style Content -->
						</div>
					</div>
				</div>
				<!-- END Page Content -->

				<!-- Footer -->
				<footer class="clearfix">
				<div class="pull-right">
					Crafted with <i class="fa fa-heart text-danger"></i> by Onnuri
				</div>
				<div class="pull-left">
					<span id="year-copy"></span> &copy; <a href="http://goo.gl/TDOSuC"
						target="_blank">온누리모터스</a>
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

	<!-- User Settings, modal which opens from Settings link (found in top right user menu) and the Cog link (found in sidebar user info) -->
	<div id="modal-user-settings" class="modal fade" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header text-center">
					<h2 class="modal-title">
						<i class="fa fa-pencil"></i> Settings
					</h2>
				</div>
				<!-- END Modal Header -->

				<!-- Modal Body -->
				<div class="modal-body">
					<form action="index" method="post"
						enctype="multipart/form-data"
						class="form-horizontal form-bordered" onsubmit="return false;">
						<fieldset>
							<legend>Vital Info</legend>
							<div class="form-group">
								<label class="col-md-4 control-label">Username</label>
								<div class="col-md-8">
									<p class="form-control-static">Admin</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" for="user-settings-email">Email</label>
								<div class="col-md-8">
									<input type="email" id="user-settings-email"
										name="user-settings-email" class="form-control"
										value="admin@example.com">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"
									for="user-settings-notifications">Email Notifications</label>
								<div class="col-md-8">
									<label class="switch switch-primary"> <input
										type="checkbox" id="user-settings-notifications"
										name="user-settings-notifications" value="1" checked>
											<span></span></label>
								</div>
							</div>
						</fieldset>
						<fieldset>
							<legend>Password Update</legend>
							<div class="form-group">
								<label class="col-md-4 control-label"
									for="user-settings-password">New Password</label>
								<div class="col-md-8">
									<input type="password" id="user-settings-password"
										name="user-settings-password" class="form-control"
										placeholder="Please choose a complex one..">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"
									for="user-settings-repassword">Confirm New Password</label>
								<div class="col-md-8">
									<input type="password" id="user-settings-repassword"
										name="user-settings-repassword" class="form-control"
										placeholder="..and confirm it!">
								</div>
							</div>
						</fieldset>
						<div class="form-group form-actions">
							<div class="col-xs-12 text-right">
								<button type="button" class="btn btn-sm btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-sm btn-primary">Save
									Changes</button>
							</div>
						</div>
					</form>
				</div>
				<!-- END Modal Body -->
			</div>
		</div>
	</div>
	<!-- END User Settings -->

	<!-- jQuery, Bootstrap.js, jQuery plugins and Custom JS code -->
	<script src="js/vendor/jquery.min.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/app.js"></script>

	<script src="js/pages/readyTimeline.js"></script>
	<script>$(function(){ ReadyTimeline.init(); });</script>
</body>
</html>