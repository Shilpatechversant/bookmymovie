<cfinclude  template = "header.cfm"  runOnce = "true">  
<cfset res=application.obj1.movieDetails()>    
<cfset res1=application.obj1.upcomingMovieDetails()>                                                                
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
                            <a href="#">Home</a>
                   
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="page-elements.html">Shows</a>                   
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="page-elements.html">About Us</a>                  
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="gallery-four.html">Contact us</a>                      
                        </li>
         
                        
                               </ul>
                        </li>
                    </ul>
                </nav>
                
                <!-- Additional header buttons / Auth and direct link to booking-->
                <div class="control-panel">
                    <div class="auth auth--home">
                      <div class="auth__show">
                        <span class="auth__image">
                          <img alt="" src="../../resources/user/images/client-photo/auth.png">
                        </span>
                      </div>
                      <a href="#" class="btn btn--sign btn--singin">
                          me
                      </a>
                        <ul class="auth__function">
                            <li><a href="#" class="auth__function-item">Watchlist</a></li>
                            <li><a href="#" class="auth__function-item">Booked tickets</a></li>
                            <li><a href="#" class="auth__function-item">Discussion</a></li>
                            <li><a href="#" class="auth__function-item">Settings</a></li>
                        </ul>

                    </div>
                    <a href="#" class="btn btn-md btn--warning btn--book btn-control--home login-window">Book a ticket</a>
                </div>

            </div>
        </header>

        <!-- Slider -->
        <div class="bannercontainer rev_slider_wrapper">
 
            <!-- the ID here will be used in the JavaScript below to initialize the slider -->
            <div id="rev_slider_1" class="banner rev_slider">
 
                <!-- BEGIN SLIDES LIST -->
                <ul>
                    <!-- SLIDE 1 -->
                    <li data-transition="fade" class="slide" data-title='Rush.'>
 
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="../../resources/user/images/slides/first-slide.jpg">

                        <div class="tp-caption slide__name margin-slider" 
                             data-x="right" 
                             data-y="80"
                             data-frames='[{
                               "delay":300,
                               "split":"chars",
                               "splitdelay":0.1,
                               "speed":700,
                               "frame":"0",
                               "from":"x:[-100%];opacity:0;",
                               "mask":"x:0px;y:0px;s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power4.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            RUSH
                        </div>

                        <div class="tp-caption n slide__time margin-slider" 
                            data-x="right" 
                            data-hoffset='250' 
                            data-y="186" 
                            data-frames='[{
                               "delay":1200,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            From
                        </div>

                        <div class="tp-caption  slide__date margin-slider" 
                             data-x="right" 
                             data-hoffset='149' 
                             data-y="186" 
                             data-frames='[{
                               "delay":1700,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             October 18
                        </div>
                        <div class="tp-caption slide__time margin-slider" 
                             data-x="right" 
                             data-hoffset='120' 
                             data-y="186" 
                             data-frames='[{
                               "delay":1200,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             till
                        </div>
                        <div class="tp-caption slide__date margin-slider" 
                             data-x="right" 
                             data-y="186" 
                             data-frames='[{
                               "delay":1700,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             November 01
                        </div>
                        <div class="tp-caption slide__text margin-slider text-right" 
                             data-x="right" 
                             data-y="250"
                             data-frames='[{
                               "delay":2300,
                               "speed":400,
                               "frame":"0",
                               "from":"y:100px;skX:50px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             Two-time Academy Award winner Ron Howard, teams once again with fellow two-time Academy<br> Award nominee, writer Peter Morgan , on Rush, a spectacular big-screen re-creation of the merciless<br> 1970s rivalry between James Hunt and Niki Lauda
                        </div>
                        <div class="tp-caption margin-slider" 
                             data-x="right" 
                             data-y="324"
                             data-frames='[{
                               "delay":2600,
                               "speed":400,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             <a href="#" class="slide__link">check out cinemas &amp; time</a>
                        </div>
 
                    </li>
 
                    <!-- SLIDE 2 -->
                    <li data-transition="fade" class="slide" data-title='Travel worldwide. Create trip film.'>
 
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="../../resources/user/images/bg-video.jpg">
                        <div class="rs-background-video-layer" 
                             data-forcerewind="on" 
                             data-volume="mute" 
                             data-videowidth="100%" 
                             data-videoheight="100%" 
                             data-videomp4="../../resources/user/video/TravelIs.mp4" 
                             data-videopreload="auto" 
                             data-videoloop="loop" 
                             data-forceCover="1" 
                             data-aspectratio="16:9" 
                             data-autoplay="true" 
                             data-autoplayonlyfirsttime="false" 
                        ></div>
                        <div class="tp-caption slide__name slide__name--smaller" 
                             data-x="center" 
                             data-y="160" 

                             data-splitin="chars"
                             data-elementdelay="0.1"

                             data-speed="700" 
                             data-start="1400" 
                             data-easing="easeOutBack"

                             data-frames='[{
                               "delay":1400,
                               "speed":700,
                               "split":"chars",
                               "splitdelay":0.1,
                               "frame":"0",
                               "from":"opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            Cinema, Entertainment,Easy Booking.
                        </div>
                        <div class="tp-caption slide__time" 
                             data-x="center"
                             data-hoffset='-115' 
                             data-y="242" 
                             data-frames='[{
                               "delay":1800,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             From
                        </div>
                        <div class="tp-caption slide__date position-center postion-place--two lfb ltb" 
                             data-x="center"                              
                             data-hoffset='-50'                                       
                             data-y="242" 
                             data-frames='[{
                               "delay":2200,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             April 18 
                        </div>
                        <div class="tp-caption slide__time" 
                             data-x="center" 
                             data-hoffset='5' 
                             data-y="242" 
                             data-frames='[{
                               "delay":1800,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             - till
                        </div>
                        <div class="tp-caption slide__date" 
                             data-x="center"                              
                             data-hoffset='60'
                             data-y="242" 
                             data-frames='[{
                               "delay":2200,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             May 01
                        </div>

                        <div class="tp-caption slider-wrap-btn" 
                             data-x="center"
                             data-y="310" 
                             data-frames='[{
                               "delay":2800,
                               "speed":400,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             <a href="#" class="btn btn-md btn--danger btn--wide slider--btn">learn more</a>
                        </div>
                    </li>

                    <!-- SLIDE 3 -->
                    <li data-transition="fade" class="slide" data-title='Stop wishing. Start doing.'>
 
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="../../resources/user/images/slides/next-slide.jpg">
                        <div class="tp-caption slide__name slide__name--smaller slide__name--specific" 
                          data-x="center" 
                          data-y="160" 
                          data-frames='[{
                               "delay":1400,
                               "speed":700,
                               "frame":"0",
                               "from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;",
                               "mask":"x:0px;y:[100%];s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            Stop <span class="highlight">wishing.</span> Start <span class="highlight">doing.</span> 
                        </div>

                        <div class="tp-caption slide__descript" 
                            data-x="center" 
                            data-y="240"
                            data-frames='[{
                               "delay":2000,
                               "speed":500,
                               "frame":"0",
                               "from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;",
                               "mask":"x:0px;y:[100%];s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            find your best match movie with Book My Movie
                        </div>

                        <div class="tp-caption slider-wrap-btn" 
                            data-x="center" 
                            data-y="310" 
                            data-frames='[{
                               "delay":2500,
                               "speed":500,
                               "frame":"0",
                               "from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;",
                               "mask":"x:0px;y:[100%];s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            <a href="#" class="btn btn-md btn--danger slider--btn">check out movies</a>
                        </div>
                    </li>

 
                </ul><!-- END SLIDES LIST -->
 
            </div><!-- END SLIDER CONTAINER -->
 
        </div><!-- END SLIDER CONTAINER WRAPPER -->
        <!--end slider -->
        

                                                                
                 
        <!-- Main content -->
        <section class="container">
            <div class="movie-best">
                 <div class="col-sm-10 col-sm-offset-1 movie-best__rating">Book Your Movie</div>
                 <div class="col-sm-12 change--col">
                     <div class="movie-beta__item ">
                        <img alt='' src="../../resources/user/images/movie/movie-sample1.jpg">
                         <span class="best-rate">5.0</span>

                         <ul class="movie-beta__info">
                             <li><span class="best-voted">71 people voted today</span></li>
                             <li>
                                <p class="movie__time">169 min</p>
                                <p>Adventure | Drama | Fantasy </p>
                                <p>38 comments</p>
                             </li>
                             <li class="last-block">
                                 <a href="movie-page-left.html" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
                     <div class="movie-beta__item second--item">
                         <img alt='' src="../../resources/user/images/movie/movie-sample2.jpg">
                         <span class="best-rate">5.0</span>

                         <ul class="movie-beta__info">
                             <li><span class="best-voted">71 people voted today</span></li>
                             <li>
                                <p class="movie__time">169 min</p>
                                <p>Adventure | Drama | Fantasy </p>
                                <p>38 comments</p>
                             </li>
                             <li class="last-block">
                                 <a href="movie-page-left.html" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
                     <div class="movie-beta__item third--item">
                         <img alt='' src="../../resources/user/images/movie/movie-sample3.jpg">
                         <span class="best-rate">5.0</span>

                         <ul class="movie-beta__info">
                             <li><span class="best-voted">71 people voted today</span></li>
                             <li>
                                <p class="movie__time">169 min</p>
                                <p>Adventure | Drama | Fantasy </p>
                                <p>38 comments</p>
                             </li>
                             <li class="last-block">
                                 <a href="movie-page-left.html" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
                     <div class="movie-beta__item hidden-xs">
                         <img alt='' src="../../resources/user/images/movie/movie-sample4.jpg">
                         <span class="best-rate">5.0</span>

                         <ul class="movie-beta__info">
                             <li><span class="best-voted">71 people voted today</span></li>
                             <li>
                                <p class="movie__time">169 min</p>
                                <p>Adventure | Drama | Fantasy </p>
                                <p>38 comments</p>
                             </li>
                             <li class="last-block">
                                 <a href="movie-page-left.html" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
                     <div class="movie-beta__item hidden-xs hidden-sm">
                         <img alt='' src="../../resources/user/images/movie/movie-sample5.jpg">
                         <span class="best-rate">5.0</span>

                         <ul class="movie-beta__info">
                             <li><span class="best-voted">71 people voted today</span></li>
                             <li>
                                <p class="movie__time">169 min</p>
                                <p>Adventure | Drama | Fantasy </p>
                                <p>38 comments</p>
                             </li>
                             <li class="last-block">
                                 <a href="movie-page-left.html" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
                     <div class="movie-beta__item hidden-xs hidden-sm">
                         <img alt='' src="../../resources/user/images/movie/movie-sample6.jpg">
                         <span class="best-rate">5.0</span>

                         <ul class="movie-beta__info">
                             <li><span class="best-voted">71 people voted today</span></li>
                             <li>
                                <p class="movie__time">169 min</p>
                                <p>Adventure | Drama | Fantasy </p>
                                <p>38 comments</p>
                             </li>
                             <li class="last-block">
                                 <a href="movie-page-left.html" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
                 </div>
                <div class="col-sm-10 col-sm-offset-1 movie-best__check">check all movies now playing</div>
            </div>
       
            </div>
        <!-- Search bar -->
            <div class="clearfix"></div>
    

                    <!-- Search bar -->
        <div class="search-wrapper">
        <br>
            <div class="container container--add">
                <form id='search-form' method='get' class="search">
                    <input type="text" class="search__field" placeholder="Search">
                    <select name="sorting_item" id="search-sort" class="search__sort" tabindex="0">
                        <option value="1" selected='selected'>By title</option>
                        <option value="2">By year</option>
                        <option value="3">By producer</option>
                        <option value="4">By title</option>
                        <option value="5">By year</option>
                    </select>
                    <button type='submit' class="btn btn-md btn--danger search__button">search a movie</button>
                </form>
            </div>
        </div>

        <div class="clearfix"></div>
            <h2 id='target' class="page-heading heading--outcontainer">Now in the cinema</h2>          
            <cfoutput query="res">                   
                <div class="col-sm-4 similar-wrap col--remove">
                    <div class="post post--preview post--preview--wide">
                        <!-- Movie variant with time -->                             
                            <div class="movie movie--test movie--test--dark movie--test--left">
                                <div class="movie__images">
                                    <a href="movie-page-left.html" class="movie-beta__link">
                                        <img alt='' src="../../assets/poster/#movie_poster#">
                                    </a>
                                </div>
                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">#movie_name# </a>
                                    <p class="movie__option"><a href="">#movie_language#</a></p>  
                                    <p class="movie__time">#movie_duration#</p>                                                                       
                                </div>
                            </div>
                        </div>                      
                         <!-- Movie variant with time -->   
                    </div>
            </cfoutput>            
             <!-- row--> 
            <div class="col-sm-12">
                <h2 class="page-heading">Upcoming cinema</h2>
             <cfoutput query="res1">  
                <div class="col-sm-4 similar-wrap col--remove">
                    <div class="post post--preview post--preview--wide">
                        <!-- Movie variant with time -->                             
                            <div class="movie movie--test movie--test--dark movie--test--left">
                                <div class="movie__images">
                                    <a href="movie-page-left.html" class="movie-beta__link">
                                        <img alt='' src="../../assets/poster/#movie_poster#">
                                    </a>
                                </div>
                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">#movie_name# </a>
                                    <p class="movie__option"><a href="">#movie_language#</a></p>  
                                    <p class="movie__time">#movie_duration#</p>                                                                       
                                </div>
                            </div>
                        </div>                      
                         <!-- Movie variant with time -->   
                    </div>
                </div>
        </cfoutput>  
          
            </div>
                
        </section>
        
        <div class="clearfix"></div>

        <footer class="footer-wrapper">    
            <div class="contact-form-wrapper">
                <div class="container">
                    <div class="col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
                        <form id='contact-form' class="form row" method='post' novalidate="" action="send.php">
                            <p class="form__title">Subscribe To Book My Ticket</p>
                            <div class="col-sm-6">
                                <input type='text' placeholder='Your name' name='user-name' class="form__name">
                            </div>
                            <div class="col-sm-6">
                                <input type='email' placeholder='Your email' name='user-email' class="form__mail">
                            </div>
                            <div class="col-sm-12">
                                <textarea placeholder="Your message" name="user-message" class="form__message"></textarea>
                            </div>
                            <button type="submit" class='btn btn-md btn--danger'>send message</button>
                        </form>
                    </div>
                </div>
            </div>  
                
            <div class="col-xs-12 col-md-6">
                <div class="footer-info">
                    <div class="clearfix"></div>
                    <p class="copy">&copy;Book MyMovie, 2013. All rights reserved.</p>
                </div>
            </div>
       </footer>
    </div>


<cfinclude  template = "footer.cfm"  runOnce = "true">  