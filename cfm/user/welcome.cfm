<cfinclude  template = "header.cfm"  runOnce = "true">  
<cfset res=application.obj1.movieDetails()>    
<cfset movies_upcoming=application.obj1.upcomingMovieDetails()>  
<cfset show_res=application.show.activeShowDetails()>    
<cfset all_res=application.show.allMovieDetails()>                                             
 <cfinclude  template = "slider.cfm"  runOnce = "true">                
    <!-- Main content -->
    <section class="container">
        <cfinclude  template = "movie_best.cfm"  runOnce = "true">      
    </div> 
    <div class="clearfix"></div>
    <!-- Search bar -->
    <div class="search-wrapper">        
        <div class="container container--add">
             <div class="clearfix"></div>
            <form id='search-form' action="" method="post"><br>  
                <select class="js-example-basic-single col-md-12 form-control" name="movie_search">
                    <option value="default"><h3>Select movie<h3></option>
                    <cfloop query="show_res">
                        <option value=<cfoutput>#mid#</cfoutput>> 
                            <cfoutput>#movie_name#</cfoutput>
                        </option>
                    </cfloop>                 
                </select>      
        </div>
    </div>
    <div class="col-sm-offset-1 pull-left">
        <button type="submit" name="submit" value="Submit" class="btn btn-md btn--danger search__button">SEARCH FOR A MOVIE</button>
    </div> 
            </form
    <div class="clearfix"></div>
    <cfif structKeyExists(form,'Submit')> 
            <cfset local.kid=form.movie_search>
            <cfset searchData=application.obj1.getMovieById(local.kid)>   
        <div class="cinema-wrap">     
            <div class="col-sm-10 col-sm-offset-1">
                 <h2 class="page-heading">Search Result</h2>
               <div class="row">  
                <cfoutput query="searchData">  
                    <cfset local.s_id=toBase64(#id#)>   
                    <!-- Movie preview item -->
                    <div class="movie movie--preview movie--full release">
                        <div class="col-sm-6 col-md-2 col-lg-2">
                                <div class="movie__images">
                                    <img alt='' src="../../assets/poster/#searchData.movie_poster#">
                                </div>
                                <div class="movie__feature">                                 
                                    <a href="#movie_trailer#" class="movie__feature-item movie__feature--video">**</a>
                                    <a href="" class="movie__feature-item movie__feature--photo">**</a>
                                </div>
                        </div>
                        <div class="col-sm-9 col-md-10 col-lg-10 movie__about">
                                <a href='single_movie.cfm?movie_id=#local.s_id#' class="movie__title link--huge">#movie_name#</a>
                                <p class="movie__time">#movie_duration# min</p>
                                <p class="movie__option"><strong>Movie Language: </strong><a href="">#movie_language#</a></p>
                                <p class="movie__option"><strong>Category: </strong><a href="">#genre#</a></p>
                                <p class="movie__option"><strong>Release date: </strong>#release_date#</p>  
                                <p class="movie__option"><strong>Genere</strong>#genre#</p>                        
                                                   
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </cfoutput>
                </div>
            </div>
        </div>
            <!-- search movie preview item --> 
        </cfif>  
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
                                        <a href='single_movie.cfm?movie_id=#m_id#' class="cinema__images">
                                            <img alt='' src="../../assets/poster/#movie_poster#" width="150px" height="150px">
                                            <span class="cinema-rating">#dateformat(release_date)#</span> 
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
                                        <a href='single_movie.cfm?movie_id=#m_id#' class="cinema__images">
                                            <img alt='' src="../../assets/poster/#movie_poster#" width="150px" height="150px">
                                            <span class="cinema-rating">#dateformat(release_date)#</span> 
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