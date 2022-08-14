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
        
                <h2 class="page-heading">showtime &amp; tickets</h2>
                <div class="choose-container">
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
                    <cfoutput query="showResult">
                        <div class="clearfix"></div>
                        <div class="time-select">
                            <div class="time-select__group group--first">
                            	<cfset time_res=application.show.getTimeSlots(#theatre_id#,local.mid,local.checkdata)>
                                <div class="col-sm-4">
                                    #theatre_name# - #screen_name# 
                                    <cfloop query="time_res">
                                        <cfif  structKeyExists(Session,"userId")>                                            
                                                <button onClick="getSeatCountView(#sh_id#,#local.mid#,#local.checkdata#)"  type="button" class="time-select__item">
                                                #show_time#</button>                                         
                                            <cfelse>
                                            <button onClick="getSeatBookView(#sh_id#)" type="button" class="time-select__item">#show_time#</button>
                                        </cfif>                          
                                    </cfloop>                                 
                                </div>                         
                            </div>
                        </div>
                     </cfoutput>   
                    <div class="clearfix"></div>
                </div>        
            </div>
             <!-- Begin Page Content -->

    <div class="row">
     <div class="col-md-4">
     </div>
        <div class="col-md-12">
            <div class="modal fade" id="SloginModal"   
               data-bs-backdrop="static" data-bs-keyboard="false" 
               tabindex="-1" aria-labelledby="staticBackdropLabel" 
               aria-hidden="true">
                <div class="loginModal">                  
                    <div class="modal-body">                       
                            <div class="contact-form-wrapper">                 
                                <!-- Main content -->
                                <form class="user" 
                                    method="post" 
                                    class="form row"
                                    name="loginForm" 
                                    action="../../cfc/login.cfc?method=checkUser">                                           
                                        <div class="container">    
                                               <div class="col-sm-12">                                                                                                                                       
                                                    <p class="email_alert text-danger"></p>
                                                </div>
                                                <div class="col-md-12"> 
                                                    <label><b>LOGIN HERE</b></label>
                                                    <input type='email' placeholder='Email' name='user_email' id="cemail" class="form__email" required>
                                                    <input type='password' placeholder='Password' name='user_password' class="form__name">
                                                    <button type='submit' id="reg_btn" class="btn btn-sm btn-danger">Log in</button>  
                                                    <button type="button" class="btn btn-sm btn--shine" data-dismiss="modal">Close</button>                                           
                                                </div>                                   
                                                <cfoutput>
                                                    <input type="hidden" name="movie_id" value="#local.mid#">
                                                    <input type="hidden" name="gshow_id" value="">                                          
                                                    <input type="hidden" name="cdate" value="#local.checkdata#">
                                                </cfoutput>           
                                        </div>
                                    </div>
                                </form> 
                            </div>                 
                         
                    </div> 
                </div>
 
        <!-- Modal -->  
        <div class="row">
            <div class="col-md-4">
            </div>
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
                                        <form class="user" 
                                                method="post" 
                                                name="checkForm" 
                                                action="../../cfc/reservation.cfc?method=ShowBookview">
                                        <input type="hidden" name="ch_show_id" value="" id="ch_show_id">
                                        <cfoutput><input type="hidden" name="cdate" value="#local.checkdata#" id="cdate"></cfoutput>
                                        <input type="hidden" name="total_seats" value="" id="total_seats">
                                    </label>
                                    <div>
                                        <input type="text" class="form-control input-lg" id="seats" name="seats" value="" onchange="seatCheck();">
                                        <span class="text-danger seat_alert"></span>
                                        <input type="submit" class="btn btn-success " name="submit" value="Seats Plan" id="seat_btn" disabled>
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
     <!-- Modal -->
        </div>
    </div>
</section>
  </div>

  <div class="row">
     <div class="col-md-12"></div>
        <div class="col-md-12">   


        </div>
    </div>
</div>
<cfinclude  template = "movie_footer.cfm"  runOnce = "true">  



