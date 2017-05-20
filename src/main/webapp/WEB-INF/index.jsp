<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 9]>         <html class="no-js lt-ie10" lang="kor"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js" lang="kor"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">

        <title>ProUI - Responsive Bootstrap Admin Template</title>

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
                <h1 class="push-top-bottom text-light text-center"><strong>Pro</strong>UI</h1>
                <div class="inner">
                    <h3 class="text-light visible-lt-ie10"><strong>Loading..</strong></h3>
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
            <div id="page-container" class="sidebar-partial sidebar-visible-lg sidebar-no-animations">
                <!-- Main Sidebar -->
				<div id="sidebar">
				    <!-- Wrapper for scrolling functionality -->
				    <div id="sidebar-scroll">
				        <!-- Sidebar Content -->
				        <div class="sidebar-content">
				            <!-- Brand -->
				            <a href="index.html" class="sidebar-brand">
				                <i class="gi gi-flash"></i><span class="sidebar-nav-mini-hide"><strong>온누리</strong>모터스</span>
				            </a>
				            <!-- END Brand -->
				
				            <!-- User Info -->
				            <div class="sidebar-section sidebar-user clearfix sidebar-nav-mini-hide">
				                <div class="sidebar-user-avatar">
				                    <a href="page_ready_user_profile.html">
				                        <img src="img/placeholders/avatars/avatar2.jpg" alt="avatar">
				                    </a>
				                </div>
				                <div class="sidebar-user-name">관리자</div>
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
				                    <a href="index.html"><i class="gi gi-stopwatch sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">메인</span></a>
				                </li>
				                <li class="sidebar-header">
				                    <span class="sidebar-header-options clearfix"><a href="javascript:void(0)" data-toggle="tooltip" title="Quick Settings"><i class="gi gi-settings"></i></a><a href="javascript:void(0)" data-toggle="tooltip" title="Create the most amazing pages with the widget kit!"><i class="gi gi-lightbulb"></i></a></span>
				                    <span class="sidebar-header-title">관리</span>
				                </li>
				                <li>
				                    <a href="page_tables_general.html"><i class="gi gi-charts sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">차량목록</span></a>
				                </li>
				                <li>
				                    <a href="page_visit_history.html"><i class="gi gi-share_alt sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">방문내역</span></a>
				                </li>
				                <li>
				                    <a href="timeline.html"><i class="gi gi-stopwatch sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">타임라인</span></a>
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
				                    <a href="javascript:void(0)" data-toggle="tooltip" title="Refresh"><i class="gi gi-refresh"></i></a>
				                </span>
				                <span class="sidebar-header-title">활동</span>
				            </div>
				            <div class="sidebar-section sidebar-nav-mini-hide">
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
                            <li>
                                <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar');this.blur();">
                                    <i class="fa fa-bars fa-fw"></i>
                                </a>
                            </li>
                            <!-- END Main Sidebar Toggle Button -->

                            <!-- Template Options -->
                            <!-- Change Options functionality can be found in js/app.js - templateOptions() -->
                            <li class="dropdown">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="gi gi-settings"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-custom dropdown-options">
                                    <li class="dropdown-header text-center">Header Style</li>
                                    <li>
                                        <div class="btn-group btn-group-justified btn-group-sm">
                                            <a href="javascript:void(0)" class="btn btn-primary" id="options-header-default">Light</a>
                                            <a href="javascript:void(0)" class="btn btn-primary" id="options-header-inverse">Dark</a>
                                        </div>
                                    </li>
                                    <li class="dropdown-header text-center">Page Style</li>
                                    <li>
                                        <div class="btn-group btn-group-justified btn-group-sm">
                                            <a href="javascript:void(0)" class="btn btn-primary" id="options-main-style">Default</a>
                                            <a href="javascript:void(0)" class="btn btn-primary" id="options-main-style-alt">Alternative</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- END Template Options -->
                        </ul>
                        <!-- END Left Header Navigation -->

                        <!-- Search Form -->
                        <form action="page_ready_search_results.html" method="post" class="navbar-form-custom">
                            <div class="form-group">
                                <input type="text" id="top-search" name="top-search" class="form-control" placeholder="Search..">
                            </div>
                        </form>
                        <!-- END Search Form -->

                        <!-- Right Header Navigation -->
                        <ul class="nav navbar-nav-custom pull-right">
                            <!-- Alternative Sidebar Toggle Button -->
                            <li>
                                <!-- If you do not want the main sidebar to open when the alternative sidebar is closed, just remove the second parameter: App.sidebar('toggle-sidebar-alt'); -->
                                <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar-alt', 'toggle-other');this.blur();">
                                    <i class="gi gi-share_alt"></i>
                                    <span class="label label-primary label-indicator animation-floating">4</span>
                                </a>
                            </li>
                            <!-- END Alternative Sidebar Toggle Button -->

                            <!-- User Dropdown -->
                            <li class="dropdown">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="img/placeholders/avatars/avatar2.jpg" alt="avatar"> <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                    <li class="dropdown-header text-center">Account</li>
                                    <li>
                                        <a href="page_ready_timeline.html">
                                            <i class="fa fa-clock-o fa-fw pull-right"></i>
                                            <span class="badge pull-right">10</span>
                                            Updates
                                        </a>
                                        <a href="page_ready_inbox.html">
                                            <i class="fa fa-envelope-o fa-fw pull-right"></i>
                                            <span class="badge pull-right">5</span>
                                            Messages
                                        </a>
                                        <a href="page_ready_pricing_tables.html"><i class="fa fa-magnet fa-fw pull-right"></i>
                                            <span class="badge pull-right">3</span>
                                            Subscriptions
                                        </a>
                                        <a href="page_ready_faq.html"><i class="fa fa-question fa-fw pull-right"></i>
                                            <span class="badge pull-right">11</span>
                                            FAQ
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="page_ready_user_profile.html">
                                            <i class="fa fa-user fa-fw pull-right"></i>
                                            Profile
                                        </a>
                                        <!-- Opens the user settings modal that can be found at the bottom of each page (page_footer.html in PHP version) -->
                                        <a href="#modal-user-settings" data-toggle="modal">
                                            <i class="fa fa-cog fa-fw pull-right"></i>
                                            Settings
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="page_ready_lock_screen.html"><i class="fa fa-lock fa-fw pull-right"></i> Lock Account</a>
                                        <a href="login.html"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                                    </li>
                                    <li class="dropdown-header text-center">Activity</li>
                                    <li>
                                        <div class="alert alert-success alert-alt">
                                            <small>5 min ago</small><br>
                                            <i class="fa fa-thumbs-up fa-fw"></i> You had a new sale ($10)
                                        </div>
                                        <div class="alert alert-info alert-alt">
                                            <small>10 min ago</small><br>
                                            <i class="fa fa-arrow-up fa-fw"></i> Upgraded to Pro plan
                                        </div>
                                        <div class="alert alert-warning alert-alt">
                                            <small>3 hours ago</small><br>
                                            <i class="fa fa-exclamation fa-fw"></i> Running low on space<br><strong>18GB in use</strong> 2GB left
                                        </div>
                                        <div class="alert alert-danger alert-alt">
                                            <small>Yesterday</small><br>
                                            <i class="fa fa-bug fa-fw"></i> <a href="javascript:void(0)" class="alert-link">New bug submitted</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- END User Dropdown -->
                        </ul>
                        <!-- END Right Header Navigation -->
                    </header>
                    <!-- END Header -->

                    <!-- Page content -->
                    <div id="page-content">
                        <!-- Dashboard Header -->
                        <!-- For an image header add the class 'content-header-media' and an image as in the following example -->
                        <div class="content-header content-header-media">
                            <div class="header-section">
                                <div class="row">
                                    <!-- Main Title (hidden on small devices for the statistics to fit) -->
                                    <div class="col-md-4 col-lg-6 hidden-xs hidden-sm">
                                        <h1>Welcome <strong>Admin</strong><br><small>You Look Awesome!</small></h1>
                                    </div>
                                    <!-- END Main Title -->

                                    <!-- Top Stats -->
                                    <div class="col-md-8 col-lg-6">
                                        <div class="row text-center">
                                            <div class="col-xs-4 col-sm-3">
                                                <h2 class="animation-hatch">
                                                    $<strong>93.7k</strong><br>
                                                    <small><i class="fa fa-thumbs-o-up"></i> Great</small>
                                                </h2>
                                            </div>
                                            <div class="col-xs-4 col-sm-3">
                                                <h2 class="animation-hatch">
                                                    <strong>167k</strong><br>
                                                    <small><i class="fa fa-heart-o"></i> Likes</small>
                                                </h2>
                                            </div>
                                            <div class="col-xs-4 col-sm-3">
                                                <h2 class="animation-hatch">
                                                    <strong>101</strong><br>
                                                    <small><i class="fa fa-calendar-o"></i> Events</small>
                                                </h2>
                                            </div>
                                            <!-- We hide the last stat to fit the other 3 on small devices -->
                                            <div class="col-sm-3 hidden-xs">
                                                <h2 class="animation-hatch">
                                                    <strong>27&deg; C</strong><br>
                                                    <small><i class="fa fa-map-marker"></i> Sydney</small>
                                                </h2>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END Top Stats -->
                                </div>
                            </div>
                            <!-- For best results use an image with a resolution of 2560x248 pixels (You can also use a blurred image with ratio 10:1 - eg: 1000x100 pixels - it will adjust and look great!) -->
                            <img src="img/placeholders/headers/dashboard_header.jpg" alt="header image" class="animation-pulseSlow">
                        </div>
                        <!-- END Dashboard Header -->

                        <!-- Mini Top Stats Row -->
                        <div class="row">
                            <div class="col-sm-6 col-lg-3">
                                <!-- Widget -->
                                <a href="page_ready_article.html" class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-autumn animation-fadeIn">
                                            <i class="fa fa-file-text"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                            New <strong>Article</strong><br>
                                            <small>Mountain Trip</small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <!-- Widget -->
                                <a href="page_comp_charts.html" class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-spring animation-fadeIn">
                                            <i class="gi gi-usd"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                            + <strong>250%</strong><br>
                                            <small>Sales Today</small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <!-- Widget -->
                                <a href="page_ready_inbox.html" class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-fire animation-fadeIn">
                                            <i class="gi gi-envelope"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                            5 <strong>Messages</strong>
                                            <small>Support Center</small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <!-- Widget -->
                                <a href="page_comp_gallery.html" class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background-amethyst animation-fadeIn">
                                            <i class="gi gi-picture"></i>
                                        </div>
                                        <h3 class="widget-content text-right animation-pullDown">
                                            +30 <strong>Photos</strong>
                                            <small>Gallery</small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                            <div class="col-sm-6">
                                <!-- Widget -->
                                <a href="page_comp_charts.html" class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background animation-fadeIn">
                                            <i class="gi gi-wallet"></i>
                                        </div>
                                        <div class="pull-right">
                                            <!-- Jquery Sparkline (initialized in js/pages/index.js), for more examples you can check out http://omnipotent.net/jquery.sparkline/#s-about -->
                                            <span id="mini-chart-sales"></span>
                                        </div>
                                        <h3 class="widget-content animation-pullDown visible-lg">
                                            Latest <strong>Sales</strong>
                                            <small>Per hour</small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                            <div class="col-sm-6">
                                <!-- Widget -->
                                <a href="page_widgets_stats.html" class="widget widget-hover-effect1">
                                    <div class="widget-simple">
                                        <div class="widget-icon pull-left themed-background animation-fadeIn">
                                            <i class="gi gi-crown"></i>
                                        </div>
                                        <div class="pull-right">
                                            <!-- Jquery Sparkline (initialized in js/pages/index.js), for more examples you can check out http://omnipotent.net/jquery.sparkline/#s-about -->
                                            <span id="mini-chart-brand"></span>
                                        </div>
                                        <h3 class="widget-content animation-pullDown visible-lg">
                                            Our <strong>Brand</strong>
                                            <small>Popularity over time</small>
                                        </h3>
                                    </div>
                                </a>
                                <!-- END Widget -->
                            </div>
                        </div>
                        <!-- END Mini Top Stats Row -->

                        <!-- Widgets Row -->
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Timeline Widget -->
                                <div class="widget">
                                    <div class="widget-extra themed-background-dark">
                                        <div class="widget-options">
                                            <div class="btn-group btn-group-xs">
                                                <a href="javascript:void(0)" class="btn btn-default" data-toggle="tooltip" title="Edit Widget"><i class="fa fa-pencil"></i></a>
                                                <a href="javascript:void(0)" class="btn btn-default" data-toggle="tooltip" title="Quick Settings"><i class="fa fa-cog"></i></a>
                                            </div>
                                        </div>
                                        <h3 class="widget-content-light">
                                            Latest <strong>News</strong>
                                            <small><a href="page_ready_timeline.html"><strong>View all</strong></a></small>
                                        </h3>
                                    </div>
                                    <div class="widget-extra">
                                        <!-- Timeline Content -->
                                        <div class="timeline">
                                            <ul class="timeline-list">
                                                <li class="active">
                                                    <div class="timeline-icon"><i class="gi gi-airplane"></i></div>
                                                    <div class="timeline-time"><small>just now</small></div>
                                                    <div class="timeline-content">
                                                        <p class="push-bit"><a href="page_ready_user_profile.html"><strong>Jordan Carter</strong></a></p>
                                                        <p class="push-bit">The trip was an amazing and a life changing experience!!</p>
                                                        <p class="push-bit"><a href="page_ready_article.html" class="btn btn-xs btn-primary"><i class="fa fa-file"></i> Read the article</a></p>
                                                        <div class="row push">
                                                            <div class="col-sm-6 col-md-4">
                                                                <a href="img/placeholders/photos/photo1.jpg" data-toggle="lightbox-image">
                                                                    <img src="img/placeholders/photos/photo1.jpg" alt="image">
                                                                </a>
                                                            </div>
                                                            <div class="col-sm-6 col-md-4">
                                                                <a href="img/placeholders/photos/photo22.jpg" data-toggle="lightbox-image">
                                                                    <img src="img/placeholders/photos/photo22.jpg" alt="image">
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="active">
                                                    <div class="timeline-icon themed-background-fire themed-border-fire"><i class="fa fa-file-text"></i></div>
                                                    <div class="timeline-time"><small>5 min ago</small></div>
                                                    <div class="timeline-content">
                                                        <p class="push-bit"><a href="page_ready_user_profile.html"><strong>Administrator</strong></a></p>
                                                        <strong>Free courses</strong> for all our customers at A1 Conference Room - 9:00 <strong>am</strong> tomorrow!
                                                    </div>
                                                </li>
                                                <li class="active">
                                                    <div class="timeline-icon"><i class="gi gi-drink"></i></div>
                                                    <div class="timeline-time"><small>3 hours ago</small></div>
                                                    <div class="timeline-content">
                                                        <p class="push-bit"><a href="page_ready_user_profile.html"><strong>Ella Winter</strong></a></p>
                                                        <p class="push-bit"><strong>Happy Hour!</strong> Free drinks at <a href="javascript:void(0)">Cafe-Bar</a> all day long!</p>
                                                        <div id="gmap-timeline" class="gmap"></div>
                                                    </div>
                                                </li>
                                                <li class="active">
                                                    <div class="timeline-icon"><i class="fa fa-cutlery"></i></div>
                                                    <div class="timeline-time"><small>yesterday</small></div>
                                                    <div class="timeline-content">
                                                        <p class="push-bit"><a href="page_ready_user_profile.html"><strong>Patricia Woods</strong></a></p>
                                                        <p class="push-bit">Today I had the lunch of my life! It was delicious!</p>
                                                        <div class="row push">
                                                            <div class="col-sm-6 col-md-4">
                                                                <a href="img/placeholders/photos/photo23.jpg" data-toggle="lightbox-image">
                                                                    <img src="img/placeholders/photos/photo23.jpg" alt="image">
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="active">
                                                    <div class="timeline-icon themed-background-fire themed-border-fire"><i class="fa fa-smile-o"></i></div>
                                                    <div class="timeline-time"><small>2 days ago</small></div>
                                                    <div class="timeline-content">
                                                        <p class="push-bit"><a href="page_ready_user_profile.html"><strong>Administrator</strong></a></p>
                                                        To thank you all for your support we would like to let you know that you will receive free feature updates for life! You are awesome!
                                                    </div>
                                                </li>
                                                <li class="active">
                                                    <div class="timeline-icon"><i class="fa fa-pencil"></i></div>
                                                    <div class="timeline-time"><small>1 week ago</small></div>
                                                    <div class="timeline-content">
                                                        <p class="push-bit"><a href="page_ready_user_profile.html"><strong>Nicole Ward</strong></a></p>
                                                        <p class="push-bit">Consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor. Vestibulum ullamcorper, odio sed rhoncus imperdiet, enim elit sollicitudin orci, eget dictum leo mi nec lectus. Nam commodo turpis id lectus scelerisque vulputate.</p>
                                                        Integer sed dolor erat. Fusce erat ipsum, varius vel euismod sed, tristique et lectus? Etiam egestas fringilla enim, id convallis lectus laoreet at. Fusce purus nisi, gravida sed consectetur ut, interdum quis nisi. Quisque egestas nisl id lectus facilisis scelerisque? Proin rhoncus dui at ligula vestibulum ut facilisis ante sodales! Suspendisse potenti. Aliquam tincidunt sollicitudin sem nec ultrices. Sed at mi velit. Ut egestas tempor est, in cursus enim venenatis eget! Nulla quis ligula ipsum.
                                                    </div>
                                                </li>
                                                <li class="text-center">
                                                    <a href="javascript:void(0)" class="btn btn-xs btn-default">View more..</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- END Timeline Content -->
                                    </div>
                                </div>
                                <!-- END Timeline Widget -->
                            </div>
                            <div class="col-md-6">
                                <!-- Your Plan Widget -->
                                <div class="widget">
                                    <div class="widget-extra themed-background-dark">
                                        <div class="widget-options">
                                            <div class="btn-group btn-group-xs">
                                                <a href="javascript:void(0)" class="btn btn-default" data-toggle="tooltip" title="Edit Widget"><i class="fa fa-pencil"></i></a>
                                                <a href="javascript:void(0)" class="btn btn-default" data-toggle="tooltip" title="Quick Settings"><i class="fa fa-cog"></i></a>
                                            </div>
                                        </div>
                                        <h3 class="widget-content-light">
                                            Your <strong>VIP Plan</strong>
                                            <small><a href="page_ready_pricing_tables.html"><strong>Upgrade</strong></a></small>
                                        </h3>
                                    </div>
                                    <div class="widget-extra-full">
                                        <div class="row text-center">
                                            <div class="col-xs-6 col-lg-3">
                                                <h3>
                                                    <strong>35</strong> <small>/50</small><br>
                                                    <small><i class="fa fa-folder-open-o"></i> Projects</small>
                                                </h3>
                                            </div>
                                            <div class="col-xs-6 col-lg-3">
                                                <h3>
                                                    <strong>25</strong> <small>/100GB</small><br>
                                                    <small><i class="fa fa-hdd-o"></i> Storage</small>
                                                </h3>
                                            </div>
                                            <div class="col-xs-6 col-lg-3">
                                                <h3>
                                                    <strong>65</strong> <small>/1k</small><br>
                                                    <small><i class="fa fa-building-o"></i> Clients</small>
                                                </h3>
                                            </div>
                                            <div class="col-xs-6 col-lg-3">
                                                <h3>
                                                    <strong>10</strong> <small>k</small><br>
                                                    <small><i class="fa fa-envelope-o"></i> Emails</small>
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END Your Plan Widget -->

                                <!-- Charts Widget -->
                                <div class="widget">
                                    <div class="widget-advanced widget-advanced-alt">
                                        <!-- Widget Header -->
                                        <div class="widget-header text-center themed-background">
                                            <h3 class="widget-content-light text-left pull-left animation-pullDown">
                                                <strong>Sales</strong> &amp; <strong>Earnings</strong><br>
                                                <small>Last Year</small>
                                            </h3>
                                            <!-- Flot Charts (initialized in js/pages/index.js), for more examples you can check out http://www.flotcharts.org/ -->
                                            <div id="dash-widget-chart" class="chart"></div>
                                        </div>
                                        <!-- END Widget Header -->

                                        <!-- Widget Main -->
                                        <div class="widget-main">
                                            <div class="row text-center">
                                                <div class="col-xs-4">
                                                    <h3 class="animation-hatch"><strong>7.500</strong><br><small>Clients</small></h3>
                                                </div>
                                                <div class="col-xs-4">
                                                    <h3 class="animation-hatch"><strong>10.970</strong><br><small>Sales</small></h3>
                                                </div>
                                                <div class="col-xs-4">
                                                    <h3 class="animation-hatch">$<strong>31.230</strong><br><small>Earnings</small></h3>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END Widget Main -->
                                    </div>
                                </div>
                                <!-- END Charts Widget -->

                                <!-- Weather Widget -->
                                <div class="widget">
                                    <div class="widget-advanced widget-advanced-alt">
                                        <!-- Widget Header -->
                                        <div class="widget-header text-left">
                                            <!-- For best results use an image with at least 150 pixels in height (with the width relative to how big your widget will be!) - Here I'm using a 1200x150 pixels image -->
                                            <img src="img/placeholders/headers/widget5_header.jpg" alt="background" class="widget-background animation-pulseSlow">
                                            <h3 class="widget-content widget-content-image widget-content-light clearfix">
                                                <span class="widget-icon pull-right">
                                                    <i class="fa fa-sun-o animation-pulse"></i>
                                                </span>
                                                Weather <strong>Station</strong><br>
                                                <small><i class="fa fa-location-arrow"></i> The Mountain</small>
                                            </h3>
                                        </div>
                                        <!-- END Widget Header -->

                                        <!-- Widget Main -->
                                        <div class="widget-main">
                                            <div class="row text-center">
                                                <div class="col-xs-6 col-lg-3">
                                                    <h3>
                                                        <strong>10&deg;</strong> <small>C</small><br>
                                                        <small>Sunny</small>
                                                    </h3>
                                                </div>
                                                <div class="col-xs-6 col-lg-3">
                                                    <h3>
                                                        <strong>80</strong> <small>%</small><br>
                                                        <small>Humidity</small>
                                                    </h3>
                                                </div>
                                                <div class="col-xs-6 col-lg-3">
                                                    <h3>
                                                        <strong>60</strong> <small>km/h</small><br>
                                                        <small>Wind</small>
                                                    </h3>
                                                </div>
                                                <div class="col-xs-6 col-lg-3">
                                                    <h3>
                                                        <strong>5</strong> <small>km</small><br>
                                                        <small>Visibility</small>
                                                    </h3>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END Widget Main -->
                                    </div>
                                </div>
                                <!-- END Weather Widget-->

                                <!-- Advanced Gallery Widget -->
                                <div class="widget">
                                    <div class="widget-advanced">
                                        <!-- Widget Header -->
                                        <div class="widget-header text-center themed-background-dark">
                                            <h3 class="widget-content-light clearfix">
                                                Awesome <strong>Gallery</strong><br>
                                                <small>4 Photos</small>
                                            </h3>
                                        </div>
                                        <!-- END Widget Header -->

                                        <!-- Widget Main -->
                                        <div class="widget-main">
                                            <a href="page_comp_gallery.html" class="widget-image-container">
                                                <span class="widget-icon themed-background"><i class="gi gi-picture"></i></span>
                                            </a>
                                            <div class="gallery gallery-widget" data-toggle="lightbox-gallery">
                                                <div class="row">
                                                    <div class="col-xs-6 col-sm-3">
                                                        <a href="img/placeholders/photos/photo15.jpg" class="gallery-link" title="Image Info">
                                                            <img src="img/placeholders/photos/photo15.jpg" alt="image">
                                                        </a>
                                                    </div>
                                                    <div class="col-xs-6 col-sm-3">
                                                        <a href="img/placeholders/photos/photo5.jpg" class="gallery-link" title="Image Info">
                                                            <img src="img/placeholders/photos/photo5.jpg" alt="image">
                                                        </a>
                                                    </div>
                                                    <div class="col-xs-6 col-sm-3">
                                                        <a href="img/placeholders/photos/photo6.jpg" class="gallery-link" title="Image Info">
                                                            <img src="img/placeholders/photos/photo6.jpg" alt="image">
                                                        </a>
                                                    </div>
                                                    <div class="col-xs-6 col-sm-3">
                                                        <a href="img/placeholders/photos/photo13.jpg" class="gallery-link" title="Image Info">
                                                            <img src="img/placeholders/photos/photo13.jpg" alt="image">
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END Widget Main -->
                                    </div>
                                </div>
                                <!-- END Advanced Gallery Widget -->
                            </div>
                        </div>
                        <!-- END Widgets Row -->
                    </div>
                    <!-- END Page Content -->

                    <!-- Footer -->
                    <footer class="clearfix">
                        <div class="pull-right">
                            Crafted with <i class="fa fa-heart text-danger"></i> by <a href="http://goo.gl/vNS3I" target="_blank">pixelcave</a>
                        </div>
                        <div class="pull-left">
                            <span id="year-copy"></span> &copy; <a href="http://goo.gl/TDOSuC" target="_blank">ProUI 3.7</a>
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
        <div id="modal-user-settings" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header text-center">
                        <h2 class="modal-title"><i class="fa fa-pencil"></i> Settings</h2>
                    </div>
                    <!-- END Modal Header -->

                    <!-- Modal Body -->
                    <div class="modal-body">
                        <form action="index.html" method="post" enctype="multipart/form-data" class="form-horizontal form-bordered" onsubmit="return false;">
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
                                        <input type="email" id="user-settings-email" name="user-settings-email" class="form-control" value="admin@example.com">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="user-settings-notifications">Email Notifications</label>
                                    <div class="col-md-8">
                                        <label class="switch switch-primary">
                                            <input type="checkbox" id="user-settings-notifications" name="user-settings-notifications" value="1" checked>
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>Password Update</legend>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="user-settings-password">New Password</label>
                                    <div class="col-md-8">
                                        <input type="password" id="user-settings-password" name="user-settings-password" class="form-control" placeholder="Please choose a complex one..">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="user-settings-repassword">Confirm New Password</label>
                                    <div class="col-md-8">
                                        <input type="password" id="user-settings-repassword" name="user-settings-repassword" class="form-control" placeholder="..and confirm it!">
                                    </div>
                                </div>
                            </fieldset>
                            <div class="form-group form-actions">
                                <div class="col-xs-12 text-right">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-sm btn-primary">Save Changes</button>
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

        <!-- Google Maps API Key (you will have to obtain a Google Maps API key to use Google Maps) -->
        <!-- For more info please have a look at https://developers.google.com/maps/documentation/javascript/get-api-key#key -->
        <script src="//maps.googleapis.com/maps/api/js?key="></script>
        <script src="js/helpers/gmaps.min.js"></script>

        <!-- Load and execute javascript code used only in this page -->
        <script src="js/pages/index.js"></script>
        <script>$(function(){ Index.init(); });</script>
    </body>
</html>