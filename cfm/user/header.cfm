<!doctype html>
<html>
    <head>
        <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Book Mymovie</title>
        <meta name="description" content="Book MyMovie">
        <meta name="keywords" content="Easy Booking">
        <meta name="author" content="Book MyMovie">
        <!-- Mobile Specific Metas-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">
        <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,700' rel='stylesheet' type='text/css'>
        <!-- Open Sans -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:800italic' rel='stylesheet' type='text/css'>
        <!-- Stylesheets -->
        <!-- Mobile menu -->
        <link href="../../resources/user/css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="../../resources/user/css/external/jquery.selectbox.css" rel="stylesheet" />
        <!-- Slider Revolution CSS Files -->
        <link rel="stylesheet" type="text/css" href="../../resources/user/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="../../resources/user/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="../../resources/user/revolution/css/navigation.css">
        <!-- Custom -->
        <link href="../../resources/user/css/style.css?v=1" rel="stylesheet" />
        <!-- Modernizr -->
        <script src="../../resources/user/js/external/modernizr.custom.js"></script>
         <link href="../../resources/js/select/css/select2.min.css" rel="stylesheet" /> 
    </head>
    <body>
        <div class="wrapper">
            <!-- Banner -->
            <div class="banner-top">
                <img alt='top banner' src="../../resources/user/images/banners/bra.jpg">
            </div>
            <!-- Header section -->
            <header class="header-wrapper header-wrapper--home">
                <div class="container">
                    <!-- Logo link-->
                    <a href='index.html' class="logo">
                        <img alt='logo' src="../../resources/user/images/logo.png">
                    </a>
                    <!-- Main website navigation-->
                    <nav id="navigation-box">
                        <!-- Toggle for mobile menu mode -->
                        <a href="#" id="navigation-toggle">
                            <span class="menu-icon">
                                <span class="icon-toggle" role="button" aria-label="Toggle Navigation">
                                    <span class="lines"></span>
                                </span>
                            </span>
                        </a>
                        <!-- Link navigation -->
                        <ul id="navigation">
                            <li>
                                <span class="sub-nav-toggle plus"></span>
                                <a href="welcome.cfm">Home</a>
                            </li>
                            <li>
                                <span class="sub-nav-toggle plus"></span>
                                <a href="show_list.cfm">Shows</a>
                            </li>
                            <li>
                                <span class="sub-nav-toggle plus"></span>
                                <a href="about_us.cfm">About Us</a>
                            </li>
                            <li>
                                <span class="sub-nav-toggle plus"></span>
                                <a href="contact_us.cfm">Contact us</a>
                            </li>
                            <cfif StructKeyExists(session, "userId" )>
                                <li>
                                    <span class="sub-nav-toggle plus"></span>
                                    <a href="../../cfc/login.cfc?method=webLogout&id=logout">Logout</a>
                                </li>
                            <cfelse>
                                <li>
                                    <span class="sub-nav-toggle plus"></span>
                                    <a href="register.cfm">Register</a>
                                </li>
                                <li>
                                    <span class="sub-nav-toggle plus"></span>
                                    <a href="login.cfm">Login</a>
                                </li>
                            </cfif>
                            <cfif StructKeyExists(session, "userId" )>
                                <!-- Additional header buttons / Auth and direct link to booking-->                          
                                <div class="control-panel">
                                    <div class="auth auth--home">
                                        <div class="auth__show">
                                            <span class="auth__image">
                                                <img alt="" src="../../resources/user/images/client-photo/auth.png">
                                            </span>
                                        </div>
                                        <a href="#" class="btn btn--sign btn--singin"> me </a>&nbsp;&nbsp;
                                        <ul class="auth__function">
                                            <li>
                                                <a href="view_bookings.cfm" class="auth__function-item">View Bookings</a>
                                            </li>
                                            <li>
                                                <a href="update_password.cfm" class="auth__function-item">Update Password</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </cfif>
                        </ul>
                    </nav>
                </div>
            </header>