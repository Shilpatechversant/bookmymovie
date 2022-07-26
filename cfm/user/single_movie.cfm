<cfinclude  template = "movie_header.cfm"  runOnce = "true">  
<cfparam  name="movie_id" default="v">  
 <cfset local.mid=toString(toBinary(movie_id))> 
     <cfset local.params = structKeyList(url)/>  
        <cfif local.params neq ''>
            <cfloop index="ix" list="#local.params#">
                <cfif ix eq 'tic_id'>           
                    <cfset local.checkdata=toString(toBinary(tic_id))> 
                <cfelse>
                       <cfset local.checkdata= DateFormat(Now(),"yyyy-mm-dd")>
                </cfif>
            </cfloop>
        </cfif>
<cfset movieData=application.obj1.movieAllDetails(local.mid)> 
<cfset castData=application.obj1.getCastDetails(local.mid)> 
<cfset crewData=application.obj1.getCrewDetails(local.mid)> 
<cfset showResult=application.show.getShowDetailsByMovie(local.mid,local.checkdata)>   

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
                        <img alt='' src="../../assets/wallpaper/#movie_wallpaper#" width="150px" height="150px">                               
                    </div>
             </cfoutput> 
               <div class="clearfix"></div>
                <h2 class="page-heading">showtime &amp; tickets</h2>
                <div class="choose-container">
                    <cfoutput query="showResult">
                        <div class="clearfix"></div>
                        <div class="time-select">
                            <div class="time-select__group group--first">
                                <div class="col-sm-4">
                                    <p class="time-select__place">#theatre_name# - #screen_name#</p>
                                </div>
                                <ul class="col-sm-8 items-wrap">
                                    <li class="time-select__item" data-time='#show_time#'>#show_time#</li>
                                </ul>
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

