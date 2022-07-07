<cfinclude  template = "../header.cfm"  runOnce = "true"> 
<cfparam  name="message" default="v"> 
<cfparam  name="status" default="v"> 
    <!-- Begin Page Content -->
    <div class="container-fluid">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Manage Movies</h1> 
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
                    <cfelseif status EQ hash('6','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                         Image should be less than 1 mb size.
                    </div>
                    <cfelseif status EQ hash('10','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                       Movie Name Already Exist
                    </div>
                    <cfelseif status EQ hash('11','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        Movie Trailer Already Exist
                    </div>
                </cfif>
                <cfif message EQ hash('2','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        Please Fill all the Required Fields!!
                    </div> 
            
                <cfelseif message EQ hash('4','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                          Movie Added Successfully!!
                    </div>  
                <cfelseif message EQ hash('5','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            Please Try After Some time!!
                    </div> 
                <cfelseif message EQ hash('8','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                          Movie Updated Successfully!!
                    </div> 
                <cfelseif message EQ hash('9','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            File size should be less than 1 mb !!
                    </div>
                </cfif>                        
 <!-- Content Row -->
 <!-- DataTales Example -->                      
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">                    
                            <button class="btn btn-danger theatre_btn title mb-3 float-right" data-toggle="modal" data-target="#AddMovieModal">Add New Movie</button>                         
                        </div>                  
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="table-responsive" id="tableList" width="100%">
                                    <table class="table table-bordered" id="example"  cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Poster</th>
                                                <th>Wallpaper</th>
                                                <th>Name</th>
                                                <th>Release Date</th>
                                                <th>Format</th>
                                                <th>Genere</th>
                                                <th>language</th>
                                                <th>Duration</th>
                                                <th>Description</th>
                                                <th>Trailer</th>
                                                <th>Add Cast And Crew</th>
                                                <th>Update</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Poster</th>
                                                <th>Wallpaper</th>
                                                <th>Name</th>
                                                <th>Release Date</th>
                                                <th>Format</th>
                                                <th>Genere</th>
                                                <th>language</th>
                                                <th>Duration</th>
                                                <th>Description</th>
                                          
                                                <th>Trailer</th>
                                                <th>Add Cast And Crew</th>
                                                <th>Update</th>
                                                <th>Delete</th>                                            
                                            </tr>
                                        </tfoot>
                                        <tbody>                                
                                              <cfset res=application.obj1.movieDetails()>                                                                 
                                            <cfoutput query="res">
                                                <cfset local.movie_id=toBase64(#id#)>                               
                                                <tr>
                                                    <td><img src="../../assets/poster/#movie_poster#" width="100px" height="100px" class="li-section" /></td>
                                                    <td><img src="../../assets/wallpaper/#movie_wallpaper#" width="100px" height="100px" class="li-section" /></td>
                                                    <td>#movie_name#</td>
                                                    <td>#release_date#</td>
                                                    <td>#movie_format#</td>
                                                    <td>#genre#</td>
                                                    <td>#movie_language#</td>
                                                    <td>#movie_duration#</td>
                                                    <td>#movie_des#</td>
                                                    <td>#movie_trailer#</td>                                             
                                                    <td> <a href="manage_crew.cfm?movie_id=#local.movie_id#" class="btn btn-xs btn-outline-danger">Manage&nbsp;Cast&nbsp;And&nbsp;Crew</a></td>
                                                    <td>  <button type="button" class="btn btn-sm btn-outline-danger" onClick="editMovieData(#id#)">Edit</button></td>
                                                    <td> <a href="../../cfc/movie.cfc?method=deleteMovie&id=#local.movie_id#"><button type="button" class="btn btn-sm btn-outline-danger">Delete</button></a></td>
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
<div class="modal movieModal" id="AddMovieModal">
    <div class="modal-dialog modal-lg">
           <form method="post" action="../../cfc/movie.cfc?method=addMovie" name="movieForm" enctype="multipart/form-data" onsubmit="return validateMovieForm()">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header center">
                    <h4><center>Add Movie</center></h4>                                
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
                                    <label class="form-label required control-label pt-3" >Movie Name:</label>
                                </div>
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Release Date:</label>
                                </div>
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Movie Format:</label>
                                </div>                             
                                <div class="col-lg-4 ">
                                    <input type="text" name="movie_name" class="form-control" id="movie_name" placeholder="Movie Name" value="" required  onchange="checkMovie()">
                                     <span class="movie_alert text-danger pt-3 "></span>
                                </div>
                                <div class="col-lg-4 ">
                                    <input type="date" name="release_date" class="form-control" id="release_date"  value="" required >
                                </div>
                                <div class="col-lg-4 ">
                                    <select name="movie_format" id="movie_format" class="form-control" required>
                                        <option  value="" >Select Movie Format</option>
                                        <option value="3D">3D</option>
                                        <option value="2D">2D</option>
                                        <option value="4DX 3D">4DX 3D</option>
                                        <option value="MX4DX 3D">4DX 3D</option>
                                        <option value="3D SCREEN X">3D SCREEN X</option>
                                        <option value="IMAX 3D">IMAX 3D</option>
                                    </select>
                                </div>                         
                            </div>
                            <div class="form-group row">                        
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Genre:</label>
                                </div>
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Language:</label>
                                </div>
                                <div class="col-lg-6">
                                    <select name="genre" id="genre" class="form-control" required>
                                        <option  value="" >Select Genre</option>
                                        <option value="Action">Action</option>
                                        <option value="Comedy">Comedy</option>
                                        <option value="Drama">Drama</option>
                                        <option value="Adventure">Adventure</option>
                                        <option value="Romantic">Romantic</option>
                                        <option value="Thriller">Thriller</option>
                                        <option value="Animation">Animation</option>
                                        <option value="Family">Family</option>
                                        <option value="Fantasy">Fantasy</option>
                                    </select>
                                </div>
                                <div class="col-lg-6">
                                    <select name="language" id="language" class="form-control" required>
                                        <option  value="" >Select Language</option>
                                        <option value="English">English</option>
                                        <option value="Malayalam">Malayalam</option>
                                        <option value="Tamil">Tamil</option>
                                        <option value="Hindi">Hindi</option>
                                        <option value="Telugu">Telugu</option>
                                        <option value="Kannada">Kannada</option>                                        
                                    </select>
                                </div>                                    
                            </div>
                             <div class="form-group row">                        
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Duartion in(h:m:s)</label>
                                </div>
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Trailer URL: </label>
                                </div>
                                <div class="col-lg-6">
                                    <input type="time" name="duration" id="duration" class="form-control"   value="" required>
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" name="trailer_url" class="form-control" id="trailer_url" placeholder="Trailer Url" value="" required onchange="checkTrailerUrl()">
                                    <span class="trailer_alert text-danger pt-3 "></span>
                                </div>                                    
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3">Upload Poster</label>
                                </div>
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3">Upload Wallpaper</label>
                                </div>
                                <div class="col-lg-6">
                                    <input class="form-control" id="poster" type="file" accept=".png,.jpg,.jpeg" name="poster"  >
                                </div>
                                <div class="col-lg-6">
                                    <input class="form-control" id="wallpaper" type="file" accept=".png,.jpg,.jpeg" name="wallpaper" >
                                </div>                                                     
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <label class="form-label required control-label pt-3" >Description:</label>
                                </div>
                                <div class="col-lg-12">
                                    <textarea name="description" id="description" class="form-control"></textarea>
                                </div>
                                <input type="hidden" name="id"  id="id" value="0" /> 
                                <input type="hidden" name="old_image"  id="old_image" value="0" /> 
                                 <input type="hidden" name="old_image1"  id="old_image1" value="0" /> 
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="img-show" id="rs1">
                            <h4> Poster </h4>
                                <img id="output" class="img-fluid"  />
                            </div>
                            <div class="wall-show" id="rs2">
                              <h4> WallPaper </h4>
                                <img id="output2" class="img-fluid"  />
                            </div>
                        </div>
                    </div>
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
  