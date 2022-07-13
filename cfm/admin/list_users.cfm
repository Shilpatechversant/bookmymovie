<cfinclude  template = "../header.cfm"  runOnce = "true"> 
<cfparam  name="message" default="v"> 
<cfparam  name="status" default="v"> 
    <!-- Begin Page Content -->
    <div class="container-fluid">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Manage Users</h1> 
                            
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 ">   
                               
                        </div>                  
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="table-responsive" id="tableList" width="100%">
                                    <table class="table table-bordered" id="example"  cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Username</th>
                                                <th>Email</th>
                                                <th>Name</th>
                                                <th>Release Date</th>
                                                <th>Registered On</th>
                                                <th>Delete</th>                       
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Username</th>
                                                <th>Email</th>
                                                <th>Name</th>
                                                <th>Release Date</th>
                                                <th>Registered On</th>
                                                <th>Delete</th>                                            
                                            </tr>
                                        </tfoot>
                                        <tbody>                                
                                    
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

           
<cfinclude  template = "../footer.cfm"  runOnce = "true">  
  