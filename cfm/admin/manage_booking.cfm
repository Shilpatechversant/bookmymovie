<cfinclude  template = "../header.cfm"  runOnce = "true"> 
<cfparam  name="message" default="v"> 
<cfparam  name="status" default="v"> 
 <cfset bookData=application.bookings.bookingDetails()>
    <!-- Begin Page Content -->
    <div class="container-fluid">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Manage Booking</h1>                             
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 ">  
                        All Bookings                               
                        </div>                  
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="table-responsive" id="tableList" width="100%">
                                    <table class="table table-bordered" id="example"  cellspacing="0">
                                        <thead>
                                            <tr>                                               
                                                <th>Email</th>
                                                <th>Movie</th>
                                                <th>Booking Date</th>
                                                <th>Show Time</th>
                                                <th>Seats & Amount</th>
                                                <th>Ticket id</th>   
                                                <th>Theater</th>  
                                                <th>Status</th>                     
                                            </tr>
                                        </thead>
                                        <tfoot>
                                              <tr>                                             
                                                <th>Email</th>
                                                <th>Movie</th>
                                                <th>Booking Date</th>
                                                <th>Show Time</th>
                                                <th>Seats & Amount</th>
                                                <th>Ticket id</th>   
                                                <th>Theater</th>  
                                                <th>Status</th>                     
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <cfoutput query='bookData'>  
                                                <tr>
                                                    <td>#user_email#</td>
                                                    <td>#movie_name#</td>
                                                    <td>#booked_on#</td>
                                                    <td>#show_name#,#show_time#</td>
                                                    <td>#seats# && #price#</td> 
                                                    <td>#ticket_id#</td>   
                                                    <td>#theatre_name#</td> 
                                                    <td><cfif #paid# eq '1'>
                                                          paid
                                                          <cfelse>
                                                          Pending
                                                        </cfif>
                                                    </td>                                                 
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

           
<cfinclude  template = "../footer.cfm"  runOnce = "true">  
  