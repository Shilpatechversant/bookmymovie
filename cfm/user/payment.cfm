<cfinclude  template = "movie_header.cfm"  runOnce = "true">  
<cfparam  name="reserve_id" default="0">
<cfset local.reserve_id=toString(toBinary(reserve_id))>
<cfset reserve_res=application.bookings.getReservation(local.reserve_id)>        
  <cfoutput> <input type="hidden" name="reserve_id" value="#local.reserve_id#" id="reserve_id"></cfoutput>
    <cfoutput query="reserve_res">
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

	            <h2 class="page-heading">Booking Summary</h2>
                    <ul class="book-result">
                        <li class="book-result__item">Tickets: <span class="book-result__count booking-ticket">#seat_num#</span></li>
                        <li class="book-result__item">Total: <span class="book-result__count booking-cost">$ #price#</span></li>
                        <li class="book-result__item">#theatre_name#,#movie_name#
                          <p><span>Time:</span> #timeformat(show_time)# (#show_name#)</p>
                          </li>
                        <li class="book-result__item"> #seats#</li>
                    </ul>     
                    <br>
                    <h2 class="page-heading">Contact information</h2>
                    <cfoutput>
                    <form id='contact-info' method='post' novalidate="" class="form contact-info">
                        <div class="contact-info__field contact-info__field-mail">
                            <input type='email' id="uemail" name='user-mail' placeholder='Your email' value="#Session.username#" class="form__mail">
                            <input type="hidden" name="u_id" id="u_id" value="#Session.userId#">
                        
                        </div>
                     <input type="text" name="total_amount" id="amount" class="form-control"  placeholder="Total Amount" value="#price#" disabled />
                    </form>
                    </cfoutput>
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
                <a href="" class="booking-pagination__next hide--arrow">
                    <p class="arrow__text arrow--next">next step</p>
                    <span class="arrow__info"></span>
                </a>
        </div>        
        <div class="clearfix"></div>
    </div>
</cfoutput>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<cfinclude  template = "movie_footer.cfm"  runOnce = "true">  
   <script>
   function payNow()
    {
        
        var email=document.getElementById('uemail').value;  
        var user_id =document.getElementById('u_id').value;  
        var amount=document.getElementById('amount').value;
        var reserve_id=document.getElementById('reserve_id').value;
        var t_price=amount*100;      
        var options = {
    "key": "rzp_test_s9cSqIJIxI5xGT", // Enter the Key ID generated from the Dashboard
    "amount": t_price, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "BookMyTicket",
    "description": "Test Transaction",
    "image": "https://example.com/your_logo",
    //"order_id": "order_9A33XWu170gUtm", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    "handler": function (response){         
        pay_id=response.razorpay_payment_id;
        location.href="http://127.0.0.1:8500/movieticket/cfc/reservation.cfc?method=confirmPayment&reserve_id="+reserve_id+"&pay_id="+response.razorpay_payment_id;
    },    
    "prefill": {
        "name": name,
        "email": email       
    },
    "notes": {
        "address": "Razorpay Corporate Office"
    },
    "theme": {
        "color": "#3399cc"
    },
    "modal": {
        "ondismiss": function () {
          if (confirm("Are you sure, you want to close the form?")) {
            txt = "You pressed OK!";
            console.log("Checkout form closed by the user");
          } else {
            txt = "You pressed Cancel!";
            console.log("Complete the Payment")
          }
        }
      },      
 
};
var rzp1 = new Razorpay(options);
rzp1.on('payment.failed', function (response){
        alert(response.error.code);
        alert(response.error.description);
        alert(response.error.source);
        alert(response.error.step);
        alert(response.error.reason);
        alert(response.error.metadata.order_id);
        alert(response.error.metadata.payment_id);
});
//document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
   // e.preventDefault();
//}
}  
 </script>
