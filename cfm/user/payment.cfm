  <cfinclude  template = "movie_header.cfm"  runOnce = "true">  
<cfparam  name="seat_num" default="0">
<cfparam  name="show_id" default="0">
<cfparam  name="ts" default="0">
<cfparam  name="tprice" default="0">
<cfset pdate=toString(toBinary(date))>
<cfset showId=toString(toBinary(show_id))>
<cfset seat_s=toString(toBinary(seat_num))>
<cfset seat_split =seat_s.Split(",")>
<cfset time_id=toString(toBinary(ts))>
<cfset total_price=toString(toBinary(tprice))>

<cfset show_res=application.show.getShowDetailsById(showId)>
<cfset time_res=application.obj.getScreenTime(time_id)>
        
        <!-- Main content -->
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="images/tickets.png">
                    <p class="order__title">Book a ticket <br><span class="order__descript">and have fun movie time</span></p>
                    <div class="order__control">
                        <a href="" class="order__control-btn active">Purchase</a>                    
                    </div>
                </div>
            </div>
                <div class="order-step-area">
                    <div class="order-step first--step order-step--disable ">1. What &amp; Where &amp; When</div>
                    <div class="order-step second--step order-step--disable">2. Choose a sit</div>
                    <div class="order-step third--step">3. Check out</div>
                </div>

            <div class="col-sm-12">
                <div class="checkout-wrapper">                    
                            <cfoutput>
                            <cfloop array="#show_res#" index="i">                
                            <h3>Booking Summary</h3>
                            <h6><span>Movie:</span>#i.movie_name#</h6>
                            <p><span>Theatre:</span> #i.theatre_name# </p>
                            </cfloop>                            
                            <p><span>Date:</span> #dateformat(pdate,"full")#</p>
                            <cfloop array="#time_res#" index="j">
                                <p><span>Time:</span> #timeformat(j.show_time)# (#j.show_name#)</p>
                                <p><span>Tickets:</span>#ArrayLen(seat_split)#</p>
                                <p><span>Seats:</span>  #seat_s#</p>
                                <h4><span>Price :</span>Rs.#total_price#</h4>
                                <h5>Grand Total :Rs. #total_price#</h5>
                            </cfloop>
                            </cfoutput>
                </div>
	
                    <h2 class="page-heading">price</h2>
                    <ul class="book-result">
                        <li class="book-result__item">Tickets: <span class="book-result__count booking-ticket">3</span></li>
                        <li class="book-result__item">One item price: <span class="book-result__count booking-price">$20</span></li>
                        <li class="book-result__item">Total: <span class="book-result__count booking-cost">$#total_price#</span></li>
                    </ul>        
                 

                    <h2 class="page-heading">Contact information</h2>
                    <cfoutput>
                    <form id='contact-info' method='post' novalidate="" class="form contact-info">
                        <div class="contact-info__field contact-info__field-mail">
                            <input type='email' name='user-mail' placeholder='Your email' value="#Session.username#" class="form__mail">
                        </div>
                     <input type="text" name="total_amount" id="amount" class="form-control"  placeholder="Total Amount" value="#total_price#" disabled />
                    </form>
                    </cfoutput>

                    <div class="form-group row">                 
                         <input type="checkbox" name="remember"> I agree to the terms and conditions
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                 <!--- <input type="submit" class="btn btn-showing" name="submit" value="Payment">--->
                
                </div>
                   <div class="order">
                         <button id="rzp-button1" class="btn btn-md btn--warning btn--wide" onclick="payNow()">Pay Now</button>
                    </div>

                
                </div>
                
           
            </div>

        </section>       

        <div class="clearfix"></div>
        <div class="booking-pagination">
                <a href="book2.html" class="booking-pagination__prev">
                    <p class="arrow__text arrow--prev">prev step</p>
                    <span class="arrow__info">choose a sit</span>
                </a>
                <a href="#" class="booking-pagination__next hide--arrow">
                    <p class="arrow__text arrow--next">next step</p>
                    <span class="arrow__info"></span>
                </a>
        </div>        
        <div class="clearfix"></div>
    </div>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
   <cfinclude  template = "movie_footer.cfm"  runOnce = "true">  
