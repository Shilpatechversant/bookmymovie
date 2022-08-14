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