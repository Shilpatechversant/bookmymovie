  
   <div class="modal confirmModal col-md-offset-5" style="display:none" id="confirmModal">
            <form action="../../cfc/reservation.cfc?method=setBooking" method="post">
                <div class="modal-dialog modal-xs">
                    <form method='post' action="" name="confirm_form" id="timeForm" enctype='multipart/form-data' >
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h2 class="modal-title" id="time_title">Confirm Seats </h2>
                                     <h6 id="confirm_alert" ><h6>                               
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="text-center text-success">         
                                
                                    <h6 id='t_price' ></h6>
                                    <div class="time_data">
                                        <h6 id="time_s" class="text-center text-success">
                                        <cfloop array="#showResult#" index="i">
                                        <cfoutput>#timeFormat(i.show_time)# (#i.show_name#)</cfoutput>
                                        </cfloop></h6>
                                    </div>
                                </div>                                                                   
                                    <cfoutput>                                      
                                        <input type="hidden" name="seats" id="seat_labels" value="">
                                        <input type="hidden" name="tprice"  id="tprice" value="">
                                        <input type="hidden" name="date"  id="date" value="#local.cdate#">
                                            <cfloop array="#showResult#" index="i">                                        
                                                <input type="hidden" name="time_sl"  id="time_sl" value="#i.st_id#">
                                                <input type="hidden" name="show_id"  id="show_id" value="#i.id#">
                                                <input type="hidden" name="theatre_id"  id="ltheatre_id" value="#local.theatre_id#">
                                            </cfloop>
                                    </cfoutput>
                            </div>                                 
                      
                            <div class="modal-footer">                    
                                <input type="submit" class="btn btn-primary" name="submit" value="Proceed" id="proceed_btn">
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                            </div>            
                        </div>                
                    </div>
                </form>
            </div>        
       </div>

