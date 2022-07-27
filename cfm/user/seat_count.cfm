
<cfinclude  template = "movie_header.cfm"  runOnce = "true">  
          <!-- Main content -->
        <div class="clearfix"></div>     
        <section class="container">
            <div class="col-sm-12">
                <div class="clearfix"></div>
                <h2 class="page-heading">Seat Count</h2>
                       <!-- Main content -->
                <form class="user" 
                       method="post" 
                       name="loginForm" 
                       action="cfc/reservation.cfc?method=insertSeatCount"
                       onsubmit="return validateClientForm()">
                    <p class="login__title">Seats Count <br><span class="login-edition">welcome to BookMyMovie</span></p>
                    <div class="field-wrap">
                        <input type='text' placeholder='No of seats Required' name='seat_count' id="seat_count" class="login__input" 
                        required>
                        <p class="seat_alert text-danger"></p>
                     </div>
                    <div class="login__control">
                        <button type='submit' id="reg_btn" class="btn btn-md btn--warning btn--wider">Seat Plan</button>                     
                    </div>
                </form>
        
            <div class="clearfix"></div>
       </section>
        <div class="clearfix"></div>
            <footer class="footer-wrapper">
                <section class="container">
                    <div class="clearfix">
                        <p class="copy">&copy;Book MyMovie, 2022. All rights reserved.</p>
                    </div>
                </section>             
            </footer>
        </div>
    <cfinclude  template = "movie_footer.cfm"  runOnce = "true">  


 