<cfinclude  template = "movie_header.cfm"  runOnce = "true">  
<cfparam  name="movie_id" default="v">  
     <cfset params = structKeyList(url)/>          
        <cfif params neq ''>
            <cfloop index="ix" list="#params#">
           
            </cfloop>
            <cfif ix eq 'tic_id'>           
                <cfset local.checkdata=toString(toBinary(tic_id))>                   
            </cfif>
        </cfif>
<cfparam  name="tic_id" default="v"> 
<cfset mid=toString(toBinary(movie_id))> 
  

<cfset movieData=application.obj1.movieAllDetails(mid)> 
<cfset castData=application.obj1.getCastDetails(mid)> 
<cfset crewData=application.obj1.getCrewDetails(mid)> 
        <!-- Main content -->
    <cfoutput query="movieData">
        <section class="container">
            <div class="col-sm-12">
                <div class="movie">
                    <h2 class="page-heading">#movie_name#</h2>                    
                    <div class="movie__info">
                        <div class="col-sm-4 col-md-3 movie-mobile">
                            <div class="movie__images">
                                <span class="movie__rating">5.0</span>
                                <img alt='' src="../../assets/poster/#movie_poster#">
                            </div>
                          </div>
                        </div>

                        <div class="col-sm-8 col-md-9">
                            <p class="movie__time">#movie_duration# min</p>
                            <p class="movie__option"><strong>Movie Name: </strong><a href="cvb">#movie_name#</a></p>
                            <p class="movie__option"><strong>Movie Language: </strong>#movie_language#</p>
                            <p class="movie__option"><strong>Category: </strong><a href=""></a>, <a href="">#genre#</a></p>
                            <p class="movie__option"><strong>Release date: </strong>#release_date#</p>
                            <p class="movie__option"><strong>Movie Format: </strong><a href="">#movie_format#</a></p>
                            <div class="movie__btns movie__btns--full">
                                <a href="" class="btn btn-md btn--warning">book a ticket for this movie</a>
                            </div>                       
                        </div>
                    </div>
           
                    <div class="clearfix"></div>
                    <h2 class="page-heading">Movie Description</h2>
                    <p class="movie__describe">#movie_des#</p>

                    <h2 class="page-heading">photos &amp; videos</h2>                    
                    <div class="movie__media">
                        <img alt='' src="../../assets/wallpaper/#movie_wallpaper#">                               
                    </div>
                   
                </div>
             </cfoutput> 
       <div class="clearfix"></div>
            <h2 class="page-heading">Cast Details</h2>
                <div class="col-sm-12">
                    <div class="row">                    
                            <cfoutput query="castData">      
                                <div class="col-xs-6 col-sm-3 cinema-item"> 
                                    <div class="cinema">
                                        <a href='single-cinema.html' class="cinema__images">
                                            <img alt='' src="../../assets/movies/actors/#actor_photo#" width="150px" height="150px">
                                           Role : #character_name#  
                                        </a>
                                           <a href="single-cinema.html" class="cinema-title">
                                              <p class="cinema-title">#actor_name#</p>                                                                                  
                                            </a>
                                    </div>
                                </div>     
                            </cfoutput> 
                        </div>
                    </div>
    
    <div class="clearfix"></div>
              <h2 class="page-heading">Crew Details</h2>
                <div class="col-sm-12">
                    <div class="row">                    
                            <cfoutput query="crewData">      
                                <div class="col-xs-6 col-sm-3 cinema-item"> 
                                    <div class="cinema">
                                        <a href='single-cinema.html' class="cinema__images">
                                            <img alt='' src="../../assets/movies/crew/#crew_photo#" width="150px" height="150px">
                                             #role_name#  
                                        </a>
                                           <a href="single-cinema.html" class="cinema-title">
                                              <p class="cinema-title">#person_name#</p>                                                                                  
                                            </a>
                                    </div>
                                </div>     
                            </cfoutput> 
                        </div>
                    </div>

                <h2 class="page-heading">showtime &amp; tickets</h2>
                <div class="choose-container">
                    <form id='select' class="select" method='get'>
                          <select name="select_item" id="select-sort" class="select__sort" tabindex="0">
                            <option value="1" selected='selected'>London</option>
                            <option value="2">New York</option>
                            <option value="3">Paris</option>
                            <option value="4">Berlin</option>
                            <option value="5">Moscow</option>
                            <option value="3">Minsk</option>
                            <option value="4">Warsawa</option>
                            <option value="5">Kiev</option>
                        </select>
                    </form>

                    <div class="datepicker">
                      <span class="datepicker__marker"><i class="fa fa-calendar"></i>Date</span>
                      <input type="text" id="datepicker"  class="datepicker__input">
                    </div>

                    
                    <div class="clearfix"></div>

                    <div class="time-select">
                        <div class="time-select__group group--first">
                            <div class="col-sm-4">
                                <p class="time-select__place">Cineworld</p>
                            </div>
                            <ul class="col-sm-8 items-wrap">
                                <li class="time-select__item" data-time='09:40'>09:40</li>
                                <li class="time-select__item" data-time='13:45'>13:45</li>
                                <li class="time-select__item active" data-time='15:45'>15:45</li>
                                <li class="time-select__item" data-time='19:50'>19:50</li>
                                <li class="time-select__item" data-time='21:50'>21:50</li>
                            </ul>
                        </div>

                        <div class="time-select__group">
                            <div class="col-sm-4">
                                <p class="time-select__place">Empire</p>
                            </div>
                            <ul class="col-sm-8 items-wrap">
                                <li class="time-select__item" data-time='10:45'>10:45</li>
                                <li class="time-select__item" data-time='16:00'>16:00</li>
                                <li class="time-select__item" data-time='19:00'>19:00</li>
                                <li class="time-select__item" data-time='21:15'>21:15</li>
                                <li class="time-select__item" data-time='23:00'>23:00</li>
                            </ul>
                        </div>

                        <div class="time-select__group">
                            <div class="col-sm-4">
                                <p class="time-select__place">Curzon</p>
                            </div>
                            <ul class="col-sm-8 items-wrap">
                                <li class="time-select__item" data-time='09:00'>09:00</li>
                                <li class="time-select__item" data-time='11:00'>11:00</li>
                                <li class="time-select__item" data-time='13:00'>13:00</li>
                                <li class="time-select__item" data-time='15:00'>15:00</li>
                                <li class="time-select__item" data-time='17:00'>17:00</li>
                                <li class="time-select__item" data-time='19:0'>19:00</li>
                                <li class="time-select__item" data-time='21:0'>21:00</li>
                                <li class="time-select__item" data-time='23:0'>23:00</li>
                                <li class="time-select__item" data-time='01:0'>01:00</li>
                            </ul>
                        </div>

                        <div class="time-select__group">
                            <div class="col-sm-4">
                                <p class="time-select__place">Odeon</p>
                            </div>
                            <ul class="col-sm-8 items-wrap">
                                <li class="time-select__item" data-time='10:45'>10:45</li>
                                <li class="time-select__item" data-time='16:00'>16:00</li>
                                <li class="time-select__item" data-time='19:00'>19:00</li>
                                <li class="time-select__item" data-time='21:15'>21:15</li>
                                <li class="time-select__item" data-time='23:00'>23:00</li>
                            </ul>
                        </div>

                        <div class="time-select__group group--last">
                            <div class="col-sm-4">
                                <p class="time-select__place">Picturehouse</p>
                            </div>
                            <ul class="col-sm-8 items-wrap">
                                <li class="time-select__item" data-time='17:45'>17:45</li>
                                <li class="time-select__item" data-time='21:30'>21:30</li>
                                <li class="time-select__item" data-time='02:20'>02:20</li>
                            </ul>
                        </div>
                    </div>  
                </div>
            </div>
        </div>

    </section>
    <footer class="footer-wrapper">
        <section class="container">
            <div class="clearfix">
                <p class="copy">&copy;Book MyMovie, 2022. All rights reserved.</p>
            </div>
        </section>             
    </footer>
        
 
    </div>
   <cfinclude  template = "movie_footer.cfm"  runOnce = "true">  

