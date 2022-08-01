<cfinclude  template = "../header.cfm"  runOnce = "true"> 
<cfparam  name="status" default="v">
<cfparam  name="message" default="v">
<cfparam  name="movie_id" default="v">
<cfparam  name="key" default="v">
<cfset movId=toString(toBinary(movie_id))>
<!---<cfset movie_data=application.movie.movieDetails(theId)>--->
<div class="container-fluid">    
    <!-- Page Heading -->
    <a href="list_movies.cfm" class="btn btn-outline-danger"><i class="fa fa-solid fa-arrow-left"></i> Back</a>
    <cfset movie_data=application.obj1.getMovieDetails(movId)>
    <h4 class="h3 mb-2 text-gray-800 text-center">Manage Cast and Crew for <b><cfloop array="#movie_data#" index="i">
        <cfoutput>#i.movie_name#
        </cfoutput>
    </cfloop>   </b></h4>
    <cfif message EQ hash('2','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               Please Fill Out all Fields . !!
        </div>
    </cfif> 
    <cfif message EQ hash('10','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               Character Name Already Exist . !!
        </div>
    </cfif>  
    <cfif message EQ hash('11','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               Actor Name Already Exist . !!
        </div>
    </cfif>  
     <cfif message EQ hash('6','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             File size should be less than 1 mb . !!
        </div>
    </cfif> 
    <cfif message EQ hash('5','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          Add cast Operation failed. !!
        </div>
    </cfif> 
    <cfif message EQ hash('4','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
         Movie Cast Added Successfully !!
        </div>
    </cfif> 
    <cfif message EQ hash('8','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
         Movie Crew Added Successfully !!
        </div>
    </cfif>
    <cfif status EQ hash('1','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                 Added Successfully !!
        </div>
    <cfelseif status EQ hash('3','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
              Cast  Deleted Successfully !!
        </div>
    <cfelseif status EQ hash('4','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please fill all required fields !!
        </div>        
    </cfif>
    <div class="row">
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">                
                 <button class="btn btn-danger theatre_btn title mb-3 float-right" data-toggle="modal" data-tid="#movId#" data-target="#AddCastModal">Add New Cast</button>                         
          
                </div>
                <div class="card-body">                    
                    <div class="table-responsive" id="tableList">
                        <table class="table table-bordered table-striped" id="screen_table" width="100%" cellspacing="0" >
                            <thead>
                                <tr>
                                    <th >Photo</th>
                                    <th >Cast</th>
                                    <th >Actor</th>                                
                                    <th >Delete</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th >Photo</th>
                                    <th >Cast</th>
                                    <th >Actor</th>                                
                                    <th >Delete</th>
                                </tr>
                            </tfoot>
                               <cfset res=application.obj1.castDetails(movId)>
                            <tbody>
                            <cfoutput query='res'>     
                                <cfset local.cast_id=toBase64(#cast_id#)>  
                                <cfset local.m_id=toBase64(#movie_id#)>                       
                                <tr>   
                                    <td><img src="../../assets/movies/actors/#actor_photo#" width="100px" height="100px" class="li-section" /></td>                                 
                                    <td>#character_name#</td>
                                    <td>#actor_name#</td>                                  
                                    <td> <a href="../../cfc/movie.cfc?method=deleteCast&id=#local.cast_id#&mov_id=#local.m_id#"><button type="button" class="btn btn-sm btn-outline-danger">Delete</button></a></td>
                                </tr>
                            </cfoutput>                    
                        
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">       
                    <button class="btn btn-danger theatre_btn title mb-3 float-right" data-toggle="modal" data-tid="#movId#" data-target="#AddCrewModal">Add New Crew</button>                         
                </div>
                <div class="card-body">                    
                    <div class="table-responsive" id="tableList">
                        <table class="table table-bordered table-striped" id="show_table" width="100%" cellspacing="0" >
                            <thead>
                                <tr>
                                    <th >Photo</th>
                                    <th >Crew Role</th>
                                    <th >Person Name</th>                                
                                    <th >Delete</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th >Photo</th>
                                    <th >Crew Role</th>
                                    <th >Person Name</th>                                
                                    <th >Delete</th>
                                </tr>
                            </tfoot>
                               <cfset res=application.obj1.crewDetails(movId)>
                            <tbody>
                            <cfoutput query='res'>     
                                <cfset local.crew_id=toBase64(#crew_id#)>  
                                <cfset local.m_id=toBase64(#movie_id#)>                       
                                <tr>   
                                    <td><img src="../../assets/movies/crew/#crew_photo#" width="100px" height="100px" class="li-section" /></td>                                 
                                    <td>#role_name#</td>
                                    <td>#person_name#</td>                                  
                                    <td> <a href="../../cfc/movie.cfc?method=deleteCrew&id=#local.crew_id#&mov_id=#local.m_id#"><button type="button" class="btn btn-sm btn-outline-danger">Delete</button></a></td>
                                </tr>
                            </cfoutput>   
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- End of Main Content -->  

<!--Add Cast Modal-->
<div class="modal fade" id="AddCastModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">               
            <div class="modal-header center">
                <h4><center>Add Cast</center></h4>                                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">           
                <form method="post" action="../../cfc/movie.cfc?method=addCast" name="castForm" enctype="multipart/form-data" onsubmit="return validateCastForm()">
               
                   <div class="form-group row">                        
                        <div class="col-lg-4">                          
                            <label class="form-label required control-label pt-3" >Character Name:</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Actor Name:</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Actor Photo:</label>
                        </div>                             
                        <div class="col-lg-4 ">
                            <input type="text" name="character_name" class="form-control" id="character_name" placeholder="Character Name" value="" required onchange="checkScreen()">
                            <span class="screen_alert text-danger pt-3"></span>
                        </div>
                        <div class="col-lg-4 ">
                            <input type="text" name="actor_name" class="form-control" id="actor_name" placeholder="Actor Name" value="" required onchange="checkGoldRate();">                            
                            <span class="gold_alert text-danger pt-3"></span>
                        </div>
                        <div class="col-lg-4 ">
                            <input type="file" name="actor_photo" class="form-control"  id="actor_photo" required onchange="checkSilverRate();" >                            
                            <span class="silver_alert text-danger pt-3"></span>
                        </div>  
                               
                        <input type="hidden" name="movie_id"  id="movie_id" value="<cfoutput>#movId#</cfoutput>" />
                        <input type="hidden" name="mov_id"  id="mov_id" value="<cfoutput>#movId#</cfoutput>" />
                          <input type="hidden" name="id" value="" id="id">                    
                    </div>  
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" id="s_btn">Save changes</button>
            </div>
        </form>  
        </div>
    </div>
</div>    
<!-- Modal -->  

<div class="modal fade" id="AddCrewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">               
            <div class="modal-header center">
                <h4><center>Add Crew</center></h4>                                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">           
                <form method="post" action="../../cfc/movie.cfc?method=addCrew" name="crewForm" enctype="multipart/form-data" onsubmit="return validateCrewForm()">
               
                   <div class="form-group row">                        
                        <div class="col-lg-4">                          
                            <label class="form-label required control-label pt-3" >Role Name:</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Persons Name:</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Photo:</label>
                        </div>                             
                        <div class="col-lg-4 ">
                            <input type="text" name="role_name" class="form-control" id="role_name" placeholder="Crew Role Name" value="" required>
                        </div>
                        <div class="col-lg-4 ">
                            <input type="text" name="person_name" class="form-control" id="person_name" placeholder="Person Name" value="" required >                            
                        </div>
                        <div class="col-lg-4 ">
                            <input type="file" name="crew_photo" class="form-control"  id="crew_photo" required>                            
                        </div>                               
                        <input type="hidden" name="movie_id"  id="movie_id" value="<cfoutput>#movId#</cfoutput>" />
                        <input type="hidden" name="mov_id"  id="mov_id" value="<cfoutput>#movId#</cfoutput>" />
                        <input type="hidden" name="id" value="" id="id">                    
                    </div>  
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" id="s_btn">Save changes</button>
            </div>
        </form>  
        </div>
    </div>
</div>    
<!-- Modal -->  



<cfinclude  template = "../footer.cfm"  runOnce = "true">  
