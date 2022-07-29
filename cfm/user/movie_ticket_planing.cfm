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
                                     #structKeyExists(Session,"userId")?'<li> <button type="button" class="time-select__item seat" data-bs-toggle="modal" data-id="#id#" data-bs-target=".loginModal"  >#start_time#</button>
                                     </li>' :'<li> <button class="time-select__item" data-toggle="modal" data-tid="#show_time#" data-target="##LoginModal">#show_time#</button>  </li>'#     
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
 <!-- Begin Page Content -->
 <div class="container-fluid">
     <!-- Modal -->
        <div class="modal fade" id="LoginModal"   
             data-mdb-backdrop="static" 
             data-mdb-keyboard="false" 
            tabindex="-1"
            aria-labelledby="staticBackdropLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" >
                <div class="modal-content">          
               
                    <div class="modal-body">                  
                        <!-- Main content -->
                              <form class="user" 
                                method="post" 
                                name="loginForm" 
                                action="../../cfc/login.cfc?method=checkUser"
                               >
                            <p class="login__title">sign in <br><span class="login-edition">welcome to BookMyMovie</span></p>
                                              
                            <div class="field-wrap">
                                <input type='email' placeholder='Email' name='user_email' class="login__input">
                                <input type='password' placeholder='Password' name='user_password' class="login__input">
                            </div>
                            
                            <div class="login__control">
                                <button type='submit' class="btn btn-md btn--warning btn--wider">sign in</button>
                             <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                    </div>
                      
                        </form>  
                    </div>
            </div>
        </div>    
        <!-- Modal -->  
       

       <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-white">Seat Form</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class='text-center'>
                   
                    <h4>Welcome Plan Your Seating</h4>
                </div>
                <div class="container pt-5">
                <form role="form" method="POST" action="../../cfc/shows.cfc?method=seatSelect">
                    
                    <div class="form-group">
                        <input type="hidden" name="login_value" value="2" id="login_value">
                        <label class="control-label">Enter Numer of seats required -- <span class="seat_label text-success"></span>
                        <input type="hidden" name="show_id" value="" id="show_id">
                        <cfoutput><input type="hidden" name="cdate" value="#pdate#" id="cdate"></cfoutput>
                        <input type="hidden" name="total_seats" value="" id="total_seats">
                             
                        </label>
                        <div>
                            <input type="text" class="form-control input-lg" id="seats" name="seats" value="" onchange="seatCheck();">
                            <span class="text-danger seat_alert"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div>
                            <input type="submit" class="btn btn-showing " name="submit" value="Seats Plan" id="seat_btn" disabled>
                        </div>
                    </div>
                </form>
                </div>
            </div>
            
        </div><!-- /.modal-content -->
    </div>

        
     </div>   
    
   <cfinclude  template = "movie_footer.cfm"  runOnce = "true">  

