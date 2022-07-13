<cfinclude  template = "../header.cfm"  runOnce = "true"> 
<cfparam  name="message" default="v"> 
<cfparam  name="status" default="v"> 
<cfset show_res=application.show.showDetails()>
    <!-- Begin Page Content -->
    <div class="container-fluid">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Manage Shows</h1> 
        <cfset theatreData=application.obj.getTheatre()>
        <cfset movieData=application.obj1.movieDetails()>

                <cfif message EQ hash('2','sha')>
                    <div class="alert alert-danger alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                      Please fill all fields!!
                    </div>                       
                </cfif> 
                <cfif message EQ hash('8','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                      Show Updated Successfully!!
                    </div>                       
                </cfif> 
                <cfif message EQ hash('10','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                       Inserted Successfully!!
                    </div>                       
                </cfif>
        
                <cfif status EQ hash('1','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                       Movie Deleted Successfully!!
                    </div> 
                    <cfelseif status EQ hash('3','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            Deletion Failed!!
                    </div>  
                   <cfelseif status EQ hash('11','sha')>
                    <div class="alert alert-danger alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            insertion Failed!!
                    </div> 
                    <cfelseif status EQ hash('12','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                           Show deleted successfully!!
                    </div>         
                </cfif>                        
 <!-- Content Row -->
 <!-- DataTales Example -->                      
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">                    
                            <button class="btn btn-danger theatre_btn title mb-3 float-right" data-toggle="modal" data-target="#AddShowTimeModal">Add New Show Time</button>                         
                        </div>                  
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="table-responsive" id="tableList" width="100%">
                                    <table class="table table-bordered" id="example"  cellspacing="0">
                                        <thead>
                                                    <tr>
                                                <th>Poster</th>
                                                <th>Movie Name</th>
                                                <th>Theatre</th>
                                                <th>Screen</th>
                                                <th>Show</th>                                              
                                                <th>Start Date</th>
                                                <th>Start Time</th>
                                                <th>Duration</th>     
                                                <th>End Time </th>                            
                                                <th>Show Status</th>
                                                <th>Show Priority</th>
                                                <th>Total Seats</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                              <tr>
                                                <th>Poster</th>
                                                <th>Movie Name</th>
                                                <th>Theatre</th>
                                                <th>Screen</th>
                                                <th>Show</th>                                              
                                                <th>Start Date</th>
                                                <th>Start Time</th>
                                                <th>Duration</th>     
                                                <th>End Time </th>                            
                                                <th>Show Status</th>
                                                <th>Show Priority</th>
                                                <th>Total Seats</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </tfoot>
                                        <tbody> 
                                             <cfoutput query='show_res'>   
                                                 <cfset show_id=toBase64(#id#)>                                         
                                                <tr>
                                                    <td><img src="../../assets/poster/#movie_poster#" class="img-fluid img-poster"></td>                           
                                                    <td>#movie_name#</td>
                                                    <td>#theatre_name#</td>
                                                    <td>#screen_name#</td>
                                                    <td>#show_name#</td>
                                                    <td>#release_date#</td>
                                                    <td>#show_time#</td>
                                                    <td>#movie_duration#</td>   
                                                    <cfset s_d=listToArray(movie_duration,":")>
                                                    <cfset hours=s_d[1]*60*60>
                                                    <cfset min=s_d[2]*60>
                                                    <cfset sec=s_d[3]>
                                                    <cfset dtn=hours+min+sec>                            
                                                    <cfset new_time = timeFormat(DateAdd("s",dtn,show_time),'hh:mm:ss tt')>
                                                     <td>#new_time#</td>
                                                    <td>Pending</td>
                                                    <td>#priority#</td>
                                                    <td>#total_seats#</td>
                                                    <td> <button type="button" class="btn btn-sm btn-outline-danger" onClick="editShowData(#id#)">Edit</button></td>
                                                    <td><a href="../../cfc/shows.cfc?method=deleteShow&id=#show_id#" class="btn btn-outline-primary">Delete</a></td>
                                                </tr>
                                            </cfoutput>                           
                                   
                                        </tbody>
                                    </table>
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
                <!-- /.container-fluid -->
         </div>
            <!-- End of Main Content -->   
<!--Create Modal -->                        
<div class="modal AddShowTimeModal" id="AddShowTimeModal">
    <div class="modal-dialog modal-lg">
           <form method="post" action="../../cfc/shows.cfc?method=addShow" name="movieshowtimeForm" enctype="multipart/form-data" onsubmit="return validateMovieForm()">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header center">
                    <h4><center>Add Movie Show Time</center></h4>                                
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                  <!-- Modal body -->
                <div class="modal-body">                  
                    <div class='row'> 
                        <div class="col-lg-9">                                                 
                            <div class="form-group row">                        
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Movie:</label>
                                </div>
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Theatre:</label>
                                </div>
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Screen:</label>
                                </div>                             
                                <div class="col-lg-4 ">
                                    <select name="movie" id="movie" class="form-control">
                                       <option  value="" >Select Movie</option>
                                        <cfloop query="movieData">
                                           
                                            <option value=<cfoutput>#id#</cfoutput>> 
                                              <cfoutput> #movie_name#</cfoutput>
                                            </option>
                                        </cfloop>
                                    </select>
                                </div>
                                <div class="col-lg-4 ">
                                    <select name="stheatre" id="Stheatre" class="form-control">
                                        <option  value="" >Select Theatre</option>
                                        <cfloop query="theatreData">
                                            <option value=<cfoutput>#id#</cfoutput>> 
                                              <cfoutput> #theatre_name#</cfoutput>
                                            </option>
                                        </cfloop>
                                    </select>
                                </div>
                                <div class="col-lg-4 ">
                                    <select name="th_screen" id="th_screen" class="form-control">
                                       
                                    </select>
                                </div>
                                                  
                            </div>
                            <div class="form-group row">                        
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Show:</label>
                                      <select name="th_shows" id="th_shows" class="form-control">                                     
                                    </select>
                                </div>
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Planned End Date:</label>
                                    <input type="date"  name="plan_end_date" id="plan_end_date" class="form-control">
                                </div>
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Show Priority:</label>
                                    <select name="show_priority" id="show_priority" class="form-control" required>
                                        <option  value="" >Select Priority</option>
                                        <option value="Top">Top</option>
                                        <option value="Medium">Medium</option>
                                        <option value="Low">Low</option>                                   
                                    </select>
                                </div>
                                <div class="col-lg-6">
                                  <label class="form-label required control-label pt-3" >Total Seats:</label>
                                      <input type="text"  name="total_seats" id="total_seats" class="form-control">
                                </div>                                                                                                           
                            </div>
                        <input type="hidden" name="upid" value="" id="upid" value="0">                          
                   
                </div>                 
                <!-- Modal footer -->
                 <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="mov_btn">Save changes</button>
                </div>          
            </div>
        </form>
    </div>
</div> 
           
           
<cfinclude  template = "../footer.cfm"  runOnce = "true">  
  