<cfinclude  template = "header.cfm"  runOnce = "true">  
<cfset res=application.obj1.movieDetails()>    
<cfset movies_upcoming=application.obj1.upcomingMovieDetails()>  
<cfset show_res=application.show.activeShowDetails()>    
<cfset all_res=application.show.allMovieDetails()>                                              
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
                <div class="cinema-wrap">     
                    <div class="col-sm-12">
                        <div class="row">                    
                                <cfoutput query="show_res">  
                                    <cfset m_id=toBase64(#mid#)>      
                                    <div class="col-xs-6 col-sm-3 cinema-item"> 
                                        <div class="cinema">
                                            <a href='single_movie.cfm?movie_id=#m_id#' class="cinema__images">
                                                <img alt='' src="../../assets/poster/#movie_poster#" width="250px" height="150px">
                                                <span class="cinema-rating">Book</span>
                                            </a>
                                            <a href="single_movie.cfm?movie_id=#m_id#" class="cinema-title">#movie_name#
                                              <p class="cinema-title">#movie_language#</p>                                          
                                            </a>                                           
                                        </div>
                                    </div>     
                                </cfoutput> 
                            </div>
                        </div>
                    </div>  
                </div>
        <div class="pagination paginatioon--full">
            <a href='#' class="pagination__prev">prev</a>
            <a href='#' class="pagination__next">next</a>
        </div>
       <div class="clearfix"></div>

        <h2 id='target' class="page-heading heading--outcontainer">Upcoming cinema</h2> 
            <div class="cinema-wrap">     
                <div class="col-sm-12">
                    <div class="row">                    
                            <cfoutput query="movies_upcoming">      
                                <div class="col-xs-6 col-sm-3 cinema-item"> 
                                    <div class="cinema">
                                        <a href='single-cinema.html' class="cinema__images">
                                            <img alt='' src="../../assets/poster/#movie_poster#" width="150px" height="150px">
                                            <span class="cinema-rating">#release_date#</span> 
                                        </a>
                                           <a href="single-cinema.html" class="cinema-title">#movie_name#
                                              <p class="cinema-title">#movie_language#</p>                                          
                                            </a>                                 
                                    </div>
                                </div>     
                            </cfoutput> 
                        </div>
                    </div>
                </div>  
            </div>
             <!-- row--> 
        <div class="pagination paginatioon--full">         
            <a href='#' class="pagination__next">next</a>
        </div>
       <div class="clearfix"></div>   
            <h2 id='target' class="page-heading heading--outcontainer">All Movies</h2> 
            <div class="cinema-wrap">     
                <div class="col-sm-12">
                    <div class="row">                    
                            <cfoutput query="all_res">      
                                <div class="col-xs-6 col-sm-3 cinema-item"> 
                                    <div class="cinema">
                                        <a href='single-cinema.html' class="cinema__images">
                                            <img alt='' src="../../assets/poster/#movie_poster#" width="150px" height="150px">
                                            <span class="cinema-rating">#release_date#</span> 
                                        </a>
                                           <a href="single-cinema.html" class="cinema-title">#movie_name#
                                              <p class="cinema-title">#movie_language#</p>                                          
                                            </a>                                 
                                    </div>
                                </div>     
                            </cfoutput> 
                        </div>
                    </div>
                </div>  
            </div> 

     </section>
     <div class="pagination paginatioon--full">
            <a href='#' class="pagination__prev">prev</a>
            <a href='#' class="pagination__next">next</a>
    </div>
        
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
                    <p class="copy">&copy;Book MyMovie, 2022. All rights reserved.</p>
                </div>
            </div>
       </footer>
    </div>


<cfinclude  template = "footer.cfm"  runOnce = "true">  