
       <cfinclude  template = "movie_header.cfm"  runOnce = "true">  
        <cfparam  name="cdate" default="v">       
        <cfset params = structKeyList(url)/>          
        <cfif params neq ''>
            <cfloop index="ix" list="#params#">
            </cfloop>
            <cfif ix eq 'cdate'>           
                <cfset local.checkdata=toString(toBinary(cdate))>
                <cfset searchResult=application.show.getShowByDate(#local.checkdata#)>    
            </cfif>
        </cfif>
       <cfset movieData=application.show.activeShowDetails()> 
        <cfset fromDate = Now()> 
        <cfset toDate = Now() + 5> 
        <!-- Main content -->
        <div class="clearfix"></div>
        <section class="container">             
            <div class="col-sm-12"> <hr>
                <h1 class="page-heading">Show List</h1>       
                    <div class="tags-area">
                        <div class="tags tags--unmarked">
                            <span class="tags__label">Show Dates</span>
                                <ul>
                                    <cfloop from="#fromDate#" to="#toDate#" index="i" step=+1 >  
                                        <cfoutput>  
                                            <cfset local.chdate= DateFormat(i,"yyyy-mm-dd")>
                                               <cfset local.encrdate=toBase64(#local.chdate#)>                                   
                                            <li class="item-wrap"><a href="../../cfm/user/show_list.cfm?cdate=#local.encrdate#"
                                            class="tags__item link--huge" data-filter='ending'><cfoutput>#DateFormat(i,"dd-mmm-yyyy - dddd")#</cfoutput></a></li>
                                        </cfoutput>
                                    </cfloop>   
                                </ul>
                        </div>
                    </div>
                <cfif params neq ''>                    
                    <h3 class="page-heading">Show Details - <cfoutput> #dateformat(local.checkdata)#</cfoutput></h3>                 
                        <cfoutput query="searchResult">  
                            <cfset m_id=toBase64(#mid#)>  
                            <cfset local.passdate=toBase64(#local.checkdata#)>   
                            <!-- Movie preview item -->
                            <div class="col-sm-12">
                                <div class="movie movie--preview movie--full release">
                                    <div class="col-sm-3 col-md-2 col-lg-2">
                                            <div class="movie__images">
                                                <img alt='' src="../../assets/poster/#movie_poster#">
                                            </div>                                  
                                    </div>
                                    <div class="col-sm-4 col-md-10 col-lg-10 movie__about">
                                            <a href='' class="movie__title link--huge">#movie_name#</a>
                                            <p class="movie__time">#movie_duration# min</p>
                                            <p class="movie__option"><strong>Movie Language: </strong><a href="">#movie_language#</a></p>
                                            <p class="movie__option"><strong>Category: </strong><a href="">#genre#</a></p>
                                            <p class="movie__option"><strong>Release date: </strong>#dateformat(release_date)#</p> 
                                            <p class="movie__option"><strong>Movie Format: </strong>#movie_format#</p>                                                           
                                            <div class="movie__btns">
                                                <a href="movie_ticket_planing.cfm?movie_id=#m_id#&tic_date=#local.passdate#" class="btn btn-md btn--warning">
                                                book a ticket <span class="hidden-sm">for this movie</span></a>
                                            </div>                                    
                                    </div>                                
                                                        
                                </div>
                                <div class="clearfix"></div>                                        
                            </div>
                        </cfoutput>         
                </cfif> 
              <h6 class="page-heading">Show Details - Today</h6> 
               <cfset local.checkdata= DateFormat(Now(),"yyyy-mm-dd")>                
               <cfoutput query="movieData">  
                    <cfset m_id=toBase64(#mid#)>            
                    <!-- Movie preview item -->
                    <div class="movie movie--preview movie--full release">
                        <div class="col-sm-3 col-md-2 col-lg-2">
                                <div class="movie__images">
                                    <img alt='' src="../../assets/poster/#movie_poster#">
                                </div>
                             
                        </div>
                        <div class="col-sm-9 col-md-10 col-lg-10 movie__about">
                            <a href='##' class="movie__title link--huge">#movie_name#</a>
                            <p class="movie__time">#movie_duration# min</p>
                            <p class="movie__option"><strong>Movie Language: </strong><a href="">#movie_language#</a></p>
                            <p class="movie__option"><strong>Category: </strong><a href="">#genre#</a></p>
                            <p class="movie__option"><strong>Release date: </strong>#release_date#</p>                        
                            <div class="movie__btns">
                                <a href="movie_ticket_planing.cfm?movie_id=#m_id#&tic_date=#local.encrdate#" 
                                class="btn btn-md btn--warning">book a ticket 
                                <span class="hidden-sm">for this movie</span></a>                    
                            </div>                                            
                        </div>
                        <div class="clearfix"></div>          
                </cfoutput>
   
                </div>
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
    <cfinclude  template = "footer.cfm"  runOnce = "true">  


 