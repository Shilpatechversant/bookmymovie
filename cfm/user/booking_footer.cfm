
	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../resources/user/js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="../../resources/user/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Mobile menu -->
        <script src="../../resources/user/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="../../resources/user/js/external/jquery.selectbox-0.2.min.js"></script>

        <!-- Form element -->
        <script src="../../resources/user/js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="../../resources/user/js/form.js"></script>

        <!-- Custom -->
        <script src="../../resources/user/js/custom.js"></script>
		
		<script type="text/javascript">
            $(document).ready(function() {
       
                init_BookingTwo();

               

           
            });

            $('.confirm').on('click',function(){
               
       
                var seat_arr=[];
                var seats="";
                var total_price=$("#checked-result").text();
           
                alert(total_price);
            $('.choosen-place').each( function () {
                Sits =  $(this).text();
                seat_arr.push(Sits);
                seats=seat_arr.toString();
              
            });
            var tseats=$("#tseat").val();
               
            if(seat_arr.length==tseats)
                {
                       alert("===");
                    $("#confirm_alert").text("Thank You for choosing seats "+seat_arr);
                    $("#seat_labels").val(seats);
                    $("#t_price").text("Total Price : "+total_price);
                    $("#tprice").val(total_price);
                    $(".time_data").css("display", "block");
                    $("#proceed_btn").prop("disabled",false);
                }
            else if(seat_arr.length<=tseats)
                {    
                      alert("less than");
                    $("#confirm_alert").text("Selected Seats should be less than required seats");
                    $("#t_price").text("");
                    $("#tprice").val("");
                    $('.time_data').css("display", "none");
                    $("#proceed_btn").prop("disabled",true);
                }
                
                else if(seat_arr.length==0)
                {    
                    alert("0000");
                    $("#confirm_alert").text("Please Choose Seats to proceed");
                    $("#t_price").text("");
                    $("#tprice").val("");
                    $('.time_data').css("display", "none");
                    $("#proceed_btn").prop("disabled",true);        
                } 
                  $('#confirmModal').modal('show');                    
                                
    
        });

                var showVal=$("#shid").val();
                var sdate=$("#sdate").val();
                alert("adssfc");
                    $.ajax({  
                        alert("sdsfdgf"); 
                        url: "../../cfc/reservation.cfc",
                        type: 'get',
                        dataType:"json",
                        data:{
                        method:"getTheatreSeats",
                        showid:showVal,
                        cdate: sdate       
                        },
                        success: function(data)
                        {
                            //console.log(data.length);      
                            for(let i=0;i<data.length;i++)      
                            {
                            // alert(data[i].seat_name);
                            var place=document.querySelector('[data-place="'+data[i].seat_name+'"]');
                                $(place).addClass("sits-state--not");
                            }
                                            
                        }         
                    });           
		</script>



</body>
</html>