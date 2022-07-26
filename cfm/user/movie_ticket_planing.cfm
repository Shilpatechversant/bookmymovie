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
<cfset showResult=application.show.getShowDetailsByMovie(local.mid,local.checkdata)>   

        <!-- Main content -->
    <cfoutput query="movieData">
        <section class="container">
            <div class="col-sm-12">
                <div class="movie">
                  <h2 class="page-heading">#movie_name#</h2>                    
                    <div class="movie__info">
                        <div class="col-sm-12  movie-mobile">
                            <div class="movie__images">
                                <span class="movie__rating">5.0</span>
                                <img alt='' src="../../assets/wallpaper/#movie_wallpaper#" width="1200px;" height="300px;">
                            </div>
                          </div>
                        </div>

                        <div class="col-sm-8 col-md-9">
                            <p class="movie__time">#movie_duration# min</p>
                            <p class="movie__option"><strong>Movie Name: </strong><a href="cvb">#movie_name#</a></p>
                            <p class="movie__option"><strong>Movie Language: </strong>#movie_language#</p>
                         
                        </div>
                    </div>
           
                    <div class="clearfix"></div>
                        
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
                                  <button class="time-select__item" onclick="return check_login();">#show_time#</button></li>
                                </ul>
                            </div>
                        </div>
                     </cfoutput>   
       <div class="clearfix"></div>
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

