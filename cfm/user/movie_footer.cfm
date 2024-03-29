	
     
    
    <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="../../resources/user/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Mobile menu -->
        <script src="../../resources/user/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="../../resources/user/js/external/jquery.selectbox-0.2.min.js"></script>

        <!-- Stars rate -->
        <script src="../../resources/user/js/external/jquery.raty.js"></script>
        <!-- Swiper slider -->
        <script src="../../resources/user/js/external/idangerous.swiper.min.js"></script>
        <!-- Magnific-popup -->
        <script src="../../resources/user/js/external/jquery.magnific-popup.min.js"></script> 

        <script src="../../resources/js/select/js/select2.min.js"></script>

        <!-- Share buttons -->
        <script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-525fd5e9061e7ef0"></script>

        <!-- Form element -->
        <script src="../../resources/user/js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="../../resources/user/js/form.js"></script>
        <script src="../../resources/user/js/custom.js"></script>  

 
		
		<script type="text/javascript">
        
            $(document).ready(function() {
                    $('.js-example-basic-single').select2();
                init_MoviePage();
                 init_MoviePageFull();
                     $('.js-example-basic-single').select2();
            });

                $(function() {
                    $( "#datepicker" ).datepicker({ 
                        changeYear: true,
                        minDate: '-3M',
                        maxDate: '+3D',
                    });
                });  

        function getSeatBookView(id)
        {   
         
            $("#gshow_id").val(id);
            $('#SloginModal').modal('show');      
         
        } 

        function getSeatCountView(show_id,mov_id,cdate)
        {   
         var sdate=$('#cdate').val(); 
         $.ajax({
            url: "../../cfc/reservation.cfc",
            type: "post", 
            dataType: "json",
            data: {
                method: "getBookings",
                showId:show_id,
                cdate:sdate,            
            },
            success: function (data){                                   
                if(data){                 
                   $(".seat_label").text("(" +data+ " Left)");
                    $('#ch_show_id').val(show_id);     
                    $('#total_seats').val(data);                                                                                        
                   $('#GseatModal').modal('show');     
              }
            }
        });
            
         
        }  
        function seatCheck()
        {
            var t_seats=$("#total_seats").val();
            var seats=$("#seats").val();
            if(parseInt(t_seats)<parseInt(seats))
            {
                $(".seat_alert").text("Should be less than total seats available!!");
                //$("#seat_btn").prop("disabled","true");
                $("#seat_btn").prop("disabled",true);
            }
            else{
                $(".seat_alert").text("");
                $("#seat_btn").prop("disabled",false);
            }

        }     
		</script>  
    

</body>
</html>
