
       <cfinclude  template = "movie_header.cfm"  runOnce = "true">  
       <cfset movieData=application.show.activeShowDetails()>       
        <!-- Main content -->
        <div class="clearfix"></div>
        <!-- Search bar -->        
        <section class="container">
            <div class="col-sm-12">
                <h2 class="page-heading">Movies</h2>
                    <div class="container container--add">
                        <form id='search-form' action="" method="post">
                            <select class="js-example-basic-single col-md-12 form-control" name="movie_search">
                                <option value="default">Search For a Movie</option>
                                <cfloop query="movieData">
                                    <option value=<cfoutput>#mid#</cfoutput>> 
                                        <cfoutput> #movie_name#</cfoutput>
                                    </option>
                                </cfloop>                 
                            </select>
                            <br> <br>
                            <div class="row col-md-12 pull-right">
                                <button type="submit" name="submit" value="Submit" class="btn btn-md btn--danger search__button">search a movie</button>
                            </div> 
                        </form>                      
                    </div>
                <h2 class="page-heading">List</h2>   
                <cfif structKeyExists(form,'Submit')>
                    <cfset local.kid=form.movie_search>
                    <cfset searchData=application.obj1.getMovieById(local.kid)>   
                       <cfoutput query="searchData">  
                          <cfset local.s_id=toBase64(#id#)>   
                          <!-- Movie preview item -->
                            <div class="movie movie--preview movie--full release">
                                <div class="col-sm-3 col-md-2 col-lg-2">
                                        <div class="movie__images">
                                            <img alt='' src="../../assets/poster/#searchData.movie_poster#">
                                        </div>
                                        <div class="movie__feature">
                                            <a href="" class="movie__feature-item movie__feature--comment">**</a>
                                            <a href="" class="movie__feature-item movie__feature--video">**</a>
                                            <a href="" class="movie__feature-item movie__feature--photo">**</a>
                                        </div>
                                </div>
                                <div class="col-sm-9 col-md-10 col-lg-10 movie__about">
                                        <a href='movie-page-full.html' class="movie__title link--huge">#movie_name#</a>
                                        <p class="movie__time">#movie_duration# min</p>
                                        <p class="movie__option"><strong>Movie Language: </strong><a href="">#movie_language#</a></p>
                                        <p class="movie__option"><strong>Category: </strong><a href="">#genre#</a></p>
                                        <p class="movie__option"><strong>Release date: </strong>#release_date#</p>                        
                                        <div class="movie__btns">
                                            <a href="" class="btn btn-md btn--warning">book a ticket <span class="hidden-sm">for this movie</span></a>
                                        </div>                    
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </cfoutput>
                    <!-- search movie preview item --> 
                </cfif>  

                <cfoutput query="movieData">  
                <cfset m_id=toBase64(#mid#)>   
                    <!-- Movie preview item -->
                    <div class="movie movie--preview movie--full release">
                        <div class="col-sm-3 col-md-2 col-lg-2">
                                <div class="movie__images">
                                    <img alt='' src="../../assets/poster/#movie_poster#">
                                </div>
                                <div class="movie__feature">
                                    <a href="" class="movie__feature-item movie__feature--comment">**</a>
                                    <a href="" class="movie__feature-item movie__feature--video">**</a>
                                    <a href="" class="movie__feature-item movie__feature--photo">**</a>
                                </div>
                        </div>
                        <div class="col-sm-9 col-md-10 col-lg-10 movie__about">
                                <a href='movie-page-full.html' class="movie__title link--huge">#movie_name#</a>
                                <p class="movie__time">#movie_duration# min</p>
                                <p class="movie__option"><strong>Movie Language: </strong><a href="">#movie_language#</a></p>
                                <p class="movie__option"><strong>Category: </strong><a href="">#genre#</a></p>
                                <p class="movie__option"><strong>Release date: </strong>#release_date#</p>                        
                                <div class="movie__btns">
                                    <a href="" class="btn btn-md btn--warning">book a ticket <span class="hidden-sm">for this movie</span></a>
                                </div>                    
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </cfoutput>
                <!-- end movie preview item -->
                <div class="coloum-wrapper">
                    <div class="pagination paginatioon--full">
                        <a href='#' class="pagination__next">next</a>
                    </div>
                </div>
            </div>
        </section>
        <div class="clearfix"></div>
            <footer class="footer-wrapper">
                <section class="container">
                    <div class="clearfix">
                        <p class="copy">&copy;Book MyMovie, 2022. All rights reserved.</p>
                    </div>
                </section>             
            </footer>
        </div>
    <cfinclude  template = "movie_footer.cfm"  runOnce = "true">  


 