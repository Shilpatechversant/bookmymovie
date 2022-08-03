<cfinclude  template = "movie_header.cfm"  runOnce = "true">
<cfset csrftoken= CSRFGenerateToken()/>
<cfparam  name="seat_num" default="v"> 
<cfparam  name="show_id" default="v"> 
<cfparam  name="date" default="v">  
<cfparam  name="message" default="v"> 
<cfset local.sh_id=toString(toBinary(show_id))>  
<cfset local.cdate=toString(toBinary(date))>  
<cfset local.seat_count=toString(toBinary(seat_num))>  
<cfset showResult=application.show.getShowDetailsById(local.sh_id)>  
<cfloop array="#showResult#" index="i"> 
    <cfset local.total_seats=#i.total_seats#>        
     <cfset local.theatre_id=#i.theatre_id#>  
</cfloop>
<cfset seat_taken =application.bookings.getBookedSeats(local.sh_id,local.cdate)>

<cfset row=Int(Sqr(local.total_seats))>
<cfset columns=Int(ceiling(local.total_seats/(row)))>


  <div class="wrapper place-wrapper">

        <!-- Main content -->

<!-- Main content -->
        <div class="place-form-area">
        <section class="container">
        <cfoutput >
        <cfloop array="#showResult#" index="i">
            <div class="order-container">
                <div class="order pt-3">                
                    <img class="order__images" alt='' src="../../assets/poster/#i.movie_poster#">
                    <p class="order__title text-center text-white">#i.movie_name# <br>
                    <span class="order__descript">#i.theatre_name#| #i.movie_language# -#i.movie_format#</span></p>
                     
                </div>
            </div>

            <div class="dt_div mt-5">
                <div class="container p-4">
                    <a href="movie_ticket_planing.cfm?movie_id=#toBase64(i.mid)#&tic_date=#toBase64(local.cdate)#id=#local.sh_id#" class="btn btn-showing" >Back</a>
                    <div class="show_right">
                        <button class="btn btn-showing">#dateformat(local.cdate,"full")#</button>
                        <button class="btn btn-showing">#timeFormat(i.show_time)# (#i.show_name#)</button>
                    </div>
                </div>
            </div>
                <div class="order-step-area pt-3 text-center">
                   <!---- <div class="order-step first--step order-step--disable ">1. What &amp; Where &amp; When</div>--->
                    <div class="order-step second--step text-white text-center">Please Choose <cfoutput>#local.seat_count#
                     seat Now</div>                    
                    <input type="hidden" name="tseats"  id="tseat" value="#local.seat_count#">       
                    </cfoutput>  
                </div>
            
            <div class="choose-sits text-white">
                <div class="choose-sits__info choose-sits__info--first">
                    <ul>
                        <li class="sits-price marker--none"><strong>Price</strong></li>
                        <li class="sits-price sits-price--cheap">#i.silver_rate#</li>
                        <li class="sits-price sits-price--middle">#i.gold_rate#</li>
                        
                    </ul>
                </div>

                <cfset row=Int(Sqr(i.total_seats))>
                <cfset columns=Int(ceiling(i.total_seats/(row)))>
                
                
                <div class="choose-sits__info">
                    <ul>
                        <li class="sits-state sits-state--not">Not available</li>
                        <li class="sits-state sits-state--your"></li>
                    </ul>
                </div>
                
                <div class="col-sm-12 col-lg-10 col-lg-offset-1">
                <div class="sits">
                <aside class="sits__checked">
                            <div class="checked-place">
                                
                            </div>
                            <div class="checked-result">
                                $0
                            </div>
                        </aside>
                </div>
                <div class="sits-area hidden-xs">
                    <div class="sits-anchor">screen</div>
                    
                    <div class="sits">
                    
                        <cfoutput>
                            <cfloop from="1" to="#columns#" index="k" step="1">
                            <span class="sits__indecator">
                            #k#</span></cfloop>
                            </cfoutput>
                    </div>
                    <h6 class="pt-3">SILVER PLUS</h6>
                    <div class="sits">
                    
                        <aside class="sits__line text-white">
                            <cfset charArray=arrayNew(1)>
                            <cfset alphabets=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z' ]>
                            <cfoutput>
                            <cfloop index="j" from="1" to="#Round(row/2)#" step="1">
                                <span class="sits__indecator"> #alphabets[j]# </span>
                            </cfloop>
                            <div class="pt-3">
                             <cfloop index="j" from=#Round(row/2)+1# to=#row# step="1">
                                <span class="sits__indecator"> #alphabets[j]# </span>
                                </cfloop>
                            </div>
                            </cfoutput>
                            
                        </aside>
                        <cfoutput>
                            <cfloop index="j" from="1" to=#Round(row/2)# step="1">
                                <div class="sits__row">
                                    <cfloop index="k" from="1" to="#columns#" step="1">
                                        <span class="sits__place sits-price--cheap" data-place='#alphabets[j]&k#' data-price=#i.silver_rate#>#alphabets[j]&k#</span>
                                   </cfloop>
                                </div>
                            </cfloop>
                            <h6>GOLD PLUS</h6>
                            <div class="">
                            
                            <cfloop index="j" from=#Round(row/2)+1# to=#row-1# step="1">
                                <div class="sits__row">
                                    <cfset n=(row*columns)-i.total_seats>
                                    <cfloop index="k" from="1" to="#columns#" step="1">
                                        <span class="sits__place sits-price--middle " data-place='#alphabets[j]&k#' data-price=#i.gold_rate#>#alphabets[j]&k#</span>
                                   </cfloop>
                                </div>
                            </cfloop>
                            <cfloop index="j" from=#row# to=#row# step="1">
                                <div class="sits__row">
                                    <cfset n=(row*columns)-i.total_seats>
                                    <cfloop index="k" from="1" to="#columns-n#" step="1">
                                        <span class="sits__place sits-price--middle " data-place='#alphabets[j]&k#' data-price=#i.gold_rate#>#alphabets[j]&k#</span>
                                   </cfloop>
                                   <cfloop index="k" from="#(columns-n)+1#" to="#columns#" step="1">
                                        <span class="sits__place sits-price--middle sits-state--not" data-place='#alphabets[j]&k#' data-price=#i.gold_rate#>#alphabets[j]&k#</span>
                                   </cfloop>
                                   
                                </div>
                            </cfloop>
                        </div>
                        </cfoutput>
                        </cfloop>
                </cfoutput>               

                   <div class="text-center pb-3">
                         <button type="button" class="btn btn-danger confirm" data-bs-toggle="modal"  data-bs-target=".confirmModal"  >Confirm Selection</button>
                    </div>   
                     
                        
                    </div>
                </div>
            </div>
                
            <div class="col-sm-12 visible-xs"> 
                <div class="sits-area--mobile">
                    <div class="sits-area--mobile-wrap">
                  
                                 
                </div>
            </div>                
        </div>
    </div>
            
        </section>
        </div>
    </div>

 <div class="clearfix"></div>     
<cfinclude  template = "confirm_seats.cfm"  runOnce = "true">  
<cfinclude  template = "booking_footer.cfm"  runOnce = "true">  

<script>
const maxSeat = 5;
    const seats = [];
    const seatStatus = (theatreId, seat) => {
        if(document.getElementById(`${theatreId}_${seat}`).checked){
            if(seats.length>=maxSeat){
                alert("Max Limit Exceeded");
                return;
            }
            seats.push(seat);
            document.getElementById(`span_${theatreId}_${seat}`).innerHTML='<img src="../../assets/user/img/chair-selected.png" alt="chair">';
        }else{
            const index = seats.indexOf(seat);
            if (index > -1) {
                seats.splice(index, 1);
            }
            document.getElementById(`span_${theatreId}_${seat}`).innerHTML='<img src="../../assets/user/img/chair.png" alt="chair">';
        }
        const ticketPrice =parseFloat(document.getElementById("price").value*seats.length).toFixed(2)
        document.getElementById("ticket-total-price").innerHTML = ticketPrice;
        document.getElementById("fare").setAttribute('value',ticketPrice);
        const seatsString = seats.toString();
        document.getElementById("seats").setAttribute('value', seatsString );
    }
</script>

