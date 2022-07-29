
  <cfinclude  template = "movie_header.cfm"  runOnce = "true">  
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="images/tickets.png">
                    <p class="order__title">Thank you <br><span class="order__descript">you have successfully purchased tickets</span></p>
                </div>

                <div class="ticket">
                    <div class="ticket-position">
                        <div class="ticket__indecator indecator--pre"><div class="indecator-text pre--text">online ticket</div> </div>
                        <div class="ticket__inner">

                            <div class="ticket-secondary">
                                <span class="ticket__item">Ticket number <strong class="ticket__number">a126bym4</strong></span>
                                <span class="ticket__item ticket__date">25/10/2013</span>
                                <span class="ticket__item ticket__time">17:45</span>
                                <span class="ticket__item">Cinema: <span class="ticket__cinema">Cineworld</span></span>
                                <span class="ticket__item">Hall: <span class="ticket__hall">Visconti</span></span>
                                <span class="ticket__item ticket__price">price: <strong class="ticket__cost">$60</strong></span>
                            </div>

                            <div class="ticket-primery">
                                <span class="ticket__item ticket__item--primery ticket__film">Film<br><strong class="ticket__movie">The Fifth Estate (2013)</strong></span>
                                <span class="ticket__item ticket__item--primery">Sits: <span class="ticket__place">11F, 12F, 13F</span></span>
                            </div>


                        </div>
                        <div class="ticket__indecator indecator--post"><div class="indecator-text post--text">online ticket</div></div>
                    </div>
                </div>

                <div class="ticket-control">
                    <a href="#" class="watchlist list--download">Download</a>
                    <a href="#" class="watchlist list--print">Print</a>
                </div>

            </div>
        </section>
        
        <div class="clearfix"></div>

    </div>
            
            <section class="container">

                <div class="col-sm-4 col-sm-offset-4">
                    <button type="button" class="overlay-close">Close</button>
                    <form id="login-form" class="login" method='get' novalidate=''>
                        <p class="login__title">sign in <br><span class="login-edition">welcome to A.Movie</span></p>

                        <div class="social social--colored">
                                <a href='#' class="social__variant fa fa-facebook"></a>
                                <a href='#' class="social__variant fa fa-twitter"></a>
                                <a href='#' class="social__variant fa fa-tumblr"></a>
                        </div>

                        <p class="login__tracker">or</p>
                        
                        <div class="field-wrap">
                        <input type='email' placeholder='Email' name='user-email' class="login__input">
                        <input type='password' placeholder='Password' name='user-password' class="login__input">

                        <input type='checkbox' id='#informed' class='login__check styled'>
                        <label for='#informed' class='login__check-info'>remember me</label>
                         </div>
                        
                        <div class="login__control">
                            <button type='submit' class="btn btn-md btn--warning btn--wider">sign in</button>
                            <a href="#" class="login__tracker form__tracker">Forgot password?</a>
                        </div>
                    </form>
                </div>

            </section>
        </div>
  
   <cfinclude  template = "movie_footer.cfm"  runOnce = "true">        

	