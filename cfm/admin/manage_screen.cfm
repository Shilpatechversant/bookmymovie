<cfinclude  template = "../header.cfm"  runOnce = "true"> 
<cfparam  name="message" default="v"> 
<cfparam  name="status" default="v"> 
<cfif isDefined("url.id")>
<cfset theatre_id=#url.id#>
  <cfinvoke component="local.cfc.theatre"  method="getTheatreDetail" returnVariable="theatreData" id=#url.id#>
   <cfinvoke component="local.cfc.screen"  method="screenDetails" returnVariable="screenData" theatre_id=#url.id#>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <cfoutput query="theatreData">
                        <p>Manage Screen & Time For - #theatre_name#</p>  
                    </cfoutput>                   
                         <!-- Content Row -->  
                    <cfif message EQ hash('2','sha')>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            Please Fill all the Required Fields!!
                        </div> 
                    </cfif>
                     <cfif message EQ hash('3','sha')>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                           Teatre id Missing.Contact Admin!!
                        </div> 
                    </cfif>  
                    <cfif message EQ hash('8','sha')>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                           Screen Detail updated Successfully
                        </div> 
                    </cfif> 
                      <cfif message EQ hash('4','sha')>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                           Screen Detail Inserted Successfully
                        </div> 
                    </cfif> 
                      <cfif message EQ hash('5','sha')>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                           Failed operation
                        </div> 
                    </cfif>                                    
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card shadow mb-4">
                                <div class="card-header py-3">                    
                                        <button class="btn btn-danger theatre_btn title mb-3 float-right" data-toggle="modal" data-target="#AddScreenModal">Add New Screen</button>                         
                                    </div>                  
                                    <div class="card-body">
                                        <div class="table-responsive" id="tableList">
                                            <table class="table table-bordered table-striped" id="screen_table" width="100%" cellspacing="0" >
                                                <thead>
                                                    <tr>
                                                        <th >Screen Name</th>
                                                        <th >Gold Ticket</th>
                                                        <th >Silver Ticket</th>                                
                                                        <th >Update</th>
                                                        <th >Delete</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th >Screen Name</th>
                                                        <th >Gold Ticket</th>
                                                        <th >Silver Ticket</th>                                
                                                        <th >Update</th>
                                                        <th >Delete</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>         
                                                           
                                            
                                                        <cfoutput query="screenData">
                                                            <tr>                                                               
                                                                <td>#screen_name#</td>
                                                                <td>#gold_rate#</td>
                                                                <td>#silver_rate#</td>
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
                        <!-- /screen time -->
                            <div class="col-lg-6">
                                <div class="card shadow mb-4">
                                <div class="card-header py-3">                    
                                        <button class="btn btn-danger theatre_btn title mb-3 float-right" data-toggle="modal" data-target="#AddTheatreModal">Add New Screen Time</button>                         
                                    </div>                  
                                    <div class="card-body">
                                        <div class="table-responsive" id="tableList">
                                    <table class="table table-bordered table-striped" id="show_table" width="100%" cellspacing="0" >
                                        <thead>
                                            <tr>
                                                <th >Show  Name</th>
                                                <th >Screen Name</th>
                                                <th >Start Time</th>                                
                                                <th >Update</th>
                                                <th >Delete</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th >Show  Name</th>
                                                <th >Screen Name</th>
                                                <th >Start Time</th>                                
                                                <th >Update</th>
                                                <th >Delete</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>                                
                                            <cfset theatreData= application.obj.getTheatre()>                        
                                            <cfoutput query="theatreData">
                                                <tr>                                                    
                                                    <td>123</td>
                                                    <td>123</td>
                                                    <td>#theatre_phone#</td>
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
                    </div>
                </div>
 <!-- /2nd half -->
            </div>
        </div>
      <!-- /.container-fluid -->
    </div>
    <!-- End of Main Content -->  
     <!-- Add screen modal -->  

     <!--Add theatre Modal-->
      <!-- Modal -->
        <div class="modal fade" id="AddScreenModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">               
                    <div class="modal-header center">
                        <h4><center>Add Screen</center></h4>                                
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="../../cfc/screen.cfc?method=addScreen" name="contactform" enctype="multipart/form-data" onsubmit="return validateContactForm()">
                            <div class="row">                               
                                <div class="col-md-4">
                                    <label  for="ScreenName">Screen Name*</label>
                                    <input name="screen_name" type="text" id="s1" class="form-control" required>
                                </div>
                                 <div class="col-md-4">
                                    <label  for="Gold Rate">Gold Rate*</label>
                                    <input name="gold_rate" type="text" id="goldrate" class="form-control" required>
                                </div>
                                 <div class="col-md-4">
                                    <label  for="Silver Rate">Silver Rate*</label>
                                    <input name="silver_rate" type="text" id="silver_rate" class="form-control" required>
                                </div>
                                  
                                <input type="hidden" name="theatre_id"  id="theate_id" value="<cfoutput>#theatre_id#</cfoutput>" />
                                <input type="hidden" name="id"  id="id"  value="0"/>                                           
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
</cfif>
<cfinclude  template = "../footer.cfm"  runOnce = "true">  
  