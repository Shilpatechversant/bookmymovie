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
<cfoutput query="showResult">  
    <cfset local.total_seats=#total_seats#>        
     <cfset local.theatre_id=#theatre_id#>  
</cfoutput>
<cfset seat_taken =application.bookings.getBookedSeats(local.sh_id,local.cdate)>

<cfset row=Int(Sqr(local.total_seats))>
<cfset columns=Int(ceiling(local.total_seats/(row)))>
<cfoutput>rows - #row#,columns - #columns#</cfoutput>

  <div class="wrapper place-wrapper">

        <!-- Main content -->
        <div class="place-form-area">
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="images/tickets.png">
                    <p class="order__title">Book a ticket <br><span class="order__descript">and have fun movie time</span></p>
                    <div class="order__control">
                        <a href="#" class="order__control-btn active">Purchase</a>
                        <a href="#" class="order__control-btn">Reserve</a>
                    </div>
                </div>
            </div>
                <div class="order-step-area">
                    <div class="order-step first--step order-step--disable ">1. What &amp; Where &amp; When</div>
                    <div class="order-step second--step">2. Choose a sit</div>
                </div>
            
            <div class="choose-sits">
                <div class="choose-sits__info choose-sits__info--first">
                    <ul>
                        <li class="sits-price marker--none"><strong>Price</strong></li>
                        <li class="sits-price sits-price--cheap">$10</li>
                        <li class="sits-price sits-price--middle">$20</li>
                        <li class="sits-price sits-price--expensive">$30</li>
                    </ul>
                </div>

                <div class="choose-sits__info">
                    <ul>
                        <li class="sits-state sits-state--not">Not available</li>
                        <li class="sits-state sits-state--your">Your choice</li>
                    </ul>
                </div>
                
                <div class="col-sm-12 col-lg-10 col-lg-offset-1">
                <div class="sits-area hidden-xs">
                    <div class="sits-anchor">screen</div>

                    <div class="sits">
                        <aside class="sits__line">
                            <span class="sits__indecator">A</span>
                            <span class="sits__indecator">B</span>
                            <span class="sits__indecator">C</span>
                            <span class="sits__indecator">D</span>
                            <span class="sits__indecator">E</span>
                            <span class="sits__indecator">F</span>
                            <span class="sits__indecator">G</span>
                            <span class="sits__indecator">I</span>
                            <span class="sits__indecator additional-margin">J</span>
                            <span class="sits__indecator">K</span>
                            <span class="sits__indecator">L</span>
                        </aside>
 <table class="table table-borderless bus">
    <tbody>
        <tr>
            <td colspan="6"></td>
        </tr>                  

        <cfloop index="seat_number" from="1" to="#local.total_seats#" step="5">
            <cfoutput>
                <tr>
                    <cfif seat_number LTE local.total_seats>
                        <td id="td_#local.theatre_id#_#seat_number#">
                            <label class="seat #listFind(seat_taken,seat_number)?'seat-taken':''#" for="#local.theatre_id#_#seat_number#">
                                <span id="span_#local.theatre_id#_#seat_number#">
                                    <img src="../../assets/user/img/chair#listFind(seat_taken,seat_number)?'-taken':''#.png" alt="chair">
                                </span>
                                <input type="checkbox" name="seats" #listFind(seat_taken,seat_number) GT 0?'disabled':''# id="#local.theatre_id#_#seat_number#" onChange="seatStatus(#local.theatre_id#,#seat_number#)"/>
                            </lable>
                        </td>
                    <cfelse>
                        <td></td>
                    </cfif>
                    <cfif seat_number+1 LTE local.total_seats>
                        <td id="td_#local.theatre_id#_#seat_number+1#">
                            <label class="seat #listFind(seat_taken,seat_number+1)?'seat-taken':''#" for="#local.theatre_id#_#seat_number+1#">
                                <span id="span_#local.theatre_id#_#seat_number+1#">
                                    <img src="../../assets/user/img/chair#listFind(seat_taken,seat_number+1)?'-taken':''#.png" alt="chair">
                                </span>
                                <input type="checkbox" name="seats" #listFind(seat_taken,seat_number+1) GT 0?'disabled':''# id="#local.theatre_id#_#seat_number+1#" onChange="seatStatus(#local.theatre_id#,#seat_number+1#)"/>
                            </lable>
                        </td>
                    <cfelse>
                        <td></td>
                    </cfif>
                    <td></td>
                    <cfif seat_number+2 LTE local.total_seats>
                        <td id="td_#local.theatre_id#_#seat_number+2#">
                            <label class="seat #listFind(seat_taken,seat_number+2)?'seat-taken':''#" for="#local.theatre_id#_#seat_number+2#">
                                <span id="span_#local.theatre_id#_#seat_number+2#">
                                    <img src="../../assets/user/img/chair#listFind(seat_taken,seat_number+2)?'-taken':''#.png" alt="chair">
                                </span>
                                <input type="checkbox" name="seats" #listFind(seat_taken,seat_number+2) GT 0?'disabled':''# id="#local.theatre_id#_#seat_number+2#" onChange="seatStatus(#local.theatre_id#,#seat_number+2#)"/>
                            </lable>
                        </td>
                    <cfelse>
                        <td></td>
                    </cfif>
                    <cfif seat_number+3 LTE local.total_seats>
                        <td id="td_#local.theatre_id#_#seat_number+3#">
                            <label class="seat #listFind(seat_taken,seat_number+3)?'seat-taken':''#" for="#local.theatre_id#_#seat_number+3#">
                                <span id="span_#local.theatre_id#_#seat_number+3#">
                                    <img src="../../assets/user/img/chair#listFind(seat_taken,seat_number+3)?'-taken':''#.png" alt="chair">
                                </span>
                                <input type="checkbox" name="seats" #listFind(seat_taken,seat_number+3) GT 0?'disabled':''# id="#local.theatre_id#_#seat_number+3#" onChange="seatStatus(#local.theatre_id#,#seat_number+3#)"/>
                            </lable>
                        </td>
                    <cfelse>
                        <td></td>
                    </cfif>
                    <cfif seat_number+4 LTE local.total_seats>
                        <td id="td_#local.theatre_id#_#seat_number+4#">
                            <label class="seat #listFind(seat_taken,seat_number+4)?'seat-taken':''#" for="#local.theatre_id#_#seat_number+4#">
                                <span id="span_#local.theatre_id#_#seat_number+4#">
                                    <img src="../../assets/user/img/chair#listFind(seat_taken,seat_number+4)?'-taken':''#.png" alt="chair">
                                </span>
                                <input type="checkbox" name="seats" #listFind(seat_taken,seat_number+4) GT 0?'disabled':''# id="#local.theatre_id#_#seat_number+4#" onChange="seatStatus(#local.theatre_id#,#seat_number+4#)"/>
                            </lable>
                        </td>
                    <cfelse>
                        <td></td>
                    </cfif>
                </tr>
            </cfoutput>
        </cfloop>

    </tbody>
</table>


                         

                        <aside class="sits__checked">
                            <div class="checked-place">
                                
                            </div>
                            <div class="checked-result">
                                $0
                            </div>
                        </aside>
                        <footer class="sits__number">
                            <span class="sits__indecator">1</span>
                            <span class="sits__indecator">2</span>
                            <span class="sits__indecator">3</span>
                            <span class="sits__indecator">4</span>
                            <span class="sits__indecator">5</span>
                            <span class="sits__indecator">6</span>
                            <span class="sits__indecator">7</span>
                            <span class="sits__indecator">8</span>
                            <span class="sits__indecator">9</span>
                            <span class="sits__indecator">10</span>
                            <span class="sits__indecator">11</span>
                            <span class="sits__indecator">12</span>
                            <span class="sits__indecator">13</span>
                            <span class="sits__indecator">14</span>
                            <span class="sits__indecator">15</span>
                            <span class="sits__indecator">16</span>
                            <span class="sits__indecator">17</span>
                            <span class="sits__indecator">18</span>
                        </footer>
                    </div>
                </div>
            </div>
                
            <div class="col-sm-12 visible-xs"> 
                <div class="sits-area--mobile">
                    <div class="sits-area--mobile-wrap">
                        <div class="sits-select">
                            <select name="sorting_item" class="sits__sort sit-row" tabindex="0">
                                    <option value="1" selected='selected'>A</option>
                                    <option value="2">B</option>
                                    <option value="3">C</option>
                                    <option value="4">D</option>
                                    <option value="5">E</option>
                                    <option value="6">F</option>
                                    <option value="7">G</option>
                                    <option value="8">I</option>
                                    <option value="9">J</option>
                                    <option value="10">K</option>
                                    <option value="11">L</option>
                            </select>
 
                            <select name="sorting_item" class="sits__sort sit-number" tabindex="1">
                                    <option value="1" selected='selected'>1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                            </select>

                            <a href="#" class="btn btn-md btn--warning toogle-sits">Choose sit</a>
                        </div>
                    </div>

                    <a href="#" class="watchlist add-sits-line">Add new sit</a>

                    <aside class="sits__checked">
                            <div class="checked-place">
                                <span class="choosen-place"></span>
                            </div>
                            <div class="checked-result">
                                $0
                            </div>
                    </aside>

                    <img alt="" src="images/components/sits_mobile.png">
                </div>
            </div>   
                
            </div>
                

            </div>
        </section>
        </div>
        
        

        <div class="clearfix"></div>
        <form id='film-and-time' class="booking-form" method='get' action='book3-buy.html'>

            <input type='text' name='choosen-number' class="choosen-number">
            <input type='text' name='choosen-number--cheap' class="choosen-number--cheap">
            <input type='text' name='choosen-number--middle' class="choosen-number--middle">
            <input type='text' name='choosen-number--expansive' class="choosen-number--expansive">
            <input type='text' name='choosen-cost' class="choosen-cost">
            <input type='text' name='choosen-sits' class="choosen-sits">


            <div class="booking-pagination booking-pagination--margin">
                    <a href="book1.html" class="booking-pagination__prev">
                        <span class="arrow__text arrow--prev">prev step</span>
                        <span class="arrow__info">what&amp;where&amp;when</span>
                    </a>
                    <a href="book3-buy.html" class="booking-pagination__next">
                        <span class="arrow__text arrow--next">next step</span>
                        <span class="arrow__info">checkout</span>
                    </a>
            </div>
        </form>
        
        <div class="clearfix"></div>

        <div class="col-md-4">
            <div class="d-flex justify-content-center fair-card">
                <div class="card w-75">
                    <div class="card-body text-center">
                        <h5 class="card-title">Fair Break-Down</h5>
                        <hr>
                        <table class="table table-borderless w-100">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="ticket-total"><h5>TOTAL FARE</h5></td>
                                    <td id="ticket-total-price">0</td>
                                </tr>
                            </tbody>
                        </table>

                        <form method="post" action="../../cfc/reservation.cfc?method=setBooking">
                            <cfoutput>
                                <input type="number" name="theatreId" id="theatreId" value="#local.theatre_id#" hidden/>
                                <input type="text" name="seats" id="seats" value="" hidden/>
                                <input type="text" name="fare" id="fare" value="0" hidden/>
                                <input type="number" name="showId" id="showId" value="#local.sh_id#" hidden/>
                                <input type="date" name="date" id="date" value="#local.cdate#" hidden/>
                                <input type="hidden" name="csrftoken" value="#csrfToken#" />
                                <button #structKeyExists(session, "id")? 'type="submit"':'type="button" data-bs-toggle="modal"
                                data-bs-target="##loginModal"'# class="btn btn-danger col-md-6">Pay Now</button>
                            </cfoutput>
                        </form>
                    </div>    
                </div>    
            </div>    
        </div>
    
    </div>

    <!-- open/close -->
        <div class="overlay overlay-hugeinc">
            
            <section class="container">



            </section>
        </div>
    <style>
    
.seat{
    cursor: pointer;
}
.seat-taken{
    cursor: default;
}
.seat>span>img{
    width: 69px;
    height: 69px;
}
.seat>input{
    display: none;

}
    </style>
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

