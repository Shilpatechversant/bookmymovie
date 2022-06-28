<cfinclude  template = "header.cfm"  runOnce = "true"> 
<cfparam  name="message" default="v"> 
<cfparam  name="status" default="v"> 
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Manage Theatres</h1> 
                            <cfif status EQ hash('1','sha')>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Contact Deleted Successfully!!
                                </div> 
                                <cfelseif status EQ hash('3','sha')>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        Deletion Failed!!
                                </div>
                            </cfif>
                            <cfif message EQ hash('2','sha')>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Please Fill all the Required Fields!!
                                </div> 
                            <cfelseif message EQ hash('3','sha')>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        Email Already Exist!!
                                </div>
                            <cfelseif message EQ hash('4','sha')>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        Theatre Added Successfully!!
                                </div>  
                            <cfelseif message EQ hash('5','sha')>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        Please Try After Some time!!
                                </div> 
                            <cfelseif message EQ hash('8','sha')>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        Theatre Updated Successfully!!
                                </div> 
                            </cfif>            
                        
                         <!-- Content Row -->
                             <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                        <button class="btn btn-danger btn-icon-split btn-sm float-right" data-toggle="modal" data-target="#AddTheatreModal">Add New Theatre</button>                         
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Photo</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th>View</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Photo</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th>View</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>                                
                                <cfset theatreData= application.obj.getTheatre()>                                	                    
                            
                                          <cfoutput query="theatreData">
                                            <tr>
                                                <td><img src="../#theatre_image#" width="100px" height="100px" class="li-section" /></td>
                                                <td>#theatre_name#</td>
                                                <td>#theatre_email#</td>
                                                <td>#theatre_phone#</td>
                                                <td>#theatre_address#,#theatre_street#,#theatre_pincode#</td>
                                                <td>  <button class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target=".viewModal-#id#">View</button></td>
                                                <td>  <button type="button" class="btn btn-sm btn-outline-danger" onClick="editData(#id#)">Edit</button></td>
                                                <td> <a href="delete.cfm?id=#id#"><button type="button" class="btn btn-sm btn-outline-danger">Delete</button></a></td>
                                                                                                              
                                            </tr>
                                        
                                    </cfoutput>    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
<cfinclude  template = "footer.cfm"  runOnce = "true">  
