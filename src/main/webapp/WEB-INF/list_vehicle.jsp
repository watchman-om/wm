<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 9]>         <html class="no-js lt-ie10" lang="kor"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="no-js" lang="kor">
<!--<![endif]-->
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
		<!-- In the PHP version you can set the following options from inc/config file -->
		<!--
                Available #page-container classes:

                '' (None)                                       for a full main and alternative sidebar hidden by default (> 991px)

                'sidebar-visible-lg'                            for a full main sidebar visible by default (> 991px)
                'sidebar-partial'                               for a partial main sidebar which opens on mouse hover, hidden by default (> 991px)
                'sidebar-partial sidebar-visible-lg'            for a partial main sidebar which opens on mouse hover, visible by default (> 991px)
                'sidebar-mini sidebar-visible-lg-mini'          for a mini main sidebar with a flyout menu, enabled by default (> 991px + Best with static layout)
                'sidebar-mini sidebar-visible-lg'               for a mini main sidebar with a flyout menu, disabled by default (> 991px + Best with static layout)

                'sidebar-alt-visible-lg'                        for a full alternative sidebar visible by default (> 991px)
                'sidebar-alt-partial'                           for a partial alternative sidebar which opens on mouse hover, hidden by default (> 991px)
                'sidebar-alt-partial sidebar-alt-visible-lg'    for a partial alternative sidebar which opens on mouse hover, visible by default (> 991px)

                'sidebar-partial sidebar-alt-partial'           for both sidebars partial which open on mouse hover, hidden by default (> 991px)

                'sidebar-no-animations'                         add this as extra for disabling sidebar animations on large screens (> 991px) - Better performance with heavy pages!

                'style-alt'                                     for an alternative main style (without it: the default style)
                'footer-fixed'                                  for a fixed footer (without it: a static footer)

                'disable-menu-autoscroll'                       add this to disable the main menu auto scrolling when opening a submenu

                'header-fixed-top'                              has to be added only if the class 'navbar-fixed-top' was added on header.navbar
                'header-fixed-bottom'                           has to be added only if the class 'navbar-fixed-bottom' was added on header.navbar

                'enable-cookies'                                enables cookies for remembering active color theme when changed from the sidebar links
            -->
		<div id="page-container"
			class="sidebar-partial sidebar-visible-lg sidebar-no-animations">
			<!-- Main Sidebar -->
			<div id="sidebar">
				<!-- Wrapper for scrolling functionality -->
				<div id="sidebar-scroll">
					<!-- Sidebar Content -->
					<div class="sidebar-content">
						<!-- Brand -->
						<a href="index" class="sidebar-brand"> <i
							class="gi gi-flash"></i><span class="sidebar-nav-mini-hide"><strong>Pro</strong>UI</span>
						</a>
						<!-- END Brand -->

						<!-- User Info -->
						<div
							class="sidebar-section sidebar-user clearfix sidebar-nav-mini-hide">
							<div class="sidebar-user-avatar">
								<a href="page_car_profile.html"> <img
									src="img/placeholders/avatars/avatar2.jpg" alt="avatar">
								</a>
							</div>
							<div class="sidebar-user-name">관리자</div>
							<div class="sidebar-user-links">
								<a href="page_car_profile.html" data-toggle="tooltip"
									data-placement="bottom" title="Profile"><i
									class="gi gi-user"></i></a> <a href="page_ready_inbox.html"
									data-toggle="tooltip" data-placement="bottom" title="Messages"><i
									class="gi gi-envelope"></i></a>
								<!-- Opens the user settings modal that can be found at the bottom of each page (page_footer.html in PHP version) -->
								<a href="javascript:void(0)" class="enable-tooltip"
									data-placement="bottom" title="Settings"
									onclick="$('#modal-user-settings').modal('show');"><i
									class="gi gi-cogwheel"></i></a> <a href="login.html"
									data-toggle="tooltip" data-placement="bottom" title="Logout"><i
									class="gi gi-exit"></i></a>
							</div>
						</div>
						<!-- END User Info -->

						<!-- Sidebar Navigation -->
						<ul class="sidebar-nav">
							<li><a href="index"><i
									class="gi gi-stopwatch sidebar-nav-icon"></i><span
									class="sidebar-nav-mini-hide">메인</span></a></li>
							<li class="sidebar-header"><span
								class="sidebar-header-options clearfix"><a
									href="javascript:void(0)" data-toggle="tooltip"
									title="Quick Settings"><i class="gi gi-settings"></i></a><a
									href="javascript:void(0)" data-toggle="tooltip"
									title="Create the most amazing pages with the widget kit!"><i
										class="gi gi-lightbulb"></i></a></span> <span
								class="sidebar-header-title">관리</span></li>
							<li><a href="list_vehicle"><i
									class="gi gi-charts sidebar-nav-icon"></i><span
									class="sidebar-nav-mini-hide">차량목록</span></a></li>
							<li><a href="page_visit_history.html"><i
									class="gi gi-share_alt sidebar-nav-icon"></i><span
									class="sidebar-nav-mini-hide">방문내역</span></a></li>
							<li><a href="timeline.html"><i
									class="gi gi-stopwatch sidebar-nav-icon"></i><span
									class="sidebar-nav-mini-hide">타임라인</span></a></li>
							<li class="sidebar-header"><span
								class="sidebar-header-options clearfix"><a
									href="javascript:void(0)" data-toggle="tooltip"
									title="Quick Settings"><i class="gi gi-settings"></i></a></span> <span
								class="sidebar-header-title">수신자</span></li>
							<li><a href="page_widgets_social.html"><i
									class="gi gi-share_alt sidebar-nav-icon"></i><span
									class="sidebar-nav-mini-hide">ìì ì</span></a></li>
						</ul>
						<!-- END Sidebar Navigation -->

						<!-- Sidebar Notifications -->
						<div class="sidebar-header sidebar-nav-mini-hide">
							<span class="sidebar-header-options clearfix"> <a
								href="javascript:void(0)" data-toggle="tooltip" title="Refresh"><i
									class="gi gi-refresh"></i></a>
							</span> <span class="sidebar-header-title">íë</span>
						</div>
						<div class="sidebar-section sidebar-nav-mini-hide">
							<div class="alert alert-success alert-alt">
								<small>5ë¶ ì </small><br> <i class="fa fa-thumbs-up fa-fw"></i>
								ì ì°¨ëìê³  (30 ê³  3512)
							</div>
							<div class="alert alert-info alert-alt">
								<small>10ë¶ ì </small><br> <i class="fa fa-arrow-up fa-fw"></i>
								ì°¨ëìê³  (21 ì 2017)
							</div>
							<div class="alert alert-warning alert-alt">
								<small>3ìê°ì  </small><br> <i class="fa fa-exclamation fa-fw"></i>
								Running low on space<br>
								<strong>18GB in use</strong> 2GB left
							</div>
							<div class="alert alert-danger alert-alt">
								<small>ì´ì </small><br> <i class="fa fa-bug fa-fw"></i> <a
									href="javascript:void(0)"><strong>New bug
										submitted</strong></a>
							</div>
						</div>
						<!-- END Sidebar Notifications -->
					</div>
					<!-- END Sidebar Content -->
				</div>
				<!-- END Wrapper for scrolling functionality -->
			</div>
			<!-- END Main Sidebar -->

			<!-- Main Container -->
			<div id="main-container">
				<!-- Header -->
				<!-- In the PHP version you can set the following options from inc/config file -->
				<!--
                        Available header.navbar classes:

                        'navbar-default'            for the default light header
                        'navbar-inverse'            for an alternative dark header

                        'navbar-fixed-top'          for a top fixed header (fixed sidebars with scroll will be auto initialized, functionality can be found in js/app.js - handleSidebar())
                            'header-fixed-top'      has to be added on #page-container only if the class 'navbar-fixed-top' was added

                        'navbar-fixed-bottom'       for a bottom fixed header (fixed sidebars with scroll will be auto initialized, functionality can be found in js/app.js - handleSidebar()))
                            'header-fixed-bottom'   has to be added on #page-container only if the class 'navbar-fixed-bottom' was added
                    -->
				<header class="navbar navbar-default">
					<!-- Left Header Navigation -->
					<ul class="nav navbar-nav-custom">
						<!-- Main Sidebar Toggle Button -->
						<li><a href="javascript:void(0)"
							onclick="App.sidebar('toggle-sidebar');this.blur();"> <i
								class="fa fa-bars fa-fw"></i>
						</a></li>
						<!-- END Main Sidebar Toggle Button -->

						<!-- Template Options -->
						<!-- Change Options functionality can be found in js/app.js - templateOptions() -->
						<li class="dropdown"><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="gi gi-settings"></i>
						</a>
							<ul class="dropdown-menu dropdown-custom dropdown-options">
								<li class="dropdown-header text-center">Header Style</li>
								<li>
									<div class="btn-group btn-group-justified btn-group-sm">
										<a href="javascript:void(0)" class="btn btn-primary"
											id="options-header-default">Light</a> <a
											href="javascript:void(0)" class="btn btn-primary"
											id="options-header-inverse">Dark</a>
									</div>
								</li>
								<li class="dropdown-header text-center">Page Style</li>
								<li>
									<div class="btn-group btn-group-justified btn-group-sm">
										<a href="javascript:void(0)" class="btn btn-primary"
											id="options-main-style">Default</a> <a
											href="javascript:void(0)" class="btn btn-primary"
											id="options-main-style-alt">Alternative</a>
									</div>
								</li>
							</ul></li>
						<!-- END Template Options -->
					</ul>
					<!-- END Left Header Navigation -->

					<!-- Search Form -->
					<form action="page_ready_search_results.html" method="post"
						class="navbar-form-custom">
						<div class="form-group">
							<input type="text" id="top-search" name="top-search"
								class="form-control" placeholder="Search..">
						</div>
					</form>
					<!-- END Search Form -->

					<!-- Right Header Navigation -->
					<ul class="nav navbar-nav-custom pull-right">
						<!-- Alternative Sidebar Toggle Button -->
						<li>
							<!-- If you do not want the main sidebar to open when the alternative sidebar is closed, just remove the second parameter: App.sidebar('toggle-sidebar-alt'); -->
							<a href="javascript:void(0)"
							onclick="App.sidebar('toggle-sidebar-alt', 'toggle-other');this.blur();">
								<i class="gi gi-share_alt"></i> <span
								class="label label-primary label-indicator animation-floating">4</span>
						</a>
						</li>
						<!-- END Alternative Sidebar Toggle Button -->

						<!-- User Dropdown -->
						<li class="dropdown"><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="img/placeholders/avatars/avatar2.jpg" alt="avatar"> <i
								class="fa fa-angle-down"></i>
						</a>
							<ul class="dropdown-menu dropdown-custom dropdown-menu-right">
								<li class="dropdown-header text-center">Account</li>
								<li><a href="page_ready_timeline.html"> <i
										class="fa fa-clock-o fa-fw pull-right"></i> <span
										class="badge pull-right">10</span> Updates
								</a> <a href="page_ready_inbox.html"> <i
										class="fa fa-envelope-o fa-fw pull-right"></i> <span
										class="badge pull-right">5</span> Messages
								</a> <a href="page_ready_pricing_tables.html"><i
										class="fa fa-magnet fa-fw pull-right"></i> <span
										class="badge pull-right">3</span> Subscriptions </a> <a
									href="page_ready_faq.html"><i
										class="fa fa-question fa-fw pull-right"></i> <span
										class="badge pull-right">11</span> FAQ </a></li>
								<li class="divider"></li>
								<li><a href="page_car_profile.html"> <i
										class="fa fa-user fa-fw pull-right"></i> Profile
								</a> <!-- Opens the user settings modal that can be found at the bottom of each page (page_footer.html in PHP version) -->
									<a href="#modal-user-settings" data-toggle="modal"> <i
										class="fa fa-cog fa-fw pull-right"></i> Settings
								</a></li>
								<li class="divider"></li>
								<li><a href="page_ready_lock_screen.html"><i
										class="fa fa-lock fa-fw pull-right"></i> Lock Account</a> <a
									href="login.html"><i class="fa fa-ban fa-fw pull-right"></i>
										Logout</a></li>
								<li class="dropdown-header text-center">Activity</li>
								<li>
									<div class="alert alert-success alert-alt">
										<small>5 min ago</small><br> <i
											class="fa fa-thumbs-up fa-fw"></i> You had a new sale ($10)
									</div>
									<div class="alert alert-info alert-alt">
										<small>10 min ago</small><br> <i
											class="fa fa-arrow-up fa-fw"></i> Upgraded to Pro plan
									</div>
									<div class="alert alert-warning alert-alt">
										<small>3 hours ago</small><br> <i
											class="fa fa-exclamation fa-fw"></i> Running low on space<br>
										<strong>18GB in use</strong> 2GB left
									</div>
									<div class="alert alert-danger alert-alt">
										<small>Yesterday</small><br> <i class="fa fa-bug fa-fw"></i>
										<a href="javascript:void(0)" class="alert-link">New bug
											submitted</a>
									</div>
								</li>
							</ul></li>
						<!-- END User Dropdown -->
					</ul>
					<!-- END Right Header Navigation -->
				</header>
				<!-- END Header -->

				<!-- Page content -->
				<div id="page-content">
					<!-- Table Styles Header -->
					<div class="content-header">
						<div class="header-section">
							<h1>
								<i class="gi gi-table"></i>ì°¨ëëª©ë¡<br> <small>íë²ì´ë¼ë
									ë°©ë¬¸í ì°¨ëì ëª©ë¡ìëë¤.</small>
							</h1>
						</div>
					</div>
					<ul class="breadcrumb breadcrumb-top">
						<li>Tables</li>
						<li><a href="">General</a></li>
					</ul>
					<!-- END Table Styles Header -->

					<!-- Table Styles Block -->
					<div class="block">
						<!-- Table Styles Title -->
						<div class="block-title">
							<h2>
								<strong>Table</strong> Styles
							</h2>
						</div>
						<!-- END Table Styles Title -->

						<!-- Table Styles Content -->
						<!-- Changing classes functionality initialized in js/pages/tablesGeneral.js -->
						<div class="table-options clearfix">
							<div class="btn-group btn-group-sm pull-right">
								<a href="javascript:void(0)" class="btn btn-primary active"
									id="style-striped" data-toggle="tooltip" title=".table-striped">Striped</a>
								<a href="javascript:void(0)" class="btn btn-primary"
									id="style-condensed" data-toggle="tooltip"
									title=".table-condensed">Condensed</a> <a
									href="javascript:void(0)" class="btn btn-primary"
									id="style-hover" data-toggle="tooltip" title=".table-hover">Hover</a>
							</div>
							<div class="btn-group btn-group-sm pull-left"
								data-toggle="buttons">
								<label id="style-default" class="btn btn-primary active"
									data-toggle="tooltip" title=".table"> <input
									type="radio" name="style-options"> Default
								</label> <label id="style-bordered" class="btn btn-primary"
									data-toggle="tooltip" title=".table-bordered"> <input
									type="radio" name="style-options"> Bordered
								</label> <label id="style-borderless" class="btn btn-primary"
									data-toggle="tooltip" title=".table-borderless"> <input
									type="radio" name="style-options"> Borderless
								</label>
							</div>
						</div>
						<div class="table-responsive">
							<!--
                                Available Table Classes:
                                    'table'             - basic table
                                    'table-bordered'    - table with full borders
                                    'table-borderless'  - table with no borders
                                    'table-striped'     - striped table
                                    'table-condensed'   - table with smaller top and bottom cell padding
                                    'table-hover'       - rows highlighted on mouse hover
                                    'table-vcenter'     - middle align content vertically
                                -->
							<table id="general-table"
								class="table table-striped table-vcenter">
								<thead>
									<tr>
										<th style="width: 80px;" class="text-center"><input
											type="checkbox"></th>
										<th style="width: 150px;" class="text-center">ì¬ì§</th>
										<th>ì°¨ëë²í¸</th>
										<th>ì°¨ì¢</th>
										<th>íµë³´ì¬ë¶</th>
										<th style="width: 150px;" class="text-center">Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-center"><input type="checkbox"
											id="checkbox1-1" name="checkbox1-1"></td>
										<td class="text-center"><img
											src="img/placeholders/avatars/avatar1.jpg" alt="avatar"
											class="img-circle"></td>
										<td><a href="page_car_profile.html">client1</a></td>
										<td>íë ì¹´ë ì¤</td>
										<td><a href="javascript:void(0)"
											class="label label-warning">Trial</a></td>
										<td class="text-center">
											<div class="btn-group btn-group-xs">
												<a href="javascript:void(0)" data-toggle="tooltip"
													title="Edit" class="btn btn-default"><i
													class="fa fa-pencil"></i></a> <a href="javascript:void(0)"
													data-toggle="tooltip" title="Delete" class="btn btn-danger"><i
													class="fa fa-times"></i></a>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-center"><input type="checkbox"
											id="checkbox1-2" name="checkbox1-2"></td>
										<td class="text-center"><img
											src="img/placeholders/avatars/avatar11.jpg" alt="avatar"
											class="img-circle"></td>
										<td><a href="page_car_profile.html">client2</a></td>
										<td>íë ê·¸ë ì ¸</td>
										<td><a href="javascript:void(0)"
											class="label label-success">VIP</a></td>
										<td class="text-center">
											<div class="btn-group btn-group-xs">
												<a href="javascript:void(0)" data-toggle="tooltip"
													title="Edit" class="btn btn-default"><i
													class="fa fa-pencil"></i></a> <a href="javascript:void(0)"
													data-toggle="tooltip" title="Delete" class="btn btn-danger"><i
													class="fa fa-times"></i></a>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-center"><input type="checkbox"
											id="checkbox1-3" name="checkbox1-3"></td>
										<td class="text-center"><img
											src="img/placeholders/avatars/avatar2.jpg" alt="avatar"
											class="img-circle"></td>
										<td><a href="page_car_profile.html">client3</a></td>
										<td>íë ìëí</td>
										<td><a href="javascript:void(0)" class="label label-info">Business</a></td>
										<td class="text-center">
											<div class="btn-group btn-group-xs">
												<a href="javascript:void(0)" data-toggle="tooltip"
													title="Edit" class="btn btn-default"><i
													class="fa fa-pencil"></i></a> <a href="javascript:void(0)"
													data-toggle="tooltip" title="Delete" class="btn btn-danger"><i
													class="fa fa-times"></i></a>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-center"><input type="checkbox"
											id="checkbox1-4" name="checkbox1-4"></td>
										<td class="text-center"><img
											src="img/placeholders/avatars/avatar8.jpg" alt="avatar"
											class="img-circle"></td>
										<td><a href="page_car_profile.html">client4</a></td>
										<td>BMW 720</td>
										<td><a href="javascript:void(0)"
											class="label label-success">VIP</a></td>
										<td class="text-center">
											<div class="btn-group btn-group-xs">
												<a href="javascript:void(0)" data-toggle="tooltip"
													title="Edit" class="btn btn-default"><i
													class="fa fa-pencil"></i></a> <a href="javascript:void(0)"
													data-toggle="tooltip" title="Delete" class="btn btn-danger"><i
													class="fa fa-times"></i></a>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-center"><input type="checkbox"
											id="checkbox1-5" name="checkbox1-5"></td>
										<td class="text-center"><img
											src="img/placeholders/avatars/avatar3.jpg" alt="avatar"
											class="img-circle"></td>
										<td><a href="page_car_profile.html">client5</a></td>
										<td>ìë³´ë  í¬ë£¨ì¦</td>
										<td><a href="javascript:void(0)"
											class="label label-primary">Personal</a></td>
										<td class="text-center">
											<div class="btn-group btn-group-xs">
												<a href="javascript:void(0)" data-toggle="tooltip"
													title="Edit" class="btn btn-default"><i
													class="fa fa-pencil"></i></a> <a href="javascript:void(0)"
													data-toggle="tooltip" title="Delete" class="btn btn-danger"><i
													class="fa fa-times"></i></a>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-center"><input type="checkbox"
											id="checkbox1-6" name="checkbox1-6"></td>
										<td class="text-center"><img
											src="img/placeholders/avatars/avatar9.jpg" alt="avatar"
											class="img-circle"></td>
										<td><a href="page_car_profile.html">client6</a></td>
										<td>ìë³´ë  ë§ë¦¬ë¶</td>
										<td><a href="javascript:void(0)" class="label label-info">Business</a></td>
										<td class="text-center">
											<div class="btn-group btn-group-xs">
												<a href="javascript:void(0)" data-toggle="tooltip"
													title="Edit" class="btn btn-default"><i
													class="fa fa-pencil"></i></a> <a href="javascript:void(0)"
													data-toggle="tooltip" title="Delete" class="btn btn-danger"><i
													class="fa fa-times"></i></a>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-center"><input type="checkbox"
											id="checkbox1-7" name="checkbox1-7"></td>
										<td class="text-center"><img
											src="img/placeholders/avatars/avatar1.jpg" alt="avatar"
											class="img-circle"></td>
										<td><a href="page_car_profile.html">client7</a></td>
										<td><a href="javascript:void(0)"
											class="label label-primary">Personal</a></td>
										<td class="text-center">
											<div class="btn-group btn-group-xs">
												<a href="javascript:void(0)" data-toggle="tooltip"
													title="Edit" class="btn btn-default"><i
													class="fa fa-pencil"></i></a> <a href="javascript:void(0)"
													data-toggle="tooltip" title="Delete" class="btn btn-danger"><i
													class="fa fa-times"></i></a>
											</div>
										</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6">
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
										<span></span>
									</label>
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

	<!-- Load and execute javascript code used only in this page -->
	<script src="js/pages/tablesGeneral.js"></script>
	<script>$(function(){ TablesGeneral.init(); });</script>
</body>
</html>