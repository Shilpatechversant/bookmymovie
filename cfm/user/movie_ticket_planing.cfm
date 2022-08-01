<cfinclude  template = "movie_header.cfm"  runOnce = "true">  
<cfparam  name="movie_id" default="v">  
<cfparam  name="message" default="v">
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
                <cfif message EQ hash('4','sha')>
                    <div class="alert alert-danger alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                      Login failed.!!
                    </div>                       
                </cfif>
                <cfif message EQ hash('5','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                      Login Successfull.Please select the Show Time!!
                    </div>                       
                </cfif>
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
                                    #structKeyExists(Session,"userId")?'
                                    <li> 
                                        <button onClick="getSeatCountView(#id#,#local.mid#,#local.checkdata#)" type="button">#show_time#</button> 
                                    </li>' :'
                                    <li> 
                                        <button onClick="getSeatBookView(#id#)" type="button">#show_time#</button> 
                                    </li>'#     
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

     <!-- Modal -->
    <div class="row">
     <div class="col-md-4">
     </div>
        <div class="col-md-4 ">
            <div class="modal fade" id="SloginModal"   
               data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog loginModal">
                    <div class="modal-content"  role="document">          
                        <div class="modal-body">                  
                            <!-- Main content -->
                            <form class="user" 
                            method="post" 
                            name="loginForm" 
                            action="../../cfc/login.cfc?method=checkUser"
                                >
                                <h2>Log In to BookMyMovie</h2>
                                <div class="field-wrap">
                                    <label>User email -  </label>
                                    <input type='email' placeholder='Email' name='user_email' id="cemail" class="form-input"  
                                    required>
                                    <p class="email_alert text-danger"></p>
                                    <label>User Password  - </label>
                                    <input type='password' placeholder='Password' name='user_password' class="form-input" >
                                        <cfoutput >
                                            <input type="hidden" name="movie_id" value="#local.mid#">
                                             <input type="hidden" name="gshow_id" value="">                                          
                                            <input type="hidden" name="cdate" value="#local.checkdata#">
                                        </cfoutput>
                                </div>
                                <div class="login__control">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type='submit' id="reg_btn" class="btn btn-md btn--warning btn--wider">Log in</button>                     
                                </div>
                            </form> 
                        </div>
                    </div>
                </div>   
            </div> 
 
        <!-- Modal -->  
        </div>
    </div>

    <div class="row">
          <div class="col-md-4"></div>
        <div class="col-md-4">   
   <!-- SeatCount Modal-->
            <div class="modal fade" id="GseatModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"></h5>
                        
                            <h2>Welcome Plan Your Seating</h2>
                        </div>
                        <div class="modal-body">                  
                            <div class="form-group">                        
                                <label class="control-label">Enter Numer of seats required --
                                    <span class="seat_label text-success"></span>
                                    <input type="hidden" name="show_id" value="" id="ch_show_id">
                                    <cfoutput><input type="hidden" name="cdate" value="#local.checkdata#" id="cdate"></cfoutput>
                                    <input type="hidden" name="total_seats" value="" id="total_seats">
                                </label>
                                <div>
                                    <input type="text" class="form-control input-lg" id="seats" name="seats" value="" onchange="seatCheck();">
                                    <span class="text-danger seat_alert"></span>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>                         
                        </div>
                    </div>
                </div>
            </div>  

        </div>
    </div>
</div>




   <cfinclude  template = "movie_footer.cfm"  runOnce = "true">  


